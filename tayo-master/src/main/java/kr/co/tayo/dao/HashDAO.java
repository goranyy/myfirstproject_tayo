package kr.co.tayo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.tayo.dto.HashDTO;

public interface HashDAO {

	

	



//	ArrayList<HashDTO> list();

	int delete(String id);


	int write(HashMap<String, String> params);



	


	int update(HashMap<String, String> params);



	HashDTO Form(HashMap<String, String> ha_num);


	/*
	 * HashMap<String, Object> search(HashMap<String, String> param);
	 */



	int totalCount();



	ArrayList<HashMap<String, Object>> list(int offset);



	ArrayList<HashDTO> search(HashMap<String, String> param); 


	int totalCount2(HashMap<String, String> param);


	int totalCount3(HashMap<String, String> param);





	/*
	 * ArrayList<HashMap<String, Object>>search(String ha_name, String ca_name, int
	 * offset);
	 */








	/*
	 * ArrayList<HashDTO> search(String param);
	 */

}
