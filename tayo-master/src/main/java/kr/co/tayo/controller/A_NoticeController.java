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

import kr.co.tayo.dto.A_NoticeDTO;
import kr.co.tayo.dto.A_ReviewDTO;
import kr.co.tayo.dto.ReviewDTO;
import kr.co.tayo.service.A_NoticeService;

@Controller
public class A_NoticeController {
	
	@Autowired A_NoticeService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "/a_noticeList") 
    public String home() { 
       return "a_noticeList"; 
    }
	
	@RequestMapping(value = "/a_notice_listCall")
	   @ResponseBody
	   public HashMap<String, Object> listCall1(@RequestParam int page) {
	      logger.info("list 요청 : "+page);
	      HashMap<String, Object> map=new HashMap<String, Object>();
	      return service.list(page);
	   }
	
	@RequestMapping(value="/a_notice_detail")
	public String detail(Model model, @RequestParam String num) {
		logger.info("num="+num);
		service.detail(num,model,"detail");
		return "a_notice_detail";
	}
	
	@RequestMapping(value="/a_notice_writeForm")
	public String writeForm(Model model, HttpSession session) {
		return "a_notice_writeForm";
	}
	
	@RequestMapping(value="/a_notice_write")
	public String write(Model model, MultipartFile photo, @RequestParam HashMap<String,String> params) {
		logger.info("params : {} ",params);
		return service.write(photo,params);
	}
	
	@RequestMapping(value="/a_notice_updateForm")
	public String updateForm(Model model, @RequestParam String num) {
		logger.info("num="+num);
		service.detail(num,model,"updateForm");
		return "a_notice_updateForm";
	}
	
	@RequestMapping(value="/a_notice_update")
	public String update(Model model, MultipartFile photo, @RequestParam HashMap<String,String> params) {
		logger.info("params : {} ",params);
		return service.update(photo,params); 
	}
	
	@RequestMapping(value="/a_notice_delete")
	public String delete(Model model, @RequestParam String num) {
		logger.info("num="+num);
		service.delete(num);
		return "redirect:/a_noticeList";
	}
	
	@RequestMapping(value="/a_notice_search")
	@ResponseBody 
	public HashMap<String, Object>Hashsearch(@RequestParam
	  HashMap<String, String> param){
		  logger.info("param:"+param);
		  HashMap<String, Object> map= new HashMap<String, Object>(); 
		  ArrayList<A_NoticeDTO>list=service.search(param); 
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
	
	@RequestMapping(value="/a_notice_del")
	@ResponseBody
	public HashMap<String , Object> del(@RequestParam(value="delList[]") ArrayList<String> delList){
		logger.info("list : {}",delList);
		int cnt = service.del(delList);
		String msg = delList.size()+" 개 삭제 요청중 ";
		msg += cnt+" 개 삭제 완료 하였습니다.";
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("msg", msg);
		
		return map;
		
	}

	

}
