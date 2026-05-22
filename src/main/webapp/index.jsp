<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀 편지 UI 테스트</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <div class="container">
        <div class="header-flex">
            <h2 class="section-title">로그인</h2>
        </div>
        <div class="form-group">
            <label for="userId">아이디</label>
            <input type="text" id="userId" class="form-control" placeholder="아이디를 입력하세요">
        </div>
        <div class="form-group">
            <label for="userPw">비밀번호</label>
            <input type="password" id="userPw" class="form-control" placeholder="비밀번호를 입력하세요">
        </div>
        <div style="margin-top: 20px;">
            <button class="btn btn-primary" style="margin-bottom: 10px;">로그인</button>
            <button class="btn btn-secondary">회원가입</button>
        </div>
    </div>

    <div class="container">
        <div class="header-flex">
            <h2 class="section-title">환영합니다, User님</h2>
            <button class="btn-logout">로그아웃</button>
        </div>
        <p style="color: #7f8c8d; font-size: 0.9rem; text-align: center; margin-bottom: 25px;">
            새로운 비밀 편지를 작성하거나 도착한 편지를 확인하세요.
        </p>
        <button class="btn btn-primary" style="margin-bottom: 10px;">편지 쓰기</button>
        <button class="btn btn-secondary">내 편지함 보기</button>
    </div>

    <div class="container">
        <div class="header-flex">
            <h2 class="section-title">비밀 편지 쓰기</h2>
            <button class="btn-logout">로그아웃</button>
        </div>
        <div class="form-group">
            <label for="receiver">받는 사람</label>
            <select id="receiver" class="form-control">
                <option value="">수신자를 선택하세요</option>
                <option value="alice">Alice</option>
                <option value="bob">Bob</option>
                <option value="charlie">Charlie</option>
            </select>
        </div>
        <div class="form-group">
            <label for="content">편지 내용</label>
            <textarea id="content" class="form-control" placeholder="전달할 비밀 메시지를 입력하세요..."></textarea>
        </div>
        <div class="form-group">
            <label for="sender">보내는 사람</label>
            <input type="text" id="sender" class="form-control" value="User (나)" readonly>
        </div>
        <div class="btn-group unequal">
            <button class="btn btn-secondary">취소</button>
            <button class="btn btn-primary">보내기</button>
        </div>
    </div>

    <div class="container">
        <div class="header-flex">
            <h2 class="section-title">받은 편지함</h2>
            <button class="btn-logout">로그아웃</button>
        </div>
        <ul class="letter-list">
            <li class="letter-item">
                <div class="letter-info">
                    <div class="sender">보낸이: Alice</div>
                    <div class="receiver">받는이: 나</div>
                </div>
                <div class="date" style="font-size: 0.8rem; color: #95a5a6;">2026-05-22</div>
            </li>
            <li class="letter-item">
                <div class="letter-info">
                    <div class="sender">보낸이: Unknown</div>
                    <div class="receiver">받는이: 나</div>
                </div>
                <div class="date" style="font-size: 0.8rem; color: #95a5a6;">2026-05-21</div>
            </li>
        </ul>
        <button class="btn btn-secondary" style="margin-top: 20px;">메인으로 돌아가기</button>
    </div>

    <div class="container">
        <div class="header-flex">
            <h2 class="section-title">편지 읽기</h2>
            <button class="btn-logout">로그아웃</button>
        </div>
        <div class="letter-meta">
            <span><strong>From.</strong> Alice</span>
            <span>2026. 05. 22 17:30</span>
        </div>
        <div class="letter-content-box">안녕! 오늘 수업 끝나고 도서관에서 볼래?
혹시 시간 안 되면 내일도 괜찮아.

비밀이야!</div>
        <div class="btn-group unequal">
            <button class="btn btn-secondary">목록으로</button>
            <button class="btn btn-primary">답장하기</button>
        </div>
    </div>

</body>
</html>