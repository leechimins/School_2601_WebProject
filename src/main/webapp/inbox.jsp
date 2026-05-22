<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 실제 환경에서는 세션(session)에서 로그인된 아이디를 가져와야 함.
    // 테스트 목업을 위해 현재 사용자를 'B'로 가정함.
    String currentUser = "B";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비밀 편지 - 보관함</title>
    <link rel="stylesheet" href="style.css">
    <script>
        function tryOpenLetter(receiver, url) {
            const currentUser = '<%= currentUser %>';
            
            // 수신자와 현재 사용자가 일치하지 않는 경우
            if (receiver !== currentUser) {
                alert("열람 실패: 수신자의 개인키(사설키)로 전자봉투를 복호화할 수 없습니다.\n본인에게 온 편지만 열람할 수 있습니다.");
                return;
            }
            
            // 정상 복호화 시 읽기 페이지로 이동
            location.href = url;
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="header-flex">
            <h2 class="section-title">받은 편지함</h2>
            <button type="button" class="btn-logout" onclick="location.href='logout.jsp'">로그아웃</button>
        </div>
        
        <ul class="letter-list">
            <li class="letter-item" onclick="tryOpenLetter('B', 'read.jsp?id=1')">
                <div class="letter-info">
                    <div class="receiver">받는이: B</div>
                    <div class="sender">보낸이: A</div>
                </div>
            </li>
            
            <li class="letter-item" onclick="tryOpenLetter('C', 'read.jsp?id=2')">
                <div class="letter-info">
                    <div class="receiver">받는이: C</div>
                    <div class="sender">보낸이: A</div>
                </div>
            </li>
            
            <li class="letter-item" onclick="tryOpenLetter('A', 'read.jsp?id=3')">
                <div class="letter-info">
                    <div class="receiver">받는이: A</div>
                    <div class="sender">보낸이: B</div>
                </div>
            </li>
        </ul>
        
        <a href="main.jsp" class="btn btn-secondary" style="margin-top: 20px;">메인으로 돌아가기</a>
    </div>
</body>
</html>