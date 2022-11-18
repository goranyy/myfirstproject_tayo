package kr.co.tayo.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.tayo.dao.A_ReviewDAO;
import kr.co.tayo.dao.ReviewDAO;
import kr.co.tayo.dto.A_ReviewDTO;
import kr.co.tayo.dto.PhotoDTO;
import kr.co.tayo.dto.ReviewDTO;

@Service
public class A_ReviewService {
		
	Logger logger = LoggerFactory.getLogger(getClass());
		
	@Autowired A_ReviewDAO dao;

//	public ArrayList<ReviewDTO> list() {
//		logger.info("리스트 호출요청");
//		return dao.list();
//	}
	
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
	

	public String write(MultipartFile photo, HashMap<String, String> params) {
		logger.info("photo 객체 : {}",photo.getOriginalFilename());
		A_ReviewDTO dto = new A_ReviewDTO();
		dto.setTitle(params.get("title"));
		dto.setMem_id(params.get("mem_id"));
		dto.setContent(params.get("content"));
		int success = dao.write(dto);
		int num = dto.getNum();
		logger.info("write success : {}",num);
		
		if(success>0 && ! photo.getOriginalFilename().equals("")) {
			fileUpload(photo,dto.getNum());
		}
		return "redirect:/a_reviewList?num="+num;
	}
	
	

	private void fileUpload(MultipartFile photo, int num) {
		String oriFileName = photo.getOriginalFilename();
		String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
		String newFileName = System.currentTimeMillis()+ext;
		
		try {
			byte[] bytes = photo.getBytes();
			Path path = Paths.get("C:/upload/"+newFileName);
			Files.write(path, bytes);
			logger.info(newFileName+" Upload ok!");
			dao.fileWrite(num,oriFileName,newFileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	


	public void detail(String num, Model model, String method) {
		A_ReviewDTO dto = dao.detail(num);
		model.addAttribute("total",dto);
		ArrayList<kr.co.tayo.dto.PhotoDTO> fileList = dao.fileList(num);
		logger.info("fileList"+fileList);
		model.addAttribute("fileList",fileList);
	}
	

	public String update(MultipartFile photo, HashMap<String, String> params) {
		logger.info("photo 객체 : {}",photo.getOriginalFilename());
		int success = dao.update(params);
		String num = params.get("num");
		
		if(success>0 && ! photo.getOriginalFilename().equals("")) {
			fileUpload(photo,Integer.parseInt(num));
		}
		return "redirect:/a_review_detail?num="+num;
	}
	

	
	public void delete(String num) {
		ArrayList<PhotoDTO> fileList = dao.fileList(num);
		int row = dao.delete(num);
		if(row>0 && fileList.size()>0) {
			File file = null;
			for(PhotoDTO dto : fileList) {
				file = new File("C:/upload/"+dto.getNewFileName());
				if(file.exists()) {
					logger.info(dto.getNewFileName()+" delete: "+file.delete());

				}
			}
		}
	}

	public ArrayList<A_ReviewDTO> search(@RequestParam HashMap<String, String> param) {
		logger.info("DB필요해서 DAO 호출");
        logger.info("param:"+ param);
        A_ReviewDTO dto = new A_ReviewDTO();
        return dao.search(param); 
    }
	
	public int del(ArrayList<String> delList) {

		int total = 0;
		for (String num : delList) {
			total += dao.delete(num);
		}
		logger.info("총 지운 갯수 : "+total);
		return total;
	}
	
	public int totalCount2(HashMap<String, String> param) {
		logger.info("param:"+param);
		logger.info("totalCount2:"+dao.totalCount2(param));
		logger.info("totalCount3:"+dao.totalCount3(param));
		return dao.totalCount2(param)+dao.totalCount3(param);
	}







}
