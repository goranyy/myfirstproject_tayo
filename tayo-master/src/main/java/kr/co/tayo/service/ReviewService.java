package kr.co.tayo.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.tayo.dao.ReviewDAO;
import kr.co.tayo.dto.PhotoDTO;
import kr.co.tayo.dto.ReviewDTO;
import kr.co.tayo.dto.TogetherReRepleDTO;
import kr.co.tayo.dto.TogetherReplyDTO;

@Service
public class ReviewService {
		
	Logger logger = LoggerFactory.getLogger(getClass());
		
	@Autowired ReviewDAO dao;

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
		ReviewDTO dto = new ReviewDTO();
		dto.setTitle(params.get("title"));
		dto.setMem_id(params.get("mem_id"));
		dto.setContent(params.get("content"));
		int success = dao.write(dto);
		int num = dto.getNum();
		logger.info("write success : {}",num);
		
		if(success>0 && ! photo.getOriginalFilename().equals("")) {
			fileUpload(photo,dto.getNum());
		}
		return "redirect:/reviewList?num="+num;
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
	


	  public void detail(String num, Model model, String method,String power) {
	      ReviewDTO dto = dao.detail(num);
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
	

	public String update(MultipartFile photo, HashMap<String, String> params) {
		logger.info("photo 객체 : {}",photo.getOriginalFilename());
		int success = dao.update(params);
		String num = params.get("num");
		
		if(success>0 && ! photo.getOriginalFilename().equals("")) {
			fileUpload(photo,Integer.parseInt(num));
		}
		return "redirect:/review_detail?num="+num;
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

	public ArrayList<ReviewDTO> search(@RequestParam HashMap<String, String> param) {
		logger.info("DB필요해서 DAO 호출");
        logger.info("param:"+ param);
        ReviewDTO dto = new ReviewDTO();
        return dao.search(param); 
    }

	/* 댓글 */
	public int replyWrite(String reply, String loginId, String num) {
		return dao.replyWrite(reply, loginId, num);
	}

	public ArrayList<TogetherReplyDTO> replyListCall(String num, int offset) {
		return dao.replylist(num, offset);
	}

	public int replyDelete(String re_num) {
		return dao.replyDelete(re_num);
	}

	public int replyUpdate(String re_num, String recom, String loginId) {
		return dao.replyUpdate(re_num,recom,loginId);
	}

	public ArrayList<TogetherReRepleDTO> reReplyListCall(String reNumVal) {
		return dao.reReplyList(reNumVal);
	}

	public int reTotalCount(String num) {
		return dao.reTotalCount(num);
	}

	public int reReplyWrite(String reReply, String loginId, String rNum) {
		return dao.reReplyWrite(reReply, loginId, rNum);
	}

	public int reReplyDelete(String rr_num) {
		return dao.reReplyDelete(rr_num);
	}

	public int reReplyUpdate(String reComment, String reNumVal, String loginId) {
		return dao.reReplyUpdate(reComment,reNumVal,loginId);
	}

	public int replySecretInsert(String reNum, String loginId) {
		return dao.replySecretInsert(reNum, loginId);
	}

	public int replySecretUpdate(String reNum, String loginId) {
		return dao.replySecretUpdate(reNum, loginId);
	}

	public int bctUp(String writer) {
		return dao.bctUp(writer);
	}

	public int replySecretCancel(String reNum, String loginId) {
		return dao.replySecretCancel(reNum, loginId);
	}

	public int bctMin(String writer) {
		return dao.bctMin(writer);
	}
	
	public int detailSecretCancel(String num, String loginId) {
		return dao.detailSecretCancel(num, loginId);
	}

	public int detailSecretInsert(String num, String loginId) {
		return dao.detailSecretInsert(num, loginId);
	}

	public int detailSecretUpdate(String num, String loginId) {
		return dao.detailSecretUpdate(num, loginId);
	}
	
	
	public int totalCount2(HashMap<String, String> param) {
			logger.info("param:"+param);
			logger.info("totalCount2:"+dao.totalCount2(param));
			logger.info("totalCount3:"+dao.totalCount3(param));
			return dao.totalCount2(param)+dao.totalCount3(param);
		}

}
