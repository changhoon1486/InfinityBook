package kr.co.book.mypage.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.mypage.dto.LibraryDTO;

@Mapper
public interface LibraryDAO {
	/*
	 * library_idx,member_idx,library_isbn,library_title,library_cover,
	 * library_author,
	 * library_price,library_publisher,library_description,library_pubdate,
	 * library_info, library_use,library_sharestate,library_blind,library_reg_date
	 */
	
	ArrayList<LibraryDTO> list();

	void write(HashMap<String, Object> bookData);

	int bookChk(String library_isbn, int member_idx);
	
	int wishChk(String library_isbn, int member_idx);

	LibraryDTO detail(String library_idx);

	void libraryDelete(String library_idx);
	
	void libraryWishDelete(String library_isbn, int member_idx);
	
	void libraryUpdate(HashMap<String, String> updateData);

	int totalLibraryList(int member_idx, String type);
	
	ArrayList<LibraryDTO> libraryList(int member_idx,int offset, String type);
	
	int totalLibrarySearchList(HashMap<String, Object> data);
	
	ArrayList<LibraryDTO> librarySearchList(HashMap<String, Object> data);
		
	void wishRegist(HashMap<String, Object> bookInfo);

	int deleteLibrary(String library_idx,int member_idx);

	ArrayList<HashMap<String, String>> reviewList(String library_idx);

	ArrayList<LibraryDTO> findWishList(Object library_isbn);

	void wishAarm(int member_idx, String content, String library_isbn);

	

	

}
