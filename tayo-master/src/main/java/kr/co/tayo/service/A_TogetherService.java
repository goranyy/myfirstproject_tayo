package kr.co.tayo.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tayo.dao.A_TogetherDAO;
import kr.co.tayo.dto.A_TogetherDTO;
import kr.co.tayo.dto.TogetherDTO;

@Service
public class A_TogetherService {
	
	Logger logger =LoggerFactory.getLogger(getClass());
	
	@Autowired A_TogetherDAO dao;

	public HashMap<String, Object> A_Togetherlist(int page) {
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
		ArrayList<A_TogetherDTO> list=dao.A_Togetherlist(offset);
		result.put("total",totalPages);
//		result.put("list", dao.A_Togetherlist(offset));		
		result.put("list", list);		
		return result;
	}

	
	public ArrayList<A_TogetherDTO> A_Togethersearch(HashMap<String, String> param) {
		logger.info("DB필요해서 DAO 호출");
		logger.info("param:"+ param);
		A_TogetherDTO dto= new A_TogetherDTO();   
		return dao.A_Togethersearch(param); 
	}


	public int A_Togetherdel(ArrayList<String> delList) {
		int total=0;		
		for (String id : delList) {
			total += dao.A_Togetherdel(id);
		}
		logger.info("총 지운 갯수 : "+total);	
		return total;
	}
	
	//public A_TogetherDTO A_Togetherdetail(String num) {
	//	logger.info("상세보기");
	//	A_TogetherDTO dto=dao.A_Togetherdetail(num);
	//	logger.info("dto:" +dto);
	//	return dto;
	//}
	
	public void A_Togetherdelete(String num) {
		logger.info("삭제 요청");
		dao.A_Togetherdelete(num);
	}
	
	

	

}