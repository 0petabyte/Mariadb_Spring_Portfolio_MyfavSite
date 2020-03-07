package com.peta.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.peta.domain.Criteria;
import com.peta.domain.PageMaker;
import com.peta.domain.ReplyVO;
import com.peta.domain.UserVO;
import com.peta.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {

	@Inject
	private ReplyService service;
	
	@RequestMapping(value="",method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO vo){
		ResponseEntity<String> entity = null;
		System.out.println("post");
		System.out.println(vo.getReplyer());
		if (vo.getReplyer() == null) {
			String replyer = "¼Õ´Ô";
			vo.setReplyer(replyer);
		}
		try {
			service.addReply(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/all/{touser}", method=RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("touser") String touser,HttpSession session){
		ResponseEntity<List<ReplyVO>> entity= null;
		
		UserVO user = (UserVO) session.getAttribute("login");
		String username = user.getUserid();
		System.out.println("================");
		System.out.println(username);
		System.out.println(touser);
		System.out.println("================");
		if (!username.equals(touser)) {
			try {
				System.out.println("in");
				entity = new ResponseEntity<>(service.sessionList(username),HttpStatus.OK);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("ex");
				e.printStackTrace();
			}
		}else {
		System.out.println(touser);
		try {
			entity = new ResponseEntity<>(service.listReply(touser),HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		}
		return entity;
		
	}
	
	@RequestMapping(value="/{rno}", method = {RequestMethod.PUT,RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody ReplyVO vo){
		ResponseEntity<String> entity = null;
		try {
			vo.setRno(rno);
			service.modifyReply(vo);
			
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/{rno}", method=RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("rno") Integer rno){
		ResponseEntity<String> entity = null;
		try {
			service.removeReply(rno);
			entity=new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{touser}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> listPage(@PathVariable("touser") String touser,
			@PathVariable("page") Integer page,HttpSession session){
		
		UserVO user = (UserVO)session.getAttribute("login");
		String username = user.getUserid();
		
		System.out.println(touser);
		ResponseEntity<Map<String, Object>> entity = null;
		
		if(!username.equals(touser)) {
			Criteria cri = new Criteria();
			cri.setPage(page);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			Map<String, Object> map = new HashMap<String, Object>();
			try {
				List<ReplyVO> list = service.sessionListpage(username, cri);
				map.put("list", list);
				int replyCount = service.sessionCount(username);
				pageMaker.setTotalCount(replyCount);
				
				map.put("pageMaker", pageMaker);
				
				entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 
		}
		else {
		
		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			
			Map<String, Object> map = new HashMap<String, Object>();
			List<ReplyVO> list = service.listReplyPage(touser, cri);
			
			map.put("list", list);
			
			int replyCount = service.count(touser);
			pageMaker.setTotalCount(replyCount);
			
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		}
		return entity;
		
	}
}
