package com.ali.today.admin.model;

import java.util.Arrays;

public class EmailVO {
	
	private String title;
	private String content;
	private String[] emailList;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String[] getEmailList() {
		return emailList;
	}
	public void setEmailList(String[] emailList) {
		this.emailList = emailList;
	}
	
	@Override
	public String toString() {
		return "EmailVO [title=" + title + ", content=" + content + ", emailList=" + Arrays.toString(emailList)
				+ ", getTitle()=" + getTitle() + ", getContent()=" + getContent() + ", getEmailList()="
				+ Arrays.toString(getEmailList()) + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
	
}
