package com.web.hchnd.mapper;

import java.util.List;

import com.web.hchnd.vo.AccountVO;
import com.web.hchnd.vo.BoardVO;
import com.web.hchnd.vo.CertifyBoardVO;
import com.web.hchnd.vo.pagingVO;

public interface BoardMapper {
	public int boardInsert(BoardVO vo);
	public List<BoardVO> boardPageList(pagingVO pVO);//Page占쏙옙 占쌔댐옙占싹댐옙 占쏙옙占쌘듸옙 占쏙옙占쏙옙
	public int totalRecord(pagingVO pVO);//占싼뤄옙占쌘듸옙占�
	public BoardVO boardSelect(int no);//占쌔당레占쌘드선占쏙옙
	public void hitCount(int no);//占쏙옙회占쏙옙占쏙옙占쏙옙
	public int heartCount(int no);
	public int boardUpdate(BoardVO vo);
	public int boardDelete(int no);//占쌉쏙옙占쏙옙 占쏙옙占쏙옙
	public BoardVO boardSelect2(int no, String category);
	public AccountVO findWriterName(String Uid);
	public List<CertifyBoardVO> boardPageList2(pagingVO pVO);
}