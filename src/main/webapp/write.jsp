<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>교환일기 - 작성</title>
    <style>
        .write-container { width: 600px; margin: 50px auto; padding: 20px; font-family: Inter, sans-serif; border: 1px solid #eee; }
        .header { display: flex; justify-content: space-between; margin-bottom: 15px; align-items: center; }
        .form-group { margin-bottom: 15px; display: flex; align-items: center; }
        .form-group label { width: 50px; font-size: 12px; }
        .form-group input { width: 150px; padding: 5px; border: 1px solid #D9D9D9; }
        .content-area { width: 100%; height: 200px; padding: 10px; border: 1px solid #D9D9D9; margin-bottom: 15px; resize: none; box-sizing: border-box; }
        .btn-group { display: flex; gap: 10px; }
        .btn { padding: 10px 15px; background-color: #D9D9D9; border: none; font-size: 12px; text-decoration: none; color: black; cursor: pointer; }
        .footer { display: flex; justify-content: space-between; align-items: center; }
    </style>
</head>
<body>
    <div class="write-container">
        <form action="processWrite.jsp" method="post">
            <div class="header">
                <div class="form-group" style="margin: 0;">
                    <label for="toUser">To.</label>
                    <input type="text" id="toUser" name="toUser" required>
                </div>
                <div class="btn-group">
                    <a href="main.jsp" class="btn">메인으로 돌아가기</a>
                    <a href="logout.jsp" class="btn">로그아웃</a>
                </div>
            </div>
            
            <textarea class="content-area" name="content" placeholder="보내고 싶은 내용을 작성하세요." required></textarea>
            
            <div class="footer">
                <div class="form-group" style="margin: 0;">
                    <label for="fromUser">From.</label>
                    <input type="text" id="fromUser" name="fromUser" required>
                </div>
                <button type="submit" class="btn">일기 보내기</button>
            </div>
        </form>
    </div>
</body>
</html>