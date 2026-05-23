package no_security;

import java.io.Serializable;

public class User implements Serializable {
	private static final long serialVersionUID = 1L;
	// 귀찮기도 하고 일부러 퍼블릭으로 선언
	public String userId;
	public String userPw;

	public User(String id, String pw) {
        this.userId = id;
        this.userPw = pw;
    }
}
