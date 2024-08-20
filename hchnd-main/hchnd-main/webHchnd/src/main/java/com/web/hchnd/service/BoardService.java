package com.web.hchnd.service;

import java.util.List;

import com.web.hchnd.vo.AccountVO;
import com.web.hchnd.vo.BoardVO;
import com.web.hchnd.vo.CertifyBoardVO;
import com.web.hchnd.vo.pagingVO;

public interface BoardService {
	public int boardInsert(BoardVO vo);
	public List<BoardVO> boardPageList(pagingVO pVO);
	public int totalRecord(pagingVO pVO);
	public BoardVO boardSelect(int no);
	public void hitCount(int no);
	public int boardUpdate(BoardVO vo);//�Խ��Ǽ���
	public int boardDelete(int no);
	public BoardVO boardSelect2(int no, String category);
	public AccountVO findWriterName(String Uid);
	public List<CertifyBoardVO> boardPageList2(pagingVO pVO);
}
