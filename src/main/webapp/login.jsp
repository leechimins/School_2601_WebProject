<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비밀 편지 - 로그인/시작</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <div class="header-flex">
            <h2 class="section-title">비밀 편지 시작하기</h2>
        </div>
        <p style="font-size: 0.85rem; color: #7f8c8d; margin-bottom: 20px;">
            처음 오신 경우 자동으로 가입 및 보안 키가 발급됩니다.
        </p>
        <form action="processLogin.jsp" method="post">
            <div class="form-group">
                <label for="userId">아이디</label>
                <input type="text" id="userId" name="userId" class="form-control" placeholder="아이디를 입력하세요" required>
            </div>
            <div class="form-group">
                <label for="userPw">비밀번호</label>
                <input type="password" id="userPw" name="userPw" class="form-control" placeholder="비밀번호를 입력하세요" required>
            </div>
            <div style="margin-top: 20px;">
                <button type="submit" class="btn btn-primary">접속하기</button>
            </div>
        </form>
    </div>
</body>
</html>