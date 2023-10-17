package kr.co.book.admin.dao;

import java.util.ArrayList;

import kr.co.book.admin.dto.AdminDepositDTO;

public interface AdminDepositDAO {

	int totalAdminDeposit(String deposit_type);

	ArrayList<AdminDepositDTO> adminDepositList(int offset,String deposit_type);

}
