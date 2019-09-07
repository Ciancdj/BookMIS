package model.service.impl;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.mapper.UsersMapper;
import model.pojo.Users;
import model.service.UsersService;

@Service("UsersServiceImpl")
@MapperScan("model.mapper")
public class UsersServiceImpl implements UsersService{
	@Autowired
	UsersMapper usersMapper;
	
	@Override
	public List<Users> list(){
		return usersMapper.list();
	}
	
	@Override
	public Users get(String account) {
		return usersMapper.get(account);
	}
	
	@Override
	public void add(Users user) {
		usersMapper.add(user);
		int id = user.getId();
		user.setId(id);
		usersMapper.addinfor(user);
	}
	
	@Override
	public void delete(int id) {
		usersMapper.delete(id);
		usersMapper.deleteinfor(id);
	}
	
	@Override
	public void updataInform(Users user) {
		usersMapper.updateInform(user);
	}
	
	@Override
	public void updataPassword(Users user) {
		usersMapper.updatePassword(user);
	}
	
	@Override
	public boolean checkPassword(int id, String input) {
		return usersMapper.checkPassword(id).equals(input);
	}

}
