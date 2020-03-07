package com.peta.service;

import java.util.List;

import com.peta.domain.Criteria;
import com.peta.domain.GroupVO;
import com.peta.domain.SearchCriteria;
import com.peta.domain.UrlVO;
import com.peta.domain.UserVO;

public interface GroupService {
	public List<GroupVO> listGroup(UserVO user)throws Exception;
	
	public void groupInsert(GroupVO vo)throws Exception;
	
	public List<UrlVO> urlList(UrlVO vo) throws Exception;
	
	public void groupDelete(Integer groupnum) throws Exception;
	
	public void urlInsert(UrlVO urlvo) throws Exception;
	
	public void urlDelete(Integer favnum) throws Exception;
	
	public int groupCount(Integer groupnum) throws Exception;
	
	public int lastGroup(GroupVO vo) throws Exception;
	
	public String groupName(Integer groupnum) throws Exception;
	
	public List<UrlVO> urlListAll(UrlVO vo) throws Exception;
	
	public UrlVO favRead(Integer favnum) throws Exception;

	public String favGroupName(Integer favnum) throws Exception;
	
	public void favmodify(UrlVO vo) throws Exception;
	
	public int groupNumber(Integer favnum) throws Exception;
	
	public List<UrlVO> listCriteria(SearchCriteria cri) throws Exception;
	
	public int listCountPaging(Criteria cri) throws Exception;
}
