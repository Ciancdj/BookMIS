package model.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import model.pojo.Borrows;

@Repository
public interface BorrowsMapper {
	public List<Borrows> get(int userid);
	public List<Borrows> adminList();
}
