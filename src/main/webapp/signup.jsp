<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비밀 편지 - 회원가입</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <div class="header-flex">
            <h2 class="section-title">회원가입 및 키 발급</h2>
        </div>
        <form action="processSignup.jsp" method="post">
            <div class="form-group">
                <label for="userId">아이디</label>
                <input type="text" id="userId" name="userId" class="form-control" placeholder="사용할 아이디" required>
            </div>
            <div class="form-group">
                <label for="userPw">비밀번호</label>
                <input type="password" id="userPw" name="userPw" class="form-control" placeholder="사용할 비밀번호" required>
            </div>
            <div class="btn-group unequal">
                <a href="login.jsp" class="btn btn-secondary">돌아가기</a>
                <button type="submit" class="btn btn-primary">회원가입</button>
            </div>
        </form>
    </div>
</body>
</html>