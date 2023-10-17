package kr.co.book.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface AdminReportDAO {

	int reportSend(HashMap<String, Object> params);

	ArrayList<HashMap<String, Object>> reportList(HashMap<String, Object> params);

	HashMap<String, Object> getReportInfor(HashMap<String, Object> params);

	ArrayList<HashMap<String, Object>> reportRecordList(HashMap<String, Object> params);

	int blind(HashMap<String, Object> params);

	void blindAlarm(HashMap<String, Object> params);

	int updateMemberState(HashMap<String, Object> params);

	int reportHandlingRecord(HashMap<String, Object> params);

	int reportHandlingCompleted(HashMap<String, Object> params);

}
