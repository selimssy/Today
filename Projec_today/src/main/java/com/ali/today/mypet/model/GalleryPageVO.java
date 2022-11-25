package com.ali.today.mypet.model;

public class GalleryPageVO {
	
	private Integer page; // 사용자가 요청한 페이지 번호
	private Integer countPerPage = 15; // 한 페이지당 들어갈 게시물의 수
	
	
	public GalleryPageVO() {
		this.page = 1;
		this.countPerPage = 15;
	}
	
		
	public Integer getPageStart() { 
		return (this.page - 1) * this.countPerPage;
	}
	
	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		// page에 0 이하의 값 대입 방지
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	
	
	public Integer getCountPerPage() {
		return countPerPage;
	}
	
	
}
