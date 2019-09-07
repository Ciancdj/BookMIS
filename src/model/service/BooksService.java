package model.service;

import model.pojo.Books;
import model.pojo.Borrows;

public interface BooksService {
	Books get(int bookID);
	void borrowBook(Borrows tem);
	void returnBook(String BookCode, int userID);
}
