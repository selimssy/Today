package com.ali.today.community.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ali.today.common.SearchVO;
import com.ali.today.community.model.BoardVO;
import com.ali.today.community.model.ReplyVO;
import com.ali.today.community.repository.IBoardMapper;
import com.ali.today.user.repository.IUserMapper;


@Service
public class BoardService implements IBoardService {

	@Autowired
	private IBoardMapper mapper;
	@Autowired
	private IUserMapper umapper;
	
	
	// 게시글 등록 
	@Override
	public void insert(BoardVO article) {
		
		String[] hashtagList = article.getHashList();
		String hashtag = Arrays.toString(hashtagList);
		article.setHashtag(hashtag);
		
		mapper.insert(article);
		umapper.upContentsCnt(article.getWriter()); // 컨텐츠 수 증가
	}
	
	
	// 게시글 수정
	@Override
	public void update(BoardVO article) {
		
		String[] hashtagList = article.getHashList();
		String hashtag = Arrays.toString(hashtagList);
		article.setHashtag(hashtag);
		
		mapper.update(article);
	}
	
	
	// 게시글 삭제 
	@Transactional
	@Override
	public void delete(BoardVO article) {
		mapper.deleteAllReply(article.getBoardNo()); // 해당 게시물 댓글 전체 삭제
		mapper.delete(article.getBoardNo());	
		umapper.downContentsCnt(article.getWriter()); // 컨텐츠 수 감소
	}

	
	// 게시글 상세 조회
	@Override
	public BoardVO getArticle(Integer boardNo) {
		
		mapper.updateViewCnt(boardNo); // 여기서 조회수 증가
		
		// 해시태그 작업
		BoardVO article = mapper.getArticle(boardNo);
		if(article != null) {
			//System.out.println(article.getHashtag());
			String str = article.getHashtag();
			String str2 = str.replaceAll("[\\[\\]]", ""); // 대괄호 제거
			String [] list = str2.trim().split("\\s*,\\s*"); // 공백 제거 후 분리
			List<String> hashtagList = Arrays.asList(list);
			if(hashtagList.get(0).equals("null")) { // 해시태그 없을 경우
				article.setHashtagList(null);
			}else {
				article.setHashtagList(hashtagList);
			}
		}
		
		return article;
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


	
	// 관리자 페이지 전체 게시글(특정 계정, 공개여부별) 조회
	@Override
	public List<BoardVO> adAllBoard(SearchVO search) {
		return mapper.adAllBoard(search);  //관리자 페이지
	}	
	
	// 관리자 페이지 전체(특정 계정) 게시물 갯수
	@Override
	public Integer boardCnt(SearchVO search) {
		return mapper.boardCnt(search);  //관리자 페이지
	}
	
	// 게시글 비공개 전환
	@Override
	public void offBoard(BoardVO board) {
		mapper.offBoard(board);  //관리자 페이지
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
	public List<ReplyVO> getReplyList(Integer boardNo, Integer page) {
		Map<String, Object> datas = new HashMap<>();
		datas.put("pageStart", (page - 1) * 10);
		datas.put("boardNo", boardNo);
		return mapper.getReplyList(datas);
	}

	
	
	// 특정 댓글 조회
	@Override
	public ReplyVO getReply(Integer replyNo) {
		return mapper.getReply(replyNo);
	}
	
	
	
	// 댓글 수정
	@Override
	public void modifyReply(ReplyVO replyVO) {
		mapper.modifyReply(replyVO);
	}

	
	//댓글 삭제
	@Transactional
	@Override
	public void deleteReply(ReplyVO replyVO) {
		mapper.deleteReply(replyVO);
		mapper.updateReplyCnt(replyVO.getBoardNo());
	}
	
	
	//특정 게시물 댓글 수
	@Override
	public Integer countReplies(Integer boardNo) {
		return mapper.countReplies(boardNo);
	}
	
	
	// 전체 댓글(특정 계정, 공개여부별) 조회
	@Override
	public List<ReplyVO> adAllReply(SearchVO search) {
		return mapper.adAllReply(search);  //관리자 페이지
	}
	
	
	// 전체(특정 계정) 댓글 갯수
	@Override
	public Integer replyCnt(SearchVO search) {
		return mapper.replyCnt(search);  //관리자 페이지
	}
	
	
	// 특정 댓글 공개/비공개 전환
	@Override
	public void offReply(ReplyVO reply) {
		mapper.offReply(reply);  //관리자 페이지
	}
	
	
}
