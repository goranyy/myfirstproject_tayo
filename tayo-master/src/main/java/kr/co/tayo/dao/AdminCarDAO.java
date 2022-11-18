package kr.co.tayo.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import kr.co.tayo.dto.CarDTO;
import kr.co.tayo.dto.CarPopulListDTO;
import kr.co.tayo.dto.FileDTO;
import kr.co.tayo.dto.hashFileDTO;
import kr.co.tayo.dto.mainListDTO;
import kr.co.tayo.dto.rentCarDTO;
import kr.co.tayo.dto.TripDTO;

public interface AdminCarDAO {
	//------------------------------------------
	// 관리자
	//------------------------------------------
	// 리스트 호출
	//ArrayList<CarDTO> list();
	// 리스트
	ArrayList<HashMap<String, Object>> carList(int offset);

	// 차량 정보 등록
	int carPut(CarDTO carDto);
	
	// 차량 사진 등록
	void carFilePut(int ca_num, String oriFileName, String newFileName);

	// 상세보기_글
	CarDTO carDetail(String ca_num);
	// 상세보기_사진
	ArrayList<FileDTO> fileList(String ca_num);

	// 수정 요청
	int update(HashMap<String, String> params);
	
	// 전체 데이터
	int totalCount();

	// 등록게시물 삭제
	void delete(String no);

	// 리스트 _검색
	ArrayList<CarDTO> search(String ca_name);

	
	//------------------------------------------
	// 사용자
	//------------------------------------------
	// 리스트 호출
	//List<CarDTO> carlist();
	//ArrayList<FileDTO> carfileList();
	//ArrayList<FileDTO> file();

	// 차량 목록
	ArrayList<CarPopulListDTO> carList();
	
	// 사진 호출
	ArrayList<FileDTO> imgList(String ca_num);
	
	// 찜한 ca_num 인지 확인
	//int jjimChk(String ca_num);
	
	// 해당아이디 찜여부 판단
	int jjimChk_loginId(HashMap<String, Object> map);

	// 찜 목록 추가 
	//int jjimSet(String ca_num, String loginId);
	int jjimSet(HashMap<String, Object> map);
	
	// 찜 목록 삭제
	int jjimDel(String ca_num);

	// 상세보기 성공 > 조회수 증가
	void upHit(String ca_num);

	// 마이페이지 > 찜목록
	List<CarDTO> myPage_jjim(String mem_id);
	
	// 마이페이지 > 찜목록 사진
	ArrayList<FileDTO> jjimFile(String mem_id);

	// 인기차 목록
	ArrayList<CarPopulListDTO> carPopulList();	

	// 메인 해시태그, 차량 정보
	ArrayList<mainListDTO> mainListCall();

	// 해시태그 > 파일목록
	ArrayList<hashFileDTO> hashFile(String ha_value);
	
	// 해시태그 > 차목록
	List<CarDTO> hashCarList(String ha_value);

	// 여행지 이미지 등록 :x
	void tripImgPut(String tr_num, String oriFileName, String newFileName);

	// 여행지 이미지
	//ArrayList<tripDTO> tripImg(String[] tr_num);

	// 여행지 이미지 띄우기
	ArrayList<TripDTO> tripInfo();

	// 렌트카 정보
	ArrayList<rentCarDTO> rentCar();

	


	

}
