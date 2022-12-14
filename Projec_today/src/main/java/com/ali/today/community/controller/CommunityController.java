package com.ali.today.community.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.json.simple.JSONObject;
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
import com.google.gson.Gson;
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
		
		// ???????????? ?????????
		if(session.getAttribute("login") == null) { // ????????? x
			model.addAttribute("msg", "notLogin");
		}else { // ????????? O
			UserVO user = (UserVO)session.getAttribute("login");
			if(user.getPet() == null) { //????????? ????????? ?????? ??????
				model.addAttribute("msg", "petNone");
			}else {  //????????? ????????? ?????? ??????
				Integer perId = user.getPet().getPetId();
				PetVO pet = userService.selectOnePet(perId);
				model.addAttribute("pet", pet);
			}
			
		}

		return "community/introduce";
	}
	
	
	
	// ???????????? ????????? ????????? ??????
	@PostMapping("/openPetList")
	@ResponseBody
	public List<PetVO> openPetList(@RequestBody Map<String, String> map){		
		Integer page = Integer.parseInt(map.get("page"));
		String condition = map.get("condition");
		String keyword = map.get("keyword");
		List<PetVO> petList = userService.selectOpenPet(page, condition, keyword);
		return petList;
	}
	
	
	// ???????????? ????????? ??? ??????
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
	
	
	// ?????? ???????????? ?????? ???????????? ??????
	@GetMapping("/otherPet/{petId}")
	public String otherPet(@PathVariable Integer petId, GalleryPageVO paging, Model model, RedirectAttributes ra) {
		
		PetVO pet = userService.selectOnePet(petId);
		if(pet == null) { // ???????????? ?????? petId ?????? ????????? ??????
			ra.addFlashAttribute("noAccess", "null");
			return "redirect:/community/intro";
		}else if(pet.getOpen() == 0) {  // ????????? ???????????? ?????? ??????
			ra.addFlashAttribute("noAccess", "closed");
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
	
	
	
	
	// ????????? ????????? ????????? ??????
	@PostMapping("/getGalleries")
	@ResponseBody
	public List<GalleryVO> getGalleries(@RequestBody GalleryVO data){
		
		System.out.println("petId : " + data.getPetId() + ", page : " + data.getPage());
		GalleryPageVO paging = new GalleryPageVO(); 
		paging.setPage(data.getPage());
		List<GalleryVO> list = mypetService.getGalleryList(data.getPetId(), paging);
		
		return list;
	}
	
	
	
	
	
	// ???????????? ?????? ????????? ?????? ???????????? ??????
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
	
	
	
	// ????????? ?????? ????????? ??????
	@GetMapping("/write")
	public String write(HttpSession session, RedirectAttributes ra) {
		
	  // ?????? ??????????????? ?????? ???????????????!!
//		if(session.getAttribute("login") == null) {
//			ra.addFlashAttribute("msg", "notLogin");
//			return "redirect:/";
//		}
		
		return "community/boardWrite";
	}
	
	// ????????? ?????? ????????? ??????
		@GetMapping("/header")
		public String write() {

			
			return "common/header";
		}
	
	
	
	// ????????? ?????? ??????
	@PostMapping("/write")
	public String write(BoardVO article, RedirectAttributes ra) {
		
		System.out.println("parameter : " + article); 

		boardService.insert(article);	
		ra.addFlashAttribute("msg", "regSuccess");
		return "redirect:/community/list";
	}
	
	
	
	
	// ????????? ???????????? ??????
	@GetMapping("/content/{boardNo}")
	public String content(@PathVariable Integer boardNo, SearchVO search, Model model, RedirectAttributes ra) {
		
		//System.out.println(boardNo + "??? ????????? ?????? ??????");
		BoardVO article = boardService.getArticle(boardNo);
		if(article == null) { // ???????????? ?????? boardNo ????????? ??????
			ra.addFlashAttribute("noAccess", "null");
			return "redirect:/community/list";
		}else {
			model.addAttribute("article", article);
			model.addAttribute("hashtagList", article.getHashtagList()); //???????????? ?????????
			model.addAttribute("p", search); 
				
			// ???????????? ??????
			List<ReplyVO> replyList = boardService.getReplyList(boardNo, 1);
			model.addAttribute("replyList", replyList);
					
			return "community/boardContent";
		}
		
	}
	
	
	
	
	// ????????? ?????? ?????? ??????
	@GetMapping("/modify")
	public String modify(HttpSession session, Integer boardNo, PageVO paging, Model model, RedirectAttributes ra) {
		
		UserVO user = (UserVO)session.getAttribute("login"); 
		String userId = user.getUserId();
		BoardVO article = boardService.getArticle(boardNo);
		if(userId.equals(article.getWriter())) {
			model.addAttribute("article", article);
			model.addAttribute("hashtagList", article.getHashtagList()); //???????????? ?????????
			model.addAttribute("p", paging);
			return "community/boardModify"; 
		}else {  // ????????? ????????? ?????? ??????
			ra.addFlashAttribute("msg", "noAuthority");
			return "redirect:/community/list";
		}
		
	}
	
	
	
	
	// ????????? ?????? ??????
	@PostMapping("/modify")
	public String modify(BoardVO article, RedirectAttributes ra) { 
		System.out.println("??? ????????? ?????? ?????? : POST");
		boardService.update(article);
		ra.addFlashAttribute("msg", "modSuccess");
		return "redirect:/community/content/" + article.getBoardNo();
	}
	
	  
	
	
	
	// ????????? ?????? ??????
	@PostMapping("/delete")
	public String delete(Integer boardNo, PageVO paging, RedirectAttributes ra) {  
		
		System.out.println(boardNo + "??? ????????? ?????? ??????");
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
		JsonObject json = new JsonObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		
		System.out.println("?????????????? : " + file.getSize());  // ???????????? getsize()!! 
		
		if(file != null) {
			if(file.getSize() >0 &&  StringUtils.isNotBlank(file.getName())) {
				if(file.getContentType().toLowerCase().startsWith("image/")) {
					if(file.getSize() > 10485760) {
						
						json.addProperty("uploaded", 0);
						JsonObject json2 = new JsonObject();
			            json2.addProperty("message", "?????? 10MB?????? ????????? ???????????????.");				    	
			    		json.add("error", json2);
			    		printWriter = resp.getWriter();
			    		printWriter.print(json);
			            System.out.println(json);
			            if (printWriter != null) {
		                    printWriter.close();
		                }
			            
					}else {
						try{
					    	 
				            String fileName = file.getOriginalFilename();
				            byte[] bytes = file.getBytes();
				           
				            String uploadPath = req.getSession().getServletContext().getRealPath("/resources/images/board"); //????????????
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
				            //String fileUrl = req.getContextPath() + "/resources/images/petDiary/" +fileName2 +fileName; // ContextPath ?????? url??????
				            String fileUrl = req.getContextPath() + "/resources/images/board/" +fileName2 +fileName; //url??????
				            System.out.println("fileUrl :" + fileUrl);
				            //JsonObject json = new JsonObject();
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
				    
				}else { // ??????????????? ??? ?????? ???????????? ??????
					json.addProperty("uploaded", 0);
					JsonObject json2 = new JsonObject();
		            json2.addProperty("message", "????????? ??????(jpg, jpeg, png, gif, bmp, pdf, webp)??? ????????? ???????????????.");				    	
		    		json.add("error", json2);
		    		printWriter = resp.getWriter();
		    		printWriter.print(json);
		            System.out.println(json);
		            if (printWriter != null) {
	                    printWriter.close();
	                }
				}
			
		}
		
	}
	}
	
	
	
	
	
	
	
	
	
	
	
}
