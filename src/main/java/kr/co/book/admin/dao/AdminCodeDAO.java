package kr.co.book.admin.dao;

import java.util.ArrayList;

import kr.co.book.admin.dto.AdminBookDTO;
import kr.co.book.admin.dto.AdminCodeDTO;

public interface AdminCodeDAO {

	ArrayList<AdminCodeDTO> upCodeList();

	ArrayList<AdminBookDTO> adminCodeList(String code_upcode);

	String findUpcode(String code_idx);

	void upcodeUpdate(String oriUpcode, String code_upcode);

	void codeUpdate(String oriUpcode, String code_upcode);

	void codenameUpdate(String code_idx, String codename);

}
