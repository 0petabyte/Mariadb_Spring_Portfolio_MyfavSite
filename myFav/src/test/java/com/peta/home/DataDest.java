package com.peta.home;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class DataDest {
	@Inject
	private DataSource ds;
	
	@Test
	public void testConection()throws Exception{
		try(Connection con = ds.getConnection()){
			System.out.println("디비연결성공");
			System.out.println(con);
		}catch(Exception e) {
			System.out.println("디비연결실패");
			e.printStackTrace();
		}
		
	}
	
}
