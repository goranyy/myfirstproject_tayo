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

import kr.co.tayo.dao.SearchDAO;
import kr.co.tayo.dto.SearchDTO;
import kr.co.tayo.service.SearchService;

@Controller
public class SearchController {
	
	Logger logger=LoggerFactory.getLogger(this.getClass());
	@Autowired SearchService searchservice;
	@Autowired SearchDAO searchdao;

	// 검색창 불러오기
	@RequestMapping(value="/searchpage")
	public String searchpage() {
		logger.info("검색창 호출");
		return "searchpage";
	}
	
	/*
	@RequestMapping(value="/searchlistCall")
	@ResponseBody
	public HashMap<String, Object> searchlistCall(@RequestParam int page) {
		
	HashMap<String, Object> map = new HashMap<String, Object>();
	logger.info("list 요청!! : "+page);//몇페이지를 요청하는지 확인
	
	return searchservice.list(page);
	
	}
	*/

	@RequestMapping (value="/searchwork")
	@ResponseBody
	public HashMap<String, Object> searchwork(Model model,
			@RequestParam HashMap<String, String> params){  
			logger.info("param: "+params);
			ArrayList<SearchDTO> searchlist = searchdao.search(params);
			HashMap<String, Object> map= new HashMap<String, Object>(); 
			map.put("searchlist",searchlist); 			
			return map; 
			/*
			ArrayList<SearchDTO>list=searchservice.searchwork(model, params); 
			
			logger.info("list : "+list);
			map.put("list",list); 
			
			return map; 
			*/
		 	}
		
	//검색 조건 파라미터 받아오기
	}

