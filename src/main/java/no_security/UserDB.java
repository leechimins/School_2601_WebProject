package no_security;

import java.util.HashMap;

public class UserDB {
	private HashMap<String, User> users = new HashMap<>();

	private UserDB() { }
	private static UserDB instance = new UserDB();
	public static UserDB getInstance() {
		return instance;
	}
	
	public void addUser(User user) {
		users.put(user.userId, user);
	}
	
	public User getUser(String id) {
		return users.get(id);
	}
	
	public boolean containsUser(String id) {
		return users.containsKey(id);
	}
}
