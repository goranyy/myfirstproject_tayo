package kr.co.tayo.service;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tayo.dao.MypageDAO;
import kr.co.tayo.dto.MypageDTO;

@Service
public class MypageService {
	Logger logger= LoggerFactory.getLogger(this.getClass());	
	@Autowired MypageDAO dao;
	public MypageDTO mypage(String loginId) {
		logger.info("개인정보 가져오기");
	
		return dao.mypage(loginId);
	}

	public String MypageUpdateForm(String loginId, HashMap<String, String> params) {
	      logger.info("MypageUpdateForm 요청.. "+loginId);
	      
	      // String loginId, String mem_email, String mem_pnum, String mem_add, String mem_detailAdd,
	      //String mem_mar, String mem_child, String mem_fam, String mem_mbti
	      String mem_id=params.get("mem_id");
	      //String mem_pw=params.get("mem_pw");
	      String mem_email=params.get("mem_email");
	      String mem_pnum=params.get("mem_pnum");
	      String mem_add=params.get("mem_add");
	      String mem_detailAdd=params.get("mem_detailAdd");
	      //String mem_name=params.get("mem_name");
	      //String mem_age=params.get("mem_age");
	      String mem_mar=params.get("marry");
	      String mem_child=params.get("children");
	      String mem_fam=params.get("mem_fam");
	      String mem_mbti=params.get("mem_mbti");

	   
	      
	      String result = dao.eventId(loginId);
	      logger.info("result"+result);
	      if(result != null ) {
	         dao.Mypageupdate(mem_id, mem_email, mem_pnum, mem_add, mem_detailAdd);
	         dao.MypageUpdateForm2(mem_id, mem_mar,mem_child, mem_fam, mem_mbti );
	         
	      } else {
	         dao.Mypageupdate(mem_id, mem_email, mem_pnum, mem_add, mem_detailAdd);
	         dao.MypageInsert(mem_id, mem_mar,mem_child, mem_fam, mem_mbti );
	      }
	      
	      
	      return  "redirect:/mypage";
	   }



	public void remove(String loginId) {
			logger.info("회원 정보 삭제");
			int row=dao.remove(loginId);
			logger.info("삭제된 회원수:"+row);
	
	}

	public MypageDTO AdminMypage(String loginId) {
		logger.info("관리자 개인정보 가져오기");
		return dao.AdminMypage(loginId);
	}

	public int AdminMypageupdate(String loginId, String mem_email, String mem_pnum, String mem_add,
			String mem_detailAdd) {
		
		return dao.AdminMypageupdate(loginId,mem_email,mem_pnum,mem_add,mem_detailAdd);
	}

	public MypageDTO mypage3(String loginId) {
		logger.info("개인정보 가져오기");
		
		return dao.mypage3(loginId);
		
	}

	public MypageDTO Memberdetail(HashMap<String, String> mem_id) {
		logger.info("회원 상세 정보 가져오기");
		
		return dao.Memberdetail(mem_id);
	}

	public int Memberdetailupdate(String mem_id, String mem_power) {
		
		return dao.Memberdetailupdate(mem_id,mem_power);
	}

}
