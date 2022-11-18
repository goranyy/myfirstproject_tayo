package kr.co.tayo.dao;

import java.util.ArrayList;

import kr.co.tayo.dto.TripDTO;

public interface TripDAO {

	int totalCount();



	int delete(String id);

	ArrayList<TripDTO> Tirplist(int offset);




}
