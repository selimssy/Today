package com.ali.today.community.service;

import java.util.Arrays;
import java.util.UUID;

public class Split {

	public static void main(String[] args) {
		String str = "a p, p, l.e c, o r.p";
		String[] list = str.split("\\s+|,\\s*|\\.\\s*");
		 
		//System.out.println(Arrays.toString(list));
		
		
		String str2 = "[aa, bb, cc, dd]";
		String str3 = str2.replaceAll("[\\[\\]]", "");
		String[] list2 = str3.trim().split("\\s*,\\s*");
		 
		//System.out.println(Arrays.toString(list2));
		for(int i =0; i<list2.length; i++){
			//System.out.println(list2[i]);
			}
		
		
		
		String[] lists = {"안녕 루퐁이", "만나서 반가워"};
		//System.out.println(lists[0]);
		
		
		String userCode = UUID.randomUUID().toString().replace("-", "");
		userCode = userCode.substring(0,20);
		System.out.println(userCode);
		
		System.out.println("----------------------------------------------------------");
		
		// user_code 생성
		String code = UUID.randomUUID().toString().replace("-", ""); // - 제거
		code = code.substring(0,20); // 앞에서부터 20자리
		Integer a= 1;
		//혹시모를 중복 방지 
		for(int i=0; i<12; i++) { // user_code 중복 아닐 때까지 반복
			String code2 = UUID.randomUUID().toString().replace("-", "");
			code2 = code2.substring(0,20);
			System.out.println(code2);
		}
		
	}

}
