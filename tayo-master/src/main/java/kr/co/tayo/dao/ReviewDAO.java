package kr.co.tayo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.tayo.dto.PhotoDTO;
import kr.co.tayo.dto.ReviewDTO;
import kr.co.tayo.dto.TogetherReRepleDTO;
import kr.co.tayo.dto.TogetherReplyDTO;

public interface ReviewDAO {
	
	ArrayList<ReviewDTO> list(int offset);
	
	//Object list(int offset);

	int write(ReviewDTO dto);

	void fileWrite(int num, String oriFileName, String newFileName);
	
	ReviewDTO detail(String num);

	ArrayList<PhotoDTO> fileList(String num);

	void upHit(String num);

	int delete(String num);

	int update(HashMap<String, String> params);

	int detail(int num);

	int totalCount();

	ArrayList<ReviewDTO> search(HashMap<String, String> param);

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

	int totalCount2(HashMap<String, String> param);

	int totalCount3(HashMap<String, String> param);

}
