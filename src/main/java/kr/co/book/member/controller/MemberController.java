package kr.co.book.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.book.member.dto.MemberDTO;
import kr.co.book.member.service.MemberService;

@Controller
public class MemberController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	private final MemberService service;
	
	public MemberController(MemberService service) {

		this.service = service;
	}
	
	@RequestMapping(value = "/login.go")
	public String loginForm() {
		return "member/login";
	}
	
	@RequestMapping(value = "/login.ajax", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> login(@RequestParam String member_email, @RequestParam String member_pw, HttpSession session) {
	    logger.info("로그인시도");
	    logger.info("email : " + member_email + ", pw : " + member_pw);
	    
	    MemberDTO dto = service.login(member_email);
	    
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    
	    if (dto != null) {
	        String encodePassWord = dto.getMember_pw();
	        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	        boolean isMatched = encoder.matches(member_pw, encodePassWord);
	        
	        if (isMatched) {
		        	logger.info("컨트롤러" + isMatched);
		            map.put("success", 1);
		            session.setAttribute("loginIdx", dto.getMember_idx());
		            session.setAttribute("loginEmail", dto.getMember_email());
		            session.setAttribute("loginNickname", dto.getMember_nickname());
		            session.setAttribute("loginGrade", dto.isMember_grade());	  
		            session.setAttribute("memberState", dto.getMember_state());
	        }
	    }
	    
	    return map;
	}

	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		logger.info("로그아웃 함");
		session.removeAttribute("loginNickname");
		session.removeAttribute("loginIdx");
		return "redirect:/";
	}
	
	@RequestMapping(value = "/join.go")
	public String joinForm() {
		return "member/joinForm";
	}
	
	@RequestMapping(value="/join.ajax",method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> join(@RequestParam HashMap<String, String> params){
	   logger.info("params: {}"+params);
	   String location = params.get("location");
	   
	   int code = service.findLocationCode(location);
	   
	   params.put("code_idx", String.valueOf(code));
	   
	return service.join(params);		   
    }
	
	@RequestMapping(value = "/pw_Search.go")
	public String pw_Search() {
		return "member/pw_Search";
	}
	
	/*
	 * @GetMapping("/mailCheck")
	 * 
	 * @ResponseBody public String mailCheck(String email) {
	 * System.out.println("이메일 인증 요청이 들어옴!"); System.out.println("이메일 인증 이메일 : " +
	 * email); return ""; }
	 */
	
	
	
	@RequestMapping(value="/member_email_check.ajax")	
	@ResponseBody
	public HashMap<String, Object> member_email_check(@RequestParam String member_email, HttpSession session){
		   		   		  
		   logger.info(member_email+"/"+" 이메일");
		   HashMap<String, Object> map = new HashMap<String, Object>();
		     // 중복된 값 확인
		     int success = service.emailOverCheck(member_email);
		     // 이메일 중복이 없을 떄 인증번호 전송 
		     if (success == 0) {
		    	 String email_check =(String) service.confirmNumCheck(member_email);
				 logger.info("이메일 인증번호: "+email_check); // 멥에 저장 map.put("email_check",
				 String charSet = "UTF-8";
			       String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com / 구글 사용시 smtp.gmail.com
			       String hostSMTPid = "vzoo8204@naver.com";
			       String hostSMTPpwd = "?gtp6418";

			       // 보내는 사람 EMail, 제목, 내용
			       String fromEmail = "vzoo8204@naver.com";
			       String fromName = "Infinity BooK";
			       String subject = "";
			       String msg = "";
			         
			       subject = "Infinity BooK 인증번호 입니다.";
			       msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			       msg += "<h3 style='color: skyblue;'>";
			       msg += "이메일(아이디) : "+ member_email + " 의 인증번호 입니다.</h3>";
			       msg += "<p>인증번호 : ";
			       msg += email_check + "</p></div>";

			         // 받는 사람 E-Mail 주소
			         String mail = member_email;
			         try {
			            HtmlEmail email = new HtmlEmail();
			            email.setDebug(true);
			            email.setCharset(charSet);
			            email.setSSL(true);
			            email.setHostName(hostSMTP);
			            email.setSmtpPort(587); //네이버 이용시 587 / 구글 이용시 465

			            email.setAuthentication(hostSMTPid, hostSMTPpwd);
			            email.setTLS(true);
			            email.addTo(mail, charSet);
			            email.setFrom(fromEmail, fromName, charSet);
			            email.setSubject(subject);
			            email.setHtmlMsg(msg);
			            email.send();
			         } catch (Exception e) {
			            logger.info("메일발송 실패 : " + e);
			         }   
			         
				     map.put("check", email_check);
			 }else {
				
			}   		   		   		  
		     return map;
		}	
	
	   @RequestMapping(value="/overlaynickname.ajax")
	   @ResponseBody
	   public HashMap<String, Object> overlaynickname(@RequestParam String member_nickname){
		   logger.info("overlaynickname : "+member_nickname);
		   
	      return service.overlaynickname(member_nickname);      

	   }
	   
	   @RequestMapping(value="/findmemberpw.ajax")	
	   @ResponseBody
	   // 3개를 입력해야 비번 찾아주는듯
	   public HashMap<String, Object> findmemberpw(@RequestParam String member_email, 
			   @RequestParam String member_nickname, HttpSession session){
		   		   		  
		   logger.info(member_email+"/"+member_nickname);		   
		   // 맵에 넣기
		   HashMap<String, Object> map = new HashMap<String, Object>();
		   // 서비스에서 비번 찾으면 1
		   int success = service.findmemberpw(member_email, member_nickname);
		   
		   logger.info("findsuccess: "+ success);
		   // 1이면
		   if(success == 1) {
			   // 서비스에서 받아온 임시 비번을 변수에 전달
			   String findpw =(String) service.RandomPassword(member_email, member_nickname);
			   logger.info("임시비밀번호: "+findpw);
			   // 멥에 저장
			   map.put("findpw", findpw);
		   }		   		   		   		  
		   return  map;
	   }	 

	   @RequestMapping(value = "/mypage/memberInfo.go")
	   public ModelAndView memberInfoGo(HttpSession session) {
		   int loginIdx = (int) session.getAttribute("loginIdx");
		   return service.getMemberInfo(loginIdx,"info");
	   }
	   
	   @RequestMapping(value = "/mypage/memberInfoUpdate.go")
	   public ModelAndView memberInfoUpdateGo(HttpSession session) {
		   int loginIdx = (int) session.getAttribute("loginIdx");
		   return service.getMemberInfo(loginIdx,"updateInfo");
	   }
	   
	   @PostMapping(value="/mypage/memberInfoUpdate.ajax")
	   @ResponseBody
	   public HashMap<String, Object> memberInfoUpdate(HttpSession session, @RequestParam HashMap<String, Object> params){
		   logger.info("params : "+params);
		   
		   int loginIdx = (int) session.getAttribute("loginIdx");
		   params.put("loginIdx", loginIdx);
		   
	      return service.memberInfoUpdate(session,params);      
	   }
	   
	   @RequestMapping(value = "/mypage/pwUpdate.go")
	   public String pwUpdateGo() {
		   return "/member/pwUpdate";
	   }
	   
	   @PostMapping(value="/mypage/pwChk.ajax")
	   @ResponseBody
	   public HashMap<String, Object> pwChk(HttpSession session, @RequestParam String exPw){
		   logger.info("exPw : "+exPw);
		   
		   int loginIdx = (int) session.getAttribute("loginIdx");
		   logger.info("loginIdx : "+loginIdx);
		   
	      return service.pwChk(exPw,loginIdx);      
	   }
	   
	   @PostMapping(value="/mypage/pwUpdate.ajax")
	   @ResponseBody
	   public HashMap<String, Object> pwUpdate(HttpSession session, @RequestParam String newPw){
		   logger.info("newPw : "+newPw);
		   
		   int loginIdx = (int) session.getAttribute("loginIdx");
		   
	      return service.pwUpdate(newPw,loginIdx);      
	   }
	   
	   @RequestMapping(value = "/mypage/leave.go")
	   public String leaveGo() {
		   return "/member/leave";
	   }
	   
	   @PostMapping(value="/mypage/leave.ajax")
	   @ResponseBody
	   public HashMap<String, Object> leave(HttpSession session, @RequestParam String pw){
		   logger.info("pw : "+pw);
		   
		   int loginIdx = (int) session.getAttribute("loginIdx");
		   
	      return service.leave(pw,loginIdx,session);      
	   }
	   
	   @RequestMapping(value = "/profilePop.go")
	   public ModelAndView profilePopGo(Model model, int member_idx) {
		   model.addAttribute("member_idx", member_idx);
		   return service.getProfileInfo(member_idx);
	   }
	   
	   @PostMapping(value="/getReview.ajax")
	   @ResponseBody
	   public HashMap<String, Object> getReview(@RequestParam HashMap<String, Object> params){
		   logger.info("params : "+params);
	      return service.getReview(params);      
	   }
	   
	   
	   
	   
	   
	   
	   
	   
}
