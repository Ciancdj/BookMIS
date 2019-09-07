package model.service.impl;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.mapper.ListsMapper;
import model.pojo.Lists;
import model.service.ListsService;


@Service("ListsServiceImpl")
@MapperScan("model.mapper")
public class ListsServiceImpl implements ListsService{
	@Autowired
	ListsMapper listsMapper;
	
	public List<Lists> list(String method, String condition){
		if(method.equals("Name")) {
			return listsMapper.searchByName(condition);
		} else if(method.equals("PressSon")) {
			return listsMapper.searchBySonRegion(condition);
		} else if(method.equals("PressParent")) {
			return listsMapper.searchByParentRegion(condition);
		} else if(method.equals("Region")) {
			return listsMapper.searchByPress(condition);
		} else {
			return null;
		}
	}
	
	
	
}
