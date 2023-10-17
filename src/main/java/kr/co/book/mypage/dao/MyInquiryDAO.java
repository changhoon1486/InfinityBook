package kr.co.book.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.admin.dto.AdminInquiryDTO;
import kr.co.book.mypage.dto.MyInquriyDTO;

@Mapper
public interface MyInquiryDAO {

	void inquirywrite(HashMap<String, Object> params);
	
	MyInquriyDTO myinquirydetail(String inquiry_idx);

	int totalmyinqCount(String member_idx);

	int totalmyinqokCount(String member_idx, Object inqstate);

	int totalmyinqCountfilter(String string, String categoryCode);

	int totalmyinqCountAll(String string, Object inqstate, String categoryCode);

	ArrayList<MyInquriyDTO> myinquiryList(int offset, String member_idx);

	ArrayList<MyInquriyDTO> myinquiryOkList(int offset, String string, Object inqstate);

	ArrayList<MyInquriyDTO> myinquiryListFilter(int offset, String string, String categoryCode);

	ArrayList<MyInquriyDTO> myinquiryListAll(int offset, String string, Object inqstate, String categoryCode);

	ArrayList<MyInquriyDTO> myinquiryreplylist(String reply_idx);

	MyInquriyDTO myinquiryreplydetail(String inquiry_idx);

	
	


}
