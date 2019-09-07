package model.service.impl;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.mapper.ClassifyListsMapper;
import model.pojo.ClassifyLists;
import model.service.ClassifyListsService;

@Service("ClassifyListsServceImpl")
@MapperScan("model.mapper")
public class ClassifyListsServceImpl implements ClassifyListsService {
	@Autowired
	ClassifyListsMapper classifyMapper;
	
	@Override
	public List<ClassifyLists> listAll(){
		return classifyMapper.listAll();
	}

	@Override
	public List<ClassifyLists> listSon(String parentID) {
		// TODO Auto-generated method stub
		return classifyMapper.listSon(parentID);
	}
}
