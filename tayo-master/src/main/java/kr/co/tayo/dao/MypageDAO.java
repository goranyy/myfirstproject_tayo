package kr.co.tayo.dao;

import java.util.HashMap;

import kr.co.tayo.dto.MypageDTO;

public interface MypageDAO {

	MypageDTO mypage(String loginId);
	/*
	int Mypageupdate(String loginId, String mem_email, String mem_pnum, String mem_add, String mem_detailAdd,
			String mem_marry, String mem_child, String mem_fam, String mem_mbti);
	*/
	   void Mypageupdate(String mem_id, String mem_email, String mem_pnum, String mem_add, String mem_detailAdd); //

	int update1(String loginId,String mem_marry, String mem_child, String mem_fam, String mem_mbti);
	int remove(String loginId);
	
	MypageDTO AdminMypage(String loginId);
	
	int AdminMypageupdate(String loginId, String mem_email, String mem_pnum, String mem_add, String mem_detailAdd);
	MypageDTO mypage3(String loginId);
	
	MypageDTO Memberdetail(HashMap<String, String> mem_id);
	
	int Memberdetailupdate(String mem_id, String mem_power);
	   void MypageUpdateForm2(String mem_id,String mem_mar, String mem_child, String mem_fam, String mem_mbti);//
	   void MypageInsert(String mem_id, String mem_mar, String mem_child, String mem_fam, String mem_mbti);//
	   String eventId(String loginId);
}
