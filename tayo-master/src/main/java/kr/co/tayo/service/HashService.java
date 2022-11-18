package kr.co.tayo.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.tayo.dao.HashDAO;
import kr.co.tayo.dto.HashDTO;

@Service
public class HashService {

	@Autowired HashDAO dao;
	Logger logger= LoggerFactory.getLogger(this.getClass());
	
	/*
	  public ArrayList<HashDTO> list() { logger.info("DB필요해서 DAO 호출"); //dao를 실행했다는
	  로거를 찍어줌
	  
	  return dao.list(); }
	 */


	public String write(HashMap<String, String> params) {
		HashDTO dto= new HashDTO();
		
		int row=dao.write(params);	
		return "redirect:/Hash";
	}


	
	public int del(ArrayList<String> delList) {
		int total=0;
		
		for(String id:delList) {
			total+= dao.delete(id);
		}
		logger.info("총 지운 갯수: "+total);
		return total;
		
	}
	public String update(HashMap<String, String> params) {
		HashDTO dto= new HashDTO();
		
		int row=dao.update(params);
		return "redirect:/Hash";
	}



	public HashDTO updateForm(HashMap<String, String> ha_num) {
		HashDTO dto= dao.Form(ha_num);
		return dto;
	}


/*
	
	  public HashMap<String, Object> search(@RequestParam HashMap<String, String> param){ 
		  logger.info("DB필요해서 DAO 호출");
	  
		  logger.info("param:"+ param);
		  String page=param.get("page");

		  
		  int pages = Integer.parseInt(page);
		  logger.info("pages:"+pages);
	  
		  int offset=(pages-1)*10;		  
		  int totalCount2=dao.totalCount2(param)+dao.totalCount3(param);
		  logger.info("total count:"+totalCount2);
		  int totalPages = totalCount2%10 > 0 ? (totalCount2/10)+1 : totalCount2/10; //총 페이지 수
			logger.info("총 페이지 수 : "+totalPages);
			logger.info("총 페이지 수2 : "+Math.ceil(totalCount2/10)); //double를 반환하므로 나중에 정수로 변환해야 함.
			
			HashMap<String, Object> result = new HashMap<String, Object>();
			result.put("total", totalPages);
			result.put("list", dao.search(param));
	  
		  HashDTO dto= new HashDTO();
	  	  
		  return dao.search(param); 
	 }

*/
	  
	  
	  
	  
		
/*	  public ArrayList<HashDTO> search(@RequestParam HashMap<String, String> param){ 
		  logger.info("DB필요해서 DAO 호출");
	  
		  logger.info("param:"+ param);
	  
		  HashDTO dto= new HashDTO();
	  	  
		  return dao.search(param); 
	 }*/
	  
	
	public ArrayList<HashDTO> search(@RequestParam HashMap<String, String> param){ 
		  logger.info("DB필요해서 DAO 호출");
	  
		  logger.info("param:"+ param);

		  
		  HashDTO dto= new HashDTO();
	  	  
		  return dao.search(param); 
	 }	  
	  
	
	  

		public HashMap<String, Object> list(int page) {
			
			int offset = (page-1)*10;
			
			
			int totalCount = dao.totalCount();
			logger.info("total count : "+totalCount);
			
		
			int totalPages = totalCount%10 > 0 ? (totalCount/10)+1 : totalCount/10; //총 페이지 수
			logger.info("총 페이지 수 : "+totalPages);
			logger.info("총 페이지 수2 : "+Math.ceil(totalCount/10)); //double를 반환하므로 나중에 정수로 변환해야 함.
			logger.info("totalPages:"+totalPages);
			logger.info("list"+dao.list(offset));
			
			HashMap<String, Object> result = new HashMap<String, Object>();
			result.put("total", totalPages);
			result.put("list", dao.list(offset));
			
			
			return result;
		}



		public int totalCount2(HashMap<String, String> param) {
			
			logger.info("param:"+param);
			
			logger.info("totalCount2:"+dao.totalCount2(param));
			logger.info("totalCount3:"+dao.totalCount3(param));
			
			return dao.totalCount2(param)+dao.totalCount3(param);
		}




	}
	  
	 
/*
public HashMap<String, Object> searchlist(HashMap<String, String> param) {
	String page=param.get("page");
	int pages = Integer.parseInt(page);
	int offset =(pages-1)*10;
	String ca_name=param.get("ca_name");
	String ha_name=param.get("ha_name");
	logger.info("offset" + offset);
	int totalCount=dao.totalCount2(param)+dao.totalCount3(param);
	int totalPages = totalCount%10 > 0 ? (totalCount/10)+1 : totalCount/10; //총 페이지 수
	logger.info("총 페이지 수 : "+totalPages);
	logger.info("총 페이지 수2 : "+Math.ceil(totalCount/10)); //double를 반환하므로 나중에 정수로 변환해야 함.
	logger.info("totalPages:"+totalPages);
	HashMap<String, Object> result = new HashMap<String, Object>();
	
	result.put("total", totalPages);
	result.put("list",dao.search(ha_name,ca_name,offset));
	/* Integer.parseInt(String.valueOf(dao.search(ha_name,ca_name,offset))) 
	
	return result;
}*/




