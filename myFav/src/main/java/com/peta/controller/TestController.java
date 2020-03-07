package com.peta.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/{test}/*")
public class TestController {
	

	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public void test(@PathVariable String test)throws Exception{
		System.out.println(test);
	}
}
