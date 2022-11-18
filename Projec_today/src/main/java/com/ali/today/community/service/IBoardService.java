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
	void delete(Integer boardNo);
	
	// 게시글 상세 조회
	BoardVO getArticle(Integer boardNo);
	

	// # 검색, 페이징 기능이 포함된 게시물 목록 조회
	List<BoardVO> getArticleList(SearchVO search);
	
	// # 검색, 페이징 기능이 포함된 게시물 수 조회
	Integer countArticles(SearchVO search);
	
		

	
	//--------------------------------- reply 게시판 메서드----------------------------------------
	
	// 댓글 추가
	void register(ReplyVO replyVO);  
	
	// 댓글 목록 조회
	List<ReplyVO> getReplyList(int boardNo);
	
	// 특정 댓글 조회
	ReplyVO getReply(Integer replyNo);
	
	// 댓글 수정
	void modifyReply(ReplyVO replyVO);
	
	// 댓글 삭제
	void deleteReply(ReplyVO replyVO);
	
}
