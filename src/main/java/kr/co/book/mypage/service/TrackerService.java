package kr.co.book.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.DefaultUriBuilderFactory;
import org.springframework.web.util.DefaultUriBuilderFactory.EncodingMode;

import kr.co.book.mypage.dao.TrackerDAO;
import kr.co.book.mypage.dto.TrackerDTO;
import reactor.core.publisher.Mono;

@Service
@MapperScan(value = {"kr.co.book.mypage.dao"}) 
public class TrackerService {
	
	@Autowired TrackerDAO TrackerDAO;

	Logger logger = LoggerFactory.getLogger(getClass());
	
	private static final String KEY = "ttbxmfhxmtm0939001";
   
	//트래커에 저장할 책 검색 
    public ModelAndView trackerBookSearch(String searchType, String searchValue) {
    	
    	String uri = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx";
    	
    	ModelAndView mav = new ModelAndView("/tracker/trackerSearch");
    	String replaceValue = searchValue.replaceAll("\\s", "");
    	logger.info("replaceValue : "+replaceValue);
    	logger.info("searchType : {} / searchValue : {}",searchType,replaceValue);
    	
    	if(replaceValue == "") {
    		mav.addObject("search",false);
    	}else {    		
    		String MaxResults = "100";
    		String Start = "1";
    		String Cover = "Big";
    		String SearchTarget = "Book";
    		String output = "JS";
    		String Version = "20131101";
    		
    		DefaultUriBuilderFactory fac = new DefaultUriBuilderFactory(uri);
    		fac.setEncodingMode(EncodingMode.VALUES_ONLY);
    		
    		WebClient client = WebClient.builder().uriBuilderFactory(fac).baseUrl(uri).build();
    		
    		Mono<HashMap> mono = client.get()
    				.uri("?ttbkey="+KEY+"&Start="+Start+"&MaxResults="+MaxResults+"&QueryType="+searchType+"&Query="+replaceValue+
    						"&Cover="+Cover+"&SearchTarget="+SearchTarget+"&output="+output+"&Version="+Version)
    				.retrieve().bodyToMono(HashMap.class);
    		
    		Map<String, Object> resp = mono.flux().toStream().findFirst().get();
    		logger.info("resp : "+resp.size());
    		
    		mav.addObject("list", resp);
    		}    		
		return mav;
	}
    
  //트래커에 저장할 책 검색 
    public ModelAndView clubBookSearch(String searchType, String searchValue) {
    	
    	String uri = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx";
    	
    	ModelAndView mav = new ModelAndView("/club/clubBookPop");
    	String replaceValue = searchValue.replaceAll("\\s", "");
    	logger.info("replaceValue : "+replaceValue);
    	logger.info("searchType : {} / searchValue : {}",searchType,replaceValue);
    	
    	if(replaceValue == "") {
    		mav.addObject("search",false);
    	}else {    		
    		String MaxResults = "100";
    		String Start = "1";
    		String Cover = "Big";
    		String SearchTarget = "Book";
    		String output = "JS";
    		String Version = "20131101";
    		
    		DefaultUriBuilderFactory fac = new DefaultUriBuilderFactory(uri);
    		fac.setEncodingMode(EncodingMode.VALUES_ONLY);
    		
    		WebClient client = WebClient.builder().uriBuilderFactory(fac).baseUrl(uri).build();
    		
    		Mono<HashMap> mono = client.get()
    				.uri("?ttbkey="+KEY+"&Start="+Start+"&MaxResults="+MaxResults+"&QueryType="+searchType+"&Query="+replaceValue+
    						"&Cover="+Cover+"&SearchTarget="+SearchTarget+"&output="+output+"&Version="+Version)
    				.retrieve().bodyToMono(HashMap.class);
    		
    		Map<String, Object> resp = mono.flux().toStream().findFirst().get();
    		logger.info("resp : "+resp.size());
    		
    		mav.addObject("list", resp);
    		}    		
		return mav;
	}

    //트래커에 책 추가
	public boolean trackerAddBook(HashMap<String, Object> params) {
		logger.info("params : {}",params);
		boolean success = false;
		
		String isbn = (String) params.get("isbn");
		
		//BOOK 테이블에 책 정보가 있는지 확인
		int count = TrackerDAO.bookInfoChk(isbn);
		logger.info("count : "+count);
		
		//책 정보가 저장되어 있을 경우
		if(count > 0) {
			if(saveTracker(params) == 1) {
				success = true;
			}
		}else { //책 정보가 없을 경우
			//api로 책정보 검색해서 가져와서 book에 저장 후 트래커에 저장
			int row = saveBookInfo(params);
			
			if(row == 1) {
				if(saveTracker(params) == 1) {
					logger.info("saveTracker : "+row);
					success = true;
				}   
			}
    					
		}		
		return success;
	}
	
	//책 정보 저장
	public int saveBookInfo(HashMap<String, Object> params) {
		int row = 0;
		
		String uri = "http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx";			
		String output = "JS";
		String Version = "20131101";
		
		DefaultUriBuilderFactory fac = new DefaultUriBuilderFactory(uri);
		fac.setEncodingMode(EncodingMode.VALUES_ONLY);
		
		WebClient client = WebClient.builder().uriBuilderFactory(fac).baseUrl(uri).build();

		Mono<HashMap> mono = client.get()
				.uri("?ttbkey="+KEY+"&itemIdType="+"ISBN"+"&ItemId="+params.get("isbn")+"&output="+output+"&Version="+Version)
				.retrieve().bodyToMono(HashMap.class);
		
		//받아온 응답
		Map<String, Object> resp = mono.flux().toStream().findFirst().get();
		logger.info("resp : "+resp);

		List<Map<String, Object>> bookInfo = (List<Map<String, Object>>) resp.get("item");
		logger.info("bookInfo : "+bookInfo);
		
		TrackerDTO dto = new TrackerDTO();
		
		dto.setCover((String) params.get("cover"));
		
		if (bookInfo != null) {
		    for (Map<String, Object> detail : bookInfo) {
		    	dto.setIsbn((String) detail.get("isbn13"));
		    	dto.setTitle((String) detail.get("title"));
		    	dto.setAuthor((String) detail.get("author"));
		    	dto.setPublisher((String) detail.get("publisher"));
		    	dto.setDescription((String) detail.get("description"));
		    	dto.setPubdate((String) detail.get("pubDate"));    
		    	logger.info("bookInfo getAuthor : "+dto.getAuthor()+dto.getTitle()+dto.getCover()+dto.getAuthor()+dto.getPublisher()+dto.getDescription()+dto.getPubdate());
		    	
		    	Map<String, Object> subInfo = (Map<String, Object>) detail.get("subInfo");

		    	dto.setTotalPage((int) subInfo.get("itemPage"));
		    	logger.info("bookInfo getTotalPage : "+dto.getTotalPage());
		    }
		    
		    dto.setLoginIdx((int) params.get("loginIdx"));
		    dto.setJsp(String.valueOf(params.get("jsp")));
		    
		    row = TrackerDAO.saveBook(dto);
		    logger.info("row : "+row);
		}    				
		return row;
	}
	
	//트래커에 저장 
	public int saveTracker(HashMap<String, Object> params) {
		logger.info("saveTracker");
		int row = TrackerDAO.saveTracker(params);
		logger.info("saveTracker row : "+row);		
		return row;
	}

	//총 페이지 수 가져오기
	public int getTotalPage(HashMap<String, Object> params) {
		int totalPage = 0;
		String isbn = String.valueOf(params.get("isbn"));
		logger.info("isbn : "+isbn);
		
		if(TrackerDAO.bookInfoChk(isbn) == 1) {
			totalPage = TrackerDAO.getTotalPage(isbn);
		}else {
			int row = saveBookInfo(params);
			if(row == 1) {
				totalPage = TrackerDAO.getTotalPage(isbn);
			}
		}		
		return totalPage;
	}

	//트래커 리스트 가져오기
	public ModelAndView trackerList(int loginIdx) {
		logger.info("trackerList loginIdx : "+loginIdx);
		
		ModelAndView mav = new ModelAndView("/tracker/trackerList");
		
		ArrayList<HashMap<String, Object>> trackerList = null;
		if(String.valueOf(loginIdx) != null) {
			trackerList = TrackerDAO.getTrackerList(loginIdx);
			if(trackerList != null) {
				logger.info("trackerList : "+trackerList);
				mav.addObject("trackerList",trackerList);
			}
		}
		
		return mav;
	}

	//트래커 책 상세보기
	public ModelAndView trackerDetail(String trackerIdx) {
		ModelAndView mav = new ModelAndView("/tracker/trackerDetail");
		HashMap<String, Object> map = TrackerDAO.trackerDetail(trackerIdx);
		mav.addObject("book",map);
		return mav;
	}
	
	//트래커 수정
	public HashMap<String, Object> trackerUpdateBook(HashMap<String, Object> params) {
		logger.info("params : "+params);

		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = TrackerDAO.trackerUpdateBook(params);
		if(row == 1) {
			logger.info("수정완료");
			map.put("success", "수정완료");
		}
		
		int totalPage = TrackerDAO.getTotalPage((String) params.get("isbn"));
		
		//읽은 페이지랑 총페이지가 같을 경우 종료일 저장
		int readPage = Integer.parseInt((String) params.get("readPage"));
		int loginIdx = (int) params.get("loginIdx");
		String isbn = (String) params.get("isbn");
		logger.info("readPage : "+readPage);
	    if (readPage == totalPage) {
	        TrackerDAO.saveEndDate(loginIdx,isbn);
	    }
		
		return map;
	}

	//트래커 삭제
	public int trackerDeleteBook(String isbn, int loginIdx) {
		return TrackerDAO.trackerDeleteBook(isbn,loginIdx);
	}

	//메모 저장
	public HashMap<String, Object> trackerAddMemo(HashMap<String, Object> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = TrackerDAO.trackerAddMemo(params);
		if(row == 1) {
			map.put("success",1);
		}
		return map;
	}

	public HashMap<String, Object> getMemoList(String trackerIdx) {
		logger.info("memo trackerIdx : "+trackerIdx);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		List<HashMap<String, Object>> list = TrackerDAO.getMemoList(trackerIdx);
		map.put("list", list);
		
		return map;
	}

	public HashMap<String, Object> memoDelete(HashMap<String, Object> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = TrackerDAO.memoDelete(params);
		if(row == 1) {
			map.put("success", 1);
		}
		return map;
	}

	//메모 내용 가져오기
	public String getContent(HashMap<String, Object> params) {
		return TrackerDAO.getContent(params);
	}

	public HashMap<String, Object> memoUpdate(HashMap<String, Object> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = TrackerDAO.memoUpdate(params);
		if(row == 1) {
			map.put("success", 1);
		}
		return map;
	}


	
	
	
	
	
	
	
    

}
