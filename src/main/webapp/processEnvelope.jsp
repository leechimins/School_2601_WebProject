<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.io.*, java.security.*, javax.crypto.*, javax.crypto.spec.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    String sender = (String) session.getAttribute("userId");
    String receiver = request.getParameter("toUser");
    String content = request.getParameter("content");

    if (sender == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    try {
        // 1. 수신자의 RSA 공개키 로드
        String keyDirPath = application.getRealPath("/WEB-INF/keys");
        File pubKeyFile = new File(keyDirPath, receiver + "_public.key");
        if (!pubKeyFile.exists()) {
            out.println("<script>alert('해당 수신자의 공개키를 찾을 수 없습니다.'); history.back();</script>");
            return;
        }
        
        // 자원동반-try문을 이용한 객체 읽기
        PublicKey publicKey;
        try (ObjectInputStream ois = new ObjectInputStream(new FileInputStream(pubKeyFile))) {
            publicKey = (PublicKey) ois.readObject();
        }

        // 2. 일회성 AES 대칭키 생성
        KeyGenerator keyGen = KeyGenerator.getInstance("AES");
        keyGen.init(128);
        SecretKey aesKey = keyGen.generateKey();

        // 3. 평문 메시지 암호화 (AES/CBC/PKCS5Padding) 및 IV 추출
        Cipher aesCipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        aesCipher.init(Cipher.ENCRYPT_MODE, aesKey);
        byte[] encryptedContent = aesCipher.doFinal(content.getBytes("UTF-8"));
        byte[] iv = aesCipher.getIV();

        // 4. 대칭키 암호화 (전자봉투 핵심): 생성한 AES 키를 수신자의 RSA 공개키로 암호화
        Cipher rsaCipher = Cipher.getInstance("RSA");
        rsaCipher.init(Cipher.ENCRYPT_MODE, publicKey);
        byte[] encryptedAesKey = rsaCipher.doFinal(aesKey.getEncoded());

        // 5. In-Memory DB에 전자봉투 저장 (Base64 인코딩)
        List<Map<String, Object>> envelopeDb = (List<Map<String, Object>>) application.getAttribute("ENVELOPE_DB");
        if (envelopeDb == null) {
            envelopeDb = new ArrayList<>();
            application.setAttribute("ENVELOPE_DB", envelopeDb);
        }

        Map<String, Object> envelope = new HashMap<>();
        envelope.put("id", UUID.randomUUID().toString());
        envelope.put("sender", sender);
        envelope.put("receiver", receiver);
        envelope.put("encryptedContent", Base64.getEncoder().encodeToString(encryptedContent));
        envelope.put("encryptedAesKey", Base64.getEncoder().encodeToString(encryptedAesKey));
        envelope.put("iv", Base64.getEncoder().encodeToString(iv));

        envelopeDb.add(0, envelope); // 최신 글이 위로 오도록 추가

        response.sendRedirect("workspace.jsp");

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('전자봉투 생성 및 암호화 중 서버 오류가 발생했습니다.'); history.back();</script>");
    }
%>