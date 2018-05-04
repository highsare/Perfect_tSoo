package sar.web.tSoo.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LogInInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		String logInID = (String)session.getAttribute("logInID");
		
		if (logInID == null) {
			response.sendRedirect(request.getContextPath()+"/logIn");
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}
	
}