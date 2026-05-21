<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>교환일기 - 읽기</title>
    <style>
        .read-container { width: 600px; margin: 50px auto; padding: 20px; font-family: Inter, sans-serif; border: 1px solid #eee; }
        .header { display: flex; justify-content: space-between; margin-bottom: 15px; align-items: center; }
        .info-label { font-size: 12px; font-weight: bold; }
        .info-text { font-size: 12px; margin-left: 10px; }
        .content-area { width: 100%; height: 200px; padding: 10px; background-color: #f5f5f5; border: 1px solid #D9D9D9; margin-bottom: 15px; box-sizing: border-box; overflow-y: auto; font-size: 12px; }
        .btn-group { display: flex; gap: 10px; }
        .btn { padding: 10px 15px; background-color: #D9D9D9; border: none; font-size: 12px; text-decoration: none; color: black; cursor: pointer; }
        .footer { display: flex; justify-content: space-between; align-items: center; }
    </style>
</head>
<body>
    <div class="read-container">
        <div class="header">
            <div>
                <span class="info-label">To.</span>
                <span class="info-text">나 (B)</span>
            </div>
            <div class="btn-group">
                <a href="inbox.jsp" class="btn">보관함으로 돌아가기</a>
                <a href="logout.jsp" class="btn">로그아웃</a>
            </div>
        </div>
        
        <div class="content-area">
            여기에 암호화 해제된 편지 내용이 출력됩니다.
        </div>
        
        <div class="footer">
            <div>
                <span class="info-label">From.</span>
                <span class="info-text">A</span>
            </div>
            <a href="write.jsp?replyTo=A" class="btn">답장 보내기</a>
        </div>
    </div>
</body>
</html>