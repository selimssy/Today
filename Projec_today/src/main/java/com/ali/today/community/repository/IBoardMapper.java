package com.ali.today.community.repository;

import java.util.List;
import java.util.Map;

import com.ali.today.common.SearchVO;
import com.ali.today.community.model.BoardVO;
import com.ali.today.community.model.ReplyVO;

public interface IBoardMapper {

	// 게시글 등록 
	void insert(BoardVO article);
	
	// 게시글 수정 
	void update(BoardVO article);
	
	// 게시글 삭제 
	void delete(Integer boardNo);
	
	// 게시글 상세 조회
	BoardVO getArticle(Integer boardNo);
	
	// 게시물 조회수 상승 처리
	void updateViewCnt(Integer boardNo);	
	

	
	// # 검색, 페이징 기능이 포함된 게시물 목록 조회
	List<BoardVO> getArticleList(SearchVO search);
	
	// # 검색, 페이징 기능이 포함된 게시물 수 조회
	Integer countArticles(SearchVO search);
	
		
	
	// 댓글 개수 업데이트 
	void updateReplyCnt(Integer boardNo);	
	
	
	
	
	
	
	//--------------------------------- reply 게시판 메서드----------------------------------------
	
	// 댓글 추가
	void register(ReplyVO replyVO);  
	
	// 댓글 목록 조회
	List<ReplyVO> getReplyList(Map<String, Object> datas);
	
	// 특정 댓글 조회
	ReplyVO getReply(Integer replyNo);
	
	// 댓글 수정
	void modifyReply(ReplyVO replyVO);
	
	// 댓글 삭제
	void deleteReply(ReplyVO replyVO);
	
	// 특정 게시물 댓글 전체 삭제
	void deleteAllReply(Integer boardNo);
	
	// 특정 게시물 댓글 수
	Integer countReplies(Integer boardNo);
	
}
