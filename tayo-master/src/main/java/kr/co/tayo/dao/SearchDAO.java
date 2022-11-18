package kr.co.tayo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.tayo.dto.SearchDTO;

public interface SearchDAO {
	
	int totalCount();

	ArrayList<SearchDTO> search(HashMap<String, String> params);


}