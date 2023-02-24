package com.ali.today.user.model;

import java.util.Date;

public class UserVO {
	
	private String userId;
	private String password;
	private String name;
	private String nickname;
	private String imagePath;
	private String email;
	private Date regDate;	
	private String sessionId;
	private Date limitTime;
	private PetVO pet;
	private Integer contentsCnt;
	private Integer petCnt;
	private Integer replyCnt;
	private Integer petLetter;
	
	public PetVO getPet() {
		return pet;
	}

	public void setPet(PetVO pet) {
		this.pet = pet;
	}

	// 자동로그인 체크 여부
	private boolean autoLogin;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public Date getLimitTime() {
		return limitTime;
	}

	public void setLimitTime(Date limitTime) {
		this.limitTime = limitTime;
	}

	public boolean isAutoLogin() {
		return autoLogin;
	}

	public void setAutoLogin(boolean autoLogin) {
		this.autoLogin = autoLogin;
	}

	public Integer getContentsCnt() {
		return contentsCnt;
	}
	public void setContentsCnt(Integer contentsCnt) {
		this.contentsCnt = contentsCnt;
	}
	public Integer getPetCnt() {
		return petCnt;
	}
	public void setPetCnt(Integer petCnt) {
		this.petCnt = petCnt;
	}
	public Integer getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(Integer replyCnt) {
		this.replyCnt = replyCnt;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
		
	public Integer getPetLetter() {
		return petLetter;
	}

	public void setPetLetter(Integer petLetter) {
		this.petLetter = petLetter;
	}

	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", password=" + password + ", name=" + name + ", nickname=" + nickname
				+ ", imagePath=" + imagePath + ", email=" + email + ", regDate=" + regDate + ", sessionId=" + sessionId
				+ ", limitTime=" + limitTime + ", pet=" + pet + ", contentsCnt=" + contentsCnt + ", petCnt=" + petCnt
				+ ", replyCnt=" + replyCnt + ", petLetter=" + petLetter + ", autoLogin=" + autoLogin + "]";
	}

	
	
}
