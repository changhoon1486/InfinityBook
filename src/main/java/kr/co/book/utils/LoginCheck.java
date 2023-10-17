package kr.co.book.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class LoginCheck implements HandlerInterceptor {

	//preHandler : Controller 전에 이곳을 지나친다.
	// true : 컨트롤러를 접근 허용 / false : 컨트롤러 접근 불가
		
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        boolean pass = true;

        HttpSession session = request.getSession();
        if (session.getAttribute("loginIdx") == null) {
            // alert 창을 포함한 JavaScript 코드를 추가한다.
            String alertMessage = "로그인이 필요합니다.";
            String redirectURL = "/login.go";
            String script = "<script>alert('%s');location.href='%s';</script>";
            String fullScript = String.format(script, alertMessage, redirectURL);

            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().println(fullScript);

            pass = false;
        }

        return pass;
    }
}
