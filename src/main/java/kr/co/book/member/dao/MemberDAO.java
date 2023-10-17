package kr.co.book.member.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.book.member.dto.MemberDTO;

public interface MemberDAO {

	MemberDTO login(String member_email);

	int join(HashMap<String, String> params);

	int emailOverCheck(String member_email);

	Object overlaynickname(String member_nickname);

	int findLocationCode(String location);

	int findmemberpw(String member_email, String member_nickname);

	void RandomPassword(String member_email, String member_nickname, String encodedPassword);

	HashMap<String, Object> getMemberInfo(int loginIdx);

	int memberInfoUpdate(HashMap<String, Object> params);

	String getPw(int loginIdx);

	int pwUpdate(String encodedPassword, int loginIdx);

	int leave(int loginIdx);

	HashMap<String, Object> getProfileInfo(int member_idx);

	String getRegion(int code_idx);

	ArrayList<HashMap<String, Object>> reviewList(HashMap<String, Object> params);


}
