package com.peta.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.peta.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace="com.peta.mapper.UserMapper";

	@Override
	public UserVO loginCheck(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".userName",vo);
	}

	
}
