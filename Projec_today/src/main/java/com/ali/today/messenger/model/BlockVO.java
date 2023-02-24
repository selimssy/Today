package com.ali.today.messenger.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class BlockVO {
	
	private Integer blockNo;
	private String userId;
	private String blockId;
	private String imagePath;
	private String nickname;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd HH:mm")
	private Date blockDate;

	
	
	
	public Integer getBlockNo() {
		return blockNo;
	}
	public void setBlockNo(Integer blockNo) {
		this.blockNo = blockNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBlockId() {
		return blockId;
	}
	public void setBlockId(String blockId) {
		this.blockId = blockId;
	}
	public Date getBlockDate() {
		return blockDate;
	}
	public void setBlockDate(Date blockDate) {
		this.blockDate = blockDate;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	
	@Override
	public String toString() {
		return "BlockVO [blockNo=" + blockNo + ", userId=" + userId + ", blockId=" + blockId + ", imagePath="
				+ imagePath + ", nickname=" + nickname + ", blockDate=" + blockDate + "]";
	}	
	

	
}
