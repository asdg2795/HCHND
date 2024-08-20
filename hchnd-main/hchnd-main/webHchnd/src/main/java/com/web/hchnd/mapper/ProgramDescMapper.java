package com.web.hchnd.mapper;

import java.util.List;

import com.web.hchnd.vo.ProgramDescVO;
import com.web.hchnd.vo.programDescPagingVO;

public interface ProgramDescMapper {
	public List<ProgramDescVO> programPageList(programDescPagingVO pdpVO);
	int totalRecord(programDescPagingVO pdpVO);
	public ProgramDescVO prgSelect(int programNo);

	
}
