package kr.co.book.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.mypage.dto.TrackerDTO;

public interface TrackerDAO {

	int bookInfoChk(String isbn);

	int saveBook(TrackerDTO dto);

	int saveTracker(HashMap<String, Object> params);

	int getTotalPage(String isbn);

	ArrayList<HashMap<String, Object>> getTrackerList(int loginIdx);

	HashMap<String, Object> trackerDetail(String trackerIdx);

	int trackerUpdateBook(HashMap<String, Object> params);

	void saveEndDate(int loginIdx, String isbn);

	int trackerDeleteBook(String isbn, int loginIdx);

	int trackerAddMemo(HashMap<String, Object> params);

	List<HashMap<String, Object>> getMemoList(String trackerIdx);

	int memoDelete(HashMap<String, Object> params);

	String getContent(HashMap<String, Object> params);

	int memoUpdate(HashMap<String, Object> params);

}
