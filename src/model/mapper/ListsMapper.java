package model.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import model.pojo.Lists;

@Repository
public interface ListsMapper {
	public List<Lists> searchByName(String searching);
	public List<Lists> searchBySonRegion(String region);
	public List<Lists> searchByParentRegion(String region);
	public List<Lists> searchByPress(String press);
}
