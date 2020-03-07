package com.peta.domain;

import java.util.Date;

public class UrlVO {
	private int groupnum;
	private String url;
	private String memo;
	private String userid;
	private int favnum;
	private Date nowdate;
	
	
	
	public Date getNowdate() {
		return nowdate;
	}
	public void setNowdate(Date nowdate) {
		this.nowdate = nowdate;
	}
	public int getFavnum() {
		return favnum;
	}
	public void setFavnum(int favnum) {
		this.favnum = favnum;
	}
	public int getGroupnum() {
		return groupnum;
	}
	public void setGroupnum(int groupnum) {
		this.groupnum = groupnum;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "UrlVO [groupnum=" + groupnum + ", url=" + url + ", memo=" + memo + ", userid=" + userid + ", favnum="
				+ favnum + ", nowdate=" + nowdate + "]";
	}


	
	
}
