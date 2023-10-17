package kr.co.book.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.book.mypage.dao.LibraryDAO;
import kr.co.book.mypage.dto.LibraryDTO;

@Service
public class LibraryService {
	
	
	 @Autowired LibraryDAO libraryDAO;
	 
	 Logger logger = LoggerFactory.getLogger(getClass());
	 
	 public ArrayList<LibraryDTO> list() { 
		 return libraryDAO.list(); 
	}
	
	public HashMap<String, Object> libraryList(int member_idx,String sPage, String type, String searchText) {
		HashMap<String, Object> books = new HashMap<String, Object>();	
		ArrayList<LibraryDTO> list = null;
		int page = Integer.parseInt(String.valueOf(sPage)); 
		int offset = 9*(page-1);
		int total = 0;
		
		if(searchText.equals("")) {
			total = libraryDAO.totalLibraryList(member_idx,type);
			list = libraryDAO.libraryList(member_idx,offset,type);
		}else {
			HashMap<String, Object> data = new HashMap<String, Object>();
			data.put("member_idx", member_idx);
			data.put("offset", offset);
			data.put("type", type);
			data.put("searchText", searchText);
			logger.info("data"+data);
			total = libraryDAO.totalLibrarySearchList(data);
			list = libraryDAO.librarySearchList(data);
		}
		
		int range = total%9  == 0 ? total/9 : total/9+1;
		page = page>range ? range:page;
		books.put("offset", offset);
		books.put("list", list);
		books.put("currPage", page);
		books.put("pages", range);
		
		return books;
	}
	
	public void write(HashMap<String, Object> bookData) {
		libraryDAO.write(bookData);		
	}


	public int bookChk(String library_isbn, int member_idx) {
		
		return libraryDAO.bookChk(library_isbn,member_idx);
	}
	
	public int wishChk( String library_isbn, int member_idx) {
		return libraryDAO.wishChk(library_isbn,member_idx);
	}
	
	public void wishRegist(HashMap<String, Object> bookInfo) {
		libraryDAO.wishRegist(bookInfo);
	}

	public LibraryDTO detail(String library_idx) {
		return libraryDAO.detail(library_idx);
	}

	public void libraryDelete(String library_idx) {
		libraryDAO.libraryDelete(library_idx);
	}

	public void update(HashMap<String, String> updateData) {
		libraryDAO.libraryUpdate(updateData);
	}

	public void libraryWishDelete(String library_isbn, int member_idx) {
		libraryDAO.libraryWishDelete(library_isbn,member_idx);
		
	}

	public HashMap<String, Object> deleteLibrary(ArrayList<String> delList,int member_idx) {
		HashMap<String, Object> map = new HashMap<String, Object>();		
		int successCnt = 0;
		for (String library_idx : delList) {
			successCnt += libraryDAO.deleteLibrary(library_idx,member_idx);
		}		
		map.put("msg", successCnt+" 개 삭제 되었습니다.");		
		map.put("success", true);
		return map;
		
	}

	public ArrayList<HashMap<String, String>> reviewList(String library_idx) {
		return libraryDAO.reviewList(library_idx);
	}

	public ArrayList<LibraryDTO> findWishList(Object library_isbn) {
		return libraryDAO.findWishList(library_isbn);
	}

	public void wishAarm(int member_idx, String library_title, String library_isbn) {
		String content = "["+library_title+"] 대여/교환 가능 도서로 등록되었습니다.";
		libraryDAO.wishAarm(member_idx,content,library_isbn);
	}

	



	

	

	

	
	
	 
}
