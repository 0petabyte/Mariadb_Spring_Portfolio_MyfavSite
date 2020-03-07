package com.peta.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.peta.domain.UserVO;
import com.peta.service.GroupService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private GroupService service;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() throws Exception {


		return "redirect:/login";
	}
	
	
	@RequestMapping(value="{username}/guestBook" ,method = RequestMethod.GET)
	public String geustBook(Model model,@PathVariable String username,UserVO user) throws Exception{
		model.addAttribute("nowUser",username);
		user.setUserid(username);
		model.addAttribute("grouplist",service.listGroup(user));
		String codeType = "fav";
		model.addAttribute("headerType",codeType);
		return "guestbook/guestBook.page";
	}
	
	
	@RequestMapping(value="/test2" ,method = RequestMethod.GET)
	public String test2() {
		return "test2.page";
	}
	

	/*    
	*//**
		 * Tiles를 사용하지 않은 일반적인 형태
		 */
	/*
	 * @RequestMapping("/test") public String test() { return "test"; }
	 * 
	 *//**
		 * Tiles를 사용(header, left, footer 포함)
		 */
	/*
	 * @RequestMapping("/testPage") public String testPage() { return
	 * "test/test.page"; }
	 * 
	 * @RequestMapping("/testPage2") public String testPage2() { return
	 * "board/board.page"; }
	 * 
	 *//**
		 * Tiles를 사용(header, left, footer 제외)
		 *//*
			 * @RequestMapping("/testPart.do") public String testPart() { return
			 * "test.part"; }
			 */
}
