package com.web.hchnd.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.web.hchnd.mapper.ProgramDescMapper;
import com.web.hchnd.vo.programDescPagingVO;
import com.web.hchnd.vo.ProgramDescVO;

@Service
public class ProgramDescImpl implements ProgramDescService{
	@Inject
	ProgramDescMapper mapper;

	@Override
	public List<ProgramDescVO> programPageList(programDescPagingVO pdpVO) {
		return mapper.programPageList(pdpVO);
	}

	@Override
	public ProgramDescVO prgSelect(int programNo) {
		return mapper.prgSelect(programNo);
	}

	@Override
	public int totalRecord(programDescPagingVO pdpVO) {
		return mapper.totalRecord(pdpVO);
	}

	
	
}
