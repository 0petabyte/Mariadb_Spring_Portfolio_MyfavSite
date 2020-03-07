package com.peta.domain;

import java.util.Date;

public class CodeVO {
	private int codenum;
	private String title;
	private String userid;
	private int groupnum;
	private String content;
	private Date nowdate;
	
	
	

	public Date getNowdate() {
		return nowdate;
	}
	public void setNowdate(Date nowdate) {
		this.nowdate = nowdate;
	}
	public int getCodenum() {
		return codenum;
	}
	public void setCodenum(int codenum) {
		this.codenum = codenum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getGroupnum() {
		return groupnum;
	}
	public void setGroupnum(int groupnum) {
		this.groupnum = groupnum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "CodeVO [codenum=" + codenum + ", title=" + title + ", userid=" + userid + ", groupnum=" + groupnum
				+ ", content=" + content + ", nowdate=" + nowdate + "]";
	}


	
	
}
