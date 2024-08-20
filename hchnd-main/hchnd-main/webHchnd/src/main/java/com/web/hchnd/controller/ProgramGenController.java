package com.web.hchnd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.hchnd.service.ProgramGenService;
import com.web.hchnd.vo.ProgramGenVO;

@Controller
public class ProgramGenController {
    @Autowired
    ProgramGenService service;
   
    
    @GetMapping("/program/programCompo/gen")
    public ModelAndView programGen(ProgramGenVO vo) {
    	
        ModelAndView mav = new ModelAndView();
        Map<String, Double> exData = new HashMap<String, Double>();
        System.out.println(vo.getPrgname());
        if(vo.getPrgname().equals("strLift55")) {
        	/*vo.setSquat(vo.getSquat()*0.5);
        	vo.setBenchPress(vo.getBenchPress()*0.5);
        	vo.setBarbellRow(vo.getBarbellRow()*0.5);
        	vo.setOverHeadPress(vo.getOverHeadPress()*0.5);
        	vo.setDeadLift(vo.getDeadLift()*0.5);*/
        	
        	exData.put("Squat", vo.getSquat()*0.5);
        	exData.put("BenchPress", vo.getBenchPress()*0.5);
        	exData.put("BarbellRow", vo.getBarbellRow()*0.5);
        	exData.put("OverHeadPress", vo.getOverHeadPress()*0.5);
        	exData.put("DeadLift", vo.getDeadLift()*0.5);
        	
        }else if(vo.getPrgname().equals("GVT1010")){
        	exData.put("DumbellPress", vo.getDumbellPress()*0.6);
        	exData.put("Squat", vo.getSquat()*0.6);
        	exData.put("LegCurl", vo.getLegCurl()*0.6);
        	exData.put("OverHeadPress", vo.getOverHeadPress()*0.6);
        	exData.put("BarbellCurl", vo.getBarbellCurl()*0.6);
        	
        }else if(vo.getPrgname().equals("texasMethod")){
        	
        }
        for(String key:exData.keySet()) {
        	System.out.println(key+"."+exData.get(key));
        }
        
        
        
        mav.addObject("vo",vo);
        mav.addObject("exData",exData);
        mav.setViewName("/account/dashBoard");
        return mav;
    }
    
    
}
