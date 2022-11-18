package kr.co.tayo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.tayo.dto.TogetherDTO;
import kr.co.tayo.dto.TogetherReRepleDTO;
import kr.co.tayo.dto.TogetherReplyDTO;

public interface TogetherDAO {
	

	void Togetherwrite(HashMap<String, String> params);

	TogetherDTO Togetherdetail(String num);

	void upHit(String num);

	void Togetherupdate(HashMap<String, String> params);

	int Togetherdelete(String num);

	int totalCount();

	ArrayList<TogetherDTO> Togethersearch(HashMap<String, String> param);
	
	ArrayList<TogetherDTO> Togetherlist(int offset);

	int replyWrite(String reply, String loginId, String num);

	ArrayList<TogetherReplyDTO> replylist(String num, int offset);

	int replyDelete(String re_num);

	int replyUpdate(String re_num, String recom, String loginId);

	ArrayList<TogetherReRepleDTO> reReplyList(String reNumVal);

	int reTotalCount(String num);

	int reReplyWrite(String reReply, String loginId, String rNum);

	int reReplyDelete(String rr_num);

	int reReplyUpdate(String reComment, String reNumVal, String loginId);

	int replySecretInsert(String reNum, String loginId);

	int replySecretUpdate(String reNum, String loginId);
	
	int bctUp(String writer);

	int replySecretCancel(String reNum, String loginId);

	int bctMin(String writer);

	int detailSecretCancel(String num, String loginId);

	int detailSecretInsert(String num, String loginId);

	int detailSecretUpdate(String num, String loginId);
	
	
	
	
}