<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비밀 편지 - 쓰기</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <form action="processWrite.jsp" method="post">
            <div class="header-flex">
                <h2 class="section-title">비밀 편지 쓰기</h2>
                <button type="button" class="btn-logout" onclick="location.href='logout.jsp'">로그아웃</button>
            </div>
            
            <div class="form-group">
                <label for="toUser">받는 사람 (To)</label>
                <select id="toUser" name="toUser" class="form-control" required>
                    <option value="">수신자를 선택하세요</option>
                    <option value="A">A</option>
                    <option value="C">C</option>
                    <option value="D">D</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="content">편지 내용</label>
                <textarea id="content" name="content" class="form-control" placeholder="전달할 비밀 메시지를 작성하세요..." required></textarea>
            </div>
            
            <div class="form-group">
                <label for="fromUser">보내는 사람 (From)</label>
                <input type="text" id="fromUser" name="fromUser" class="form-control" value="나 (B)" readonly>
            </div>
            
            <div class="btn-group unequal">
                <a href="main.jsp" class="btn btn-secondary">취소</a>
                <button type="submit" class="btn btn-primary">보내기</button>
            </div>
        </form>
    </div>
</body>
</html>