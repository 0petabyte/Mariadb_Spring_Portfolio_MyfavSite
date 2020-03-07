package com.peta.service;

import java.util.List;

import com.peta.domain.Criteria;
import com.peta.domain.ReplyVO;

public interface ReplyService {
	
	public void addReply(ReplyVO vo) throws Exception;
	
	public List<ReplyVO> listReply(String touser) throws Exception;
	
	public List<ReplyVO> sessionList(String username) throws Exception;
	
	public void modifyReply(ReplyVO vo) throws Exception;
	
	public void removeReply(Integer rno) throws Exception;

	public List<ReplyVO> listReplyPage(String touser, Criteria cri) throws Exception;
	
	public int count(String touser) throws Exception;
	
	public List<ReplyVO> sessionListpage(String username, Criteria cri) throws Exception;
	
	public int sessionCount(String username) throws Exception;
}
