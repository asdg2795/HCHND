package com.web.hchnd.controller;

import com.web.hchnd.service.AccountService;
import com.web.hchnd.vo.AccountVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;

@Controller
@RequestMapping("/account")
public class AccountController {
    @Autowired
    AccountService service;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Inject
    JavaMailSenderImpl mailSender;

    /* 회원가입 */
    @GetMapping("/join")
    public String join(){
        return "account/join";
    }

    @PostMapping("/accountCheck")
    @ResponseBody
    public boolean accountCheck(String emailID){
        System.out.print("이메일 검사 : "+emailID);
        int result = service.emailCheck(emailID);
        System.out.println(" > 결과 :"+ result);
        /*메일 중복 검사*/
        if(result == 0){
            return true;
        } else {
            return false;
        }
    }

    @PostMapping("/joinAction")
    public ModelAndView joinAction(AccountVO vo){
        ModelAndView mav = new ModelAndView();
        /*비밀번호 bcrypt 암호화 스레드 1*/
        Thread pwdEncodeThread = new Thread(() -> {
            String encodedPassword = passwordEncoder.encode(vo.getPwd());
            vo.setPwd(encodedPassword);
        });
        /*임시 UID + 메일 인증 키 스레드 2*/
        /*정기적으로 한번씩 DB상에서 지울것 권장하는 로직*/
        Thread uidGenThread = new Thread(() -> {
            String tmp_UID = service.lastUID("Temporary_%");
            if(tmp_UID == null){
                vo.setUID("Temporary_00000");
            } else {
                int lastCount = Integer.parseInt(tmp_UID);
                String toStr = String.format("%05d",++lastCount);
                vo.setUID("Temporary_"+toStr);
            }
        });

        try{ // 스레드 시작(1,2)
            pwdEncodeThread.start();
            uidGenThread.start();
            /*모든 쓰레드 종료시 까지 대기*/
            pwdEncodeThread.join();
            uidGenThread.join();
        } catch (InterruptedException e) {
            System.out.println(e.getMessage());
        }


        /*DB Insert 스레드 3*/
        Thread DBInsertResult = new Thread(() -> {
            int result = service.temporaryAccount(vo);
            if(result > 0){ /*성공*/
                mav.setViewName("redirect:logIn");
            } else {        /*실패*/
                mav.setViewName("account/result/joinResult");
            }
        });
        /*메일전송 스레드 4*/
        Thread MailSending = new Thread(() -> {
            String subject = "헬창놈들 가입 확인 메일입니다.";//메일 제목
            String content = "<h1>본 메일은 회원가입을 위한 인증 메일입니다.</h1>" +
                    "<p><a href='http://localhost:8080/hchnd/account/mailCheck?tmp=" + vo.getUID() +"'>회원가입을 진행하시려면 클릭해주세요</a></p>";
            try{
                MimeMessage message = mailSender.createMimeMessage();
                MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
                messageHelper.setFrom("iraleia92@gmail.com");//보내는 주소
                messageHelper.setTo(vo.getEmailID());
                messageHelper.setSubject(subject);
                messageHelper.setText("text/html;charset=UTF-8", content);
                mailSender.send(message);
            } catch (MessagingException e) {
                System.out.println(e.getMessage());
            }
        });

        try{ // 스레드 시작(3,4)
            DBInsertResult.start();
            MailSending.start();
            DBInsertResult.join();
            MailSending.join();
        } catch (InterruptedException e) {
            System.out.println(e.getMessage());
        }

        return mav;
    }

    /* 메일 인증 확인 */
    @GetMapping("/mailCheck")
    public ModelAndView MailCheck(String tmp){
        ModelAndView mav = new ModelAndView();
        // 현재 날짜를 가져오기
        LocalDate currentDate = LocalDate.now();
        System.out.println(currentDate);

        // 날짜를 원하는 형식으로 포맷팅
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        String UID = "R" + currentDate.format(formatter) + "_";


        String lastUID = service.lastUID(UID+"%");
        System.out.println(lastUID);
        if(lastUID == null){
            UID = UID + "00000";
        } else {
            int lastCount = Integer.parseInt(lastUID);
            String toStr = String.format("%05d",++lastCount);
            UID = UID + toStr;
        }
        System.out.println(UID);

        int result = service.updateAuth(UID, tmp);
        if(result > 0){
            mav.setViewName("redirect:logIn");
        } else {
            mav.setViewName("account/result/joinResult");
        }
        return mav;
    }

    /* 로그인 */
    @GetMapping("/logIn")
    public String login(){
        return "account/logIn";
    }

    @PostMapping("/auth")
    @ResponseBody
    public int loginAuth(String emailID, String pwd, HttpSession session){
        AccountVO vo = service.loginAction(emailID);
        /*암호 평문과 Encoding된 비밀번호의 일치 여부 확인*/
        boolean result = passwordEncoder.matches(pwd, vo.getPwd());
        String validationCheck = vo.getUID().substring(0,10);
        if(result && !validationCheck.equals("Temporary_")){
            session.setAttribute("logId", vo.getUID());
            session.setAttribute("logName", vo.getNickname());
            session.setAttribute("logEmail", vo.getEmailID());
            session.setAttribute("logStatus", "Y");
            // Cookie cookie = new Cookie();
            return 0;
        } else if(validationCheck.equals("Temporary_")){
            return 1;
        } else {
            return 2;
        }
    }

    @PostMapping("/logInAction")
    public ModelAndView logInAction(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:/");
        return mav;
    }

    /* 로그아웃 */
    @GetMapping("/logOut")
    public ModelAndView logOutAction(HttpSession session){
        session.invalidate();

        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:/");
        return mav;
    }

    /* 마이페이지 */
    @PostMapping("/myPage")
    public String myPage(HttpSession session){
        String UID = (String) session.getAttribute("logUID");


        return "account/myPage";
    }
}
