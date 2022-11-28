package com.ali.today.user.controller;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.ali.today.user.model.PetVO;
import com.ali.today.user.model.UserVO;
import com.ali.today.user.service.IUserService;

@RestController
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserService service;
	
	
	// 회원가입 요청 처리
	@PostMapping("/")
	public String register(@RequestBody UserVO user) { 
		System.out.println("/user/ 요청 : POST");
		System.out.println("param22 : " + user);
		
		service.register(user);
		return "joinSuccess";
	}
	
	
	
	
	// 아이디 중복확인 요청 처리
	@PostMapping("/checkId")
	public String checkId(@RequestBody String userId) {
		
		System.out.println("/user/checkId 요청 : POST");
		System.out.println("param : " + userId);
		String result = null;
		
		Integer checkNum = service.checkId(userId);
		if(checkNum == 1) {
			System.out.println("아이디가 중복됨!");
			result = "NO";
		}else {
			System.out.println("아이디 사용가능!");
			result = "OK";
		}
		
		return result;
		
	}
	
	
	
	
	// 로그인 요청 처리
	@PostMapping("/loginCheck")
	public String loginCheck(@RequestBody UserVO user,
							 /*HttpServletRequest request*/
			                  HttpSession session,
			                  HttpServletResponse response) {
		
		
		String result = null;

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		UserVO dbUser = service.selectOne(user.getUserId());
		
		System.out.println(user);
		System.out.println(dbUser);
		
		if(dbUser == null) {
			result = "idFail";
		}else {
			if(encoder.matches(user.getPassword(), dbUser.getPassword())) {
				PetVO pet = service.firstPet(dbUser.getUserId());
				dbUser.setPet(pet);		
				session.setAttribute("login", dbUser); // 로그인 세션 등록
				result = "loginSuccess";
				
				
				long limitTime = 60 * 60 * 24 * 90;				
				// 자동로그인 체크시 처리
				if(user.isAutoLogin()) {
					
					System.out.println("자동로그인 쿠키 생성중...");
					
					Cookie loginCookie = new Cookie("loginCookie", session.getId());
					loginCookie.setPath("/today"); // 쿠키경로
					loginCookie.setMaxAge((int)limitTime);
				
					response.addCookie(loginCookie); // 서버에서 생성한 쿠키를 클라이언트에게 보내줌
					
					// 자동로그인 유지시간을 날짜객체로 변환
					long expiredDate = System.currentTimeMillis() + (limitTime * 1000);
					Date limitDate = new Date(expiredDate);  // 3개월 뒤의 날짜를 long타입 밀리초로 대입
					
					service.keepLogin(session.getId(), limitDate, user.getUserId());
				}
				
				
			}else {
				result = "pwFail";
			}
		}
		
		return result;
	}
	
	
	
	
	
	// 로그아웃 요청 처리
	@GetMapping("/logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {  // @RestController 에서 뷰리졸버 사용시 ModelAndView로
		
		UserVO user = (UserVO)session.getAttribute("login"); // getAttribute 반환타입이 Object라서 다운캐스팅
		
		if(user != null) {
			session.removeAttribute("login");  // 좀더 확실하게 처리하기 위해
			session.invalidate();
			
			// 로그아웃 시 자동로그인 쿠기 삭제 및 DB에서 해당 회원 session_id 제거
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) {
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin("none", new Date(), user.getUserId());
			}
			
		}
		
		return new ModelAndView("redirect:/");  
	}
		
	
	
	
	
	
	
	
	
	
	
	
}
