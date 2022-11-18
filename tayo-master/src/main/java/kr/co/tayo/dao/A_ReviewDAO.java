package kr.co.tayo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.tayo.dto.A_ReviewDTO;
import kr.co.tayo.dto.PhotoDTO;
import kr.co.tayo.dto.ReviewDTO;

public interface A_ReviewDAO {
	
	ArrayList<A_ReviewDTO> list(int offset);
	
	//Object list(int offset);

	int write(A_ReviewDTO dto);

	void fileWrite(int num, String oriFileName, String newFileName);
	
	A_ReviewDTO detail(String num);

	ArrayList<PhotoDTO> fileList(String num);

	void upHit(String num);

	int delete(String num);

	int update(HashMap<String, String> params);

	int detail(int num);

	int totalCount();

	ArrayList<A_ReviewDTO> search(HashMap<String, String> param);

	int totalCount2(HashMap<String, String> param);

	int totalCount3(HashMap<String, String> param);
	




}
