package kr.co.book.notice.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.notice.dto.NoticeDTO;

@Mapper
public interface NoticeDAO {

	int totalnoticeCount();

	ArrayList<NoticeDTO> noticeList(int offset);

	void noticeuphit(String notice_idx);

	NoticeDTO noticedetail(String notice_idx);
	
}
