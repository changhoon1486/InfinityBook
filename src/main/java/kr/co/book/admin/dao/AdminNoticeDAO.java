package kr.co.book.admin.dao;

import java.util.HashMap;

public interface AdminNoticeDAO {

	// 공지 작성
	void noticewrite(HashMap<String, Object> params);

	// 공지 수정
	void noticeupdate(HashMap<String, Object> params);

	// 공지 블라인드
	void noticedel(String notice_idx);

}
