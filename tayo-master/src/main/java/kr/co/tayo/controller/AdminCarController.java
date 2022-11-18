package kr.co.tayo.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
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

import kr.co.tayo.dto.CarDTO;
import kr.co.tayo.service.AdminCarService;

@Controller
public class AdminCarController {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	AdminCarService carservice;

	
	//-------------------------------------------------------------------------
    //관리자
    //-------------------------------------------------------------------------
	@RequestMapping(value = "/carList")
	public String carList() {
	
		return "carList";
	}
	
	@RequestMapping(value = "/carList1")
	@ResponseBody
	public HashMap<String, Object> carList(@RequestParam int page, HttpSession session){
		logger.info("리스트 호출 : "+page);
		
		return carservice.carList(page);			
	}
	
	
	// 차량 등록페이지로 이동
	@RequestMapping(value = "/carPutForm")
	public String carPut(Model model) {

		return "carPutForm";
	}


	// 차량 정보/사진 등록하기
	 @RequestMapping(value = "/carPut") public String carPut(HttpSession session, Model model ,
			 MultipartFile files, @RequestParam HashMap<String, String> params) {
	 logger.info("params:{}", params); logger.info("photo: {}" + files);
	 return carservice.carPut(files, params); }
	 
	
	// 차량 상세보기 이동
	@RequestMapping(value = "/carDetail")
	public String carDetail(HttpSession session, Model model, @RequestParam String ca_num) {
		logger.info("ca_num=" + ca_num);
		carservice.carDetail(ca_num, model);

		return "carDetail";
	}

	
	// 수정 폼 이동
	@RequestMapping(value = "/carUpdateForm")
	public String updateForm(HttpSession session, Model model, @RequestParam String ca_num) {
		logger.info("수정 ca_num: " + ca_num);

		carservice.carDetail(ca_num, model);
		return "carUpdateForm";
	}

	
	// 수정 요청
	@RequestMapping(value = "/carUpdate")
	public String update(HttpSession session, Model model, MultipartFile uploadFile, @RequestParam HashMap<String, String> params) { 
		logger.info("params :{}", params);
		logger.info("photo: {}" + uploadFile);
		return carservice.update(uploadFile, params); // 수정 후, 상세보기 페이지로 이동
	}

	
	// 등록게시물 삭제
	@RequestMapping(value="/Cardelete")
	public String delete(HttpSession session, HttpServletRequest request) {
		logger.info("게시물 삭제 요청..");
		
		String[] msg = request.getParameterValues("valueArr");
		for(int i=0; i<msg.length; i++) {
			carservice.delete(msg[i]);
			logger.info("msg : "+msg[i]);
		}
		return "redirect:/CarList";
	}
	
	
	// 리스트 _검색
	@RequestMapping(value="/Carsearch")
	@ResponseBody 
	public HashMap<String, Object> search(@RequestParam String keyword){ 
		logger.info("search 요청.. param: {}"+keyword);
		
		// 넘길 데이터
		HashMap<String, Object> map= new HashMap<String, Object>(); 
		ArrayList<CarDTO>list=carservice.search(keyword); 
		logger.info("list:"+list);
		map.put("list",list);

		return map; 
	}
	
	
	//-------------------------------------------------------------------------
    //사용자
    //------------------------------------------------------------------------
	// 리스트 호출
	@RequestMapping(value = "/userCarList")
	public String home(HttpSession session, Model model) {		
		
		return "userCarList";
	} // end - home
	

	// 리스트 호출
	@RequestMapping(value="/carListCall")
	@ResponseBody	// 반환 위해 필요함
	public HashMap<String, Object> list(HttpSession session, Model model) {
		logger.info("list..");
		
		// 추후 로그인 상태도 전달
		return carservice.list();
	}
	
	// 간편보기
	@RequestMapping(value = "/CarSpl")
	@ResponseBody
	public HashMap<String, Object> CarSpl(HttpSession session, Model model, String ca_num){
		logger.info("CarSpl 요청..");
		logger.info("ca_num :{}", ca_num);
		
		return carservice.Carsql(ca_num);
	}
	
	// 찜한 여부 판단
	@RequestMapping(value ="/jjimChk")
	@ResponseBody 
	public int jjimChk(HttpSession session, Model model, @RequestParam String ca_num) {
		logger.info("jjimChk.. ca_num:{}", ca_num);
		
		String loginId = (String) session.getAttribute("loginId");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("loginId", loginId);
		map.put("ca_num", ca_num);
		
		//int result =0;	// 쿼리 결과
		int idResult = 0;
		
		if(loginId != null) { // 로그인 o
			idResult = carservice.jjimChk_loginId(map);	// 해당 차에 해당 아이디가 좋아요 한 경우 : 1, 아닌경우 0
			logger.info("idResult:{} ",idResult);
			
			// 해당 아이디로 해당 ca_num 찜하기 했는지 확인 후 아니면 실행
			//result = carservice.jjimChk(ca_num);
			//logger.info("result :{}", result);
			
		} else {
			// 비회원 간편보기 조회 : 빈하트만 보여주도록..
			logger.info("로그인 X");
			idResult = 0;
		}
		
		return idResult;
	}
	
	
	// 찜하기
	@RequestMapping(value = "/jjimSet")
	@ResponseBody
	public int jjimSet(HttpSession session, String ca_num, HttpServletRequest request) {
		logger.info("jjimSet 요청.. ca_num:{}",ca_num);
		
		String loginId = (String) session.getAttribute("loginId");		
		int jjimResult = 0;
		
		if(loginId != null) { // 로그인 o
			// 로그인한 아이디가 찜한 항목인지 확인 : map 이용
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("ca_num", ca_num);
			map.put("loginId", loginId);
			jjimResult = carservice.jjimSet(map);
			
			if(jjimResult ==1) {
				// 성공
				logger.info("jjimSet 성공!");
			} else {
				logger.info("jjimSet 실패!");
				
			}
		} else { // 로그인 x
			jjimResult = 2;
			request.setAttribute("msg", "로그인 필요한 서비스입니다.");
			request.setAttribute("url", "/tayo/userCarList");
		}
		
		
		
		return jjimResult;
	}

	
	// 찜하기 취소
	@RequestMapping(value = "/jjimDel")
	@ResponseBody
	public int jjimDel(HttpSession session, String ca_num, HttpServletRequest request) {
		logger.info("jjimDel 요청.. ca_num:{}",ca_num);
		
		String loginId = (String) session.getAttribute("loginId");		
		int jjimResult = carservice.jjimDel(ca_num);
		
		if(loginId != null) {
			// 로그인 o
			if(jjimResult ==1) {
				// 성공
				logger.info("jjimDel 성공!");
			} else {
				logger.info("jjimDel 실패!");
			}			
		} else {
			//로그인 x
			logger.info("로그인 필요..");
			jjimResult = 2;
			request.setAttribute("msg","로그인이 필요한 서비스입니다.");
			request.setAttribute("url", "userCarList");
		}
		
		
		return jjimResult;
	}
	
	
	// 간편 > 상세보기 이동 요청
	@RequestMapping(value = "userCarDetail")
	public String userCarDetailCall(HttpSession session, Model model, @RequestParam String ca_num, HttpServletRequest request) {
		logger.info("상세보기 요청.. ca_num:{}"+ca_num);
		
		// 회원 로그인 세션 확인
		String loginId = (String) session.getAttribute("loginId");
		
		if(loginId != null) { // 로그인 o
			carservice.carDetailCall(ca_num, model);			
			
		} else {
			logger.info("로그인 필요..");
			request.setAttribute("msg","로그인이 필요한 서비스입니다.");
			request.setAttribute("url", "userCarList");
		}
		
		return "carDetailCall";
	}

	
	// 마이페이지_찜 목록
	@RequestMapping(value = "/myPage_jjim")
	@ResponseBody
	public HashMap<String, Object> myPage_jjim(HttpSession session, Model model, @RequestParam String mem_id, HttpServletRequest request) {
		logger.info("찜목록 요청.. mem_id:{} ", mem_id);
		
		return carservice.myPage_jjim(mem_id);
	}
	
	@RequestMapping(value = "/carPopulList")
	public String carPopul(HttpSession session, Model model) {		
		
		return "carPopulList";
	} // end - home
	
	// 인기차 목록
	@RequestMapping(value = "/carPopulListCall")
	@ResponseBody
	public HashMap<String, Object> carPopulList(HttpSession session, Model model){
		logger.info("인기차목록 요청");
		//String loginId = (String) session.getAttribute("loginId");	// 회원 로그인 세션 확인
		
		return carservice.carPopulList();
	}
	
	// 해시태그
	@RequestMapping(value = "/mainListCall")
	@ResponseBody
	public HashMap<String, Object> mainListCall(HttpSession session, Model model){
		logger.info("인기차목록 요청");
		//String loginId = (String) session.getAttribute("loginId");	// 회원 로그인 세션 확인
		
		return carservice.mainListCall();
	}
	
	
	 // 리스트 호출
	 @RequestMapping(value = "/hashCarList") public String hashCarList(HttpSession session, Model model) {
	 
		return "hashCarList"; 
	}
	
	// 해시태그 선택->차량목록
	@RequestMapping(value = "/hashCarListCall")
	@ResponseBody
	public HashMap<String, Object> hashCarListCall(HttpSession session, Model model, @RequestParam String ha_value) {		
		logger.info("ha_value:{} ",ha_value);
	
		return carservice.hashCarList(ha_value);
	} 

	
	// 여행지 이미지 등록폼 이동
	@RequestMapping(value = "/tripImgCall")
	public String tripImgCall() {
		logger.info("여행지 이미지 등록요청..");
		return "tripPutForm";
	}
	
	// 차량 정보/사진 등록하기
	@RequestMapping(value = "/tripImgPut") public String tripImgPut(HttpSession session, Model model, MultipartFile files, @RequestParam String tr_num) {
		 logger.info("여행지 이미지 등록요청22..");
		 logger.info("tr_num:{}", tr_num); 
		 logger.info("photo: {}" + files);
		 return carservice.tripImgPut(files, tr_num); 
	}
	
	// 간편보기 > 여행지 이미지
	/*
	 * @RequestMapping(value = "/tripInfo")
	 * 
	 * @ResponseBody public HashMap<String, Object> tripImg(HttpSession session,
	 * Model model, HttpServletRequest request, @RequestParam String[] random) {
	 * logger.info("여행지 이미지 요청.."); //logger.info("random:{}", random);
	 * 
	 * String[] tr_num = request.getParameterValues("random");
	 * logger.info("tr_num: ",tr_num); int size = tr_num.length;
	 * 
	 * for(int i=0; i<size; i++) { logger.info("random :{}", tr_num[i]); }
	 * 
	 * return carservice.tripImg(tr_num); }
	 */
	
	// 여행지 이미지 띄우기
	@RequestMapping(value = "/tripInfo")
	@ResponseBody 
	public HashMap<String, Object> tripInfo(HttpSession session) {
		
		return carservice.tripInfo();
	}
	
	// 렌트카 정보
	@RequestMapping(value = "/rentCar")
	@ResponseBody
	public HashMap<String, Object> rentCar(HttpSession session){
		
		return carservice.rentCar();
	}
}








