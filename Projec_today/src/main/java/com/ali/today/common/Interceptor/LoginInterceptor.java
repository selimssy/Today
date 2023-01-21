package com.ali.today.common.Interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//System.out.println("로그인 접근 인터셉터 작동");	
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") == null) {
			//System.out.println("로그인 X");
			//response.sendRedirect("/");
			
			response.setContentType("text/html; charset-utf-8"); // out객체 쓰려면 우선 텍스트타입 설정해야
			PrintWriter out = response.getWriter(); // 이 out 객체를 통해 자바에서 html 작성
			String element = "<script>"
						        + "alert('로그인 후 사용 가능합니다.');"
					            + "location.href='/';"
						        + "</script>";
			out.print(element);
			out.flush(); // 브라우저 출력버터 비우기
			out.close(); 
			
			return false;
		}
		
		return true;
	}
	
}
