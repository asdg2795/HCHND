package com.web.hchnd.service;
import java.util.List;

import com.web.hchnd.vo.ProgramDescVO;
import com.web.hchnd.vo.programDescPagingVO;

public interface ProgramDescService {
	public List<ProgramDescVO> programPageList(programDescPagingVO pdpVO);
	public ProgramDescVO prgSelect(int programNo);
	public int totalRecord(programDescPagingVO pdpVO);
}
