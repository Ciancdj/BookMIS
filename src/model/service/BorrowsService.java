package model.service;

import java.util.List;

import model.pojo.Borrows;

public interface BorrowsService {
	List<Borrows> list(int userid);
	List<Borrows> Adminlist();
}
