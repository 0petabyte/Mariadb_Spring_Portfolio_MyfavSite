package com.peta.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.peta.domain.Criteria;
import com.peta.domain.GroupVO;
import com.peta.domain.PageMaker;
import com.peta.domain.SearchCriteria;
import com.peta.domain.UrlVO;
import com.peta.domain.UserVO;
import com.peta.service.GroupService;

@Controller
@RequestMapping("{username}/fav/*")
public class GroupController {
	private static final Logger logger = LoggerFactory.getLogger(GroupController.class);
	
	@Inject
	private GroupService service;
	
	@RequestMapping(value="/list", method = {RequestMethod.GET,RequestMethod.POST})
	public String groupList(@PathVariable String username,Model model,UrlVO vo,SearchCriteria cri,UserVO user,HttpSession session) throws Exception{
		String userid = username;

		cri.setUserid(userid);
		logger.info(cri.toString());
		user.setUserid(userid);
		model.addAttribute("grouplist",service.listGroup(user));
		model.addAttribute("list",service.listCriteria(cri));
		String codeType = "fav";
		model.addAttribute("headerType",codeType);
		model.addAttribute("codeType",codeType);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("cri",cri);
		pageMaker.setTotalCount(service.listCountPaging(cri));
		
		model.addAttribute("pageMaker",pageMaker);
		
	
		int groupnum = vo.getGroupnum();
		model.addAttribute("nowgroupnum",groupnum);
		model.addAttribute("groupcount",service.groupCount(groupnum));
		model.addAttribute("nowgroupname",service.groupName(groupnum));
		model.addAttribute("nowUser",userid);
		return "favboard/favList.page";
    	
	}
	
	
	/*
	 * @RequestMapping(value="/groupInsert", method = RequestMethod.GET) public void
	 * groupInsert(GroupVO vo) throws Exception{ System.out.println("GET");
	 * logger.info("group insert.............");
	 * 
	 * }
	 */
	
	@RequestMapping(value="/groupInsert", method = {RequestMethod.GET,RequestMethod.POST})
	public String groupInsertPOST(GroupVO vo) throws Exception{
		

		logger.info("group insert.............");
		logger.info(vo.toString());

		service.groupInsert(vo);
		System.out.println(vo);

		int lastgroup = service.lastGroup(vo);

		System.out.println(lastgroup);

		return "redirect:list?groupnum="+lastgroup;
	}
	
	@RequestMapping(value="/groupDelete", method = RequestMethod.GET)
	public String groupDelete(@RequestParam("groupnum") int groupnum) throws Exception{
		service.groupDelete(groupnum);
		return "redirect:list";
	}
	
	@RequestMapping(value="/urlInsert", method= {RequestMethod.GET,RequestMethod.POST})
	public String urlInsert(@PathVariable String username,UrlVO urlvo,HttpServletRequest request, HttpSession session) throws Exception{

		logger.info("url Insert");

		service.urlInsert(urlvo);

		String old_url = request.getHeader("referer");
		return "redirect:"+old_url;
	}
	
	@RequestMapping(value="/urlDelete" , method = RequestMethod.GET)
	public String urlDelete(@RequestParam("favnum") int favnum,RedirectAttributes rttr,SearchCriteria cri,HttpSession session) throws Exception{
		rttr.addAttribute("groupnum",cri.getGroupnum());
		service.urlDelete(favnum);
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("keyword",cri.getKeyword());
		rttr.addAttribute("searchType",cri.getSearchType());
		return "redirect:list";
	}
	
	@RequestMapping(value="/favRead", method = RequestMethod.GET)
	public String favRead(@RequestParam("favnum") int favnum,@PathVariable ("username") String username, UserVO user,Model model,HttpServletRequest request, @ModelAttribute("cri") SearchCriteria cri) throws Exception{
		model.addAttribute("favlist",service.favRead(favnum));
		model.addAttribute("grouplist",service.listGroup(user));
		String nowtab = "fav";
		model.addAttribute("nowTab",nowtab);
		String old_url = request.getHeader("referer");
		
		String backBtn = "favRead";
		model.addAttribute("backBtn",backBtn);
		model.addAttribute("nowgroupname",service.favGroupName(favnum));
		model.addAttribute("nowgroupnum",service.groupNumber(favnum));
		/* model.addAttribute("lastPageGroup",service.lastPageGroup(favnum)); */
		model.addAttribute("lastPage",old_url);
		model.addAttribute("nowUser",username);
		

		return "favboard/favPage.page";
	}
	
	@RequestMapping(value="/favRead", method = RequestMethod.POST)
	public String favModifyPost(@RequestParam("favnum") int favnum,UrlVO vo,SearchCriteria cri, Model model,RedirectAttributes rttr) throws Exception{	
		rttr.addAttribute("groupnum",cri.getGroupnum());
		service.favmodify(vo);
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("keyword",cri.getKeyword());
		rttr.addAttribute("searchType",cri.getSearchType());
		return "redirect:favRead?favnum="+favnum;
	}
	
}
