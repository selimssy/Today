package com.ali.today.community.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ali.today.common.PageCreator;
import com.ali.today.common.SearchVO;
import com.ali.today.community.model.BoardVO;
import com.ali.today.community.model.ReplyVO;
import com.ali.today.community.service.IBoardService;
import com.ali.today.diary.model.DiaryVO;
import com.ali.today.mypet.model.GalleryVO;
import com.ali.today.mypet.model.LifetimeVO;
import com.ali.today.mypet.service.IMypetService;
import com.ali.today.user.model.PetVO;
import com.ali.today.user.model.UserVO;
import com.ali.today.user.service.IUserService;
import com.google.gson.JsonObject;



@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Autowired
	IUserService userService;
	@Autowired
	IMypetService mypetService;
	@Autowired
	IBoardService boardService;
	
	@GetMapping("/intro")
	public String intro(HttpSession session, Model model) {
		
		// 반려동물 데이터
		UserVO user = (UserVO)session.getAttribute("login");
		Integer perId = user.getPet().getPetId();
		PetVO pet = userService.selectOnePet(perId);
		model.addAttribute("pet", pet);
		
		// 공개상태 반려동물 리스트
		List<PetVO> petList = userService.selectOpenPet();
		model.addAttribute("petList", petList);
		
		return "community/introduce";
	}
	
	
	
	
	// 다른 반려동물 보러 놀러가기 요청
	@GetMapping("/otherPet/{petId}")
	public String otherPet(@PathVariable Integer petId, Model model) {	
		
		PetVO pet = userService.selectOnePet(petId);
		List<LifetimeVO> cardList = mypetService.getLifetimeCardList(petId);
		List<GalleryVO> galleryList = mypetService.getGalleryList(petId);
		
		model.addAttribute("pet", pet);
		model.addAttribute("cardList", cardList);
		model.addAttribute("galleryList", galleryList);	
		
		return "community/otherPet";
	}
	
	
	
	
	// 검색처리 이후 게시글 목록 불러오기 요청
	@GetMapping("/list")
	public String list(SearchVO search, Model model) { 
	
		PageCreator pc = new PageCreator();
		pc.setPaging(search); 
		
		List<BoardVO> boardList = boardService.getArticleList(search);
		pc.setArticleTotalCount(boardService.countArticles(search));

		model.addAttribute("boardList", boardList);
		model.addAttribute("pc", pc);
		
		
		return "community/boardList";
	}  
	
	
	
	// 글쓰기 화면 띄우기 요청
	@GetMapping("/write")
	public String write(HttpSession session, RedirectAttributes ra) {
		
	  // 이젠 인터셉터가 이걸 처리하도록!!
//		if(session.getAttribute("login") == null) {
//			ra.addFlashAttribute("msg", "notLogin");
//			return "redirect:/";
//		}
		
		return "community/boardWrite";
	}
	
	
	
	// 글쓰기 처리 요청
	@PostMapping("/write")
	public String write(BoardVO article, RedirectAttributes ra) {
		
		System.out.println("parameter : " + article); 

		boardService.insert(article);	
		ra.addFlashAttribute("msg", "regSuccess");
		return "redirect:/community/list";
	}
	
	
	
	
	// 게시물 상세보기 요청
	@GetMapping("/content/{boardNo}")
	public String content(@PathVariable Integer boardNo, SearchVO search, Model model) {
		
		System.out.println(boardNo + "번 게시물 조회 요청");
		BoardVO article = boardService.getArticle(boardNo);
		model.addAttribute("article", article);
		model.addAttribute("hashtagList", article.getHashtagList()); //해시태그 리스트
		model.addAttribute("p", search); 
			
		// 댓글관련 작업
		List<ReplyVO> replyList = boardService.getReplyList(boardNo);
		model.addAttribute("replyList", replyList);
				
		return "community/boardContent";
	}
	
	
	
	
	
	
	
	// ckeditor
	@ResponseBody
	@PostMapping("/fileupload")
    public void communityImageUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception{
		JsonObject jsonObject = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		
		if(file != null) {
			if(file.getSize() >0 &&  StringUtils.isNotBlank(file.getName())) {
				if(file.getContentType().toLowerCase().startsWith("image/")) {
				    try{
				    	 
			            String fileName = file.getOriginalFilename();
			            byte[] bytes = file.getBytes();
			           
			            String uploadPath = req.getSession().getServletContext().getRealPath("/resources/images/board"); //저장경로
			            System.out.println("uploadPath:"+uploadPath);

			            File uploadFile = new File(uploadPath);
			            if(!uploadFile.exists()) {
			            	uploadFile.mkdir();
			            }
			            String fileName2 = UUID.randomUUID().toString();
			            uploadPath = uploadPath + "/" + fileName2 +fileName;
			            
			            out = new FileOutputStream(new File(uploadPath)); 
			            out.write(bytes);
			            
			            printWriter = resp.getWriter();
			            //String fileUrl = req.getContextPath() + "/resources/images/petDiary/" +fileName2 +fileName; // ContextPath 포함 url경로
			            String fileUrl = req.getContextPath() + "/resources/images/board/" +fileName2 +fileName; //url경로
			            System.out.println("fileUrl :" + fileUrl);
			            JsonObject json = new JsonObject();
			            json.addProperty("uploaded", 1);
			            json.addProperty("fileName", fileName);
			            json.addProperty("url", fileUrl);
			            printWriter.print(json);
			            System.out.println(json);
			 
			        }catch(IOException e){
			            e.printStackTrace();
			        } finally {
			            if (out != null) {
		                    out.close();
		                }
		                if (printWriter != null) {
		                    printWriter.close();
		                }
			        }
				}
			
		}
		
	}
	}
	
	
	
	
	
	
	
	
	
	
	
}
