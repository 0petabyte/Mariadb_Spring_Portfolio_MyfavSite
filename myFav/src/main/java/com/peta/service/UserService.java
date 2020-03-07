package com.peta.service;

import com.peta.domain.UserVO;

public interface UserService {
	public UserVO loginCheck(UserVO vo)throws Exception;
	
}
