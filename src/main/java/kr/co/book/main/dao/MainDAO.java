package kr.co.book.main.dao;

import java.util.ArrayList;

import kr.co.book.main.dto.MainDTO;

// @Mapper
public interface MainDAO {

	ArrayList<MainDTO> popularReport();

	ArrayList<MainDTO> popularLibrary();

}
