package kr.co.tayo.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.tayo.dto.QnaDTO;
import kr.co.tayo.dto.TogetherReplyDTO;
import kr.co.tayo.service.QnaService;

@Controller
public class QnaController {
	
	Logger logger=LoggerFactory.getLogger(this.getClass());
	@Autowired QnaService service;

		// 고객센터 목록
		@RequestMapping(value="/Qnalist")
		public String Qnalist() {
			logger.info("고객센터 목록 호출");
			return "Qnalist";
		}
	
		@RequestMapping(value="/QnalistCall")
		@ResponseBody
		public HashMap<String, Object> QnalistCall(@RequestParam int page) {
			
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("list 요청!! : "+page);//몇페이지를 요청하는지 확인
		
		return service.list(page);
		
		}
		
		/*
		 ajax없이 list띄우는 법 
		@RequestMapping(value = "/")
		public String home(Model model){
			logger.info("리스트 호출");
			ArrayList<QnaDTO> list=service.list();
			model.addAttribute("list", list);
			return "list";
		}
		*/
		
		// 고객센터 글작성폼으로 이동
		@RequestMapping(value = "/QnawriteForm")
		public String QnawriteForm(Model model) {
			logger.info("게시글 작성 이동");
			return "QnawriteForm";
		}
		
		// 고객센터 글 작성
		@RequestMapping(value = "/Qnawrite" ,method = RequestMethod.POST)
		public String Qnawrite(Model model,
				MultipartFile photo,
				@RequestParam HashMap<String, String> params) { 
			logger.info("params : {}",params);
			return service.write(photo, params);
		}
		
		// 고객센터 글 상세보기 (댓글 추가해야함)
		@RequestMapping(value = "/Qnadetail")
		public String Qnadetail(Model model, @RequestParam String num, HttpSession session) {
			String power = (String) session.getAttribute("power");
			logger.info("num : {}",num);
			service.detail(num,model,"detail",power);
			
			return "Qnadetail";		
		}
		
		// 고객센터 글 수정폼
		@RequestMapping(value="/QnaupdateForm")
		public String QnaupdateForm(Model model, @RequestParam String num,HttpSession session) {
			String power = (String) session.getAttribute("power");
			logger.info("num="+num);
			service.detail(num,model,"QnaupdateForm",power);
			return "QnaupdateForm";
		}
		
			//고객센터 글 수정하기
		@RequestMapping(value="/Qnaupdate")
		public String Qnaupdate(Model model, MultipartFile photo, @RequestParam HashMap<String,String> params, @RequestParam String num) {
			logger.info("num : {}",num);
			logger.info("params : {} ",params);
			
			return service.update(photo,params); 
		}
		
		@RequestMapping(value="/Qnadelete")
		public String Qnadelete(@RequestParam String num) {
			logger.info("num:{}",num);
			service.delete(num);
			
			return "redirect:/Qnalist";
		}
		
		//검색기능
		@RequestMapping(value = "/Qnasearch")
		@ResponseBody 
		public HashMap<String, Object>Qnasearch(@RequestParam
			    HashMap<String, String> param){ 
			    HashMap<String, Object> map= new HashMap<String, Object>(); 
			    ArrayList<QnaDTO>list=service.search(param); 
			     logger.info("list:"+list);
			     map.put("list",list); 
			     return map; 
			     }
		
		//댓글기능
		/* QnA 댓글 리스트 */
		@RequestMapping(value="/replyListCallQ")
		@ResponseBody
		public HashMap<String, Object>replyListCall(@RequestParam HashMap<String, String> params){
			String num = params.get("num");
			String page = params.get("page");
			
			int offset = (Integer.parseInt(page)-1)*10;
			int reTotalCount = service.reTotalCount(num);
			int totalPages = reTotalCount%10 > 0 ? (reTotalCount/10)+1 : reTotalCount/10; //총 페이지 수
			
			ArrayList<TogetherReplyDTO> list=service.replyListCall(num, offset);
			HashMap<String, Object> map= new HashMap<String, Object>();
			map.put("list",list);
			map.put("total", totalPages);
			
			return map;
		}
		
		/* QnA 댓글 작성 */
	      @RequestMapping(value="/replyWriteQ")
	      @ResponseBody
	      public HashMap<String, Object> replyWrite(HttpSession session, @RequestParam HashMap<String, String> params) {
	         String reply = params.get("reply");
	         String num = params.get("num");
	         String loginId = (String) session.getAttribute("loginId");
	         
	         int row = service.replyWrite(reply, loginId, num);
	         
	         HashMap<String, Object> map = new HashMap<String, Object>();
	         map.put("success", row);
	         
	         return map;
	      }
		
		
		
		
		
		/* QnA 댓글 삭제 */
		@RequestMapping(value="/replyDeleteQ")
		@ResponseBody
		public HashMap<String, Object> replyDelete(HttpSession session, @RequestParam HashMap<String, String> params) {
			String re_num = params.get("re_num");
			int row = service.replyDelete(re_num);
		   
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("success", row);
		   
		   return map;
		}
			
		/* QnA 댓글 수정 */
		@RequestMapping(value="/replyUpdateQ")
		@ResponseBody
		public HashMap<String, Object> replyUpdate(HttpSession session, @RequestParam HashMap<String, String> params) {
			String re_num = params.get("reNumVal");
			String recom = params.get("recom");
			String loginId = (String) session.getAttribute("loginId");
			
			int row = service.replyUpdate(re_num,recom,loginId);
		   
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("success", row);
			
		   return map;
		}
		
		/* 같이 가볼래 게시글 비공개 취소 */
		@RequestMapping(value="/detailSecretCancelQ")
		@ResponseBody
		public HashMap<String, Object> detailSecretCancel(HttpSession session, @RequestParam HashMap<String, String> params) {
			String num = params.get("num");
			String writer = params.get("writer");		
			String loginId = (String) session.getAttribute("loginId");
			
			int row = service.detailSecretCancel(num, loginId);
			int memRow = service.bctMin(writer);
			int success = 0;
			
			if(row==1 && memRow ==1) {
				success += 1;
			}
		   
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("success", success);
			return map;
		}
		
		/* 같이 가볼래 게시글 비공개 처리 Insert */
		@RequestMapping(value="/detailSecretInsertQ")
		@ResponseBody
		public HashMap<String, Object> detailSecretInsert(HttpSession session, @RequestParam HashMap<String, String> params) {
			String num = params.get("num");
			String writer = params.get("writer");		
			String loginId = (String) session.getAttribute("loginId");
			
			int row = service.detailSecretInsert(num, loginId);
			int memRow = service.bctUp(writer);
			int success = 0;
			
			if(row==1 && memRow ==1) {
				success += 1;
			}
		   
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("success", success);
			return map;
		}
		
		/* 같이 가볼래 게시글 비공개 처리 Update */
		@RequestMapping(value="/detailSecretUpdateQ")
		@ResponseBody
		public HashMap<String, Object> detailSecretUpdate(HttpSession session, @RequestParam HashMap<String, String> params) {
			String num = params.get("num");
			String writer = params.get("writer");
			String loginId = (String) session.getAttribute("loginId");
			
			int row = service.detailSecretUpdate(num, loginId);
			int memRow = service.bctUp(writer);
			int success = 0;
			
			if(row==1 && memRow ==1) {
				success += 1;
			}
		   
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("success", success);
			return map;
		}
}
