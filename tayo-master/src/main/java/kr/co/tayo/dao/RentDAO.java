package kr.co.tayo.dao;

import java.util.ArrayList;

import kr.co.tayo.dto.RentDTO;


public interface RentDAO {

	int totalCount();



	int delete(String id);

	ArrayList<RentDTO> Rentlist(int offset);

}
