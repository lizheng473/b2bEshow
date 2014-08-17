package com.logo.eshow.bean.query;

import java.util.Date;

public class TwitterQueryBean extends BaseQueryBean {
	public Date addTime;
	public String content;
	public Integer userId;

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

}