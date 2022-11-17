package com.ali.today.community.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		
		String[] hashtagList = article.getHashList();
		String hashtag = Arrays.toString(hashtagList);
		article.setHashtag(hashtag);
		
		mapper.insert(article);
	}
	
	
	// 게시글 수정
	@Override
	public void update(BoardVO article) {
		mapper.update(article);
	}
	
	
	// 게시글 삭제 
	@Override
	public void delete(Integer boardNo) {
		mapper.delete(boardNo);
	}

	
	// 게시글 상세 조회
	@Override
	public BoardVO getArticle(Integer boardNo) {
		mapper.updateViewCnt(boardNo); // 여기서 조회수 증가
		return mapper.getArticle(boardNo);
	}

	

	
	// # 검색, 페이징 기능이 포함된 게시물 목록 조회
	@Override
	public List<BoardVO> getArticleList(SearchVO search) {
		
		List<BoardVO> list = mapper.getArticleList(search);
		
		// 1일 이내 신규 글 new마크 처리 로직
		for(BoardVO article : list) {
			// 현재시간 읽어오기
			long now = System.currentTimeMillis();
			// 각 게시물들의 작성 시간을 밀리초로 읽어오기
			long regTime = article.getRegDate().getTime();
			
			if(now - regTime < 60 * 60 * 24 * 1000) {
				article.setNewMark(true);
			}
		}			
		return list;
	}

	
	// # 검색, 페이징 기능이 포함된 게시물 수 조회
	@Override
	public Integer countArticles(SearchVO search) {
		return mapper.countArticles(search);
	}


	
	//--------------------------------- reply 게시판 메서드----------------------------------------
	
	
	
	// 댓글 등록
	@Transactional  // 댓글 수 업데이트와 연동
	@Override
	public void register(ReplyVO replyVO) {
		mapper.register(replyVO);
		mapper.updateReplyCnt(replyVO.getBoardNo());
	}

	
	// 댓글 목록 조회
	@Override
	public List<ReplyVO> getReplyList(int boardNo) {
		return mapper.getReplyList(boardNo);
	}

}
