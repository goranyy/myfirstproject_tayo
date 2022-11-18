package kr.co.tayo.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.tayo.dao.AdminCarDAO;
import kr.co.tayo.dto.CarDTO;
import kr.co.tayo.dto.CarPopulListDTO;
import kr.co.tayo.dto.FileDTO;
import kr.co.tayo.dto.hashFileDTO;
import kr.co.tayo.dto.mainListDTO;
import kr.co.tayo.dto.rentCarDTO;
import kr.co.tayo.dto.TripDTO;

@Service
public class AdminCarService {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminCarDAO cardao;
	
	// 리스트 호출 : 페이징
	public HashMap<String, Object> carList(int page) {
		logger.info("리스트 호출 서비스");
		
		int offset = (page-1)*10;
		
		// 총 페이지 수 = 게시물 총 갯수(=totalCount)/페이지당 보여줄 수
		int totalCount= cardao.totalCount();	// bbs에 저장된 데이터 갯수
		logger.info("totalCount : "+totalCount);
		
		// 이 경우 나머지가 생기면 page+1
		int totalPages = totalCount%10 > 0 ? (totalCount/10)+1 : (totalCount/10);
		logger.info("총 페이지 수 : " + totalPages);
		
		// 두 개의 값을 반환하기 위해 map 이용
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("total", totalPages);
		result.put("list", cardao.carList(offset));
		
		return result;
	}

	
	// 차량 등록하기
	public String carPut(MultipartFile uploadFile, HashMap<String, String> params) {
		logger.info("차량 등록 서비스");
		
		CarDTO carDto = new CarDTO();
		carDto.setCa_name(params.get("ca_name"));
		carDto.setCa_name(params.get("ca_name"));
		carDto.setCa_model(params.get("ca_model"));
		carDto.setCa_brand(params.get("ca_brand"));
		carDto.setCa_price(params.get("ca_price"));
		carDto.setCa_fuel(params.get("ca_fuel"));
		carDto.setCa_age(params.get("ca_age"));
		
		int success = cardao.carPut(carDto);
		int ca_num = carDto.getCa_num();
		logger.info("put success:{}", ca_num);
		logger.info("success:"+success);
		logger.info("uploadFile:"+uploadFile);
		// 성공 후, 업로드할 파일이 존재할때
		logger.info("photo"+uploadFile.getOriginalFilename());
		
		if(success > 0 && !uploadFile.getOriginalFilename().equals("")) {
			logger.info("success: "+success);
			// fileUpload() 실행
			fileUpload(uploadFile, ca_num);
		}
		
		return "redirect:/carDetail?ca_num="+ca_num;
	}
	
	
	
	// 차량등록: 파일 업로드 메서드
	private void fileUpload(MultipartFile uploadFile, int ca_num) {
		logger.info("사진 업로드 서비스!");

		String oriFileName = uploadFile.getOriginalFilename();
		logger.info("oriFileName :{}", oriFileName);
		
		String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
		String newFileName = System.currentTimeMillis() + ext;

		
		try {
			byte[] bytes = uploadFile.getBytes();
			Path path = Paths.get("C:/upload/"+newFileName);
			Files.write(path, bytes);
			logger.info(newFileName+"업로드 성공!");
			
			cardao.carFilePut(ca_num, oriFileName, newFileName);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	// 차량 상세보기
	public void carDetail(String ca_num, Model model) {
		logger.info("상세보기 서비스 ca_num : "+ca_num);
		CarDTO carDto = cardao.carDetail(ca_num);
		model.addAttribute("car", carDto);
		
		// 사진
		ArrayList<FileDTO> fileList = cardao.fileList(ca_num);
		logger.info("fileList: "+fileList);
		model.addAttribute("fileList", fileList);
	}

	// 수정 요청
	public String update(MultipartFile uploadFile, HashMap<String, String> params) {
		logger.info("수정 요청 서비스");
		
		int success = cardao.update(params);
		String ca_num = params.get("ca_num");
		logger.info("ca_num:{}"+ca_num);
		logger.info("success:{}"+success);
		
		
		if(success > 0 && !uploadFile.getOriginalFilename().equals("")) {
			fileUpload(uploadFile, Integer.parseInt(ca_num));
			logger.info("ca_num... 사진 업로드.. : "+ca_num);
		}
		
		
		return "redirect:/carDetail?ca_num="+ca_num;
	}


	// 등록 게시물 삭제
	public void delete(String no) {	// no = 번호
		logger.info(no);
		cardao.delete(no);
	}

	
	// 리스트 _검색
    public ArrayList<CarDTO> search(@RequestParam String ca_name){ 
        logger.info("search 서비스 요청..DB필요해서 DAO 호출");
     
        logger.info("param:"+ ca_name);
     
        CarDTO dto= new CarDTO();
          
        return cardao.search(ca_name); 
    }


    //-------------------------------------------------------------------------
    //사용자
    //-------------------------------------------------------------------------
	// 리스트 호출
	/*
	 * public HashMap<String, Object> list() { logger.info("list service..");
	 * 
	 * // 차량정보 List<CarDTO> carDto = cardao.carlist(); HashMap<String, Object> map =
	 * new HashMap<String, Object>(); map.put("car", carDto);
	 * 
	 * // 사진 ArrayList<FileDTO> fileList = cardao.file(); map.put("fileList",
	 * fileList); return map; }
	 */
	// 차량 목록
	public HashMap<String, Object> list() {
			
		ArrayList<CarPopulListDTO> carPopulList = cardao.carList();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("carPopulList", carPopulList);
		logger.info("map:{}",map);
			
		return map;
	}
	
		
	// 간편보기
	public HashMap<String, Object> Carsql(String ca_num) {
		logger.info("Carsql 서비스..");
		
		// 차량정보
		CarDTO carDto = cardao.carDetail(ca_num);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("car", carDto);
		
		// 해당 ca_num의 photo 데이터 추출 _ 첫번쩨 사진만 보내기
		ArrayList<FileDTO> fileList = cardao.fileList(ca_num);
		// 하나만 전달
		 if(fileList.size() > 0) { 
			 fileList.get(0); 
			 map.put("fileList", fileList.get(0)); 
		 }
		
		return map;
	}

	// 해당아이디 찜여부 판단
	public int jjimChk_loginId(HashMap<String, Object> map) {
		
		return cardao.jjimChk_loginId(map);
	}
	
	/*
	// 찜여부 판단 
	public int jjimChk(String ca_num) { return cardao.jjimChk(ca_num);  }
	 */

	
	//	찜하기
	public int jjimSet(HashMap<String, Object> map) {
		logger.info("찜하기 서비스 요청");
		logger.info("map:{}", map);
		//만약 해당 아이디로 해당 ca_num의 
		return cardao.jjimSet(map);
	}
	
	//	찜 삭제	
	public int jjimDel(String ca_num) {
		return cardao.jjimDel(ca_num);
	}

	//	간편 > 상세보기 이동 요청
	public void carDetailCall(String ca_num, Model model) {
		// 로그인 되어있어야 service 실행
		
		// 차량정보
		CarDTO carDto = cardao.carDetail(ca_num);
		model.addAttribute("car", carDto);
				
		// 사진
		ArrayList<FileDTO> fileList = cardao.fileList(ca_num);
		logger.info("fileList: "+fileList);
		model.addAttribute("fileList", fileList);	
		
		// 데이터 호출 성골 -> 조회수 
		if(carDto != null && fileList != null) {
			cardao.upHit(ca_num);
		}
	}

	// 마이페이지 > 찜목록
	public HashMap<String, Object> myPage_jjim(String mem_id) {
		// 차량정보
		List<CarDTO> jjimList = cardao.myPage_jjim(mem_id);	
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("jjimList", jjimList);
		logger.info("jjimList :{} ", jjimList);
		
		// 사진
		ArrayList<FileDTO> fileList = cardao.jjimFile(mem_id);
		logger.info("fileList: "+fileList);
		map.put("fileList", fileList);	
		
		return map;
	}

	// 인기차 목록
	public HashMap<String, Object> carPopulList() {
		/*
		// 차량정보
		List<CarDTO> jjimList = cardao.carPopulList();	
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("jjimList", jjimList);
		logger.info("jjimList :{} ", jjimList);
				
		// 사진
		ArrayList<FileDTO> fileList = cardao.carPopulFile();
		logger.info("fileList: "+fileList);
		map.put("fileList", fileList);	
		*/
		
		ArrayList<CarPopulListDTO> carPopulList = cardao.carPopulList();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("carPopulList", carPopulList);
		logger.info("map:{}",map);
		
		return map;
	}

	// 인기차량/해시태그
	public HashMap<String, Object> mainListCall() {
		// 인기차
		ArrayList<CarPopulListDTO> carPopulList = cardao.carPopulList();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("carPopulList", carPopulList);
		logger.info("map:{}",map);
		
		ArrayList<mainListDTO> mainListCall = cardao.mainListCall();
		map.put("mainListCall", mainListCall);
		logger.info("map:{}",map);
		
		return map;
	}

	// 해시태그 차 목록
	public HashMap<String, Object> hashCarList(String ha_value) {	
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<hashFileDTO> hashFile = cardao.hashFile(ha_value);
		map.put("hashFile", hashFile);
		logger.info("hashFile:{}",hashFile);
				
		List<CarDTO> hashCarList = cardao.hashCarList(ha_value);	
		map.put("hashCarList", hashCarList);
		logger.info("hashCarList:{}",hashCarList);
		
		return map;
	}
	
	// 간편보기 > 여행지 이미지
	/*
	 * public HashMap<String, Object> tripImg(String[] tr_num) {
	 * //logger.info("random:{}", random); HashMap<String, Object> map = new
	 * HashMap<String, Object>(); ArrayList<tripDTO> tripImg = new
	 * ArrayList<tripDTO> ();
	 * 
	 * tripImg = cardao.tripImg(tr_num); map.put("tripImg", tripImg);
	 * logger.info("map:{}",map);
	 * 
	 * return map; }
	 */

	// 여행지 이미지 넣기
	public String tripImgPut(MultipartFile files, String tr_num) {
		logger.info("여행지 이미지 서비스");
		
		String oriFileName = files.getOriginalFilename();
		logger.info("oriFileName :{}", oriFileName);
		
		String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
		String newFileName = System.currentTimeMillis() + ext;

		
		try {
			byte[] bytes = files.getBytes();
			Path path = Paths.get("C:/upload/"+newFileName);
			Files.write(path, bytes);
			logger.info(newFileName+"업로드 성공!");
			
			cardao.tripImgPut(tr_num, oriFileName, newFileName);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	// 여행지 이미지 띄우기
	public HashMap<String, Object> tripInfo() {
		logger.info("여행지 파일 요청..");
		
		ArrayList<TripDTO> tripInfo = cardao.tripInfo();
		logger.info("tripInfo :{}", tripInfo);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("tripInfo", tripInfo);
		logger.info("map:{}", map);
		
		return map;
	}

	// 렌트카 
	public HashMap<String, Object> rentCar() {
		
		ArrayList<rentCarDTO> rentCar = cardao.rentCar();
		HashMap<String, Object> map = new HashMap<>();
		map.put("rentCar", rentCar);
		
		return map;
	}
	




	
	

}
