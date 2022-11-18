package kr.co.tayo.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.tayo.dao.NoticeDAO;
import kr.co.tayo.dto.NoticeDTO;
import kr.co.tayo.dto.ReviewDTO;

@Service
public class NoticeService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired NoticeDAO dao;

	public HashMap<String,Object> list(int page) { 
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
	      result.put("total",totalPages);
	      result.put("list", dao.list(offset));      
	      return result;
	   }
	
	public void detail(String num, Model model, String method,String power) {
	      NoticeDTO dto = dao.detail(num);
	      model.addAttribute("total",dto);
	      ArrayList<kr.co.tayo.dto.PhotoDTO> fileList = dao.fileList(num);
	      logger.info("fileList"+fileList);
	      model.addAttribute("fileList",fileList);
	      if(method.equals("detail")&& ("0".equals(power))) {
	         dao.upHit(num);
	      }else if(power == null) {
	    	  dao.upHit(num);
	      }else {
	    	  
	      }
	   }

	public ArrayList<NoticeDTO> search(@RequestParam HashMap<String, String> param) {
		logger.info("DB필요해서 DAO 호출");
        logger.info("param:"+ param);
        NoticeDTO dto = new NoticeDTO();
        return dao.search(param); 
    }
	
	public int totalCount2(HashMap<String, String> param) {
		logger.info("param:"+param);
		logger.info("totalCount2:"+dao.totalCount2(param));
		logger.info("totalCount3:"+dao.totalCount3(param));
		return dao.totalCount2(param)+dao.totalCount3(param);
	}


}
