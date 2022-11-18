package kr.co.tayo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.tayo.dto.A_NoticeDTO;
import kr.co.tayo.dto.NoticeDTO;
import kr.co.tayo.dto.PhotoDTO;
import kr.co.tayo.dto.ReviewDTO;

public interface A_NoticeDAO {

	ArrayList<A_NoticeDTO> list(int offset);

	int totalCount();
	
	A_NoticeDTO detail(String num);
	
	void upHit(String num);

	int write(A_NoticeDTO dto);

	ArrayList<PhotoDTO> fileList(String num);

	void fileWrite(int num, String oriFileName, String newFileName);

	int update(HashMap<String, String> params);

	int delete(String num);

	ArrayList<A_NoticeDTO> search(HashMap<String, String> param);
	
	int totalCount2(HashMap<String, String> param);

	int totalCount3(HashMap<String, String> param);
}
