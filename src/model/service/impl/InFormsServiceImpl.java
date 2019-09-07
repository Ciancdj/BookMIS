package model.service.impl;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.mapper.InFormsMapper;
import model.pojo.InForms;
import model.service.InFormsService;

@Service("InFormsServiceImpl")
@MapperScan("model.mapper")
public class InFormsServiceImpl implements InFormsService{
	@Autowired
	InFormsMapper informsMapper;
	
	public List<InForms> list(int bookid) {
		return informsMapper.listAll(bookid);
	}
	
	public boolean state(String BookCode) {
		return (informsMapper.state(BookCode)).getBookstate() == 0;
	}
}
