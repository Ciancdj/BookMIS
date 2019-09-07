package model.mapper;

import org.springframework.stereotype.Repository;

import model.pojo.Books;
import model.pojo.Borrows;
import model.pojo.Couple;

@Repository
public interface BooksMapper {
	public Books get(int bookid);
	public void update(Couple couple);
	public void add(Borrows couple);
	public void delete(Couple couple);
}
