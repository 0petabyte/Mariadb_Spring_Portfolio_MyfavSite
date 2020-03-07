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

import com.peta.domain.CodeGroupVO;
import com.peta.domain.CodeVO;
import com.peta.domain.Criteria;
import com.peta.domain.PageMaker;
import com.peta.domain.SearchCriteria;
import com.peta.domain.UserVO;
import com.peta.service.CodeService;

@Controller
@RequestMapping("{username}/code/*")
public class CodeController {
	private static final Logger logger = LoggerFactory.getLogger(CodeController.class);
	
	@Inject
	private CodeService service;
	
    @RequestMapping(value="/list", method= {RequestMethod.GET,RequestMethod.POST})
    public String codeGroupList(@PathVariable String username, Model model,SearchCriteria cri,HttpSession session) throws Exception {
    	

		String userid = username;

    	logger.info("Code Group list start................");
    	//code // fav 구분용
    	String nowtab = "code";
    	model.addAttribute("nowTab",nowtab);
    	String headertype = "code";
    	model.addAttribute("headerType",headertype);
    	
		int groupnum = cri.getGroupnum();
		model.addAttribute("nowgroupnum",groupnum);
		
		//left menu
    	model.addAttribute("codeGroup",service.codeGroupList(userid));
    	cri.setUserid(userid);
    	model.addAttribute("list",service.listCriteria(cri));
    	model.addAttribute("groupcount",service.groupCount(groupnum));
    	model.addAttribute("nowgroupname",service.groupName(groupnum));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("cri",cri);
		pageMaker.setTotalCount(service.countPaging(cri));
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("nowUser",userid);
        return "codeboard/codeList.page";

    }
    
    @RequestMapping(value="/groupInsert", method= {RequestMethod.GET,RequestMethod.POST})
    public String groupInsert(@PathVariable String username, CodeGroupVO vo,HttpSession session) throws Exception{

    	logger.info("code group create..............");
    	logger.info(vo.toString());
    	service.codeGroupInsert(vo);

		int lastgroup = service.lastGroup(vo); 
    	return "redirect:list?groupnum="+lastgroup;
    	
    }
    
	@RequestMapping(value="/groupDelete", method = RequestMethod.GET)
	public String groupDelete(@RequestParam("groupnum") int groupnum) throws Exception{
		service.groupDelete(groupnum);
		return "redirect:list";
	}
	
	@RequestMapping(value="/codeInsert", method= {RequestMethod.GET})
	public String codeInsertGET(CodeVO vo,HttpServletRequest request,Model model,HttpSession session,@PathVariable String username) throws Exception{

		logger.info("code insert GET");
    	String nowtab = "code";
    	model.addAttribute("nowTab",nowtab);
    	String codeType = "read";
		int groupnum = vo.getGroupnum();
		System.out.println(groupnum);
		model.addAttribute("nowgroupnum",groupnum);
    	model.addAttribute("codeGroup",service.codeGroupList(username));
    	model.addAttribute("codeType",codeType);
		String backBtn = "codeRead";
		model.addAttribute("backBtn",backBtn);
    	//model.addAttribute("list",service.codeList(vo));
    	//model.addAttribute("AllList",service.codeAllList(vo));
    	model.addAttribute("groupcount",service.groupCount(groupnum));
    	model.addAttribute("nowgroupname",service.groupName(groupnum));
		return "codeboard/insertForm.page";

	}
	
	
	@RequestMapping(value="/codeInsert", method= {RequestMethod.POST})
	public String codeInsert(CodeVO codevo,HttpServletRequest request,@PathVariable String username, HttpSession session) throws Exception{
    	
		logger.info("code Insert POST IN");
		logger.info(codevo.toString());
		service.codeInsert(codevo);

		int groupnum = codevo.getGroupnum();
		return "redirect:list?groupnum="+groupnum;
	}
	
	@RequestMapping(value="/codeRead", method = RequestMethod.GET)
	public String codeRead(@RequestParam("codenum") int codenum,@PathVariable String username,@ModelAttribute("cri") SearchCriteria cri, Model model, HttpSession session) throws Exception{
		String userid = username;
		model.addAttribute("readlist",service.codeRead(codenum));
		model.addAttribute("codeGroup",service.codeGroupList(userid));
		String backBtn = "codeRead";
		model.addAttribute("backBtn",backBtn);
		String nowtab = "code";
		model.addAttribute("nowTab",nowtab);
		model.addAttribute("nowUser",userid);


		model.addAttribute("nowgroupnum",service.lastPageGroup(codenum));
		model.addAttribute("nowgroupname",service.codeGroupName(codenum));
		return "codeboard/codePage.page";
	}
	
	@RequestMapping(value="/readPage", method = RequestMethod.GET)
	public void read(@RequestParam("codenum") int codenum, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		model.addAttribute(service.codeRead(codenum));
		System.out.println(model);
		
	}

	
	@RequestMapping(value="/codeDelete", method = RequestMethod.GET)
	public String urlDelete(@RequestParam("codenum") int codenum,RedirectAttributes rttr,SearchCriteria cri) throws Exception{
		System.out.println(cri);
		rttr.addAttribute("groupnum",cri.getGroupnum());
		service.codeDelete(codenum);
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("keyword",cri.getKeyword());
		rttr.addAttribute("searchType",cri.getSearchType());
		return "redirect:list";
	}
    
	@RequestMapping(value="/codeModify", method = RequestMethod.GET)
	public String codeModify(@RequestParam("codenum") int codenum, @ModelAttribute("cri") SearchCriteria cri,HttpSession session,Model model,HttpServletRequest request) throws Exception{
		System.out.println(cri);
		UserVO user2 = (UserVO) session.getAttribute("login");
		String userid = user2.getUserid();
		model.addAttribute("readlist",service.codeRead(codenum));
		model.addAttribute("nowgroupnum",service.lastPageGroup(codenum));
		model.addAttribute("nowgroupname",service.codeGroupName(codenum));
    	String nowtab = "code";
    	model.addAttribute("nowTab",nowtab);

		model.addAttribute("codeGroup",service.codeGroupList(userid));

		String backBtn = "codeRead";
		model.addAttribute("backBtn",backBtn);
		String old_url = request.getHeader("referer");
		model.addAttribute("lastPage",old_url);
		return "codeboard/codeModify.page";
	}
	
	@RequestMapping(value="/codeModify", method = RequestMethod.POST)
	public String codeModifyPost(@RequestParam("codenum") int codenum,SearchCriteria cri,RedirectAttributes rttr,CodeVO vo, Model model,HttpServletRequest request) throws Exception{
		rttr.addAttribute("groupnum",cri.getGroupnum());
		model.addAttribute("readlist",service.codeRead(codenum));
		service.codemodify(vo);
		String old_url = request.getHeader("referer");
		model.addAttribute("lastPage",old_url);
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("keyword",cri.getKeyword());
		rttr.addAttribute("searchType",cri.getSearchType());
		return "redirect:codeRead?codenum="+codenum;
	}
	
	@RequestMapping(value = "/portfolio", method = RequestMethod.GET)
	public String listPortfolio(@PathVariable ("username") String username, Model model,SearchCriteria cri)throws Exception{
		String userid = username;

    	logger.info("Code Group list start................");
    	//code // fav 구분용
    	String nowtab = "code";
    	model.addAttribute("nowTab",nowtab);
    	String headertype = "code";
    	model.addAttribute("headerType",headertype);

		//left menu
    	model.addAttribute("codeGroup",service.codeGroupList(userid));
    	cri.setUserid(userid);
    	model.addAttribute("list",service.listPortfolio(username));

    	int groupnum = service.portNum(username);
    	
    	model.addAttribute("nowgroupnum",groupnum);
    	cri.setGroupnum(groupnum);
    	model.addAttribute("groupcount",service.groupCount(groupnum));
    	model.addAttribute("nowgroupname",service.groupName(groupnum));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		model.addAttribute("cri",cri);
		pageMaker.setTotalCount(service.countPaging(cri));
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("nowUser",userid);
        return "codeboard/codeList.page";
	}
}
