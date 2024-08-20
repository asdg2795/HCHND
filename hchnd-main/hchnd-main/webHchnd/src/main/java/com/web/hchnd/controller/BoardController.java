package com.web.hchnd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.hchnd.service.BoardService;
import com.web.hchnd.vo.AccountVO;
import com.web.hchnd.vo.BoardVO;
import com.web.hchnd.vo.CertifyBoardVO;
import com.web.hchnd.vo.pagingVO;

@Controller
public class BoardController {
   @Autowired
   BoardService service;
   //占쌉쏙옙占쏙옙
   
   @GetMapping("/community/list")
   public ModelAndView boardList(pagingVO pVO) {
      ModelAndView mav = new ModelAndView();     

      //占싼뤄옙占쌘듸옙占�
      pVO.setTotalRecord(service.totalRecord(pVO));          
      //DB 占쏙옙占쏙옙(page, 占싯삼옙占쏙옙占�)
      List<BoardVO> list=service.boardPageList(pVO);
      List<CertifyBoardVO> list2=service.boardPageList2(pVO);
      

      mav.addObject("pVO",pVO);
      mav.addObject("list", list);
      mav.addObject("list2", list2);
      mav.setViewName("community/boardList");
      return mav;
   }
   //占쌜억옙占쏙옙 占쏙옙
   @GetMapping("/community/write")
   public String boardWrite() {
	   return "community/boardWrite";
   }
   //占쌜듸옙占�
   @PostMapping("/community/writeOk")
   public ModelAndView boardWriteOk(BoardVO vo, HttpServletRequest request) {
	   ModelAndView mav = new ModelAndView();

	   vo.setIp(request.getRemoteAddr());
	   vo.setUid((String)(request.getSession()).getAttribute("logId"));
	   
	   int result = service.boardInsert(vo);
	   if(result>0) {
		   mav.setViewName("redirect:list");
	   }else {
		   mav.addObject("msg","등록");
		   mav.setViewName("community/boardResult");
	   }
	   return mav;
   }
   //占쌜놂옙占쎈보占쏙옙
   @GetMapping("/community/view")
   public ModelAndView boardView(int no, String category, pagingVO pVO) {
	   
	   service.hitCount(no);//조회수증가
	   BoardVO vo = service.boardSelect2(no, category);
	   System.out.println(vo.getUid());
	   AccountVO writer = service.findWriterName(vo.getUid());
	   
	   
	   ModelAndView mav = new ModelAndView();
	   
	   mav.addObject("vo",vo);
	   mav.addObject("pVO",pVO);
	   mav.addObject("writer",writer);
	   mav.setViewName("community/boardView");
	   return mav;
   }
   //占쏙옙 占쏙옙占쏙옙 占쏙옙
   @GetMapping("/community/edit")
   public ModelAndView boardEdit(int no) {
	   ModelAndView mav = new ModelAndView();
	   mav.addObject("vo",service.boardSelect(no));
	   mav.setViewName("community/boardEdit");
	   return mav;
   }
   //占쏙옙 占쏙옙占쏙옙(DB)
   @PostMapping("/community/editOk")
   public ModelAndView boardEditOk(BoardVO vo) {
	   int result = service.boardUpdate(vo);
	   ModelAndView mav = new ModelAndView();
	   if(result>0) {
		   mav.setViewName("redirect:view?no=" + vo.getNo() + "&category=" + vo.getCategory());
	   }else {
		   mav.addObject("msg"," 수정에 찡긋><");
		   mav.setViewName("community/boardResult");
	   }
	   return mav;
   }
   //占쌉시깍옙 占쏙옙占쏙옙
   @GetMapping("/community/delete")
   		public ModelAndView boardDelete(int no) {
	    ModelAndView mav = new ModelAndView();
	   	int result = service.boardDelete(no);
	   	if(result>0) {//占쏙옙占쏙옙
	   		mav.setViewName("redirect:list");//占쌜몌옙占쏙옙占쏙옙占� 占쏙옙占쏙옙
	   	}else {
	   		mav.setViewName("redirect:view?no="+no);
	   	}
	   	return mav;
   }
}