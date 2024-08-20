package com.web.hchnd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.hchnd.service.ProgramDescService;
import com.web.hchnd.vo.programDescPagingVO;
import com.web.hchnd.vo.ProgramDescVO;

@Controller
public class ProgramDescController {
	@Autowired
	ProgramDescService service;
	
	  @GetMapping("/program/programDesc/list")
	   public ModelAndView programList() {
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("/program/programDesc/programList");
	      return mav;
	      }
	
	//해당플로그램 정 가ㅂ
	@GetMapping("/program/programDesc/info")
	@ResponseBody
	public ProgramDescVO programInformation(int programNo) {
		
		return service.prgSelect(programNo);
	}
	
	     @GetMapping("/program/programDesc/view")
	      public ModelAndView prodeamDescView(int programNo, programDescPagingVO pdpVO) {
	   	   
	   	   ProgramDescVO vo = service.prgSelect(programNo);
	   	   
	   	   ModelAndView mav = new ModelAndView();
	   	   mav.addObject("vo",vo);
	   	   mav.addObject("pdpVO",pdpVO);
	   	   mav.setViewName("/program/programDesc/programView");
	   	   return mav;
	   }
    
}
