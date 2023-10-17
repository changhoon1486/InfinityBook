package kr.co.book.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.book.admin.dto.AdminBookDTO;

public interface AdminBookReportDAO {

	int totalAdminBookReport();

	ArrayList<AdminBookDTO> adminBookReportList(int offset);

	int totalAdminBookReportSearch(HashMap<String, Object> data);

	ArrayList<AdminBookDTO> adminBookReportListSearch(HashMap<String, Object> data);

	void bookReportBlind(String blind, String book_report_idx);

}
