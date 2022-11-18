package kr.co.tayo.service;

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

import kr.co.tayo.dao.QnaDAO;
import kr.co.tayo.dto.QnaDTO;
import kr.co.tayo.dto.QnaPhotoDTO;
import kr.co.tayo.dto.TogetherReplyDTO;

@Service
public class QnaService {
	Logger logger =LoggerFactory.getLogger(this.getClass());

	@Autowired QnaDAO dao;
	
	/*ajax없이 list띄우는 법
	public ArrayList<QnaDTO> list() {
		logger.info("dao 호출");
		return dao.list();
	}
	*/
	
	public HashMap<String, Object> list(int page) {
		 //page에 따른 offset 구하기 
		//페이지당 보여주는 limit을 10이라고 했을떄 offset은 몇이 되는가? 
		
		
		int offset = 10*(page-1); 
		
		
		//총 페이지 수 = 게시물 총 갯수 / 페이지당 보여줄 수 (나누기) 
		int totalCount = dao.totalCount();
		logger.info("total count : "+totalCount);
		
		//만약 총게시물 수가 10개면 1페이지 보여주고,
		//나눴을 때 나머지가 떨어지면  +1해줘야 함. 
		
		int totalPages = totalCount%10>0 ? (totalCount/10)+1 : (totalCount/10); //총페이지 수  
		logger.info("총 페이지 수 : "+totalPages);
		/// 여기까지 찍힘
		//logger.info("총 페이지 수2 : "+Math.ceil(totalCount/10)); //Math는 나머지를 올림한다. 근데 이건 double로 반환하기때문에 정수로 변환 해줘야 한다. 
		
		//못받았어
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("total", totalPages);
		result.put("list", dao.list(offset));
		
		logger.info("result"+result);
		return result;
	}
	

	public String write(MultipartFile photo,HashMap<String, String> params) {
		logger.info("photo 객체 : {}",photo);
		
		//key generator
		QnaDTO dto = new QnaDTO(); 
		dto.setTitle(params.get("title"));
		dto.setContent(params.get("content"));
		dto.setMem_id(params.get("mem_id"));
		
		int success = dao.write(dto); 
		logger.info("write success : {}",dto.getNum());
		
		//성공하고 업로드할 파일이 있다면 
		if(success > 0 && !photo.getOriginalFilename().equals("")) {
		//파일을 업로드하고 photo에 데이터 넣기
		fileUpload(photo,dto.getNum());
		}
		return "redirect:/Qnadetail?num="+dto.getNum();
		
	}
	
	public void fileUpload(MultipartFile photo, int num) {
		//1. 파일명 추출
		String oriFileName = photo.getOriginalFilename();
		//1-1. 기존 파일명에서 확장자 분리 
		String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
		//1-2. 신규 파일명 만들기(새로운 이름 주고 확장자 재조립)
		String newFileName = System.currentTimeMillis()+ext;
		
		
		try {
			//2-1. 파일 바이너리 얻어내기
			byte[] bytes = photo.getBytes();
			//2-2. 확장경로애 파일 쓰기
			Path path = Paths.get("C:/upload/"+newFileName);
			Files.write(path, bytes);
			logger.info(newFileName+"   UPLOAD OK!");
			//dao를 이용해서 photo 테이블에 데이터 넣기
			dao.fileWrite(num,oriFileName,newFileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}

	public void detail(String num, Model model, String method,String power) {
		logger.info("상세보기");
		
		QnaDTO dto = dao.detail(num); 
		model.addAttribute("Qnadto", dto);
		logger.info("Qnadto"+dto);
		
		ArrayList<QnaPhotoDTO> fileList = dao.fileList(num); 
		model.addAttribute("fileList", fileList);
		logger.info("fileList"+fileList);
		
		//조회수 올리기
	      if(method.equals("detail")&& ("0".equals(power))) {
		         dao.upHit(num);
		      }else if(power == null) {
		    	  dao.upHit(num);
		      }else {
		    	  
		      }
	}

	public QnaDTO updateForm(String num) {
		logger.info("수정하기");
		return dao.detail(num);
	}
	
	public String update(MultipartFile photo, @RequestParam HashMap<String, String> params) {
		logger.info("photo 객체 : {}",photo.getOriginalFilename());
		int success = dao.update(params);
		String num = params.get("num");
		logger.info("num어디갔니"+num);
		
		if(success>0 && ! photo.getOriginalFilename().equals("")) {
			fileUpload(photo,Integer.parseInt(num));
		}
		return "redirect:/Qnadetail?num="+num;
	}


	public void delete(String num) {
		int row = dao.delete(num);
		logger.info("삭제 row : "+row);
	}

	 public ArrayList<QnaDTO> search(@RequestParam HashMap<String, String> param){ 
	        logger.info("DB필요해서 DAO 호출");
	        logger.info("param:"+ param);
	        QnaDTO dto= new QnaDTO();
	          
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
		
		public int reTotalCount(String num) {
			return dao.reTotalCount(num);
		}
		
		/* 게시글 비공개 */
		public int bctUp(String writer) {
			return dao.bctUp(writer);
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


}
