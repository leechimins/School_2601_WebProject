package security;

import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;

import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

import no_security.UserDB;

public class KeyManager {
	
	private KeyManager() { }
	private static KeyManager instance = new KeyManager();
	public static KeyManager getInstance() {
		return instance;
	}

    private static final String ALGORITHM_S = "AES";
    private static final int SIZE_S = 128;
    private static final String ALGORITHM_P = "RSA";
    private static final int SIZE_P = 1024;
    
    public boolean generateAndSaveKeyPair(String userId) throws NoSuchAlgorithmException {
    	
    	// 1-1. AES 키 쌍 생성 (대칭키)
    	KeyGenerator keyGen1 = KeyGenerator.getInstance(ALGORITHM_S);
    	keyGen1.init(SIZE_S);
    	SecretKey secretKey = keyGen1.generateKey();
    	
		// 1-2. RSA 키 쌍 생성 (비대칭키)
		KeyPairGenerator keyGen2 = KeyPairGenerator.getInstance(ALGORITHM_P);
		keyGen2.initialize(SIZE_P);
		KeyPair keyPair = keyGen2.generateKeyPair();
		
		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();
		
		// 2. 키를 파일로 저장 (직렬화 활용)
		// 자원동반-try문 (try-with-resources) 사용 - 코딩 가이드 준수 (규칙 43)
		String secKeyPath = "/WEB-INF/keys/" + userId + "_secret.key";
		// 시작 경로는 jsp에서 application.getRealPath()로 받아 매개변수로 넘겨주는게 더 좋긴하다.
		String pubKeyPath = "/WEB-INF/keys/" + userId + "_public.key";
		String priKeyPath = "/WEB-INF/keys/" + userId + "_private.key";
		
		try (FileOutputStream fosSec = new FileOutputStream(secKeyPath);
		     ObjectOutputStream oosSec = new ObjectOutputStream(fosSec)) {
			oosSec.writeObject(secKeyPath);
		} catch(Exception e) {
			e.printStackTrace();
			// 여기를 사용자 정의 예외로 수정해도 좋을 듯?
		}
		
		try (FileOutputStream fosPub = new FileOutputStream(pubKeyPath);
		     ObjectOutputStream oosPub = new ObjectOutputStream(fosPub)) {
		    oosPub.writeObject(publicKey);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		try (FileOutputStream fosPri = new FileOutputStream(priKeyPath);
		     ObjectOutputStream oosPri = new ObjectOutputStream(fosPri)) {
		    oosPri.writeObject(privateKey);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return true;
    }
}