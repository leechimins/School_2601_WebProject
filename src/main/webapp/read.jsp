<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.io.*, java.security.*, javax.crypto.*, javax.crypto.spec.*" %>
<%
    String currentUser = (String) session.getAttribute("userId");
    String letterId = request.getParameter("id");
    if (currentUser == null) { response.sendRedirect("login.jsp"); return; }

    List<Map<String, Object>> envelopeDb = (List<Map<String, Object>>) application.getAttribute("ENVELOPE_DB");
    Map<String, Object> targetEnvelope = null;

    if (envelopeDb != null) {
        for (Map<String, Object> env : envelopeDb) {
            if (letterId.equals(env.get("id"))) {
                targetEnvelope = env;
                break;
            }
        }
    }

    if (targetEnvelope == null) {
        out.println("<script>alert('해당 편지를 찾을 수 없습니다.'); location.href='workspace.jsp';</script>");
        return;
    }

    String sender = (String) targetEnvelope.get("sender");
    String receiver = (String) targetEnvelope.get("receiver");
    String decryptedMessage = "";

    // 서버 사이드 권한(수신자) 2차 검증
    if (!currentUser.equals(receiver)) {
         out.println("<script>alert('비정상적 접근입니다. 본인의 편지만 열람할 수 있습니다.'); location.href='workspace.jsp';</script>");
         return;
    }

    try {
        // 1. 수신자(본인)의 RSA 개인키 로드
        String keyDirPath = application.getRealPath("/WEB-INF/keys");
        File priKeyFile = new File(keyDirPath, currentUser + "_private.key");
        
        PrivateKey privateKey;
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(priKeyFile))) {
            privateKey = (PrivateKey) ois.readObject();
        }

        // 2. Base64로 인코딩된 데이터 디코딩
        byte[] encryptedAesKey = Base64.getDecoder().decode((String) targetEnvelope.get("encryptedAesKey"));
        byte[] encryptedContent = Base64.getDecoder().decode((String) targetEnvelope.get("encryptedContent"));
        byte[] iv = Base64.getDecoder().decode((String) targetEnvelope.get("iv"));

        // 3. 전자봉투 해독: RSA 개인키로 암호화된 AES 키를 복구
        Cipher rsaCipher = Cipher.getInstance("RSA");
        rsaCipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedAesKeyBytes = rsaCipher.doFinal(encryptedAesKey);
        SecretKey aesKey = new SecretKeySpec(decryptedAesKeyBytes, "AES");

        // 4. 본문 복호화: 복구된 AES 키와 IV를 사용하여 원문 해독
        Cipher aesCipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        IvParameterSpec ivSpec = new IvParameterSpec(iv);
        aesCipher.init(Cipher.DECRYPT_MODE, aesKey, ivSpec);
        byte[] decryptedBytes = aesCipher.doFinal(encryptedContent);
        
        // 원문 추출 및 XSS(크로스 사이트 스크립팅) 방어를 위한 태그 이스케이프 치환
        decryptedMessage = new String(decryptedBytes, "UTF-8")
                            .replace("<", "&lt;")
                            .replace(">", "&gt;");

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('복호화에 실패했습니다. 키가 불일치하거나 데이터가 손상되었습니다.'); location.href='workspace.jsp';</script>");
        return;
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비밀 편지 - 복호화된 편지 읽기</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <div class="header-flex">
            <h2 class="section-title">전자봉투 복호화 성공</h2>
            <button type="button" class="btn-logout" onclick="location.href='logout.jsp'">로그아웃</button>
        </div>
        
        <div class="letter-meta">
            <span><strong>From.</strong> <%= sender %></span>
            <span><strong>To.</strong> <%= receiver %></span>
        </div>
        
        <div class="letter-content-box"><%= decryptedMessage %></div>
        
        <div class="btn-group">
            <a href="workspace.jsp" class="btn btn-secondary">작업 공간으로 돌아가기</a>
        </div>
    </div>
</body>
</html>