package com.peta.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.peta.domain.CodeGroupVO;
import com.peta.domain.CodeVO;
import com.peta.domain.Criteria;
import com.peta.persistence.CodeDAO;

@Service
public class CodeServiceImpl implements CodeService {
	
	@Inject
	private CodeDAO dao;
	
	@Override
	public List<CodeGroupVO> codeGroupList(String userid)throws Exception{
		return dao.codeGroupList(userid);
	}
	
	@Override
	public List<CodeVO> codeList(CodeVO vo) throws Exception{
		return dao.codeList(vo);
	}
	
	@Override
	public List<CodeVO> codeAllList(CodeVO vo) throws Exception{
		return dao.codeAllList(vo);
	}
	
	@Override
	public void codeGroupInsert(CodeGroupVO vo) throws Exception{
		dao.codeGroupInsert(vo);
	}
	
	@Override
	public int lastGroup(CodeGroupVO vo) throws Exception{
		return dao.lastGroup(vo);
	}
	
	@Override
	public int lastPageGroup(Integer codenum) throws Exception{
		return dao.lastPageGroup(codenum);
	}
	
	@Override
	public String groupName(Integer groupnum) throws Exception{
		return dao.groupName(groupnum);
	}
	
	@Override
	public int groupCount(Integer groupnum) throws Exception{
		return dao.groupCount(groupnum);
	}
	
	@Override
	public void groupDelete(Integer groupnum) throws Exception{
		dao.groupDelete(groupnum);
	}
	
	@Override
	public void codeInsert(CodeVO vo) throws Exception{
		dao.codeInsert(vo);
	}
	
	@Override
	public CodeVO codeRead(Integer codenum) throws Exception{
		return dao.codeRead(codenum);
	}
	
	@Override
	public void codeDelete(Integer codenum) throws Exception{
		dao.codeDelete(codenum);
	}
	
	@Override
	public void codemodify(CodeVO vo) throws Exception{
		dao.codemodify(vo);
	}
	
	@Override
	public String codeGroupName(Integer codenum) throws Exception{
		return dao.codeGroupName(codenum);
	}
	
	@Override
	public List<CodeVO> listCriteria(Criteria cri) throws Exception{
		return dao.listCriteria(cri);
	}
	
	@Override
	public int countPaging(Criteria cri) throws Exception{
		return dao.countPaging(cri);
	}

	@Override
	public List<CodeVO> listPortfolio(String username) throws Exception {
		return dao.listPortfolio(username);
	}

	@Override
	public int portNum(String username) throws Exception {
		return dao.portNum(username);
	}
	
	
}
