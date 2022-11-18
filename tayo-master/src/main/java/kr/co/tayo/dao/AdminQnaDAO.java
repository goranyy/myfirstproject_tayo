package kr.co.tayo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.tayo.dto.AdminQnaDTO;

public interface AdminQnaDAO {

	int totalCount();
			
	ArrayList<AdminQnaDTO> AdminQnasearch(HashMap<String, String> param);

	ArrayList<AdminQnaDTO> AdminQnalist(int offset);

	int AdminQnaChkDel(String id);

	AdminQnaDTO AdminQnaDetail(String num);

	void AdminQnaDelete(String num);

	int totalCount2(HashMap<String, String> param);

	int totalCount3(HashMap<String, String> param);

}
