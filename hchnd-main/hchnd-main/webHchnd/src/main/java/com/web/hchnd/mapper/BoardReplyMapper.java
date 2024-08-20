package com.web.hchnd.mapper;

import java.util.List; 

import com.web.hchnd.vo.BoardReplyVO;

public interface BoardReplyMapper {
	public int replyInsert(BoardReplyVO vo);
	public List<BoardReplyVO> replySelect(int no);
	public int replyUpdate(BoardReplyVO vo);
	public int replyDelete(int replyno);
}