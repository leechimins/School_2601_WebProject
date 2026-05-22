<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String userName = request.getParameter("userId") != null ? request.getParameter("userId") : "00";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비밀 편지 - 메인</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <div class="header-flex">
            <h2 class="section-title">환영합니다, <%= userName %>님</h2>
            <button type="button" class="btn-logout" onclick="location.href='logout.jsp'">로그아웃</button>
        </div>
        <p style="color: #7f8c8d; font-size: 0.9rem; text-align: center; margin-bottom: 25px;">
            새로운 비밀 편지를 작성하거나 도착한 편지를 확인하세요.
        </p>
        <a href="write.jsp" class="btn btn-primary" style="margin-bottom: 10px;">비밀 편지 쓰기</a>
        <a href="inbox.jsp" class="btn btn-secondary">내 편지함 보기</a>
    </div>
</body>
</html>