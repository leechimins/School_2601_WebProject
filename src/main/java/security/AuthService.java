package security;

import java.security.NoSuchAlgorithmException;
import no_security.User;
import no_security.UserDB;

public class AuthService {
	private UserDB db;
	
	private AuthService() {
		this.db = UserDB.getInstance();
	}
	private static AuthService instance = new AuthService();
	public static AuthService getInstance() {
		return instance;
	}
	
	public boolean login(String id, String pw) throws NoSuchAlgorithmException {
		if (db.containsUser(id) == false) {
			return false;
		}

		User user = db.getUser(id);
		if (user.userPw.equals(pw)) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public boolean register(String id, String pw, String path) throws NoSuchAlgorithmException {
		KeyManager keyManager = KeyManager.getInstance();
		if (keyManager.generateAndSaveKeyPair(id, path)) {
			db.addUser(new User(id, pw));
			return true;
		}
		return false;
	}
	
}