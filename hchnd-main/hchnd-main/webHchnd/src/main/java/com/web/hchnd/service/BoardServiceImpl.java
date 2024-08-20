package com.web.hchnd.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.web.hchnd.mapper.BoardMapper;
import com.web.hchnd.vo.AccountVO;
import com.web.hchnd.vo.BoardVO;
import com.web.hchnd.vo.CertifyBoardVO;
import com.web.hchnd.vo.pagingVO;
@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	BoardMapper mapper;

	@Override
	public int boardInsert(BoardVO vo) {
		return mapper.boardInsert(vo);
	}

	@Override
	public List<BoardVO> boardPageList(pagingVO pVO) {
		return mapper.boardPageList(pVO);
	}

	@Override
	public int totalRecord(pagingVO pVO) {
		return mapper.totalRecord(pVO);
	}

	@Override
	public BoardVO boardSelect(int no) {
		return mapper.boardSelect(no);
	}

	@Override
	public void hitCount(int no) {
		mapper.hitCount(no);
	}

	@Override
	public int boardUpdate(BoardVO vo) {
		// TODO Auto-generated method stub
		return mapper.boardUpdate(vo);
	}

	@Override
	public int boardDelete(int no) {
		
		return mapper.boardDelete(no);
	}


	@Override
	public BoardVO boardSelect2(int no, String category) {
		// TODO Auto-generated method stub
		return mapper.boardSelect2(no, category);
	}

	@Override
	public AccountVO findWriterName(String Uid) {
		// TODO Auto-generated method stub
		return mapper.findWriterName(Uid);
	}

	@Override
	public List<CertifyBoardVO> boardPageList2(pagingVO pVO) {
		// TODO Auto-generated method stub
		return mapper.boardPageList2(pVO);
	}


}
