package com.peta.controller;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.peta.domain.UserVO;
import com.peta.service.UserService;

@Controller
public class UserController {
	
	@Inject
	private UserService service;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login()throws Exception{
		return "login";
	}
	
	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	public void loginCheck(UserVO user,Model model, HttpSession session) throws Exception{
		System.out.println(user.toString());
		UserVO username = service.loginCheck(user);
		System.out.println("username :" +username);
		if (username == null) {
			System.out.println("리턴");
			return;
		}
		System.out.println("이것도 하냐?");
		model.addAttribute("loginData", username);

	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		Object obj = session.getAttribute("login");
		String referer = (String)request.getHeader("REFERER");

		if(obj != null) {
			UserVO user = (UserVO) obj;
			
			session.removeAttribute("login");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			

			if(loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				
			}
		}
		return "redirect:"+referer;
	}
}
