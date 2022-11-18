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

import kr.co.tayo.service.TripService;

@Controller
public class TripController {
	@Autowired TripService service;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@RequestMapping(value="/TripList")
	
	public String hash(Model model) {
		logger.info("여행지 리스트 불러오기");
		
		return "TripList";
	}
	
	
	@RequestMapping(value = "/TriplistCall")
	@ResponseBody
	public HashMap<String, Object> TriplistCall(@RequestParam int page) {
		logger.info("list 요청 : "+page);

		return service.list(page); 
	}	

	@RequestMapping(value="/Triplistdel")
	@ResponseBody
	public HashMap<String, Object>Triplistdel(@RequestParam(value="delList[]")ArrayList<String> delList){
		logger.info("list:{}",delList);
		int cnt=service.del(delList);
		String msg=delList.size()+" 개 삭제 요청중";
		msg += cnt+"개 삭제 완료 하였습니다.";
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("msg", msg);
		return map;	
	}
	
}
