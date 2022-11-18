package kr.co.tayo.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.tayo.dao.SearchDAO;
import kr.co.tayo.dto.QnaDTO;
import kr.co.tayo.dto.QnaPhotoDTO;
import kr.co.tayo.dto.SearchDTO;

@Service
public class SearchService {
	
	Logger logger =LoggerFactory.getLogger(this.getClass());
	@Autowired SearchDAO searchdao;

	/*
	public HashMap<String, Object> searchlist(int page) {
		 //page에 따른 offset 구하기 
		//페이지당 보여주는 limit을 8이라고 했을떄 offset은 몇이 되는가? 
		
		
		int offset = 8*(page-1); 
		
		
		//총 페이지 수 = 게시물 총 갯수 / 페이지당 보여줄 수 (나누기) 
		int totalCount = searchdao.totalCount();
		logger.info("total count : "+totalCount);
		
		//만약 총게시물 수가 8개면 1페이지 보여주고,
		//나눴을 때 나머지가 떨어지면  +1해줘야 함. 
		
		int totalPages = totalCount%8>0 ? (totalCount/8)+1 : (totalCount/8); //총페이지 수  
		logger.info("총 페이지 수 : "+totalPages);
		/// 여기까지 찍힘
		//logger.info("총 페이지 수2 : "+Math.ceil(totalCount/8)); //Math는 나머지를 올림한다. 근데 이건 double로 반환하기때문에 정수로 변환 해줘야 한다. 
		
		//못받았어
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("total", totalPages);
		result.put("list", searchdao.list(offset));
		
		logger.info("result"+result);
		return result;
	}
	*/
	
	public ArrayList<SearchDTO> searchwork(Model model, @RequestParam HashMap<String, String> params) {
		 logger.info("DAO입니다");
	        logger.info("params: "+ params);
	        
	        return searchdao.search(params);
	        
	        /*
	        ArrayList<SearchDTO> searchlist = searchdao.search(params);
	        
			logger.info("list : "+searchlist);
			logger.info("list 뽑 : "+searchlist.get(0).getNewFileName());
			logger.info("list 뽑 : "+searchlist.get(0).getCa_name());
			map.put("list",searchlist); 
			logger.info("map에 넣은 리스트 : "+map.get("list"));
			
			return map; 
			*/
	        
			
			/* public HashMap<String, Object> list() {
      logger.info("list service..");   
      
      // 차량정보
      List<CarDTO> carDto = cardao.carlist();   
      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("car", carDto);
      
      // 사진
      ArrayList<FileDTO> fileList = cardao.file();
      map.put("fileList", fileList);
      return map;
   }*/
	    }

	

}
