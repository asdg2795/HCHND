package com.web.hchnd.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.web.hchnd.mapper.BoardReplyMapper;
import com.web.hchnd.vo.BoardReplyVO;

@Service
public class BoardReplyServiceImpl implements BoardReplyService {
	@Inject
	BoardReplyMapper mapper;

	@Override
	public int replyInsert(BoardReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.replyInsert(vo);
	}

	@Override
	public List<BoardReplyVO> replySelect(int no) {
		// TODO Auto-generated method stub
		return mapper.replySelect(no);
		
	}

	@Override
	public int replyUpdate(BoardReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.replyUpdate(vo);
	}

	@Override
	public int replyDelete(int replyno) {
		// TODO Auto-generated method stub
		return mapper.replyDelete(replyno);
	}
}
