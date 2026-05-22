<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    String currentUser = (String) session.getAttribute("userId");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // In-Memory 봉투 DB 가져오기
    List<Map<String, Object>> envelopeDb = (List<Map<String, Object>>) application.getAttribute("ENVELOPE_DB");
    if (envelopeDb == null) {
        envelopeDb = new ArrayList<>();
        application.setAttribute("ENVELOPE_DB", envelopeDb);
    }

    // 지금까지 가입 및 로그인했던 전체 사람 목록 로드 (드롭다운 추출용)
    Map<String, String> userDb = (Map<String, String>) application.getAttribute("USER_DB");
    Set<String> userList = (userDb != null) ? userDb.keySet() : new HashSet<>();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비밀 편지 - 전자봉투 실습 공간</title>
    <link rel="stylesheet" href="style.css">
    <script>
        function verifyAndOpen(receiver, letterId) {
            const user = '<%= currentUser %>';
            if (receiver !== user) {
                alert("[복호화 실패] 전자봉투 해독 불가\n\n원인: 현재 접속자(" + user + ")의 개인키로는 타인(" + receiver + ")의 공개키로 암호화된 대칭키를 해독할 수 없습니다.");
                return;
            }
            location.href = "read.jsp?id=" + letterId;
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="header-flex">
            <h2 class="section-title">소유자: <span class="user-highlight"><%= currentUser %></span></h2>
            <button type="button" class="btn-logout" onclick="location.href='logout.jsp'">로그아웃</button>
        </div>

        <form action="processEnvelope.jsp" method="post">
            <h3 class="section-subtitle">[1] 전자봉투 암호화 송신</h3>
            
            <div class="form-group">
                <label for="toUser">수신자 ID (해당 사용자의 공개키로 대칭키 암호화)</label>
                <select id="toUser" name="toUser" class="form-control" required>
                    <option value="">수신자를 선택하세요</option>
                    <% 
                        if (userList != null) {
                            for (String userId : userList) {
                                // 본인 제외하고 목록 구성하고 싶다면 조건 추가 가능
                                out.println("<option value=\"" + userId + "\">" + userId + "</option>");
                            }
                        }
                    %>
                </select>
            </div>
            <div class="form-group">
                <label for="content">평문 메시지 (AES 대칭키로 암호화)</label>
                <textarea id="content" name="content" class="form-control" placeholder="비밀 메시지를 입력하세요..." required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">전자봉투 생성 및 전송</button>
        </form>

        <hr class="divider">

        <h3 class="section-subtitle">[2] 시스템에 라우팅된 전체 전자봉투 목록</h3>
        <ul class="letter-list">
            <% if (envelopeDb.isEmpty()) { %>
                <li class="list-empty">저장된 편지가 없습니다.</li>
            <% } else {
                for (Map<String, Object> env : envelopeDb) {
                    String sender = (String) env.get("sender");
                    String receiver = (String) env.get("receiver");
                    String letterId = (String) env.get("id");
                    boolean isMine = currentUser.equals(receiver);
            %>
            <li class="letter-item" onclick="verifyAndOpen('<%= receiver %>', '<%= letterId %>')">
                <div class="letter-info">
                    <div class="<%= isMine ? "status-mine" : "status-other" %>">
                        <%= isMine ? "[수신 가능]" : "[복호화 불가]" %> 받는이: <%= receiver %>
                    </div>
                    <div class="meta-desc">보낸이: <%= sender %> | 상태: AES-CBC 암호화됨</div>
                </div>
            </li>
            <%      }
               } %>
        </ul>
    </div>
</body>
</html>