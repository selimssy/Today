<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.main_inner{display: flex; align-content: space-between;}
	.main_nav{width: 220px; background: #545456; padding-top: 10px; border-right: 1px solid #aaa; height: 100%; /*float: left;*/}
	.main_nav ul{list-style: none; padding-left:35px;}
	.main_nav li{padding: 20px 0;}
	.main_nav li a{text-decoration: none; color: #fff;}
	.sub_menu li{padding: 15px 0;}
	.sub_menu li a{font-size: 14px;}
</style>
</head>


<nav class="main_nav">
    <ul>
        <li><a href="<c:url value='/admin/member'/>">회원 관리</a></li>
        <li><a href="<c:url value='/admin/pet'/>">반려견 관리</a>
        	<ul class="sub_menu">
        		<li><a href="<c:url value='/admin/petContent'/>">반려견 콘텐츠 현황</a></li>
            	<li><a href="<c:url value='/admin/pet'/>">반려견 관리</a></li>                                          
            </ul>
        </li>
        <li><a href="<c:url value='/admin/content'/>">컨텐츠 관리</a>
            <ul class="sub_menu">
            	<li><a href="<c:url value='/admin/content'/>">컨텐츠 현황</a></li>
                <li><a href="<c:url value='/admin/lifetime'/>">반려견 생애기록</a></li>
                <li><a href="<c:url value='/admin/gallery'/>">갤러리</a></li>
                <li><a href="<c:url value='/admin/calendar'/>">캘린더</a></li>
                <li><a href="<c:url value='/admin/diary'/>">견주 일기</a></li>
                <li><a href="<c:url value='/admin/board'/>">커뮤니티 게시판</a></li>
                <li><a href="<c:url value='/admin/reply'/>">댓글</a></li>
            </ul>
        </li>                  
    </ul>
</nav>