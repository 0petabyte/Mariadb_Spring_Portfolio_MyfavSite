package com.peta.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.peta.domain.UserVO;
import com.peta.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService{
	
	@Inject
	private UserDAO dao;

	@Override
	public UserVO loginCheck(UserVO vo) throws Exception {
		
		return dao.loginCheck(vo);
	}
	
}
