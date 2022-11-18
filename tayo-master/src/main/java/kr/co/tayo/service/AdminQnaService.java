package kr.co.tayo.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.tayo.dao.AdminQnaDAO;
import kr.co.tayo.dto.AdminQnaDTO;

@Service
public class AdminQnaService {

	Logger logger =LoggerFactory.getLogger(getClass());
	@Autowired AdminQnaDAO dao;
	
	public HashMap<String, Object> AdminQnalist(int page) {
		
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
		ArrayList<AdminQnaDTO> list=dao.AdminQnalist(offset);
		result.put("total",totalPages);
		result.put("list", list);		
		return result;
	}

	public ArrayList<AdminQnaDTO> AdminQnasearch(HashMap<String, String> param) {
		logger.info("DB필요해서 DAO 호출");
		logger.info("param:"+ param);
		AdminQnaDTO dto= new AdminQnaDTO();   
		return dao.AdminQnasearch(param); 
	}

	public int AdminQnaChkDel(ArrayList<String> delList) {
		int total=0;		
		for (String id : delList) {
			total += dao.AdminQnaChkDel(id);
		}
		logger.info("총 지운 갯수 : "+total);	
		return total;
	}

	public AdminQnaDTO AdminQnaDetail(String num) {
		logger.info("상세보기");
		AdminQnaDTO dto=dao.AdminQnaDetail(num);
		logger.info("dto:" +dto);
		return dto;
	}

	public void AdminQnaDelete(String num) {
		logger.info("삭제 요청");
		dao.AdminQnaDelete(num);
	}

	public int totalCount2(HashMap<String, String> param) {
		logger.info("param:"+param);
		
		logger.info("totalCount2:"+dao.totalCount2(param));
		logger.info("totalCount3:"+dao.totalCount3(param));
		
		return dao.totalCount2(param)+dao.totalCount3(param);
	}

}
