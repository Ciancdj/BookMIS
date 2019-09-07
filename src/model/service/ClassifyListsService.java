package model.service;

import java.util.List;

import model.pojo.ClassifyLists;

public interface ClassifyListsService {
	List<ClassifyLists> listAll();
	List<ClassifyLists> listSon(String parentID);
}
