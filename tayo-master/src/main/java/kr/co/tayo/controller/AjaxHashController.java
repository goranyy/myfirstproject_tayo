package kr.co.tayo.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.tayo.dto.HashDTO;
import kr.co.tayo.service.HashService;

@Controller
public class AjaxHashController {
	Logger logger =LoggerFactory.getLogger(getClass());
	@Autowired HashService service;
	
	/*
	  @RequestMapping(value="/listCall")
	  
	  @ResponseBody public HashMap<String, Object>listCall(){ HashMap<String,
	  Object> map= new HashMap<String, Object>(); ArrayList<HashDTO>
	  list=service.list(); map.put("list",list); return map; }
	 */
	
	@RequestMapping(value = "/HashlistCall")
	@ResponseBody
	public HashMap<String, Object> HashlistCall(@RequestParam int page) {
		logger.info("list 요청 : "+page);
		HashMap<String, Object> map = new HashMap<String, Object>();

		return service.list(page); 
	}	

	@RequestMapping(value="/Hashdel")
	@ResponseBody
	public HashMap<String, Object>Hashdel(@RequestParam(value="delList[]")ArrayList<String> delList){
		logger.info("list:{}",delList);
		int cnt=service.del(delList);
		String msg=delList.size()+" 개 삭제 요청중";
		msg += cnt+"개 삭제 완료 하였습니다.";
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("msg", msg);
		return map;
	
	}
	
	
	/*
	  @RequestMapping(value="/Hashsearch")
		 
	@ResponseBody public HashMap<String, Object>Hashsearch(@RequestParam
			  HashMap<String, String> param){
				  logger.info("param:"+param);
			 		  
			  return service.searchlist(param); 
			  }	
	*/
	
	
	
	
	
	

	
	

	  

	  @RequestMapping(value="/Hashsearch")
		 
	@ResponseBody public HashMap<String, Object>Hashsearch(@RequestParam
	  HashMap<String, String> param){
		  logger.info("param:"+param);
		  HashMap<String, Object> map= new HashMap<String, Object>(); 
		  ArrayList<HashDTO>list=service.search(param); 
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

	  
	  
	  
	  
	  

	  
	  
	/*  @RequestMapping(value="/Hashsearch")
		 
	@ResponseBody public HashMap<String, Object>Hashsearch(@RequestParam
	  HashMap<String, String> param){
		  logger.info("param");
		  HashMap<String, Object> map= new HashMap<String, Object>(); 

	  
	  return service.search(param); 
	  }*/
	  
	  
	  
	
	/*
	 * @RequestMapping(value="/search")
	 * 
	 * @ResponseBody public HashMap<String, Object>search(@RequestParam String
	 * param){ logger.info("param:"+param); ArrayList<HashDTO>
	 * search=service.search(param); HashMap<String, Object> map= new
	 * HashMap<String, Object>(); logger.info("serach:"+search);
	 * map.put("search",search);
	 * 
	 * 
	 * return map; }
	 */

}