package com.ali.today.community.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReplyVO {

	private int replyNo;  // 댓글 번호
	private int boardNo;  // 게시글 번호	
	private String content; // 댓글 내용 
	private String replyer; // userId
	private String nickname; // userId(pk)로 조인 
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd HH:mm")
	private Date replyDate;   // 댓글 작성일
	
	private Date updateDate;  // 댓글 수정일
	private Integer open; // 공개 여부
	
	
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public Integer getOpen() {
		return open;
	}
	public void setOpen(Integer open) {
		this.open = open;
	}
	
	
	@Override
	public String toString() {
		return "ReplyVO [replyNo=" + replyNo + ", boardNo=" + boardNo + ", content=" + content + ", replyer=" + replyer
				+ ", nickname=" + nickname + ", replyDate=" + replyDate + ", updateDate=" + updateDate + ", open="
				+ open + ", getReplyNo()=" + getReplyNo() + ", getBoardNo()=" + getBoardNo() + ", getContent()="
				+ getContent() + ", getReplyer()=" + getReplyer() + ", getNickname()=" + getNickname()
				+ ", getReplyDate()=" + getReplyDate() + ", getUpdateDate()=" + getUpdateDate() + ", getOpen()="
				+ getOpen() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
		

}
