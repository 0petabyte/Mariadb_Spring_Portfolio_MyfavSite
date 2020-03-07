package com.peta.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.peta.domain.Criteria;
import com.peta.domain.ReplyVO;


@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.peta.mapper.ReplyMapper";

	@Override
	public List<ReplyVO> list(String touser) throws Exception {

		return session.selectList(namespace+".list",touser);
	}
	
	

	@Override
	public List<ReplyVO> sessionList(String username) throws Exception {
		return session.selectList(namespace+".sessionList",username);
	}



	@Override
	public void create(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace+".create", vo);
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+".update",vo);
	}

	@Override
	public void delete(Integer rno) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+".delete",rno);
	}
	
	@Override
	public List<ReplyVO> listpage(String touser, Criteria cri) throws Exception{
		Map<String, Object> paraMap = new HashMap<> ();
		
		paraMap.put("touser",touser);
		paraMap.put("cri",cri);
		
		return session.selectList(namespace + ".listPage", paraMap);
		
		 
	}
	
	@Override
	public int count(String touser) throws Exception{
		return session.selectOne(namespace+".count",touser);
	}



	@Override
	public List<ReplyVO> sessionListpage(String username, Criteria cri) throws Exception {
		Map<String, Object> paraMap = new HashMap<> ();
		paraMap.put("username",username);
		paraMap.put("cri",cri);
		return session.selectList(namespace + ".sessionListPage", paraMap);
	}



	@Override
	public int sessionCount(String username) throws Exception {
		return session.selectOne(namespace+".sessionCount",username);
	}
	


}
