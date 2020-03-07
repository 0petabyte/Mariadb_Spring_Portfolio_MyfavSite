package com.peta.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.peta.domain.Criteria;
import com.peta.domain.ReplyVO;
import com.peta.persistence.ReplyDAO;


@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO dao;

	@Transactional
	@Override
	public void addReply(ReplyVO vo) throws Exception {
		dao.create(vo);
	}
	
	

	@Override
	public List<ReplyVO> listReply(String touser) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(touser);
	}

	
	
	@Override
	public List<ReplyVO> sessionList(String username) throws Exception {
		// TODO Auto-generated method stub
		return dao.sessionList(username);
	}



	@Override
	public void modifyReply(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public void removeReply(Integer rno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(rno);
	}

	@Override
	public List<ReplyVO> listReplyPage(String touser, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
	
		return dao.listpage(touser, cri);
	}

	@Override
	public int count(String touser) throws Exception {
		// TODO Auto-generated method stub
		return dao.count(touser);
	}



	@Override
	public List<ReplyVO> sessionListpage(String username, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.sessionListpage(username, cri);
	}



	@Override
	public int sessionCount(String username) throws Exception {
		// TODO Auto-generated method stub
		return dao.sessionCount(username);
	}

	

	
}
