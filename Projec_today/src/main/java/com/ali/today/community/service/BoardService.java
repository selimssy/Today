package com.ali.today.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ali.today.common.SearchVO;
import com.ali.today.community.model.BoardVO;
import com.ali.today.community.model.ReplyVO;
import com.ali.today.community.repository.IBoardMapper;


@Service
public class BoardService implements IBoardService {

	@Autowired
	IBoardMapper mapper;
	
	
	// 게시글 등록 
	@Override
	public void insert(BoardVO article) {
		// TODO Auto-generated method stub

	}
	
	
	// 게시글 수정
	@Override
	public void update(BoardVO article) {
		// TODO Auto-generated method stub

	}
	
	
	// 게시글 삭제 
	@Override
	public void delete(Integer boardNo) {
		// TODO Auto-generated method stub

	}

	
	// 게시글 상세 조회
	@Override
	public BoardVO getArticle(Integer boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	
	// 게시물 조회수 상승 처리
	@Override
	public void updateViewCnt(Integer boardNo) {
		// TODO Auto-generated method stub

	}

	
	// # 검색, 페이징 기능이 포함된 게시물 목록 조회
	@Override
	public List<BoardVO> getArticleList(SearchVO search) {
		// TODO Auto-generated method stub
		return null;
	}

	
	// # 검색, 페이징 기능이 포함된 게시물 수 조회
	@Override
	public Integer countArticles(SearchVO search) {
		// TODO Auto-generated method stub
		return null;
	}

	
	// 댓글 개수 조회 
	@Override
	public void updateReplyCnt(Integer boardNo) {
		// TODO Auto-generated method stub

	}

	
	
	
	//--------------------------------- reply 게시판 메서드----------------------------------------
	
	
	
	// 댓글 추가
	@Override
	public void register(ReplyVO replyVO) {
		// TODO Auto-generated method stub

	}

	
	// 댓글 목록 조회
	@Override
	public List<ReplyVO> getReplyList(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
