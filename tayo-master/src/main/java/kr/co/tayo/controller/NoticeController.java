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

import kr.co.tayo.dto.A_NoticeDTO;
import kr.co.tayo.dto.NoticeDTO;
import kr.co.tayo.dto.ReviewDTO;
import kr.co.tayo.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired NoticeService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/noticeList") 
    public String home() { 
       return "noticeList"; 
    }
	
	@RequestMapping(value = "/notice_listCall")
	   @ResponseBody
	   public HashMap<String, Object> listCall2(@RequestParam int page) {
	      logger.info("list 요청 : "+page);
	      HashMap<String, Object> map=new HashMap<String, Object>();
	      return service.list(page);
	   }
	
	@RequestMapping(value="/notice_detail")
	public String detail(Model model, @RequestParam String num,HttpSession session) {
		String power = (String) session.getAttribute("power");
		logger.info("num="+num);
		service.detail(num,model,"detail",power);
		return "notice_detail";
	}
	
	@RequestMapping(value="/notice_search")
	@ResponseBody 
	public HashMap<String, Object>Hashsearch(@RequestParam
	  HashMap<String, String> param){
		  logger.info("param:"+param);
		  HashMap<String, Object> map= new HashMap<String, Object>(); 
		  ArrayList<NoticeDTO>list=service.search(param); 
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

	

}
