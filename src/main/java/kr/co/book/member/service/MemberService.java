package kr.co.book.member.service;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.book.member.dao.MemberDAO;
import kr.co.book.member.dto.MemberDTO;

@Service
@MapperScan(value = {"kr.co.book.member.dao"})
public class MemberService {
	
	private final MemberDAO dao;
	
	public MemberService(MemberDAO dao) {
		this.dao = dao;
	}
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public HashMap<String, Object> join(HashMap<String, String> params) {
	
	HashMap<String, Object> map = new HashMap<>();
	
	String password = params.get("member_pw"); 
	logger.info(password);
	
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	String encodedPassword = encoder.encode(password);
	params.replace("member_pw", password, encodedPassword);
	map.put("success", dao.join(params));
	
	return map;
	
	}

	public MemberDTO login(String member_email) {
		
		return dao.login(member_email);
	}

	public String randomCheck(String member_email, String member_email2) {
		// 알파벳 전부
				
			    String NUMBER = "0123456789";
			    // 랜덤 임시비번
			    String EMAIL_ALLOW_BASE = NUMBER;
			    // 임시비번은 8자리
			    int EMAIL_LENGTH = 6;
			    // 랜덤 변수
			    SecureRandom random = new SecureRandom();
			    // 저장될 문자열
			    String sb = "";
			    // 임시비번8자리가 될떄까지 랜덤 돌림
			    for (int i = 0; i < EMAIL_LENGTH; i++) {
			        int randomIndex = random.nextInt(EMAIL_ALLOW_BASE.length());
			        char randomChar = EMAIL_ALLOW_BASE.charAt(randomIndex);
			        sb+=randomChar;
			    }
			    
			    logger.info("인증번호 : "+sb);			    
				// 드디어 메일
				String charSet = "UTF-8";
			    String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com / 구글 사용시 smtp.gmail.com
			    // 메일 아이디
			    String hostSMTPid = "vzoo8204@naver.com";
			    // 메일 비번
			    String hostSMTPpwd = "ckdgns1486";

			    // 보내는 사람 EMail, 제목, 내용
			    String fromEmail = "vzoo8204@naver.com";
			    String fromName = "B∞K";
			    String subject = "";
			    String msg = "";
			   // 메일에 추가할거
		       subject = "B∞K 이메일 인증번호를 확인해주세요.";
		       msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		       msg += "<h3 style='color: skyblue;'>";
		       msg += "홈페이지에 접속하여, 인증번호를 입력해 주세요. </h3>";
		       msg += "<p>인증번호 : ";
		       msg += sb + "</p></div>";

			      // 받는 사람 E-Mail 주소
			      String mail = member_email + member_email2;
			      try {
			    	 // 메일 객체화
			         HtmlEmail email = new HtmlEmail();
			         // 메일에 디버그를 성공
			         email.setDebug(true);
			         // 메일에 한글형식
			         email.setCharset(charSet);
			         // 권장하지 않고 곧 없어질건데 트루
			         email.setSSL(true);
			         // 보낼사람이 이용할 메일
			         email.setHostName(hostSMTP);
			         
			         email.setSmtpPort(587); //네이버 이용시 587 / 구글 이용시 465
			         // 보낼사람 정보
			         email.setAuthentication(hostSMTPid, hostSMTPpwd);	         
			         email.setTLS(true);
			         // 받을 사람 메일과 한글 타입
			         email.addTo(mail, charSet);
			         // 보내는 사람 타입
			         email.setFrom(fromEmail, fromName, charSet);
			         email.setSubject(subject);
			         email.setHtmlMsg(msg);
			         email.send();
			      } catch (Exception e) {
			         logger.info("메일발송 실패 : " + e);
			      }		
			      // 이렇게 메일로 임시 비번 보냄...
			    return sb;
	}

	public int emailOverCheck(String member_email) {
		
		return dao.emailOverCheck(member_email);
	}

	public String confirmNumCheck(String member_email) {
	   
       String NUMBER = "0123456789";
       String Email_ALLOW_BASE = NUMBER;
       int email_length = 6;
       SecureRandom random = new SecureRandom();             
       String sb = "";
       
       for (int i = 0; i < email_length; i++) {
           int randomIndex = random.nextInt(Email_ALLOW_BASE.length());
           char randomChar = Email_ALLOW_BASE.charAt(randomIndex);
           sb+=randomChar;
       }
		return sb;
	}

	public HashMap<String, Object> overlaynickname(String member_nickname) {
		
		HashMap<String, Object> map = new HashMap<>();
		// 같은 닉네임이 있는가? 있으면 1 없으면 0	
		map.put("overlaynickname", dao.overlaynickname(member_nickname));	
		
		return map;
	}

	public int findLocationCode(String location) {

		return dao.findLocationCode(location);
	}

	public int findmemberpw(String member_email, String member_nickname) {
		
		return dao.findmemberpw(member_email, member_nickname);
	}

	public String RandomPassword(String member_email, String member_nickname) {
		
		String CHAR_LOWER = "abcdefghijklmnopqrstuvwxyz";
		// 전부를 모두 대문자로
	    String CHAR_UPPER = CHAR_LOWER.toUpperCase();
	    // 숫잦ㄴ부
	    String NUMBER = "0123456789";
	    // 랜덤 임시비번
	    String PASSWORD_ALLOW_BASE = CHAR_LOWER + CHAR_UPPER + NUMBER;
	    // 임시비번은 8자리
	    int PASSWORD_LENGTH = 8;
	    // 랜덤 변수
	    SecureRandom random = new SecureRandom();
	    // 저장될 문자열
	    String sb = "";
	    // 임시비번8자리가 될떄까지 랜덤 돌림
	    for (int i = 0; i < PASSWORD_LENGTH; i++) {
	        int randomIndex = random.nextInt(PASSWORD_ALLOW_BASE.length());
	        char randomChar = PASSWORD_ALLOW_BASE.charAt(randomIndex);
	        sb+=randomChar;
	    }
	    
	    logger.info("임시 비밀번호"+sb);
	    // 암호하
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		// 임시비번을 암호화해서 저장
		String encodedPassword = encoder.encode(sb);
		// 디비에 저장(기록때문인듯)
		dao.RandomPassword(member_email, member_nickname, encodedPassword);
		// 드디어 메일
		String charSet = "UTF-8";
	    String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com / 구글 사용시 smtp.gmail.com
	    // 메일 아이디
	    String hostSMTPid = "vzoo8204@naver.com";
	    // 메일 비번
	    String hostSMTPpwd = "?gtp6418";

	    // 보내는 사람 EMail, 제목, 내용
	    String fromEmail = "vzoo8204@naver.com";
	    String fromName = "B∞K";
	    String subject = "";
	    String msg = "";
	   // 메일에 추가할거
       subject = "B∞K 임시 비밀번호 입니다.";
       msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
       msg += "<h3 style='color: skyblue;'>";
       msg += "아이디: "+ member_email + " 의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
       msg += "<p>임시 비밀번호 : ";
       msg += sb + "</p></div>";

	      // 받는 사람 E-Mail 주소
	      String mail = member_email;
	      try {
	    	 // 메일 객체화
	         HtmlEmail email = new HtmlEmail();
	         // 메일에 디버그를 성공
	         email.setDebug(true);
	         // 메일에 한글형식
	         email.setCharset(charSet);
	         // 권장하지 않고 곧 없어질건데 트루
	         email.setSSL(true);
	         // 보낼사람이 이용할 메일
	         email.setHostName(hostSMTP);
	         
	         email.setSmtpPort(587); //네이버 이용시 587 / 구글 이용시 465
	         // 보낼사람 정보
	         email.setAuthentication(hostSMTPid, hostSMTPpwd);	         
	         email.setTLS(true);
	         // 받을 사람 메일과 한글 타입
	         email.addTo(mail, charSet);
	         // 보내는 사람 타입
	         email.setFrom(fromEmail, fromName, charSet);
	         email.setSubject(subject);
	         email.setHtmlMsg(msg);
	         email.send();
	      } catch (Exception e) {
	         logger.info("메일발송 실패 : " + e);
	      }		
	      // 이렇게 메일로 임시 비번 보냄...
	    return sb;
	}

	public ModelAndView getMemberInfo(int loginIdx, String flag) {
		ModelAndView mav = new ModelAndView();
		
		if(flag.equals("info")) {
			mav.setViewName("/member/memberInfo");
		}else {
			mav.setViewName("/member/memberInfoUpdate");
		}
		
		HashMap<String, Object> map = dao.getMemberInfo(loginIdx);
		mav.addObject("info",map);
		return mav;
	}

	public HashMap<String, Object> memberInfoUpdate(HttpSession session, HashMap<String, Object> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int code_idx = dao.findLocationCode((String) params.get("location"));
		logger.info("codeIdx : "+code_idx);
		params.put("code_idx", code_idx);
		
		int success = dao.memberInfoUpdate(params);
		if(success == 1) {
			map.put("success", success);
			session.setAttribute("loginNickname", (String)params.get("nickname"));			
		}
		
		return map;
	}

	public HashMap<String, Object> pwChk(String exPw, int loginIdx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String encodePassWord = dao.getPw(loginIdx);

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        boolean isMatched = encoder.matches(exPw, encodePassWord);
        
        if(isMatched) {
    		map.put("pwChk", true);
        }
		
		return map;
	}

	public HashMap<String, Object> pwUpdate(String newPw, int loginIdx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPassword = encoder.encode(newPw);
		
		int success = dao.pwUpdate(encodedPassword,loginIdx);
		
		map.put("success", success);
		return map;
	}

	public HashMap<String, Object> leave(String pw, int loginIdx, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		String encodePassWord = dao.getPw(loginIdx);

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        boolean isMatched = encoder.matches(pw, encodePassWord);
        
        if(isMatched) {
        	int row = dao.leave(loginIdx);
        	
        	if(row == 1) {
        		map.put("success", true);
        		session.invalidate();
        	}
        }
		
		return map;
	}

	public ModelAndView getProfileInfo(int member_idx) {
		ModelAndView mav = new ModelAndView("/member/profilePop");

		HashMap<String, Object> map =  dao.getProfileInfo(member_idx);
		
		String region = dao.getRegion((int) map.get("code_idx"));
		map.put("region", region);
		
		mav.addObject("info",map);
		   
		return mav;
	}

	public HashMap<String, Object> getReview(HashMap<String, Object> params) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<HashMap<String, Object>> list = null;
		int page = Integer.parseInt(String.valueOf(params.get("page"))); 
		int offset = 5*(page-1);
		params.put("offset", offset);
		int total = 0;
		
		list = dao.reviewList(params);
		logger.info("list : "+list);
		total = list.size();
		logger.info("total : "+total);		
		
		int range = total%5  == 0 ? total/5 : total/5+1;
		page = page>range ? range:page;
		
		map.put("offset", offset);
		map.put("list", list);
		map.put("currPage", page);
		map.put("pages", range);
		
		return map;
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
