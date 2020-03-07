package com.peta.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.peta.domain.CodeGroupVO;
import com.peta.domain.CodeVO;
import com.peta.domain.Criteria;


@Repository
public class CodeDAOImpl implements CodeDAO {
	@Inject
	private SqlSession session;
	
	private static String namespace="com.peta.mapper.CodeMapper";
	
	@Override
	public List<CodeGroupVO> codeGroupList(String userid)throws Exception{
		return session.selectList(namespace + ".codeGroupList",userid);
	}
	
	@Override
	public List<CodeVO> codeList(CodeVO vo) throws Exception{
		return session.selectList(namespace+".codeList",vo);
	}
	
	@Override
	public List<CodeVO> codeAllList(CodeVO vo) throws Exception{
		return session.selectList(namespace+".codeAllList",vo);
	}
	
	@Override
	public void codeGroupInsert(CodeGroupVO vo) throws Exception{
		session.insert(namespace + ".codeGroupInsert", vo);
	}
	
	@Override
	public int lastGroup(CodeGroupVO vo) throws Exception{
		return session.selectOne(namespace+".lastGroup",vo);
	}
	
	@Override
	public int lastPageGroup(Integer codenum) throws Exception{
		return session.selectOne(namespace+".lastPageGroup",codenum);
	}
	
	@Override
	public String groupName(Integer groupnum) throws Exception{
		return session.selectOne(namespace + ".groupName", groupnum);
	}
	
	@Override
	public int groupCount(Integer groupnum) throws Exception{
		return session.selectOne(namespace + ".groupCount" , groupnum);
	}
	
	@Override
	public void groupDelete(Integer groupnum) throws Exception{
		session.delete(namespace + ".groupDel",groupnum);
	}
	
	@Override
	public void codeInsert(CodeVO vo) throws Exception{
		session.insert(namespace+".codeInsert", vo);
	}
	
	@Override
	public CodeVO codeRead(Integer codenum) throws Exception{
		return session.selectOne(namespace+".codeRead",codenum);
	}
	
	@Override
	public void codeDelete(Integer codenum) throws Exception{
		session.delete(namespace+".codeDelete",codenum);
	}
	
	@Override
	public void codemodify(CodeVO vo) throws Exception{
		session.update(namespace+".codeUpdate",vo);
	}
	
	@Override
	public String codeGroupName(Integer codenum) throws Exception{
		return session.selectOne(namespace+".codeNumGroupName",codenum);
	}
	
	@Override
	public List<CodeVO> listCriteria(Criteria cri) throws Exception{
		return session.selectList(namespace+".listCriteria",cri);
	}
	
	@Override
	public int countPaging(Criteria cri) throws Exception{
		return session.selectOne(namespace+".countPaging",cri);
	}

	@Override
	public List<CodeVO> listPortfolio(String username) throws Exception {
		return session.selectList(namespace + ".selectPortfolio",username);
	}

	@Override
	public int portNum(String username) throws Exception {
		int portNum = 0;
		try {
		portNum = session.selectOne(namespace + ".portNum",username);
		}catch (Exception e) {
			portNum = 0;
		}
		return portNum ;
	}

	
	
}
