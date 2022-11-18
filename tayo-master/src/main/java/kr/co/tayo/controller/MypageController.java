package kr.co.tayo.controller;

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

import kr.co.tayo.dto.MypageDTO;
import kr.co.tayo.service.MypageService;



@Controller
public class MypageController {
	Logger logger= LoggerFactory.getLogger(this.getClass());

	@Autowired MypageService service;
	
	  @RequestMapping(value="/mypage")
	 
	  public String mypage(Model model,HttpSession session) {
		  String loginId = (String) session.getAttribute("loginId");
		  logger.info("loginId:"+loginId);
		  logger.info("마이페이지 접속");
		  
		  if(session.getAttribute("loginId")!=null) {
			  MypageDTO dto =service.mypage(loginId);
			  logger.info("dto"+dto);
				if(dto!=null) {
				model.addAttribute("info",dto);
				logger.info("dto:"+dto);
				
				}else {
					MypageDTO skt =service.mypage3(loginId);
					model.addAttribute("info",skt);
					logger.info("skt:"+skt);
				}			  
		  }else{
			  model.addAttribute("msg", "로그인이 필요한 서비스 입니다.");
		  }

		  return "Mypage"; 
	 }
	  
	  @RequestMapping(value="/Mypageupdate")
	  public String MypageupdateForm(Model model,HttpSession session) {
		  String loginId = (String) session.getAttribute("loginId");
		  logger.info("loginId:"+loginId);
		  logger.info("마이페이지 수정이동");
		  
		  if(session.getAttribute("loginId")!=null) {
			  MypageDTO dto =service.mypage(loginId);
			  logger.info("dto"+dto);
				if(dto!=null) {
				model.addAttribute("info",dto);
				logger.info("dto:"+dto);
				
				}else {
					MypageDTO skt =service.mypage3(loginId);
					model.addAttribute("info",skt);
					logger.info("skt:"+skt);
				}			  
		  }else{
			  model.addAttribute("msg", "로그인이 필요한 서비스 입니다.");
		  }
		  
		  return "MypageupdateForm";
	  }
	  
	     // 업데이트 요청
	     @RequestMapping(value = "/MypageUpdateForm")
	      public String update(HttpSession session, Model model,  @RequestParam  HashMap<String, String> params) { //@RequestParam HashMap<String, String> params
	      //   logger.info("params :{}", params);
	       logger.info("MypageUpdateForm 요청..");
	      logger.info("params:{}",params);
	      String loginId = (String) session.getAttribute("loginId");
	         
	         return service.MypageUpdateForm(loginId, params); // 수정 후, 상세보기 페이지로 이동
	      }
	     
	     
	  @RequestMapping(value="/remove")
	  public String remove(Model model,HttpSession session) {
		  String loginId = (String) session.getAttribute("loginId");
		  logger.info("삭제요청 loginId:"+loginId);
		  logger.info("회원 삭제");
		  String page="Mypage";
		  if(loginId!=null) {
			  service.remove(loginId);
			  page="redirect:/logout";
		  }else {
			  model.addAttribute("msg", "실패했습니다.");
		  }
		  
		  return page;
	  }
	  
	  
	  
	  @RequestMapping(value="/AdminMypage")
		 
	  public String AdminMypage(Model model,HttpSession session) {
		  String loginId = (String) session.getAttribute("loginId");
		  logger.info("loginId:"+loginId);
		  logger.info("관리자 마이페이지 접속");
		  
		  if(session.getAttribute("loginId")!=null) {
			  MypageDTO dto =service.AdminMypage(loginId);
			  logger.info("dto"+dto);
				if(dto!=null) {
				model.addAttribute("info",dto);
				logger.info("dto:"+dto);
				
				}else {
					model.addAttribute("msg","데이터를 가져오는데 실패 했습니다.");
				}			  
		  }else{
			  model.addAttribute("msg", "로그인이 필요한 서비스 입니다.");
		  }

		  return "AdminMypage"; 
	 }
	  
	  
	  @RequestMapping(value="/AdminMypageupdate")
	  public String AdminMypageupdateForm(Model model,HttpSession session) {
		  String loginId = (String) session.getAttribute("loginId");
		  logger.info("loginId:"+loginId);
		  logger.info("관리자 마이페이지 수정이동");
		  
		  if(session.getAttribute("loginId")!=null) {
			  MypageDTO dto =service.AdminMypage(loginId);
			  logger.info("dto"+dto);
				if(dto!=null) {
				model.addAttribute("info",dto);
				logger.info("dto:"+dto);
				
				}else {
					model.addAttribute("msg","데이터를 가져오는데 실패 했습니다.");
				}			  
		  }else {
			  model.addAttribute("msg", "로그인이 필요한 서비스 입니다.");
		  }
		  
		  return "AdminMypageupdateForm";
	  }
	  
	  @RequestMapping(value="/AdminMypageupdateForm")
	  public HashMap<String, Object>AdminMypageupdate(@RequestParam HashMap<String, String> params,HttpSession session, HttpServletRequest req){
		  String loginId = (String) session.getAttribute("loginId");
		  logger.info("loginId:"+loginId);
		  logger.info("관리자 마이페이지 업데이트");
		  logger.info("params{}"+params);
		  String mem_email = params.get("mem_email").replaceAll("\\s", "");
		  String mem_pnum =params.get("mem_pnum").replaceAll("[^0-9]", "");
		  String mem_add= params.get("mem_add");
		  String mem_detailAdd=params.get("mem_detailAdd").trim();

		  logger.info("mem_email:"+mem_email);
		  logger.info("mem_pnum:"+mem_pnum);
		  logger.info("mem_add:"+mem_add);
		  logger.info("mem_detailAdd:"+mem_detailAdd);

			int row = service.AdminMypageupdate(loginId,mem_email,mem_pnum,mem_add,mem_detailAdd);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("row", row);
			logger.info("row:"+row);
			return map; 
	  }	  
	  
	  @RequestMapping(value="/MemberdetailForm")
		 
	  public String Memberdetail(Model model,HttpSession session,@RequestParam HashMap<String, String> mem_id) {
		  String loginId = (String) session.getAttribute("loginId");
		  logger.info("loginId:"+loginId);
		  logger.info("회원 관리 하기");
		  logger.info("mem_id:"+mem_id);
		 
		 MypageDTO dto =service.Memberdetail(mem_id);
		 logger.info("dto:"+dto);
				if(dto!=null) {
				model.addAttribute("info",dto);
				logger.info("dto:"+dto);
				}
		  return "Memberdetail"; 
	 }
	  
	  @RequestMapping(value="/Memberdetailupdate")
	  public String Memberdetailupdate(Model model,HttpSession session,@RequestParam HashMap<String, String> params) {
		  String loginId = (String) session.getAttribute("loginId");
		  String mem_id= params.get("mem_id");
		  String mem_power= params.get("mem_power");
		  logger.info("loginId:"+loginId);
		  logger.info("권한 업데이트");
		  logger.info("params:"+params);
		  int row = service.Memberdetailupdate(mem_id,mem_power);
		  
		  HashMap<String, Object> map = new HashMap<String, Object>();
			
		  map.put("row", row);
		  logger.info("row:"+row);
		
		  return "MemberList";

	 }
	  
	  
	  
	  
	  
}
