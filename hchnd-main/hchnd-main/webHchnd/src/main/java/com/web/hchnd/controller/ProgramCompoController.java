package com.web.hchnd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.hchnd.service.ProgramCompoService;
import com.web.hchnd.vo.ProgramCompoVO;
import com.web.hchnd.vo.ProgramDescVO;

@Controller
public class ProgramCompoController {
    @Autowired
    ProgramCompoService service;
   
    @GetMapping("/program/programCompo/list")
    public ModelAndView programCompoList(ProgramCompoVO pcVO) {
    	
        ModelAndView mav = new ModelAndView();
        
        System.out.println(pcVO.getProgramNo());
        System.out.println(pcVO.getExercises());
        
        List<ProgramCompoVO> list = service.programComposition(pcVO);
        
       
        mav.addObject("pcvo",pcVO);
        mav.addObject("list",list);
        
        mav.setViewName("/program/programCompo/programCompoList");
        return mav;
    }
}