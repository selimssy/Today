package com.ali.today.common.Interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ali.today.user.model.UserVO;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("login");
		
		
		if(user != null) {
			if(user.getUserId().equals("admin01")) {
				return true;			
			}else {
				response.setContentType("text/html; charset-utf-8"); // out객체 쓰기 위한 텍스트타입 설정
				PrintWriter out = response.getWriter(); // out 객체 통해 자바에서 html 작성
				String element = "<script>"
							        + "alert('권한이 없습니다.');"
						            + "location.href='/';"
							        + "</script>";
				out.print(element);
				out.flush(); // 브라우저 출력버터 비우기
				out.close(); 
				
				return false;
			}
		}else {
			response.setContentType("text/html; charset-utf-8"); // out객체 쓰기 위한 텍스트타입 설정
			PrintWriter out = response.getWriter(); // out 객체 통해 자바에서 html 작성
			String element = "<script>"
						        + "alert('권한이 없습니다.');"
					            + "location.href='/';"
						        + "</script>";
			out.print(element);
			out.flush(); // 브라우저 출력버터 비우기
			out.close(); 
			
			return false;
		}
		
		
		
		
		
	}	
	

}
