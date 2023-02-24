package com.ali.today.diary.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ScheduleVO {

	private Integer scheduleId;
	private String userId;
	private Integer scheduleNum;
	private String scheduleTitle;
	private String scheduleDesc;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	Date scheduleDate;
	
	public Integer getScheduleId() {
		return scheduleId;
	}
	public void setScheduleId(Integer scheduleId) {
		this.scheduleId = scheduleId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Integer getScheduleNum() {
		return scheduleNum;
	}
	public void setScheduleNum(Integer scheduleNum) {
		this.scheduleNum = scheduleNum;
	}
	public String getScheduleTitle() {
		return scheduleTitle;
	}
	public void setScheduleTitle(String scheduleTitle) {
		this.scheduleTitle = scheduleTitle;
	}
	public String getScheduleDesc() {
		return scheduleDesc;
	}
	public void setScheduleDesc(String scheduleDesc) {
		this.scheduleDesc = scheduleDesc;
	}
	public Date getScheduleDate() {
		return scheduleDate;
	}
	public void setScheduleDate(Date scheduleDate) {
		this.scheduleDate = scheduleDate;
	}
	
	
	@Override
	public String toString() {
		return "ScheduleVO [scheduleId=" + scheduleId + ", userId=" + userId + ", scheduleNum=" + scheduleNum
				+ ", scheduleTitle=" + scheduleTitle + ", scheduleDesc=" + scheduleDesc + ", scheduleDate="
				+ scheduleDate + "]";
	}
	
	
	
	
}
