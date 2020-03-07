package com.peta.persistence;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.peta.domain.Criteria;
import com.peta.domain.GroupVO;
import com.peta.domain.SearchCriteria;
import com.peta.domain.UrlVO;
import com.peta.domain.UserVO;


@Repository
public class GroupDAOImpl implements GroupDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace="com.peta.mapper.BoardMapper";
	
	@Override
	public List<GroupVO> listGroup(UserVO user)throws Exception{
		return session.selectList(namespace + ".grouplist",user);
	}
	
	@Override
	public void groupInsert(GroupVO vo)throws Exception{
		session.insert(namespace+".groupCreate",vo);
	}
	
	@Override
	public List<UrlVO> urlList(UrlVO vo) throws Exception{
		return session.selectList(namespace + ".urlList",vo);
	}
	
	@Override
	public void groupDelete(Integer groupnum) throws Exception{
		session.delete(namespace + ".groupDel",groupnum);
	}
	
	@Override
	public void urlInsert(UrlVO urlvo) throws Exception{
		session.insert(namespace+".urlInsert", urlvo);
	}
	
	@Override
	public void urlDelete(Integer favnum) throws Exception{
		session.delete(namespace + ".urlDelete", favnum);
	}
	
	@Override
	public int groupCount(Integer groupnum) throws Exception{
		return session.selectOne(namespace + ".groupCount" , groupnum);
	}
	
	@Override
	public int lastGroup(GroupVO vo) throws Exception{
		return session.selectOne(namespace+".lastGroup", vo);
	}
	
	@Override
	public String groupName(Integer groupnum) throws Exception{
		return session.selectOne(namespace + ".groupName", groupnum);
	}
	
	@Override
	public List<UrlVO> urlListAll(UrlVO vo) throws Exception{
		return session.selectList(namespace+".urlListAll",vo);
	}
	
	@Override
	public UrlVO favRead(Integer favnum) throws Exception{
		return session.selectOne(namespace+".favRead",favnum);
	}
	
	@Override
	public String favGroupName(Integer favnum) throws Exception{
		return session.selectOne(namespace+".favnumGroupName",favnum);
	}
	
	@Override
	public void favmodify(UrlVO vo) throws Exception{
		session.update(namespace+".favUpdate",vo);
	}
	
	public int groupNumber(Integer favnum) throws Exception{
		return session.selectOne(namespace+".groupNumber",favnum);
	}
	
	@Override
	public List<UrlVO> listPage(int page) throws Exception{
		return session.selectList(namespace+".listPage",page);
	}
	
	@Override
	public List<UrlVO> listCriteria(SearchCriteria cri) throws Exception{
//		System.out.println(cri.toString());
//		System.out.println(user.toString());
//		ArrayList<Object> test = new ArrayList<Object>();
//		test.add(cri);
//		test.add(user);
//		System.out.println(test.toString());
		System.out.println("dao userid:"+cri.getUserid());
		return session.selectList(namespace+".listCriteria",cri);
	}
	
	@Override
	public int countPaging(Criteria cri) throws Exception{
		return session.selectOne(namespace+".countPaging", cri);
	}
	

}
