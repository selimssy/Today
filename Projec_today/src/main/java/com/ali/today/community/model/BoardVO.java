package com.ali.today.community.model;


import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class BoardVO {
	
	private Integer boardNo;
	private String title;
	private String content;
	private String writer; //userId(pk)
	private String nickname; // pk인 userId 통해 조인
	private Date regDate;
	private Integer viewCnt;
	private int replyCnt;
	private String hashtag;
	
	private String[] hashList;
	private List<String> hashtagList;

	// 신규 게시물에 new마크 붙일지 말지 결정하는 논리필드 선언
	private boolean newMark;
	
	
	
	public void setNewMark(boolean newMark) {
		this.newMark = newMark;
	}
	
	public boolean isNewMark() {
		return newMark;
	}
	
	
	public Integer getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(Integer boardNo) {
		this.boardNo = boardNo;
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
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Integer getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(Integer viewCnt) {
		this.viewCnt = viewCnt;
	}	
	
	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public List<String> getHashtagList() {
		return hashtagList;
	}

	public void setHashtagList(List<String> hashtagList) {
		this.hashtagList = hashtagList;
	}

	public int getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}

	public String[] getHashList() {
		return hashList;
	}

	public void setHashList(String[] hashList) {
		this.hashList = hashList;
	}

	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", nickname=" + nickname + ", regDate=" + regDate + ", viewCnt=" + viewCnt + ", replyCnt=" + replyCnt
				+ ", hashtag=" + hashtag + ", hashList=" + Arrays.toString(hashList) + ", hashtagList=" + hashtagList
				+ ", newMark=" + newMark + "]";
	}

	
	
}
