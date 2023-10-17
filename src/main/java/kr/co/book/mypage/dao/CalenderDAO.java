package kr.co.book.mypage.dao;

import java.util.ArrayList;

import kr.co.book.mypage.dto.CalenderDTO;

public interface CalenderDAO {

	ArrayList<CalenderDTO> rentEvents(int loginIdx);

	ArrayList<CalenderDTO> borrowEvents(int loginIdx);

	ArrayList<CalenderDTO> changeEvents(int loginIdx);

	ArrayList<CalenderDTO> clubEvents(int loginIdx);

}
