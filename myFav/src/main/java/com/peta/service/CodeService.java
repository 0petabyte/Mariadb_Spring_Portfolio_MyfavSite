package com.peta.service;

import java.util.List;

import com.peta.domain.CodeGroupVO;
import com.peta.domain.CodeVO;
import com.peta.domain.Criteria;



public interface CodeService {
	public List<CodeGroupVO> codeGroupList(String userid)throws Exception;
	
	public List<CodeVO> codeList(CodeVO vo) throws Exception;
	
	public List<CodeVO> codeAllList(CodeVO vo) throws Exception;
	
	public void codeGroupInsert(CodeGroupVO vo) throws Exception;
	
	public int lastGroup(CodeGroupVO vo) throws Exception;
	
	public int lastPageGroup(Integer codenum) throws Exception;
	
	public String groupName(Integer groupnum) throws Exception;
	
	public int groupCount(Integer groupnum) throws Exception;
	
	public void groupDelete(Integer groupnum) throws Exception;
	
	public void codeInsert(CodeVO vo) throws Exception;
	
	public CodeVO codeRead(Integer codenum) throws Exception;
	
	public void codeDelete(Integer codenum) throws Exception;
	
	public void codemodify(CodeVO vo) throws Exception;
	
	public String codeGroupName(Integer codenum) throws Exception;
	
	public List<CodeVO> listCriteria(Criteria cri) throws Exception;
	
	public int countPaging(Criteria cri) throws Exception;
	
	public List<CodeVO> listPortfolio(String username) throws Exception;
	
	public int portNum(String username) throws Exception;
}
