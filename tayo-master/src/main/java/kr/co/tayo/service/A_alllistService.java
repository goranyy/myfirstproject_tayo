package kr.co.tayo.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tayo.dao.A_alllistDAO;
import kr.co.tayo.dto.A_alllistDTO;

@Service
public class A_alllistService {
	
	Logger logger =LoggerFactory.getLogger(getClass());
	
	@Autowired A_alllistDAO dao;
	
	public HashMap<String, Object> A_alllist(int page) {
		int offset=(page-1)*10;
		int totalCount=dao.totalCount();
		logger.info("total count : "+ totalCount);
		
		int totalPages=totalCount/10;
		if(totalCount%10>0) {
			totalPages=(totalCount/10)+1;
		}
		
		logger.info("총 페이지 수 : "+ totalPages);
		logger.info("총 페이지 수 2: "+Math.ceil(totalCount/10));
		
		HashMap<String, Object> result=new HashMap<String, Object>();
		ArrayList<A_alllistDTO> list=dao.A_alllist(offset);
		result.put("total",totalPages);	
		result.put("list", list);		
		return result;
	}
	
	
	public ArrayList<A_alllistDTO> A_alllistsearch(HashMap<String, String> param) {
		logger.info("DB필요해서 DAO 호출");
		logger.info("param:"+ param);
		A_alllistDTO dto= new A_alllistDTO();          
		return dao.A_alllistsearch(param); 
	}
		
	
	public int A_alllistdel(ArrayList<String> delList) {
		int total=0;		
		for (String id : delList) {
			total += dao.A_alllistdel(id);
		}
		logger.info("총 지운 갯수 : "+total);	
		return total;
	}
	
	
	// 신규추가
	public int totalCount2(HashMap<String, String> param) {
		
		logger.info("param:"+param);
		
		logger.info("totalCount2:"+dao.totalCount2(param));
		logger.info("totalCount3:"+dao.totalCount3(param));
		
		return dao.totalCount2(param)+dao.totalCount3(param);
	}
	
	

}