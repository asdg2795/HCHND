package com.web.hchnd.service;

import java.util.List; 

import com.web.hchnd.vo.BoardReplyVO;

public interface BoardReplyService{
	public int replyInsert(BoardReplyVO vo);
	public List<BoardReplyVO> replySelect(int no);//占쏙옙肪占쏙옙
	public int replyUpdate(BoardReplyVO vo);// 占쏙옙占� 占쏙옙占쏙옙(DB)
	public int replyDelete(int replyno);
}
