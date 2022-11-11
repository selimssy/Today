package com.ali.today.mypet.model;

import java.util.Date;

public class GalleryVO {
	
	private Integer imgId;
	private Integer petId;
	private String title;
	private Date date;
	private String imagePath;
	
	
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
	
	
	@Override
	public String toString() {
		return "GalleryVO [imgId=" + imgId + ", petId=" + petId + ", title=" + title + ", date=" + date + ", imagePath="
				+ imagePath + "]";
	}
	
	

	
	
}
