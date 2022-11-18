package kr.co.tayo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.tayo.dto.NoticeDTO;
import kr.co.tayo.dto.PhotoDTO;

public interface NoticeDAO {

	ArrayList<NoticeDTO> list(int offset);

	int totalCount();
	
	NoticeDTO detail(String num);
	
	void upHit(String num);

	ArrayList<NoticeDTO> search(HashMap<String, String> param);
	
	ArrayList<PhotoDTO> fileList(String num);
	
	int totalCount2(HashMap<String, String> param);

	int totalCount3(HashMap<String, String> param);
}
