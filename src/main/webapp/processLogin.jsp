<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
if (application.getAttribute("USER_DB") == null) {
	application.setAttribute("USER_DB", no_security.UserDB.getInstance());
}
no_security.UserDB userDB = (no_security.UserDB) application.getAttribute("USER_DB");
security.AuthService authService = security.AuthService.getInstance();

// request.setCharacterEncoding("UTF-8");

String userId = request.getParameter("userId");
String userPw = request.getParameter("userPw");

/* AI가 쓴 코드.. 필요한가?
if (userId == null || userId.trim().isEmpty() || userPw == null || userPw.trim().isEmpty()) {
    out.println("<script>alert('아이디와 비밀번호를 모두 입력해주세요.'); history.back();</script>");
    return;
}
*/

if (userDB.containsUser(userId)) {
	if (authService.login(userId, userPw)) {
		session.setAttribute("userId", userId);
		response.sendRedirect("workspace.jsp?msg=LOGIN");
		return;
	}
	else {
		response.sendRedirect("login.jsp?msg=WRONG_PW");
		return;
	}
}
else {
	String path = application.getRealPath("/WEB-INF/keys");
	if (authService.register(userId, userPw, path)) {
		session.setAttribute("userId", userId);
		response.sendRedirect("workspace.jsp?msg=REGISTER");
		return;
	}
	else {
		response.sendRedirect("login.jsp?msg=KEY_FAIL");
		return;
	}
}
%>