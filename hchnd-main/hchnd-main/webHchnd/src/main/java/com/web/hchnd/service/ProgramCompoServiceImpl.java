package com.web.hchnd.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.web.hchnd.mapper.ProgramCompoMapper;
import com.web.hchnd.vo.ProgramCompoVO;

@Service
public class ProgramCompoServiceImpl implements ProgramCompoService{
    @Inject
    ProgramCompoMapper mapper;

    @Override
    public List<ProgramCompoVO> programComposition(ProgramCompoVO pcvo) {
        return mapper.programComposition(pcvo);
    }


}