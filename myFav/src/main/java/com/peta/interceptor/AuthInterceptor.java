package com.peta.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.peta.domain.UserVO;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler
			) throws Exception{
		System.out.println("프리핸들러 AUTH");
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute("login");
		Map<String,String> test = (Map<String,String>) request.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);
		String username = test.get("username");

		if(user == null || !username.equals(user.getUserid())) {
			response.sendRedirect("/login");
			return false;
		}
		return true;
	}
}
