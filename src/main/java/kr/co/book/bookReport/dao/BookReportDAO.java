package kr.co.book.bookReport.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.bookReport.dto.BookReportDTO;

@Mapper
public interface BookReportDAO {

	int bookInfoChk(String isbn);

	int saveBook(BookReportDTO dto);

	int bookReportWrite(HashMap<String, Object> params);

	BookReportDTO reportDetail(String book_report_idx);

	HashMap<String, Object> getBookInfo(String isbn);

	ArrayList<BookReportDTO> bookReportList();

	Object getLike(String book_report_idx);

	void likeCheck(HashMap<String, Object> map);

	Object myLike(String book_report_idx, String member_idx);

	int bookTotalReplyList(String book_report_idx);

	ArrayList<BookReportDTO> bookReplyList(String book_report_idx, int offset);

	void bookReplyWrite(String member_idx, String reply_content, String book_report_idx);

	void bookReplyDelete(String reply_idx);

	void bookReplyUpdate(String reply_idx, String reply_content);

	void bookReReply(String member_idx, String reply_idx, String reply_content);

	ArrayList<BookReportDTO> bookReReplyList(String reply_idx);


	String bookReplyMember(String reply_idx);
	
	void bookReReplyAlarm(String member_idx, String idx, String content);

	String bookTitle(String book_report_idx);

	void hit(String book_report_idx);

	Object getName(String book_report_idx);
}
