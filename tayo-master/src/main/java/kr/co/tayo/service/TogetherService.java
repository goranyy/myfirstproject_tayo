package kr.co.tayo.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.tayo.dao.TogetherDAO;

import kr.co.tayo.dto.TogetherDTO;
import kr.co.tayo.dto.TogetherReRepleDTO;
import kr.co.tayo.dto.TogetherReplyDTO;

@Service
public class TogetherService {
	
	Logger logger =LoggerFactory.getLogger(getClass());

	@Autowired TogetherDAO dao;
	
	public HashMap<String,Object> Togetherlist(int page) { 
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
		ArrayList<TogetherDTO> list=dao.Togetherlist(offset);
		result.put("total",totalPages);
		result.put("list", list);		
		return result;
	}
		
	public void Togetherwrite(HashMap<String, String> params) {
		dao.Togetherwrite(params);
		logger.info("게시글 작성");		
	}
	

	public TogetherDTO Togetherdetail(String num, String power) {
		logger.info("상세보기");
		TogetherDTO dto=dao.Togetherdetail(num);
		logger.info("dto:" +dto);
		if((dto!=null) && ("0".equals(power))) {
	         dao.upHit(num);
	      }else if(power == null) {
	    	  dao.upHit(num);
	      }else {	    	  
	      }	
		return dto;
	}

	public TogetherDTO TogetherupdateForm(String num) {
		logger.info("updateForm 요청");
		return dao.Togetherdetail(num);
	}

	public void Togetherupdate(HashMap<String, String> params) {
		dao.Togetherupdate(params);			
	}

	public void Togetherdelete(String num) {
		logger.info("삭제 요청");
		dao.Togetherdelete(num);
	}

	 public ArrayList<TogetherDTO> Togethersearch(@RequestParam HashMap<String, String> param){ 
	        logger.info("DB필요해서 DAO 호출");
	        logger.info("param:"+ param);
	        TogetherDTO dto= new TogetherDTO();	          
	        return dao.Togethersearch(param); 
	 }
	 
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

}