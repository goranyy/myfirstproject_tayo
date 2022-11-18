package kr.co.tayo.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tayo.dao.AdminDAO;
import kr.co.tayo.dto.AdminDTO;
import kr.co.tayo.dto.HashDTO;
import kr.co.tayo.dto.MypageDTO;

@Service
public class AdminService {
	@Autowired AdminDAO dao;
	Logger logger= LoggerFactory.getLogger(this.getClass());
	public HashMap<String, Object> list(int page) {
		int offset = (page-1)*10;
		
		
		int totalCount = dao.totalCount();
		logger.info("total count : "+totalCount);
		
	
		int totalPages = totalCount%10 > 0 ? (totalCount/10)+1 : totalCount/10; //총 페이지 수
		logger.info("총 페이지 수 : "+totalPages);
		logger.info("총 페이지 수2 : "+Math.ceil(totalCount/10)); //double를 반환하므로 나중에 정수로 변환해야 함.
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("total", totalPages);
		result.put("list", dao.list(offset));
		
		
		return result;
		
	}

	public int Memberlistdel(ArrayList<String> delList) {
		int total=0;
		
		for(String id:delList) {
			total+= dao.delete(id);
		}
		logger.info("총 지운 갯수: "+total);
		return total;
	}

	public ArrayList<HashDTO> MemberListsearch(HashMap<String, String> param) {
		  logger.info("DB필요해서 DAO 호출");
		  
		  logger.info("param:"+ param);
	  
		
	  	  
		  return dao.MemberListsearch(param); 
	}
/*
	public AdminDTO Memberdetail(HashMap<String, String> mem_id) {
		
		return dao.Memberdetail(mem_id);
	}
*/

	public int totalCount2(HashMap<String, String> param) {
		logger.info("param:"+param);
		
		logger.info("totalCount2:"+dao.totalCount2(param));
		
		
		return dao.totalCount2(param);
	}
}
