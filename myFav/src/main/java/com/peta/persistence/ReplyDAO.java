package com.peta.persistence;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.peta.domain.Criteria;
import com.peta.domain.ReplyVO;

public interface ReplyDAO {
	public List<ReplyVO> list(String touser) throws Exception;
	
	public List<ReplyVO> sessionList(String username) throws Exception;
	
	public void create(ReplyVO vo) throws Exception;
	
	public void update(ReplyVO vo) throws Exception;
	
	public void delete(Integer rno) throws Exception;
	
	public List<ReplyVO> listpage(String touser, Criteria cri) throws Exception;
	
	public List<ReplyVO> sessionListpage(String username, Criteria cri) throws Exception;
	
	public int count(String touser) throws Exception;
	
	public int sessionCount(String username) throws Exception;
	
}
