package com.peta.persistence;

import com.peta.domain.UserVO;

public interface UserDAO {
	public UserVO loginCheck(UserVO vo)throws Exception;
	
}
