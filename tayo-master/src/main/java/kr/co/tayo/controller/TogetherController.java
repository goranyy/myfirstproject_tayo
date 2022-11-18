package kr.co.tayo.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.tayo.dto.TogetherDTO;
import kr.co.tayo.dto.TogetherReRepleDTO;
import kr.co.tayo.dto.TogetherReplyDTO;
import kr.co.tayo.service.TogetherService;

@Controller
public class TogetherController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	TogetherService service;

	// 글 목록
	@RequestMapping(value = "/Togetherlist")
	public String main() {
		return "Togetherlist";
	}
	
	// 페이징처리
	@RequestMapping(value = "/TogetherlistCall")
	@ResponseBody
	public HashMap<String, Object> TogetherlistCall(@RequestParam int page) {
		logger.info("list 요청 : " + page);
		HashMap<String, Object> map = new HashMap<String, Object>();
		return service.Togetherlist(page);
	}

	// 글 목록 검색(제목, 작성자)
	@RequestMapping(value = "/Togethersearch")
	@ResponseBody
	public HashMap<String, Object> Togethersearch(@RequestParam HashMap<String, String> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<TogetherDTO> list = service.Togethersearch(param);
		logger.info("list:" + list);
		map.put("list", list);
		return map;
	}

	// 같이가볼래 글작성폼으로 이동
	@RequestMapping(value = "/TogetherwriteForm")
	public String TogetherWriteForm(Model model, HttpSession session) {
		logger.info("게시글 작성 이동");
		return "TogetherwriteForm";
	}

	// 같이가볼래 글 작성
	@RequestMapping(value = "/Togetherwrite")
	public String Togetherwrite(Model model, @RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("params : {}", params);
		
		service.Togetherwrite(params);
		return "redirect:/Togetherlist";
	}
	//수정
	// 같이가볼래 글 상세보기
		@RequestMapping(value = "/Togetherdetail")
		public String Togetherdetail(Model model, @RequestParam String num, HttpSession session) {
			String power = (String) session.getAttribute("power");
			logger.info("num : {}", num);			
			TogetherDTO dto = service.Togetherdetail(num,power);			
			model.addAttribute("total", dto);			
			return "Togetherdetail";
		}
	
	
	//기존
	// 같이가볼래 글 상세보기
	//@RequestMapping(value = "/Togetherdetail")
	//public String Togetherdetail(Model model, @RequestParam String num) {
	//	logger.info("num : {}", num);
	//	String page = "redirect:/";
	//	TogetherDTO dto = service.Togetherdetail(num);
	//	if (dto != null) {
	//		page = "Togetherdetail";
	//		model.addAttribute("total", dto);
	//	}
	//	return page;
	//}

	// 같이가볼래 글 수정하기
	@RequestMapping(value = "/TogetherupdateForm")
	public String Togetherupdate(Model model, @RequestParam String num) {

		logger.info("num:{}", num);
		String page = "redirect:/Togetherlist";
		TogetherDTO dto = service.TogetherupdateForm(num);

		if (dto != null) {
			page = "TogetherupdateForm";
			model.addAttribute("total", dto);
		}
		return page;
	}

	@RequestMapping(value = "/Togetherupdate")
	public String Togetherupdate(@RequestParam HashMap<String, String> params) {
		logger.info("params:{}", params);
		service.Togetherupdate(params);
		return "redirect:/Togetherdetail?num=" + params.get("num");
	}

	// 갈이가볼래 글 삭제하기
	@RequestMapping(value = "/Togetherdelete")
	public String Togetherdelete(@RequestParam String num) {
		logger.info("num=" + num);
		service.Togetherdelete(num);
		return "redirect:/Togetherlist";
	}
	
	/* 같이 가볼래 댓글 리스트 */
	@RequestMapping(value="/replyListCallT")
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
	
	/* 같이 가볼래 댓글 작성 */
	@RequestMapping(value="/replyWriteT")
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
	
	/* 같이 가볼래 댓글 삭제 */
	@RequestMapping(value="/replyDeleteT")
	@ResponseBody
	public HashMap<String, Object> replyDelete(HttpSession session, @RequestParam HashMap<String, String> params) {
		String re_num = params.get("re_num");
		int row = service.replyDelete(re_num);
	   
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", row);
	   
	   return map;
	}
	
	/* 같이 가볼래 댓글 수정 */
	@RequestMapping(value="/replyUpdateT")
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
	
	/* 같이 가볼래 대댓글 리스트 */
	@RequestMapping(value="/reReplyListCallT")
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
	
	/* 같이 가볼래 대댓글 작성 */
	@RequestMapping(value="/reReplyWriteT")
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
	
	/* 같이 가볼래 대댓글 삭제 */
	@RequestMapping(value="/reReplyDeleteT")
	@ResponseBody
	public HashMap<String, Object> reReplyDelete(HttpSession session, @RequestParam HashMap<String, String> params) {
		String rr_num = params.get("rr_num");

		int row = service.reReplyDelete(rr_num);
	   
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", row);
	   
	   return map;
	}
	
	/* 같이 가볼래 대댓글 수정 */
	@RequestMapping(value="/reReplyUpdateT")
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
	@RequestMapping(value="/replySecretUpdateT")
	@ResponseBody
	public HashMap<String, Object> replySecretUpdate(HttpSession session, @RequestParam HashMap<String, String> params) {
		String reNum = params.get("reNum");
		String writer = params.get("writer");
		String loginId = (String) session.getAttribute("loginId");
		
		int row = service.replySecretUpdate(reNum, loginId);
		int memRow = service.bctUp(writer);
		int success = 0;
		
		if(row==1 && memRow ==1) {
			success += 1;
		}
	   
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", success);
		return map;
	}
	
	
	/* 같이 가볼래 댓글 비공개 처리 Insert */
	@RequestMapping(value="/replySecretInsertT")
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
	@RequestMapping(value="/replySecretCancelT")
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
	@RequestMapping(value="/detailSecretCancelT")
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
	@RequestMapping(value="/detailSecretInsertT")
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
	@RequestMapping(value="/detailSecretUpdateT")
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
