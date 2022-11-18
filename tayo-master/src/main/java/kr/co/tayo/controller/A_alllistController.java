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
import kr.co.tayo.dto.A_alllistDTO;
import kr.co.tayo.service.A_TogetherService;
import kr.co.tayo.service.A_alllistService;

@Controller
public class A_alllistController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	A_alllistService service;
	
	
	//신규추가
	@RequestMapping(value = "/A_alllist")
	public String A_alllist(Model model) {
		return "A_alllist";
	}
	

	// 관리자 글관리 전체 글목록
	//@RequestMapping(value = "/A_alllist")
	//public String main() {
	//	return "A_alllist";
	//}
	
	
	//관리자 글관리 전체 페이징처리
	@RequestMapping(value = "/A_alllistCall")
	@ResponseBody
	public HashMap<String, Object> A_alllistCall(@RequestParam int page) {
		logger.info("list 요청 : " + page);
		HashMap<String, Object> map = new HashMap<String, Object>();
		return service.A_alllist(page);
	}
	

	// 관리자 글관리 전체 목록 검색(제목, 작성자)
	@RequestMapping(value = "/A_alllistsearch")
	@ResponseBody
	public HashMap<String, Object> A_alllistsearch(@RequestParam HashMap<String, String> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<A_alllistDTO> list = service.A_alllistsearch(param);
		logger.info("list:" + list);
		map.put("list", list);
		return map;
	}
	
	// 관리자 같이가볼래 체크박스 삭제
	@RequestMapping(value = "/A_alllistdel")
	@ResponseBody
	public HashMap<String, Object> A_alllistdel(@RequestParam(value="delList[]")ArrayList<String> delList){
		logger.info("list: {}",delList);
		
		int cnt=service.A_alllistdel(delList);
		String msg=delList.size()+" 개 삭제 요청중";
		msg +=cnt+" 개 삭제 완료 하였습니다";
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("msg", msg);
		
		return map;		
	}	
	
	
}