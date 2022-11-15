package com.ali.today.user.model;

public class PetVO {
	
	private Integer petId;
	private String userId;
	private String petName;
	private Integer age;
	private String gender; 
	private String feature;
	private String imagePath;
	private String instagram;
	private String youtube;
	private Integer open;
	
	
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public Integer getPetId() {
		return petId;
	}
	public void setPetId(Integer petId) {
		this.petId = petId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	
	public String getFeature() {
		return feature;
	}
	public void setFeature(String feature) {
		this.feature = feature;
	}
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}	
	public String getInstagram() {
		return instagram;
	}
	public void setInstagram(String instagram) {
		this.instagram = instagram;
	}
	public String getYoutube() {
		return youtube;
	}
	public void setYoutube(String youtube) {
		this.youtube = youtube;
	}
	public Integer getOpen() {
		return open;
	}
	public void setOpen(Integer open) {
		this.open = open;
	}
	
	
	@Override
	public String toString() {
		return "PetVO [petId=" + petId + ", userId=" + userId + ", petName=" + petName + ", age=" + age + ", gender="
				+ gender + ", feature=" + feature + ", imagePath=" + imagePath + ", instagram=" + instagram
				+ ", youtube=" + youtube + ", open=" + open + "]";
	}
	
	
	
	
}
