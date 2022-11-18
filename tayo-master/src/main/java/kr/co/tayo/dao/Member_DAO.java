package kr.co.tayo.dao;

public interface Member_DAO {
	
	String login(String id, String pw);

	int join(String id, String pw, String pnum, String email, String add, String detailAdd, String name, String age);

	String idCheck(String id);

	String findId(String name, String email, String pnum);

	int update(String id, String pw);

	int eventPage(String loginId, String marry, String children, String mbti, String familly);

	String mbti(String loginId);

	int join1(String id);

	String login1(String id, String pw);

}
