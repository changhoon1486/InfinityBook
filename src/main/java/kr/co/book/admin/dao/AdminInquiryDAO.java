package kr.co.book.admin.dao;


import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.admin.dto.AdminInquiryDTO;
import kr.co.book.mypage.dto.MyInquriyDTO;


public interface AdminInquiryDAO {

	AdminInquiryDTO inquirydetail(String inquiry_idx);

	void inquiryreplywrite(HashMap<String, Object> params);

	void inquirystateupdate(HashMap<String, Object> params);

	int totalinqCount();

	ArrayList<MyInquriyDTO> inquiryList(int offset);

	int totalinqokCount(Object inqstate);

	ArrayList<MyInquriyDTO> inquiryOkList(int offset, Object inqstate);

	int totalinqCountfilter(String categoryCode);

	ArrayList<MyInquriyDTO> inquiryListFilter(int offset, String categoryCode);

	int totalinqCountAll(Object inqstate, String categoryCode);

	ArrayList<MyInquriyDTO> inquiryListAll(int offset, Object inqstate, String categoryCode);

	int totalinqSearchCount(String searchText);

	ArrayList<MyInquriyDTO> inquirySearchList(int offset, String searchText);

	int totalinqokSearchCount(Object inqstate, String searchText);

	ArrayList<MyInquriyDTO> inquiryOkSearchList(int offset, Object inqstate, String searchText);

	int totalinqSearchCountfilter(String categoryCode, String searchText);

	ArrayList<MyInquriyDTO> inquirySearchListFilter(int offset, String categoryCode, String searchText);

	int totalinqSearchCountAll(Object inqstate, String categoryCode, String searchText);

	ArrayList<MyInquriyDTO> inquirySearchListAll(int offset, Object inqstate, String categoryCode, String searchText);

	void inquiryalarm(HashMap<String, Object> params);

}
