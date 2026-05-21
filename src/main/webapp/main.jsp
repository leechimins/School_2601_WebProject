<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 임시 사용자명 처리 (실제 환경에서는 세션에서 가져옴)
    String userName = request.getParameter("userId") != null ? request.getParameter("userId") : "00";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>교환일기 - 메인</title>
    <style>
        .main-container { width: 500px; margin: 50px auto; padding: 20px; font-family: Inter, sans-serif; }
        .greeting { font-size: 14px; margin-bottom: 20px; }
        .btn-group { display: flex; gap: 10px; }
        .btn { padding: 10px 15px; background-color: #D9D9D9; border: none; font-size: 12px; text-decoration: none; color: black; cursor: pointer; }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="greeting">안녕하세요, <%= userName %>님</div>
        <div class="btn-group">
            <a href="write.jsp" class="btn">일기 작성하기</a>
            <a href="inbox.jsp" class="btn">보관함으로 이동하기</a>
        </div>
    </div>
</body>
</html>