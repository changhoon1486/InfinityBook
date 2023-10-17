package kr.co.book.alarm.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.book.alarm.dto.AlarmDTO;

@Mapper
public interface AlarmDAO {

	ArrayList<AlarmDTO> alarmList(String member_idx);

	void alarmCheck(String member_idx);

	int alarmchk(String member_idx);

	long alarmdel_all(String member_idx);

	int alarmdel(String alarm_idx);

}
