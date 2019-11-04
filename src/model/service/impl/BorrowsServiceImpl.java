package model.service.impl;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.mapper.BorrowsMapper;
import model.pojo.Borrows;
import model.service.BorrowsService;

@Service("BorrowsServiceImpl")
@MapperScan("model.mapper")
public class BorrowsServiceImpl implements BorrowsService {
	@Autowired
	BorrowsMapper borrowsMapper;
	
	@Override
	public List<Borrows> list(int userid){
		return borrowsMapper.get(userid);
	}
	
	public List<Borrows> Adminlist(){
		return borrowsMapper.adminList();
	}

	public List<Borrows> AdminlistByAccount(String userAccount){
		return borrowsMapper.adminListByAccount(userAccount);
	}
	public List<Borrows> AdminlistByBookCode(String bookCode){
		return borrowsMapper.adminListByBookCode(bookCode);
	}
}
