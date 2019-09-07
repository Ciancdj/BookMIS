package model.service.impl;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.mapper.BooksMapper;
import model.pojo.Books;
import model.pojo.Borrows;
import model.pojo.Couple;
import model.service.BooksService;

@Service("BooksServiceImpl")
@MapperScan("model.mapper")
public class BooksServiceImpl implements BooksService{
	@Autowired
	BooksMapper booksMapper;
	
	public Books get(int bookID) {
		return booksMapper.get(bookID);
	}
	
	public void borrowBook(Borrows tem) {
		booksMapper.update(new Couple(tem.getBookcode(), 1));
		booksMapper.add(tem);
	}
	
	public void returnBook(String BookCode, int userID) {
		booksMapper.update(new Couple(BookCode, 0));
		booksMapper.delete(new Couple(BookCode, userID));
	}
	
}
