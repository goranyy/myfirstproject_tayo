package kr.co.tayo.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tayo.dao.RentDAO;
import kr.co.tayo.dto.RentDTO;


@Service

public class RentService {
	@Autowired RentDAO dao;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	public HashMap<String, Object> list(int page) {	
	int offset = (page-1)*10;
	
	
	int totalCount = dao.totalCount();
	logger.info("total count : "+totalCount);
	

	int totalPages = totalCount%10 > 0 ? (totalCount/10)+1 : totalCount/10; //총 페이지 수
	logger.info("총 페이지 수 : "+totalPages);
	logger.info("총 페이지 수2 : "+Math.ceil(totalCount/10)); //double를 반환하므로 나중에 정수로 변환해야 함.
	logger.info("totalPages:"+totalPages);
	
	
	HashMap<String, Object> result = new HashMap<String, Object>();
	
	ArrayList<RentDTO> list=dao.Rentlist(offset);
	result.put("total", totalPages);
	result.put("list", list);
	
	
	return result;
}
public int del(ArrayList<String> delList) {
	int total=0;
	
	for(String id:delList) {
		total+= dao.delete(id);
	}
	logger.info("총 지운 갯수: "+total);
	return total;
}

}
