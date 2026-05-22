package security;

import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;

public class KeyManager {

    private static final String ALGORITHM = "RSA";
    private static final int KEY_SIZE = 2048; // 최소 2048비트 권장 (안전하지 않은 암호 알고리즘 사용 금지 규칙 반영)

    /**
     * 사용자의 RSA 키 쌍을 생성하고 파일로 저장합니다.
     * @param userId 사용자 ID
     * @param dirPath 키를 저장할 디렉토리 경로
     * @return 성공 여부
     */
    public boolean generateAndSaveKeyPair(String userId, String dirPath) {
        try {
            // 1. RSA 키 쌍 생성
            KeyPairGenerator keyGen = KeyPairGenerator.getInstance(ALGORITHM);
            keyGen.initialize(KEY_SIZE);
            KeyPair keyPair = keyGen.generateKeyPair();

            PublicKey publicKey = keyPair.getPublic();
            PrivateKey privateKey = keyPair.getPrivate();

            // 2. 키를 파일로 저장 (직렬화 활용)
            // 자원동반-try문 (try-with-resources) 사용 - 코딩 가이드 준수 (규칙 43)
            String pubKeyPath = dirPath + "/" + userId + "_public.key";
            String priKeyPath = dirPath + "/" + userId + "_private.key";

            try (FileOutputStream fosPub = new FileOutputStream(pubKeyPath);
                 ObjectOutputStream oosPub = new ObjectOutputStream(fosPub)) {
                oosPub.writeObject(publicKey);
            }

            try (FileOutputStream fosPri = new FileOutputStream(priKeyPath);
                 ObjectOutputStream oosPri = new ObjectOutputStream(fosPri)) {
                oosPri.writeObject(privateKey);
            }

            return true;

        } catch (Exception e) {
            e.printStackTrace(); // 실제 서비스에서는 로거(Logger)를 사용하여 안전하게 기록해야 함
            return false;
        }
    }
}