package model.mapper;

import java.util.List;
import org.springframework.stereotype.Repository;
import model.pojo.Users;

@Repository
public interface UsersMapper {
	public int add(Users user);
	public void addinfor(Users user);
	public void delete(int id);
	public void deleteinfor(int id);
	public Users get(String account);
	public List<Users> list();
	public void updateInform(Users user);
	public void updatePassword(Users user);
	public String checkPassword(int id);
}
