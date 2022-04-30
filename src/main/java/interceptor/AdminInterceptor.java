package interceptor;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String login = (String)session.getAttribute("memberId");
		if(login ==null || !login.equals("vision")) {
			String msg = URLEncoder.encode("사용이 제한 되었습니다", "utf-8");
			response.sendRedirect(request.getContextPath()+"/board/main?msg="+msg);
			return false;
		}
		return true;
	}
	
}
