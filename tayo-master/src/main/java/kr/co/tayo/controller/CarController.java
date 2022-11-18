package kr.co.tayo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;

@Controller
public class CarController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//@Autowired CarService service;
	/*
	 * @RequestMapping(value="/") public String home() {
	 * 
	 * return "list"; }
	 */
	/*
	 * // 리스트 호출
	 * 
	 * @RequestMapping(value="/listCall")
	 * 
	 * @ResponseBody // 반환 위해 필요함 public HashMap<String, Object> list(Model model) {
	 * logger.info("list..");
	 * 
	 * HashMap<String, Object> map = new HashMap<String, Object>();
	 * ArrayList<CarDTO> list = service.list(); logger.info("list :{}",list);
	 * 
	 * map.put("list", list);
	 * 
	 * // 추후 로그인 상태도 전달 return map; }
	 * 
	 * // 사진 호출
	 * 
	 * @RequestMapping(value="/imgList")
	 * 
	 * @ResponseBody // 반환 위해 필요함 public HashMap<String, Object> imgList(Model
	 * model, @RequestParam String ca_num) { logger.info("imgList.. ca_num: {}",
	 * ca_num);
	 * 
	 * HashMap<String, Object> map = new HashMap<String, Object>();
	 * ArrayList<FileDTO> imgList = service.imgList(ca_num);
	 * logger.info("imgList :{}",imgList);
	 * 
	 * map.put("imgList", imgList);
	 * 
	 * // 추후 로그인 상태도 전달 return map; }
	 */
	
	//-------------------------------------------------------------------------
    //사용자
    //-------------------------------------------------------------------------
	
}
