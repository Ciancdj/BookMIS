package Control.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.service.UsersService;
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
	UsersService usersService;
	@Autowired
	BooksService booksService;
	@Autowired
	InFormsService informsService;
	@Autowired
	BorrowsService borrowsService;

	@RequestMapping(value="/books")
	public ModelAndView GetBook(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		Users users = (Users)session.getAttribute("holdingUsers");
		if(users != null){
			try{
				judgeAccountNormal(request);
			} catch (ErrorInformationException e){
				accountDis(request);
			}
		}
		int BookID = Integer.parseInt(request.getParameter("BookId"));
		Books book = booksService.get(BookID);
		String BookURL = "books?BookId="+request.getParameter("BookId");
		List<InForms> Booklist = informsService.list(BookID);
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
		try{
			judgePowerOfAdmin(req);
		} catch (ErrorInformationException e){
			mav.addObject("msg1", e.getMessage());
			return errorOutLogin(mav, req);
		}
		int userid = Integer.parseInt(id);
		booksService.returnBook(bookcode, userid);
		mav.setViewName("redirect:/AdminBorrowPage");
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
		try{
			judgeAccountNormal(req);
		} catch (ErrorInformationException e){
			mav.addObject("msg1", e.getMessage());
			return errorOutLogin(mav, req);
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
		try{
			judgeAccountNormal(req);
		} catch (ErrorInformationException e){
			mav.addObject("msg1", e.getMessage());
			return errorOutLogin(mav, req);
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
		try{
			judgeAccountNormal(req);
		} catch (ErrorInformationException e){
			mav.addObject("msg1", e.getMessage());
			return errorOutLogin(mav, req);
		}
		List<Borrows> myborrrows = borrowsService.list(user.getId());
		Calendar cal = Calendar.getInstance();
		int overTimeNum = 0;
		for (Borrows single : myborrrows){
			cal.setTime(single.getBorrowerdate());
			// 借阅超时，冻结处理
			if(((System.currentTimeMillis() - cal.getTimeInMillis()) / (1000*60*60*24)) >= single.getFreeday()){
				usersService.updateState(user.getId(), 0);
				mav.addObject("msg2", "该账户已经被冻结，请联系管理员");
				return mav;
			}
			if((single.getFreeday()-(((System.currentTimeMillis() - cal.getTimeInMillis()) / (1000*60*60*24))) <= 5) &&
					(single.getFreeday()-(((System.currentTimeMillis() - cal.getTimeInMillis()) / (1000*60*60*24))) >= 0)){
				overTimeNum++;
			}
		}
		mav.addObject("user", user);
		if(overTimeNum>0){
			mav.addObject("overTimeBookInformation","当前用户共借阅"+myborrrows.size()+
					"本书 有" + overTimeNum + "本书将要过期，请尽快归还，如果未在规定时间内归还，则将会冻结该账户");
		}
		mav.addObject("sizeBorrow", myborrrows.size());
		mav.addObject("myborrow", myborrrows);
		mav.setViewName("BorrowPage");
		return mav;
	}

	/*
      @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
     */
	public boolean judgePowerOfAdmin(HttpServletRequest req) throws ErrorInformationException{
		if(!judgeAccountNormal(req)){
			return false;
		}
		HttpSession session = req.getSession();
		Users users = (Users) session.getAttribute("holdingUsers");
		if (users.getPower() > 2) {
			throw new ErrorInformationException("检测非管理员账号，请切换账号");
		}
		return true;
	}
	public boolean judgeAccountNormal(HttpServletRequest req) throws ErrorInformationException{
		HttpSession session = req.getSession();
		String sessionID = session.getId();
		Users users = (Users) session.getAttribute("holdingUsers");
		if (users == null) {
			throw new ErrorInformationException("检测到未登陆，请先登陆");
		}
		if(System.currentTimeMillis() - users.getLastActivityTime() >= (2*60*1000)){
			throw new ErrorInformationException("长时间未响应，请重新登陆");
		}
		Users tempUser = usersService.get(users.getAccount());
		if(tempUser == null){
			throw new ErrorInformationException("该账户已经被注销，请重新注册");
		} else if(tempUser.getState() == 0){
			throw new ErrorInformationException("该账户已经被冻结，请联系管理员");
		}
		users.updateLastActivityTime();
		session.setAttribute("holdingUsers",users);
		return true;
	}
	public ModelAndView errorOutLogin(ModelAndView mav, HttpServletRequest req){
		mav.setViewName("redirect:/login");
		accountDis(req);
		return mav;
	}
	public void accountDis(HttpServletRequest req){
		HttpSession session = req.getSession();
		Users users = (Users)session.getAttribute("holdingUsers");
		if(session.getId().equals(UsersMapHolding.USR_SESSION.get(users.getAccount()))){
			UsersMapHolding.USR_SESSION.remove(users.getAccount());
			UsersMapHolding.SESSIONID_USR.remove(session.getId());
		}
		session.setAttribute("holdingUsers", null);
	}
}
