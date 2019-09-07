package model.service;

import java.util.List;
import model.pojo.Users;

public interface UsersService {
	List<Users> list();
	Users get(String account);
	void add(Users user);
	void delete(int id);
	void updataInform(Users user);
	void updataPassword(Users user);
	boolean checkPassword(int id, String input);
}
