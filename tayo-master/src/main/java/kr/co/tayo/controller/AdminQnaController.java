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

import kr.co.tayo.dto.AdminQnaDTO;
import kr.co.tayo.service.AdminQnaService;

	@Controller
	public class AdminQnaController {

		Logger logger = LoggerFactory.getLogger(this.getClass());

		@Autowired AdminQnaService service;
		
		// 관리자 같이가볼래 글 목록
		@RequestMapping(value = "/AdminQnalist")
		public String AdminQnalist() {
			return "AdminQnalist";
		}
		
		
		// 관리자 같이가볼래 페이징처리
		@RequestMapping(value = "/AdminQnalistCall")
		@ResponseBody
		public HashMap<String, Object> AdminQnalistCall(@RequestParam int page) {
			logger.info("list 요청 : " + page);
			HashMap<String, Object> map = new HashMap<String, Object>();
			return service.AdminQnalist(page);
		}
		
		
		// 관리자 같이가볼래 글 목록 검색(제목, 작성자)
		@RequestMapping(value = "/AdminQnasearch")
		@ResponseBody
		public HashMap<String, Object> search(@RequestParam HashMap<String, String> param) {
			logger.info("param:"+param);
			HashMap<String, Object> map = new HashMap<String, Object>();
			ArrayList<AdminQnaDTO> list = service.AdminQnasearch(param);
			logger.info("list:" + list);
			
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
		
		// 관리자 같이가볼래 체크박스 삭제
		@RequestMapping(value = "/AdminQnaChkDel")
		@ResponseBody
		public HashMap<String, Object> AdminQnaChkDel(@RequestParam(value="delList[]")ArrayList<String> delList){
			logger.info("list: {}",delList);
			
			int cnt=service.AdminQnaChkDel(delList);
			String msg=delList.size()+" 개 삭제 요청중";
			msg +=cnt+" 개 삭제 완료 하였습니다";
			
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("msg", msg);
			
			return map;		
		}	
/*
		// 관리자 같이가볼래 상세보기
		@RequestMapping(value = "/AdminQnaDetail")
		public String AdminQnadetail(Model model, @RequestParam String num) {
			logger.info("num : {}", num);
			String page = "redirect:/A_Togetherlist";
			AdminQnaDTO dto = service.AdminQnaDetail(num);
			if (dto != null) {
				page = "AdminQnadetail";
				model.addAttribute("total", dto);
			}
			return page;
		}
		*/
		
		// 관리자 같이가볼래 글 삭제하기 // 체크박스아님
		@RequestMapping(value = "/AdminQnaDelete")
		public String A_Togetherdelete(@RequestParam String num) {
			logger.info("num=" + num);
			service.AdminQnaDelete(num);
			return "redirect:/AdminQnalist";
		}
		
		
	}

