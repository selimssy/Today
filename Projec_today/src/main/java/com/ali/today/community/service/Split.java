package com.ali.today.community.service;

import java.util.Arrays;

public class Split {

	public static void main(String[] args) {
		String str = "a p, p, l.e c, o r.p";
		String[] list = str.split("\\s+|,\\s*|\\.\\s*");
		 
		System.out.println(Arrays.toString(list));
		
		
		String str2 = "[aa, bb, cc, dd]";
		String str3 = str2.replaceAll("[\\[\\]]", "");
		String[] list2 = str3.trim().split("\\s*,\\s*");
		 
		//System.out.println(Arrays.toString(list2));
		for(int i =0; i<list2.length; i++){
			System.out.println(list2[i]);
			}
		
		
		
		String[] lists = {"안녕 루퐁이", "만나서 반가워"};
		System.out.println(lists[0]);
		
		
	}

}
