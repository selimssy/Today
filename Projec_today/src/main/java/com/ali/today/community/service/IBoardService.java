package com.ali.today.community.service;

import java.util.List;

import com.ali.today.common.SearchVO;
import com.ali.today.community.model.BoardVO;
import com.ali.today.community.model.ReplyVO;

public interface IBoardService {


	// 게시글 등록 
	void insert(BoardVO article);
	
	// 게시글 수정 
	void update(BoardVO article);
	
	// 게시글 삭제 
	void delete(BoardVO article);
	
	// 게시글 상세 조회
	BoardVO getArticle(Integer boardNo);
	

	// # 검색, 페이징 기능이 포함된 게시물 목록 조회
	List<BoardVO> getArticleList(SearchVO search);
	
	// # 검색, 페이징 기능이 포함된 게시물 수 조회
	Integer countArticles(SearchVO search);
	
	
	
	// 관리자 페이지 전체 게시글(특정 계정, 공개여부별) 조회
	List<BoardVO> adAllBoard(SearchVO search); // 관리자 페이지
		
	// 관리자 페이지 전체(특정 계정) 게시물 갯수
	Integer boardCnt(SearchVO search); // 관리자 페이지
	
	// 게시글 비공개 전환
	void offBoard(Integer boardNo); // 관리자 페이지
		

	
	//--------------------------------- reply 게시판 메서드----------------------------------------
	
	// 댓글 추가
	void register(ReplyVO replyVO);  
	
	// 댓글 목록 조회
	List<ReplyVO> getReplyList(Integer boardNo, Integer page);
	
	// 특정 댓글 조회
	ReplyVO getReply(Integer replyNo);
	
	// 댓글 수정
	void modifyReply(ReplyVO replyVO);
	
	// 댓글 삭제
	void deleteReply(ReplyVO replyVO);
	
	// 특정 게시물 댓글 수
	Integer countReplies(Integer boardNo);
	
}
