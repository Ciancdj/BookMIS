package model.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import model.pojo.ClassifyLists;

@Repository

public interface ClassifyListsMapper {
	public List<ClassifyLists> listAll();
	public List<ClassifyLists> listSon(String parentid);
}
