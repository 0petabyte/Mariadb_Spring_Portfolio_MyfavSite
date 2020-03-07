package com.peta.domain;

public class GroupVO {
	private int groupnum;
	private String name;
	private String userid;
	
	public int getGroupnum() {
		return groupnum;
	}
	public void setGroupnum(int groupnum) {
		this.groupnum = groupnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "GroupVO [groupnum=" + groupnum + ", name=" + name + ", userid=" + userid + "]";
	}
	
	

}
