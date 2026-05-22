<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.util.concurrent.ConcurrentHashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="security.KeyManager" %>
<%@ page import="java.io.File" %>
<%
    request.setCharacterEncoding("UTF-8");
    String userId = request.getParameter("userId");
    String userPw = request.getParameter("userPw");

    if (userId == null || userId.trim().isEmpty() || userPw == null || userPw.trim().isEmpty()) {
        out.println("<script>alert('아이디와 비밀번호를 모두 입력해주세요.'); history.back();</script>");
        return;
    }

    // 1. In-Memory DB 초기화 (application 스코프 활용)
    Map<String, String> userDb = (Map<String, String>) application.getAttribute("USER_DB");
    if (userDb == null) {
        userDb = new ConcurrentHashMap<>();
        application.setAttribute("USER_DB", userDb);
    }

    // 2. SHA-256 해시 함수를 이용한 비밀번호 암호화
    String hashedPw = "";
    try {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(userPw.getBytes());
        byte[] byteData = md.digest();
        StringBuilder sb = new StringBuilder();
        for (byte b : byteData) {
            sb.append(Integer.toString((b & 0xff) + 0x100, 16).substring(1));
        }
        hashedPw = sb.toString();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('암호화 처리 중 오류가 발생했습니다.'); history.back();</script>");
        return;
    }

    // 3. 통합 로그인/회원가입 로직 분기
    if (userDb.containsKey(userId)) {
        // [기존 유저] 로그인 시도
        if (userDb.get(userId).equals(hashedPw)) {
            // 로그인 성공
            session.setAttribute("userId", userId);
            response.sendRedirect("workspace.jsp");
        } else {
            // 비밀번호 불일치
            out.println("<script>alert('비밀번호가 일치하지 않습니다.'); history.back();</script>");
        }
    } else {
        // [신규 유저] 회원가입 및 키 발급 진행
        String keyDirPath = application.getRealPath("/WEB-INF/keys");
        File keyDir = new File(keyDirPath);
        if (!keyDir.exists()) {
            keyDir.mkdirs();
        }

        KeyManager keyManager = new KeyManager();
        boolean isSuccess = keyManager.generateAndSaveKeyPair(userId, keyDirPath);

        if (isSuccess) {
            // DB에 계정 저장 및 세션 부여
            userDb.put(userId, hashedPw);
            session.setAttribute("userId", userId);
            out.println("<script>alert('신규 가입 및 RSA 키 발급이 완료되었습니다. 작업 공간으로 이동합니다.'); location.href='workspace.jsp';</script>");
        } else {
            out.println("<script>alert('RSA 키 생성 중 오류가 발생했습니다.'); history.back();</script>");
        }
    }
%>