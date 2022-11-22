package com.ali.today.mypet.model;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class LifetimeVO {
	
	private Integer cardId;
	private Integer petId;
	private Date date;
	private String content;
	private String imagePath;
	
	
	
	
	public Integer getCardId() {
		return cardId;
	}
	public void setCardId(Integer cardId) {
		this.cardId = cardId;
	}
	public Integer getPetId() {
		return petId;
	}
	public void setPetId(Integer petId) {
		this.petId = petId;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	@Override
	public String toString() {
		return "LifetimeVO [cardId=" + cardId + ", petId=" + petId + ", date=" + date + ", content=" + content
				+ ", imagePath=" + imagePath + "]";
	}	
	
	
	
}
