package com.ali.today.common;

public class SearchVO extends PageVO{

	private String keyword;
	private String condition;
	private String order; // 정렬 방법
	
	public SearchVO() {
		this.keyword = "";
		this.condition = "";
		this.order = ""; // 
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	@Override
	public String toString() {
		return "SearchVO [keyword=" + keyword + ", condition=" + condition + ", order=" + order + "]";
	}

	
	
}
