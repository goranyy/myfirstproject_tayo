package kr.co.tayo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.tayo.dto.A_TogetherDTO;
import kr.co.tayo.dto.A_replylistDTO;

public interface A_replylistDAO {

	int totalCount();

	ArrayList<A_replylistDTO> A_replylist(int offset);

	ArrayList<A_replylistDTO> A_replylistsearch(HashMap<String, String> param);

	void chkdelete(String num);
	
	int A_replylistdel(String id);

	int totalCount2(HashMap<String, String> param);

	int totalCount3(HashMap<String, String> param);


	


	
}