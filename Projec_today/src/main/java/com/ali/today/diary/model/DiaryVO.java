package com.ali.today.diary.model;

import java.util.Date;

public class DiaryVO {
	
	private Integer diaryNo;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private String thumbImg;
	
	
	public Integer getDiaryNo() {
		return diaryNo;
	}
	public void setDiaryNo(Integer diaryNo) {
		this.diaryNo = diaryNo;
	}
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getThumbImg() {
		return thumbImg;
	}
	public void setThumbImg(String thumbImg) {
		this.thumbImg = thumbImg;
	}
	
	
	@Override
	public String toString() {
		return "DiaryVO [diaryNo=" + diaryNo + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regDate=" + regDate + ", thumbImg=" + thumbImg + "]";
	}
	
	
}
