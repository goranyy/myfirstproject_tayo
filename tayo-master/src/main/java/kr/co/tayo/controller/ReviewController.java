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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.tayo.dto.ReviewDTO;
import kr.co.tayo.dto.TogetherReRepleDTO;
import kr.co.tayo.dto.TogetherReplyDTO;
import kr.co.tayo.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired ReviewService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
//	@RequestMapping(value="/reviewList")
//	public String main(Model model) {
//		
//		ArrayList<ReviewDTO> list = service.list();
//		logger.info("list size: "+list.size());
//		model.addAttribute("list",list);
//		
//		return "reviewList";
//	}
	
	@RequestMapping(value = "/reviewList") 
    public String home() { 
       return "reviewList"; 
    }
	
	@RequestMapping(value = "/review_listCall")
	   @ResponseBody
	   public HashMap<String, Object> listCall(@RequestParam int page) {
	      logger.info("list 요청 : "+page);
	      HashMap<String, Object> map=new HashMap<String, Object>();
	      return service.list(page);
	   }
	
	
	
	@RequestMapping(value="/review_writeForm")
	public String writeForm(Model model, HttpSession session) {
		return "review_writeForm";
	}
	
	@RequestMapping(value="/review_write")
	public String write(Model model, MultipartFile photo, @RequestParam HashMap<String,String> params) {
		logger.info("params : {} ",params);
		return service.write(photo,params);
	}
	
	
	@RequestMapping(value="/review_detail")
	public String detail(Model model, @RequestParam String num, HttpSession session) {
		String power = (String) session.getAttribute("power");
		logger.info("num="+num);
		service.detail(num,model,"detail", power);
		return "review_detail";
	}
	
	@RequestMapping(value="/review_updateForm")
	public String updateForm(Model model, @RequestParam String num,HttpSession session) {
		String power = (String) session.getAttribute("power");
		logger.info("num="+num);
		service.detail(num,model,"updateForm",power);
		return "review_updateForm";
	}
	
	@RequestMapping(value="/review_update")
	public String update(Model model, MultipartFile photo, @RequestParam HashMap<String,String> params) {
		logger.info("params : {} ",params);
		return service.update(photo,params); 
	}
	
	@RequestMapping(value="/review_delete")
	public String delete(Model model, @RequestParam String num) {
		logger.info("num="+num);
		service.delete(num);
		return "redirect:/reviewList";
	}
	
	@RequestMapping(value="/review_search")
	@ResponseBody 
	public HashMap<String, Object>Hashsearch(@RequestParam
	  HashMap<String, String> param){
		  logger.info("param:"+param);
		  HashMap<String, Object> map= new HashMap<String, Object>(); 
		  ArrayList<ReviewDTO>list=service.search(param); 
		  logger.info("list:"+list);
		  
		  String page=param.get("page");
		  int pages = Integer.parseInt(page);
		  
		  int offest =(pages-1)*10;
		  logger.info("offset" + offest);
		  int totalCount=service.totalCount2(param);
		  int totalPages = totalCount%10 > 0 ? (totalCount/10)+1 : totalCount/10; //총 페이지 수
			logger.info("총 페이지 수 : "+totalPages);
			logger.info("총 페이지 수2 : "+Math.ceil(totalCount/10)); //double를 반환하므로 나중에 정수로 변환해야 함.
			logger.info("totalPages:"+totalPages);
			
			
			map.put("total", totalPages);
			map.put("list",list);
	 
	  
	  return map; 
	  }

	/* 댓글 */
	/* 후기 댓글 리스트 */
	@RequestMapping(value="/replyListCallR")
	@ResponseBody
	public HashMap<String, Object>replyListCall(@RequestParam HashMap<String, String> params){
		String num = params.get("num");
		String page = params.get("page");
		
		int offset = (Integer.parseInt(page)-1)*10;
		int reTotalCount = service.reTotalCount(num);
		int totalPages = reTotalCount%10 > 0 ? (reTotalCount/10)+1 : reTotalCount/10; //총 페이지 수
		
		ArrayList<TogetherReplyDTO> list=service.replyListCall(num, offset);
		logger.info("list {}", list);
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("list",list);
		map.put("total", totalPages);
		
		return map;
	}
	
	/* 후기 댓글 작성 */
	@RequestMapping(value="/replyWriteR")
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
	
	/* 후기 댓글 삭제 */
	@RequestMapping(value="/replyDeleteR")
	@ResponseBody
	public HashMap<String, Object> replyDelete(HttpSession session, @RequestParam HashMap<String, String> params) {
		String re_num = params.get("re_num");
		int row = service.replyDelete(re_num);
	   
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", row);
	   
	   return map;
	}
	
	/* 후기 댓글 수정 */
	@RequestMapping(value="/replyUpdateR")
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
	
	/* 후기 대댓글 리스트 */
	@RequestMapping(value="/reReplyListCallR")
	@ResponseBody
	public HashMap<String, Object>reReplyListCall(@RequestParam HashMap<String, String> params){
		String reNum = params.get("reNum");
		logger.info("reNumVal : {}", reNum);
		ArrayList<TogetherReRepleDTO> reList=service.reReplyListCall(reNum);
		logger.info("reList : {}", reList);
		
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("list",reList);
		
		return map;
	}
	
	/* 후기 대댓글 작성 */
	@RequestMapping(value="/reReplyWriteR")
	@ResponseBody
	public HashMap<String, Object> reReplyWrite(HttpSession session, @RequestParam HashMap<String, String> params) {
		String reReply = params.get("reReply");
		String reReNum = params.get("reReNum");
		String loginId = (String) session.getAttribute("loginId");

		int row = service.reReplyWrite(reReply, loginId, reReNum);
	   
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", row);
	   
	   return map;
	}
	
	/* 후기 대댓글 삭제 */
	@RequestMapping(value="/reReplyDeleteR")
	@ResponseBody
	public HashMap<String, Object> reReplyDelete(HttpSession session, @RequestParam HashMap<String, String> params) {
		String rr_num = params.get("rr_num");

		int row = service.reReplyDelete(rr_num);
	   
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", row);
	   
	   return map;
	}
	
	/* 후기 대댓글 수정 */
	@RequestMapping(value="/reReplyUpdateR")
	@ResponseBody
	public HashMap<String, Object> reReplyUpdate(HttpSession session, @RequestParam HashMap<String, String> params) {
		String reComment = params.get("reComment");
		String reReNum = params.get("reReNum");
		String loginId = (String) session.getAttribute("loginId");

		int row = service.reReplyUpdate(reComment, reReNum, loginId);
	   
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", row);
		
	   return map;
	}
	
	/* 같이 가볼래 댓글 비공개 처리 Update */
	@RequestMapping(value="/replySecretUpdateR")
	@ResponseBody
	public HashMap<String, Object> replySecretUpdate(HttpSession session, @RequestParam HashMap<String, String> params) {
		String reNum = params.get("reNum");
		String writer = params.get("writer");
		logger.info("param {}", params);
		String loginId = (String) session.getAttribute("loginId");
		
		int row = service.replySecretUpdate(reNum, loginId);
		int memRow = service.bctUp(writer);
		logger.info("memRow : "+memRow);
		int success = 0;
		
		if(row==1 && memRow ==1) {
			success += 1;
		}
		logger.info("success : "+success);
	   
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", success);
		return map;
	}
	
	
	/* 같이 가볼래 댓글 비공개 처리 Insert */
	@RequestMapping(value="/replySecretInsertR")
	@ResponseBody
	public HashMap<String, Object> replySecretInsert(HttpSession session, @RequestParam HashMap<String, String> params) {
		String reNum = params.get("reNum");
		String writer = params.get("writer");		
		String loginId = (String) session.getAttribute("loginId");
		
		int row = service.replySecretInsert(reNum, loginId);
		int memRow = service.bctUp(writer);
		int success = 0;
		
		if(row==1 && memRow ==1) {
			success += 1;
		}
	   
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", success);
		return map;
	}
	
	/* 같이 가볼래 댓글 비공개 취소 */
	@RequestMapping(value="/replySecretCancelR")
	@ResponseBody
	public HashMap<String, Object> replySecretCancel(HttpSession session, @RequestParam HashMap<String, String> params) {
		String reNum = params.get("reNum");
		String writer = params.get("writer");		
		String loginId = (String) session.getAttribute("loginId");
		
		int row = service.replySecretCancel(reNum, loginId);
		int memRow = service.bctMin(writer);
		int success = 0;
		
		if(row==1 && memRow ==1) {
			success += 1;
		}
	   
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", success);
		return map;
	}
	
	/* 같이 가볼래 게시글 비공개 취소 */
	@RequestMapping(value="/detailSecretCancelR")
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
	@RequestMapping(value="/detailSecretInsertR")
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
	@RequestMapping(value="/detailSecretUpdateR")
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


