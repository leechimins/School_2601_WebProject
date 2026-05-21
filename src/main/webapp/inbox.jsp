<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>교환일기 - 보관함</title>
    <style>
        .inbox-container { width: 600px; margin: 50px auto; padding: 20px; font-family: Inter, sans-serif; }
        .header { display: flex; justify-content: space-between; align-items: center; border-bottom: 2px solid #D9D9D9; padding-bottom: 10px; margin-bottom: 20px; }
        .title { font-size: 16px; font-weight: bold; }
        .btn-group { display: flex; gap: 10px; }
        .btn { padding: 8px 12px; background-color: #D9D9D9; border: none; font-size: 12px; text-decoration: none; color: black; cursor: pointer; }
        .diary-list { list-style: none; padding: 0; }
        .diary-item { padding: 10px; background-color: #f9f9f9; border: 1px solid #D9D9D9; margin-bottom: 10px; cursor: pointer; display: block; text-decoration: none; color: black; font-size: 12px; }
        .diary-item:hover { background-color: #e9e9e9; }
    </style>
</head>
<body>
    <div class="inbox-container">
        <div class="header">
            <div class="title">일기 보관함</div>
            <div class="btn-group">
                <a href="main.jsp" class="btn">메인으로 돌아가기</a>
                <a href="logout.jsp" class="btn">로그아웃</a>
            </div>
        </div>
        
        <ul class="diary-list">
            <li><a href="read.jsp?id=1" class="diary-item">A가 B에게 보내는 편지</a></li>
            <li><a href="read.jsp?id=2" class="diary-item">A가 C에게 보내는 편지</a></li>
            <li><a href="read.jsp?id=3" class="diary-item">B가 A에게 보내는 편지</a></li>
        </ul>
    </div>
</body>
</html>