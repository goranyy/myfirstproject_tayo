package kr.co.tayo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.tayo.dto.A_TogetherDTO;

public interface A_TogetherDAO {

	int totalCount();

	ArrayList<A_TogetherDTO> A_Togetherlist(int offset); 
			
	ArrayList<A_TogetherDTO> A_Togethersearch(HashMap<String, String> param);

	void chkdelete(String num);

	int A_Togetherdel(String id);

	//A_TogetherDTO A_Togetherdetail(String num);

	int A_Togetherdelete(String num);



	


	
}