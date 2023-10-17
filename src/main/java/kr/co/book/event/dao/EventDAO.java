package kr.co.book.event.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.book.event.dto.EventDTO;

public interface EventDAO {
	
		String eventWrite(HashMap<String, String> params);

		int eventWrite(EventDTO dto);
		
		void event_FileSave(int i, int event_no, String ori_photo_name, String new_photo_name, String member_idx, int j);

		int event_No_Search(EventDTO dto);

		int totalEventCount();

		ArrayList<EventDTO> eventList(int offset);
	 

	

}
