package com.ali.today.community.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ali.today.common.PageCreator;
import com.ali.today.common.PageVO;
import com.ali.today.common.SearchVO;
import com.ali.today.community.model.BoardVO;
import com.ali.today.community.model.ReplyVO;
import com.ali.today.community.service.IBoardService;
import com.ali.today.diary.model.DiaryVO;
import com.ali.today.mypet.model.GalleryPageCreator;
import com.ali.today.mypet.model.GalleryPageVO;
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
		if(session.getAttribute("login") == null) { // 로그인 x
			model.addAttribute("msg", "notLogin");
		}else { // 로그인 O
			UserVO user = (UserVO)session.getAttribute("login");
			if(user.getPet() == null) { //등록된 반려견 없는 경우
				model.addAttribute("msg", "petNone");
			}else {  //등록된 반려견 있는 경우
				Integer perId = user.getPet().getPetId();
				PetVO pet = userService.selectOnePet(perId);
				model.addAttribute("pet", pet);
			}
			
		}

		return "community/introduce";
	}
	
	
	
	// 공개상태 반려견 리스트 통신
	@PostMapping("/openPetList")
	@ResponseBody
	public List<PetVO> openPetList(@RequestBody Map<String, String> map){		
		Integer page = Integer.parseInt(map.get("page"));
		String condition = map.get("condition");
		String keyword = map.get("keyword");
		List<PetVO> petList = userService.selectOpenPet(page, condition, keyword);
		return petList;
	}
	
	
	// 공개상태 반려견 수 통신
	@PostMapping("/countPet")
	@ResponseBody
	public Map<String, Integer> countPet(@RequestBody Map<String, String> map){		
		String condition = map.get("condition");
		String keyword = map.get("keyword");
		Integer countPet = userService.countOpenPet(condition, keyword);
		Map<String, Integer> data = new HashMap<>();
		data.put("countPet", countPet);
		return data;
	}
	
	
	// 다른 반려동물 보러 놀러가기 요청
	@GetMapping("/otherPet/{petId}")
	public String otherPet(@PathVariable Integer petId, GalleryPageVO paging, Model model, RedirectAttributes ra) {
		
		PetVO pet = userService.selectOnePet(petId);
		if(pet.getOpen() == 0) {  // 비공개 반려동물 접근 방지
			ra.addFlashAttribute("msg", "closed");
			return "redirect:/community/intro";
		}else {
			List<LifetimeVO> cardList = mypetService.getLifetimeCardList(petId);
			List<GalleryVO> galleryList = mypetService.getGalleryList(petId, paging);
			
			GalleryPageCreator pc = new GalleryPageCreator();
			pc.setPaging(paging);
			pc.setArticleTotalCount(mypetService.countGalleries(petId));
			
			model.addAttribute("pet", pet);
			model.addAttribute("cardList", cardList);
			model.addAttribute("galleryList", galleryList);	
			model.addAttribute("pc", pc);
			
			return "community/otherPet";			
		}	
	}
	
	
	
	
	// 갤러리 페이징 비동기 요청
	@PostMapping("/getGalleries")
	@ResponseBody
	public List<GalleryVO> getGalleries(@RequestBody GalleryVO data){
		
		System.out.println("petId : " + data.getPetId() + ", page : " + data.getPage());
		GalleryPageVO paging = new GalleryPageVO(); 
		paging.setPage(data.getPage());
		List<GalleryVO> list = mypetService.getGalleryList(data.getPetId(), paging);
		
		return list;
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
	
	// 글쓰기 화면 띄우기 요청
		@GetMapping("/header")
		public String write() {

			
			return "common/header";
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
		List<ReplyVO> replyList = boardService.getReplyList(boardNo, 1);
		model.addAttribute("replyList", replyList);
				
		return "community/boardContent";
	}
	
	
	
	
	// 게시글 수정 화면 요청
	@GetMapping("/modify")
	public String modify(HttpSession session, Integer boardNo, PageVO paging, Model model, RedirectAttributes ra) {
		
		UserVO user = (UserVO)session.getAttribute("login"); 
		String userId = user.getUserId();
		BoardVO article = boardService.getArticle(boardNo);
		if(userId.equals(article.getWriter())) {
			model.addAttribute("article", article);
			model.addAttribute("hashtagList", article.getHashtagList()); //해시태그 리스트
			model.addAttribute("p", paging);
			return "community/boardModify"; 
		}else {  // 타계정 게시물 접근 방지
			ra.addFlashAttribute("msg", "noAuthority");
			return "redirect:/community/list";
		}
		
	}
	
	
	
	
	// 게시물 수정 요청
	@PostMapping("/modify")
	public String modify(BoardVO article, RedirectAttributes ra) { 
		System.out.println("번 게시물 수정 요청 : POST");
		boardService.update(article);
		ra.addFlashAttribute("msg", "modSuccess");
		return "redirect:/community/content/" + article.getBoardNo();
	}
	
	
	
	
	
	// 게시글 삭제 요청
	@PostMapping("/delete")
	public String delete(Integer boardNo, PageVO paging, RedirectAttributes ra) {  
		
		System.out.println(boardNo + "번 게시물 삭제 요청");
		boardService.delete(boardNo);
		ra.addFlashAttribute("msg", "delSuccess");		
		ra.addAttribute("page", paging.getPage());   
		ra.addAttribute("countPerPage", paging.getCountPerPage());
		
		return "redirect:/community/list";
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
