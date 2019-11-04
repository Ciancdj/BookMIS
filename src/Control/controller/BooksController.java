package Control.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.pojo.Books;
import model.pojo.Borrows;
import model.pojo.InForms;
import model.pojo.TemporaryBook;
import model.pojo.Users;
import model.service.BooksService;
import model.service.BorrowsService;
import model.service.InFormsService;

@Controller
public class BooksController {
	@Autowired
	BooksService booksService;
	@Autowired
	InFormsService informsService;
	@Autowired
	BorrowsService borrowsService;

	@RequestMapping(value="/books")
	public ModelAndView GetBook(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int BookID = Integer.parseInt(request.getParameter("BookId"));
		Books book = booksService.get(BookID);
		String BookURL = "books?BookId="+request.getParameter("BookId");
		List<InForms> Booklist = informsService.list(BookID);
//		for(InForms i : book.getBookinfroms()) {
//			System.out.println(i.getBookcode());
//		}
		if(book.getBookintro().equals("")) {
			book.setBookintro("本书暂未添加书籍介绍");
		}
		mav.addObject("Book", book);
		mav.addObject("Booklist", Booklist);
		mav.addObject("BookURL",BookURL);
		mav.setViewName("Detail");
		return mav;
	}

	@RequestMapping(value="/returnBook")
	public ModelAndView returnBook(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String bookcode = req.getParameter("bookcode");
		String id = req.getParameter("userid");
		// System.out.println(id);
		int userid = Integer.parseInt(id);
		booksService.returnBook(bookcode, userid);
		mav.setViewName("redirect:/MyBorrow");
		return mav;
	}

	@RequestMapping(value="/borrowBook")
	public ModelAndView borrowBook(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String BookCode = req.getParameter("bookcode");
		String url = req.getParameter("returnUrl");
		String BookName = req.getParameter("bookname");
		String BookAuthor = req.getParameter("bookauthor");
		HttpSession session = req.getSession();
		Users user= (Users) session.getAttribute("holdingUsers");
		if(user == null) {
			mav.setViewName("redirect:/login");
			mav.addObject("msg1", "检测到未登陆，请先登陆");
			return mav;
		}
		int userID = user.getId();
		List<TemporaryBook> TempList = (List<TemporaryBook>) session.getAttribute("TempList");
		for(int i = 0; i < TempList.size(); i++) {
			TemporaryBook b = TempList.get(i);
			if(b.getBookcode().equals(BookCode)) {
				session.setAttribute("TempNum", ((int)session.getAttribute("TempNum") - 1));
				TempList.remove(i);
				break;
			}
		}
		Calendar now = Calendar.getInstance();
		Borrows tem = new Borrows();
		tem.setBookcode(BookCode);
		tem.setBookname(BookName);
		tem.setBookauthor(BookAuthor);
		tem.setUserid(userID);
		tem.setBorrowerdate(new Date(now.getTimeInMillis()));
		List<Borrows> success = new ArrayList<Borrows>();
		List<Borrows> lose = new ArrayList<Borrows>();
		if(informsService.state(BookCode)) {
			success.add(tem);
			booksService.borrowBook(tem);
		} else {
			lose.add(tem);
		}
		mav.addObject("successBorrow", success);
		mav.addObject("loseBorrow", lose);
		mav.addObject("returnURL", url);
		session.setAttribute("TempList", TempList);
		mav.setViewName("SuccessBorrow");
		return mav;
	}

	@RequestMapping(value="/borrowAllBook")
	public ModelAndView borrowAllBook(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		Users user= (Users) session.getAttribute("holdingUsers");
		if(user == null) {
			mav.setViewName("redirect:/login");
			mav.addObject("msg1", "检测到未登陆，请先登陆");
			return mav;
		}
		int userID = user.getId();
		List<TemporaryBook> TempList = (List<TemporaryBook>) session.getAttribute("TempList");
		String url = req.getParameter("returnUrl");
		List<Borrows> success = new ArrayList<Borrows>();
		List<Borrows> lose = new ArrayList<Borrows>();
		for(TemporaryBook tem : TempList) {
			Calendar now = Calendar.getInstance();
			Borrows temp = new Borrows();
			temp.setBookcode(tem.getBookcode());
			temp.setBookname(tem.getBookname());
			temp.setBookauthor(tem.getBookauthor());
			temp.setUserid(userID);
			temp.setBorrowerdate(new Date(now.getTimeInMillis()));
			if(informsService.state(tem.getBookcode())) {
				success.add(temp);
				booksService.borrowBook(temp);
			} else {
				lose.add(temp);
			}
		}
		mav.addObject("successBorrow", success);
		mav.addObject("loseBorrow", lose);
		mav.addObject("returnURL", url);
		TempList = new ArrayList<TemporaryBook>();
		session.setAttribute("TempList", TempList);
		session.setAttribute("TempNum", 0);
		mav.setViewName("SuccessBorrow");
		return mav;
	}

	@RequestMapping(value="/MyBorrow")
	public ModelAndView borrowList(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		Users user= (Users) session.getAttribute("holdingUsers");
		if(user == null) {
			mav.setViewName("redirect:/login");
			mav.addObject("msg1", "检测到未登陆，请先登陆");
			return mav;
		}
		List<Borrows> myborrrows = borrowsService.list(user.getId());
		System.out.println(myborrrows.size());
		mav.addObject("sizeBorrow", myborrrows.size());
		mav.addObject("myborrow", myborrrows);
		mav.setViewName("BorrowPage");
		return mav;
	}

}
