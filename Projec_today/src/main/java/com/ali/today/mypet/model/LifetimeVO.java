package com.ali.today.mypet.model;


import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

public class LifetimeVO {
	
	private Integer cardId;
	private Integer petId;
	private String content;
	private String imagePath;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date date;
	
	
	
	
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
