package kr.co.tayo.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.tayo.dto.AdminDTO;
import kr.co.tayo.dto.HashDTO;
import kr.co.tayo.dto.MypageDTO;

public interface AdminDAO {

	ArrayList<HashDTO> MemberListsearch(HashMap<String, String> param);

	int delete(String id);

	ArrayList<HashMap<String, Object>> list(int offset);

	int totalCount();

	int totalCount2(HashMap<String, String> param);

	

	/* AdminDTO Memberdetail(HashMap<String, String> mem_id); */

}
