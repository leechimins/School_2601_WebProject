<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교환일기 - 로그인</title>
<style>
	.login-container { width: 400px; margin: 50px auto; padding: 20px; border: 1px solid #ccc; font-family: Inter, sans-serif; }
	.form-group { margin-bottom: 15px; display: flex; align-items: center; }
	.form-group label { width: 80px; font-size: 12px; }
	.form-group input { flex: 1; padding: 5px; border: 1px solid #D9D9D9; }
	.login-btn { width: 100%; padding: 10px; background-color: #D9D9D9; border: none; font-size: 12px; cursor: pointer; }
</style>
</head>
<body>
<div class="login-container">
	<form action="main.jsp" method="post">
	<div class="form-group">
		<label for="userId">아이디</label>
		<input type="text" id="userId" name="userId" required>
		</div>
	<div class="form-group">
		<label for="userPw">비밀번호</label>
		<input type="password" id="userPw" name="userPw" required>
	</div>
	<button type="submit" class="login-btn">로그인하기</button>
	</form>
</div>
</body>
</html>