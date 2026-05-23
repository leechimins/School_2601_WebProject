<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비밀 편지 - 로그인/시작</title>
</head>
<body>

<h2>비밀 편지 시작하기</h2>
처음 오신 경우 자동으로 가입 및 보안 키가 발급됩니다.
<form action="processLogin.jsp" method="post">
	아이디
	<input type="text" name="userId" placeholder="아이디를 입력하세요" required>
	비밀번호
	<input type="password" name="userPw" placeholder="비밀번호를 입력하세요" required>
	<button type="submit">접속하기</button>
</form>
</body>
</html>