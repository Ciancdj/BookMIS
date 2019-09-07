package model.service;

import java.util.List;
import model.pojo.Lists;


public interface ListsService {
	List<Lists> list(String method, String condition);
}
