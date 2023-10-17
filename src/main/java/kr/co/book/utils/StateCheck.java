package kr.co.book.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class StateCheck implements HandlerInterceptor {

	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        boolean pass = true;
        String alertMessage = "";
		String redirectURL ="";
		String script = "";
		String fullScript = "";

        HttpSession session = request.getSession();
        if (session.getAttribute("loginIdx") != null && session.getAttribute("memberState").equals("7일 제한")) {
            // alert 창을 포함한 JavaScript 코드를 추가한다.
            alertMessage = "신고처리로 인해 7일 동안 이용제한 되었습니다.";
            redirectURL = "/";
            script = "<script>alert('%s');location.href='/logout.do';</script>";
            fullScript = String.format(script, alertMessage, redirectURL);

            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().println(fullScript);

            pass = false;
        } else if(session.getAttribute("loginIdx") != null && session.getAttribute("memberState").equals("15일 제한")) {
            // alert 창을 포함한 JavaScript 코드를 추가한다.
            alertMessage = "신고처리로 인해 15일 동안 이용제한 되었습니다.";
            redirectURL = "/";
            script = "<script>alert('%s');location.href='/logout.do';</script>";
            fullScript = String.format(script, alertMessage, redirectURL);

            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().println(fullScript);

            pass = false;
        } else if(session.getAttribute("loginIdx") != null && session.getAttribute("memberState").equals("영구제한")) {
            // alert 창을 포함한 JavaScript 코드를 추가한다.
            alertMessage = "신고처리로 인해 이용이 영구제한 되었습니다.";
            redirectURL = "/";
            script = "<script>alert('%s');location.href='/logout.do';</script>";
            fullScript = String.format(script, alertMessage, redirectURL);

            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().println(fullScript);

            pass = false;
        } 

        return pass;
    }
}
