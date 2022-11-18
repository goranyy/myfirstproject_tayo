package kr.co.tayo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.tayo.dto.A_alllistDTO;

public interface A_alllistDAO {

	int totalCount();
	
	ArrayList<A_alllistDTO> A_alllist(int offset); 
			
	ArrayList<A_alllistDTO> A_alllistsearch(HashMap<String, String> param);

	int A_alllistdel(String id);

	int totalCount2(HashMap<String, String> param);

	int totalCount3(HashMap<String, String> param);

	
	
}