package com.web.hchnd.controller;

import com.web.hchnd.service.CertifyBoardService;
import com.web.hchnd.vo.AccountVO;
import com.web.hchnd.vo.CertifyBoardVO;
import com.web.hchnd.vo.HeartVO;
import com.web.hchnd.vo.pagingVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
public class CertifyBoardController {
    @Autowired
    CertifyBoardService service;

    @GetMapping("community/certifyBoardWrite")
    public String test(){
        return "community/certifyBoardWrite";
    }

    @PostMapping("community/certifyOk")
    @Transactional(rollbackFor = {RuntimeException.class, SQLException.class})
    public ModelAndView certifyOk(CertifyBoardVO vo, HttpSession session, HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        /*1. UID*/
        String UID = (String) session.getAttribute("logId");
        vo.setUID(UID);
        vo.setIp(request.getRemoteAddr());
        System.out.println(vo.toString());
        /*2. �뙆�씪 �뾽濡쒕뱶*/
        // > �뙆�씪�쓣 �뾽濡쒕뱶�븷 �쐞移� �뤃�뜑 援ы븯湲�(�젅�� 二쇱냼)
        String path = session.getServletContext().getRealPath("/img/certifyBoard");
        System.out.println("path : " + path);

        // > HttpServletRequest -> MultipartHttpServletRequest 媛앹껜瑜� 援ы븳�떎
        MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
        // > MultipartHttpServletRequest 媛앹껜 �궡�뿉 �뙆�씪 �닔留뚰겮 MultipartFile 媛앹껜媛� �엳�쓬
        MultipartFile profileImg = mr.getFile("certifyImg"); // inputTag �쓽 name�냽�꽦 媛�

        if (profileImg != null && !profileImg.isEmpty()){
            String originalFilename = profileImg.getOriginalFilename();
            // �뙆�씪�쓽 蹂몃옒 �씠由꾩씠 �엳�뼱�빞吏�留� �닔�뻾
            if(originalFilename != null && !originalFilename.equals("")){
                String ext = originalFilename.substring(originalFilename.indexOf("."));
                String newProfileName = UID + "(0)" + ext;
                File newImg = new File(path, newProfileName);
                if(newImg.exists()){
                    for(int renameNum = 1; ; renameNum++){
                        newProfileName = UID + "(" + renameNum + ")" + ext;
                        newImg = new File(path, newProfileName);
                        if(!newImg.exists()){
                            break;
                        }
                    }
                }

                // > �뾽濡쒕뱶
                try {
                    profileImg.transferTo(newImg);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                vo.setImageName(newProfileName);
            }
        }
        try {
            int result = service.certifyBoardWrite(vo);
            if(result > 0){
                mav.setViewName("redirect:list");
            } else {
                mav.addObject("msg", "�벑濡�");
                mav.setViewName("/community/boardResult");
            }
        } catch (Exception e) {
            e.printStackTrace();
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        }
        return mav;
    }

    @GetMapping("community/certifyView")
    public ModelAndView certifyView(int no, String category, pagingVO pVO){
        service.certifyBoardHitCount(no);

        ModelAndView mav = new ModelAndView();
        CertifyBoardVO vo = service.certifyBoardSelect(no, category);
        AccountVO writer = service.findWriterName(vo.getUID());

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime cd = LocalDateTime.parse(vo.getWriteDate(), DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        vo.setWriteDate(cd.format(formatter));

        mav.addObject("vo",vo);
        mav.addObject("writer", writer);
        mav.addObject("pVO",pVO);
        mav.setViewName("community/certifyBoardView");
        return mav;
    }
    @GetMapping("/heartCount")
    @ResponseBody
    public int heartCount(int articleNo, String keyNo){
        return service.countHeart(articleNo, keyNo);
    }
    @PostMapping("/heartState")
    @ResponseBody
    public boolean heartState(HeartVO vo){
        int interaction = service.heartState(vo);
        System.out.println(interaction);
        if(interaction == 0){
            return true;
        } else {
            return false;
        }
    }

    @PostMapping("/heart")
    @ResponseBody
    public boolean heart(HeartVO vo){
        int interaction = service.heartState(vo);

        if(interaction == 0){
            service.heartInsert(vo);
            return true;
        } else {
            service.heartDelete(vo);
            return false;
        }
    }


    @GetMapping("community/certifyDelete")
    public ModelAndView certifyDelete(int no, String category, String imageName, HttpSession session){
        ModelAndView mav = new ModelAndView();
        int result = service.certifyBoardDelete(no, category);
        if(result > 0){
            String path = session.getServletContext().getRealPath("/img/certifyBoard");
            System.out.println("path : " + path);
            File f = new File(path, imageName);
            if(f.exists()){
                f.delete();
            }
            mav.setViewName("redirect:list");
        } else {
            mav.setViewName("redirect:certifyView?no="+no+"&category="+category);
        }
        return mav;
    }
    @GetMapping("community/certifyEdit")
    public ModelAndView certifyEdit(int no, String category){
        ModelAndView mav = new ModelAndView();

        mav.addObject("vo", service.certifyBoardSelect(no,category));
        mav.setViewName("community/certifyBoardEdit");
        return mav;
    }


    @PostMapping("community/certifyEditOk")
    @Transactional(rollbackFor = {RuntimeException.class, SQLException.class})
    public ModelAndView certifyEditOk(CertifyBoardVO vo, HttpSession session, HttpServletRequest request){
        ModelAndView mav = new ModelAndView();
        System.out.println(vo.toString());
        /*1. UID*/
        String UID = (String) session.getAttribute("logId");
        vo.setUID(UID);
        vo.setIp(request.getRemoteAddr());

        /*2. �뙆�씪 �뾽濡쒕뱶*/
        // > �뙆�씪�쓣 �뾽濡쒕뱶�븷 �쐞移� �뤃�뜑 援ы븯湲�(�젅�� 二쇱냼)
        String path = session.getServletContext().getRealPath("/img/certifyBoard");
        System.out.println("path : " + path);

        // > HttpServletRequest -> MultipartHttpServletRequest 媛앹껜瑜� 援ы븳�떎
        MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
        // > MultipartHttpServletRequest 媛앹껜 �궡�뿉 �뙆�씪 �닔留뚰겮 MultipartFile 媛앹껜媛� �엳�쓬
        MultipartFile profileImg = mr.getFile("certifyImg"); // inputTag �쓽 name�냽�꽦 媛�

        if (profileImg != null && !profileImg.isEmpty()){
            String originalFilename = profileImg.getOriginalFilename();
            // �뙆�씪�쓽 蹂몃옒 �씠由꾩씠 �엳�뼱�빞吏�留� �닔�뻾
            if(originalFilename != null && !originalFilename.equals("")){
                File oldImg = new File(path, vo.getImageName());
                System.out.println(vo.getImageName());
                if(oldImg.exists()){
                    oldImg.delete();
                }

                String ext = originalFilename.substring(originalFilename.indexOf("."));
                String newProfileName = UID + "(0)" + ext;
                File newImg = new File(path, newProfileName);
                if(newImg.exists()){
                    for(int renameNum = 1; ; renameNum++){
                        newProfileName = UID + "(" + renameNum + ")" + ext;
                        newImg = new File(path, newProfileName);
                        if(!newImg.exists()){
                            break;
                        }
                    }
                }

                // > �뾽濡쒕뱶
                try {
                    profileImg.transferTo(newImg);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                vo.setImageName(newProfileName);
            }
        }
        try {
            int result = service.certifyBoardEdit(vo);
            System.out.println(result);
            if(result > 0){
                mav.setViewName("redirect:list");
            } else {
                mav.addObject("msg", "�벑濡�");
                mav.setViewName("/account/boardResult");
            }
        } catch (Exception e) {
            e.printStackTrace();
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        }
        return mav;
    }
}
