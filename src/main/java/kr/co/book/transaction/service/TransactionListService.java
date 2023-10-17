package kr.co.book.transaction.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.util.DefaultUriBuilderFactory;
import org.springframework.web.util.DefaultUriBuilderFactory.EncodingMode;

import kr.co.book.transaction.dao.TransactionListDAO;
import kr.co.book.transaction.dto.TransactionListDTO;
import reactor.core.publisher.Mono;

@Service
@MapperScan(value= {"kr.co.book.transaction.dao"})
public class TransactionListService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired TransactionListDAO dao;

	public Map<String, Object> bookSearch(String Query, String QueryType) {
		
		String url = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx";
		
		String ttbkey = "ttbtyhn00000921001";
		String MaxResults = "100";
		String Start = "1";
		String Cover = "Big";
		String SearchTarget = "Book";
		String output = "JS";
		String Version = "20131101";
		
		DefaultUriBuilderFactory fac = new DefaultUriBuilderFactory(url);
		fac.setEncodingMode(EncodingMode.VALUES_ONLY);
		
		WebClient client = WebClient.builder().uriBuilderFactory(fac).baseUrl(url).build();
		
		Mono<HashMap> mono = client.get()
				.uri("?ttbkey="+ttbkey+"&MaxResults="+MaxResults+"&Query="+Query+"&QueryType="
		+QueryType+"&Start="+Start+"&Cover="+Cover+"&SearchTarget="+SearchTarget+"&output="+output
		+"&Version="+Version)
				.retrieve().bodyToMono(HashMap.class);
		
		Map<String, Object> resp = mono.flux().toStream().findFirst().get();
		logger.info("resp : "+resp);
		
		
		return resp;
	}


	public ArrayList<TransactionListDTO> searchUserChange(String isbn, String member_idx) {

		ArrayList<TransactionListDTO> change = dao.searchUserChange(isbn,member_idx);
		
		return change;
	}
	
	public ArrayList<TransactionListDTO> searchUserRent(String isbn, String member_idx) {

		ArrayList<TransactionListDTO> rent = dao.searchUserRent(isbn,member_idx);
		
		return rent;
	}


	public TransactionListDTO searchDetail(String library_idx) {
		
		return dao.searchDetail(library_idx);
	}



	public  ArrayList<TransactionListDTO> change(String member_idx) {
		 ArrayList<TransactionListDTO> list =  dao.changeMyBook(member_idx);
		return list;
	}


	public String deposit(String member_idx) {
		
		String deposit = dao.deposit(member_idx);
		
		return deposit;
	}


	public String getUserNickname(String member_idx) {
		
		return dao.getUserNickname(member_idx);
	}


	public void reviewWrite(HashMap<String, Object> params) {
		dao.reviewWrite(params);
		
		
	}


	public ArrayList<TransactionListDTO> searchReview(String library_idx) {
		
		return dao.searchReview(library_idx);
	}

}
