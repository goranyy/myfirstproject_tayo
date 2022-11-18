package kr.co.tayo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.tayo.dto.QnaDTO;
import kr.co.tayo.dto.QnaPhotoDTO;
import kr.co.tayo.dto.TogetherReplyDTO;

public interface QnaDAO {

	ArrayList<QnaDTO> list(int offset);

	int totalCount();
	
	int write(QnaDTO dto);

	void fileWrite(int num, String oriFileName, String newFileName);
	
	QnaDTO detail(String num);

	ArrayList<QnaPhotoDTO> fileList(String num);
	
	void upHit(String num);

	int update(HashMap<String, String> params);

	int delete(String num);

	ArrayList<QnaDTO> search(HashMap<String, String> param);

	int replyWrite(String reply, String loginId, String num);

	ArrayList<TogetherReplyDTO> replylist(String num, int offset);

	int replyDelete(String re_num);

	int replyUpdate(String re_num, String recom, String loginId);
	
	int reTotalCount(String num);
	
	int bctUp(String writer);
	
	int bctMin(String writer);
	
	int detailSecretCancel(String num, String loginId);

	int detailSecretInsert(String num, String loginId);

	int detailSecretUpdate(String num, String loginId);
	
}
