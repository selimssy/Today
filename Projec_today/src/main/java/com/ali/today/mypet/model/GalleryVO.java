package com.ali.today.mypet.model;

import java.util.Date;

public class GalleryVO {
	
	private Integer imgId;
	private Integer petId;
	private String title;
	private String content;
	private Date date;
	private String imagePath;
	private Integer page;
	
	
	public Integer getImgId() {
		return imgId;
	}
	public void setImgId(Integer imgId) {
		this.imgId = imgId;
	}
	public Integer getPetId() {
		return petId;
	}
	public void setPetId(Integer petId) {
		this.petId = petId;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	@Override
	public String toString() {
		return "GalleryVO [imgId=" + imgId + ", petId=" + petId + ", title=" + title + ", content=" + content
				+ ", date=" + date + ", imagePath=" + imagePath + "]";
	}

	
}
