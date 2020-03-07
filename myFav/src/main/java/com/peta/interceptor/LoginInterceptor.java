package com.peta.interceptor;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.peta.domain.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	private static final String LOGIN = "login";
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception{
		HttpSession session = request.getSession();

		ModelMap modelMap = modelAndView.getModelMap();
		System.out.println("1");
		UserVO userVO = (UserVO) modelMap.get("loginData");
		System.out.println("2");

		System.out.println("3");
		if(userVO != null) {
			session.setAttribute(LOGIN, userVO);
			response.sendRedirect("/"+userVO.getUserid()+"/fav/list");
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		HttpSession session = request.getSession();
		

		if(session.getAttribute(LOGIN) != null) {
			session.removeAttribute(LOGIN);

		}

		return true;
	}
}
