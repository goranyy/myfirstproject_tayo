package kr.co.tayo.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.tayo.dto.A_TogetherDTO;
import kr.co.tayo.dto.A_replylistDTO;
import kr.co.tayo.service.A_TogetherService;
import kr.co.tayo.service.A_replylistService;

@Controller
public class A_replylistController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	A_replylistService service;
	
	//신규추가
	@RequestMapping(value = "/A_replylist")
	public String A_replylist(Model model) {
		return "A_replylist";
	}
	
	
	// 관리자 글관리 댓글 목록보기
	//@RequestMapping(value = "/A_replylist")
	//public String A_replylist() {
	//	return "A_replylist";
	//}
	
	
	// 관리자 글관리 댓글 페이징처리
	@RequestMapping(value = "/A_replylistCall")
	@ResponseBody
	public HashMap<String, Object> A_replylistCall(@RequestParam int page) {
		logger.info("list 요청 : " + page);
		HashMap<String, Object> map = new HashMap<String, Object>();
		return service.A_replylist(page);
	}
	
	
	// 관리자 글관리 댓글 검색(제목, 작성자)
	@RequestMapping(value = "/A_replylistsearch")
	@ResponseBody
	public HashMap<String, Object> A_replylistsearch(@RequestParam HashMap<String, String> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<A_replylistDTO> list = service.A_replylistsearch(param);
		logger.info("list:" + list);
		map.put("list", list);
		return map;
	}	
	
	
	// 관리자 글관리 댓글 체크박스 삭제기능
	@RequestMapping(value = "/A_replylistdel")
	@ResponseBody
	public HashMap<String, Object> A_replylistdel(@RequestParam(value = "delList[]") ArrayList<String> delList) {
		logger.info("list: {}", delList);

		int cnt = service.A_replylistdel(delList);
		String msg = delList.size() + " 개 삭제 요청중";
		msg += cnt + " 개 삭제 완료 하였습니다";

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("msg", msg);

		return map;
	}
	
}