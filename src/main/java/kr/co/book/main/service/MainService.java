package kr.co.book.main.service;

import java.util.ArrayList;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.book.main.dao.MainDAO;
import kr.co.book.main.dto.MainDTO;

@Service
@MapperScan(value = {"kr.co.book.main.dao"}) 
public class MainService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired MainDAO mainDAO;
	
	
	public ArrayList<MainDTO> popularReport() {
		return mainDAO.popularReport();
	}


	public ArrayList<MainDTO> popularLibrary() {
		return mainDAO.popularLibrary();
	}

}
