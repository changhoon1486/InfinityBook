package kr.co.book.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface ActivitiesDAO {


	ArrayList<HashMap<String, Object>> changeList(HashMap<String, Object> params);

	ArrayList<HashMap<String, Object>> changeListSearch(HashMap<String, Object> params);

	ArrayList<HashMap<String, Object>> rentList(HashMap<String, Object> params);

	ArrayList<HashMap<String, Object>> rentListSearch(HashMap<String, Object> params);


}
