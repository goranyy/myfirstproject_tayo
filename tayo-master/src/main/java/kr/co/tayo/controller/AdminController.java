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

import kr.co.tayo.dto.AdminDTO;
import kr.co.tayo.dto.HashDTO;
import kr.co.tayo.dto.MypageDTO;
import kr.co.tayo.service.AdminService;



@Controller
public class AdminController {
	Logger logger= LoggerFactory.getLogger(this.getClass());
	@Autowired AdminService service;
	
	@RequestMapping(value="/MemberList")
	
	public String MemberList(Model model) {

		return "MemberList";
	}
	@RequestMapping(value = "/MemberlistCall")
	@ResponseBody
	public HashMap<String, Object> MemberlistCall(@RequestParam int page) {
		logger.info("list 요청 : "+page);
		HashMap<String, Object> map = new HashMap<String, Object>();

		return service.list(page); 
	}
	@RequestMapping(value="/Memberlistdel")
	@ResponseBody
	public HashMap<String, Object>Memberlistdel(@RequestParam(value="delList[]")ArrayList<String> delList){
		logger.info("list:{}",delList);
		int cnt=service.Memberlistdel(delList);
		String msg=delList.size()+" 개 삭제 요청중";
		msg += cnt+"개 삭제 완료 하였습니다.";
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("msg", msg);
		return map;
	
	}
	  @RequestMapping(value="/MemberListsearch")
		 
	@ResponseBody public HashMap<String, Object>MemberListsearch(@RequestParam
	  HashMap<String, String> param){ 
		  HashMap<String, Object> map= new HashMap<String, Object>(); 
		  ArrayList<HashDTO>list=service.MemberListsearch(param); 
	  logger.info("list:"+list);
	  map.put("list",list);
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
	  
	  
	/*
		@RequestMapping(value="/Memberdetail")
		
		public String Memberdetail(Model model,@RequestParam HashMap<String, String> mem_id) {
			 AdminDTO dto =service.Memberdetail(mem_id);
			 logger.info("dto"+dto);
			 model.addAttribute("info",dto);
			return "Memberdetail";
		}
	  
	  */
	  
	  
	  
	  
}
