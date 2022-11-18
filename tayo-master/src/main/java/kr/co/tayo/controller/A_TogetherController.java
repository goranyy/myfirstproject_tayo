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
import kr.co.tayo.dto.TogetherDTO;
import kr.co.tayo.service.A_TogetherService;

@Controller
public class A_TogetherController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	A_TogetherService service;
	
	
	// 관리자 같이가볼래 글 목록
	@RequestMapping(value = "/A_Togetherlist")
	public String main() {
		return "A_Togetherlist";
	}
	
	
	// 관리자 같이가볼래 페이징처리
	@RequestMapping(value = "/A_TogetherlistCall")
	@ResponseBody
	public HashMap<String, Object> A_TogetherlistCall(@RequestParam int page) {
		logger.info("list 요청 : " + page);
		HashMap<String, Object> map = new HashMap<String, Object>();
		return service.A_Togetherlist(page);
	}
	
	
	// 관리자 같이가볼래 글 목록 검색(제목, 작성자)
	@RequestMapping(value = "/A_Togethersearch")
	@ResponseBody
	public HashMap<String, Object> search(@RequestParam HashMap<String, String> param) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<A_TogetherDTO> list = service.A_Togethersearch(param);
		logger.info("list:" + list);
		map.put("list", list);
		return map;
	}
	
	// 관리자 같이가볼래 체크박스 삭제
	@RequestMapping(value = "/A_Togetherdel")
	@ResponseBody
	public HashMap<String, Object> A_Togetherdel(@RequestParam(value="delList[]")ArrayList<String> delList){
		logger.info("list: {}",delList);
		
		int cnt=service.A_Togetherdel(delList);
		String msg=delList.size()+" 개 삭제 요청중";
		msg +=cnt+" 개 삭제 완료 하였습니다";
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("msg", msg);
		
		return map;		
	}	

	// 관리자 같이가볼래 상세보기
	//@RequestMapping(value = "/A_Togetherdetail")
	//public String A_Togetherdetail(Model model, @RequestParam String num) {
	//	logger.info("num : {}", num);
	//	String page = "redirect:/A_Togetherlist";
	//	A_TogetherDTO dto = service.A_Togetherdetail(num);
	//	if (dto != null) {
	//		page = "A_Togetherdetail";
	//		model.addAttribute("total", dto);
	//	}
	//	return page;
	//}
	
	// 관리자 같이가볼래 글 삭제하기
	@RequestMapping(value = "/A_Togetherdelete")
	public String A_Togetherdelete(@RequestParam String num) {
		logger.info("num=" + num);
		service.A_Togetherdelete(num);
		return "redirect:/A_Togetherlist";
	}
	
	
}

















