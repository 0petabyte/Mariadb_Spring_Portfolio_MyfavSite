package com.peta.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.peta.domain.Criteria;
import com.peta.domain.GroupVO;
import com.peta.domain.SearchCriteria;
import com.peta.domain.UrlVO;
import com.peta.domain.UserVO;
import com.peta.persistence.GroupDAO;

@Service
public class GroupServiceImpl implements GroupService{
	
	@Inject
	private GroupDAO dao;
	
	@Override
	public List<GroupVO> listGroup(UserVO vo)throws Exception{
		//System.out.println("¼­ºñ½º");
		return dao.listGroup(vo);
	}
	
	@Override
	public void groupInsert(GroupVO vo)throws Exception{
		dao.groupInsert(vo);
	}
	
	@Override
	public List<UrlVO> urlList(UrlVO vo) throws Exception{
		return dao.urlList(vo);
	}
	
	@Override
	public void groupDelete(Integer groupnum) throws Exception{
		dao.groupDelete(groupnum);
	}
	
	@Override
	public void urlInsert(UrlVO urlvo) throws Exception{
		dao.urlInsert(urlvo);
	}
	
	@Override
	public void urlDelete(Integer favnum) throws Exception{
		dao.urlDelete(favnum);
	}
	
	@Override
	public int groupCount(Integer groupnum) throws Exception{
		return dao.groupCount(groupnum);
	}
	
	@Override
	public int lastGroup(GroupVO vo) throws Exception{
		return dao.lastGroup(vo);
	}
	
	@Override
	public String groupName(Integer groupnum) throws Exception{
		return dao.groupName(groupnum);
	}
	
	@Override
	public List<UrlVO> urlListAll(UrlVO vo) throws Exception{
		return dao.urlListAll(vo);
	}
	

	@Override
	public UrlVO favRead(Integer favnum) throws Exception{
		return dao.favRead(favnum);
	}
	
	@Override
	public String favGroupName(Integer favnum) throws Exception{
		return dao.favGroupName(favnum);
	}
	
	@Override
	public void favmodify(UrlVO vo) throws Exception{
		dao.favmodify(vo);
	}
	
	@Override
	public int groupNumber(Integer favnum) throws Exception{
		return dao.groupNumber(favnum);
	}
	
	@Override
	public List<UrlVO> listCriteria(SearchCriteria cri) throws Exception{
		return dao.listCriteria(cri);
	}
	
	@Override
	public int listCountPaging(Criteria cri) throws Exception{
		return dao.countPaging(cri);
	}
}
