package Control.controller;

import java.nio.charset.Charset;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.service.impl.BorrowsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.pojo.Borrows;
import model.pojo.Users;
import model.service.BorrowsService;
import model.service.UsersService;

@Controller
public class AdminController {
	@Autowired
	UsersService usersService;
	@Autowired
	BorrowsService borrowsService;


	@RequestMapping(value="/adminlogin")
	public ModelAndView adminLogin(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		Users users = (Users) session.getAttribute("holdingUsers");
		if (users == null) {
			mav.setViewName("redirect:/login");
			mav.addObject("msg1", "检测到未登陆，请先登陆");
			return mav;
		}
		if (users.getPower() > 2) {
			mav.setViewName("redirect:/login");
			mav.addObject("msg1", "检测非管理员账号，请切换账号");
			return mav;
		}
		mav.setViewName("AdminLogin");
		return mav;
	}

	@RequestMapping(value="/adminloginTest")
	public ModelAndView adminLoginTest(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		String accessPassword = "0000";
		Users users = (Users) session.getAttribute("holdingUsers");
		if (users == null) {
			mav.setViewName("redirect:/login");
			mav.addObject("msg1", "检测到未登陆，请先登陆");
			return mav;
		}
		if (users.getPower() > 2) {
			mav.setViewName("redirect:/login");
			mav.addObject("msg1", "检测非管理员账号，请切换账号");
			return mav;
		}
		String input = req.getParameter("input");
		if(!accessPassword.equals(input)) {
			int loginErrorTime = (int) session.getAttribute("loginErrorTime");
			loginErrorTime += 1;
			if(loginErrorTime > 3) {
				mav.setViewName("redirect:/login/outlogin");
				return mav;
			}
			session.setAttribute("loginErrorTime", loginErrorTime);
			mav.addObject("Error", "密钥输入错误次数 : " + loginErrorTime + "(若是错误次数3次则强制账号下线)");
			mav.setViewName("AdminLogin");
			return mav;
		}
		mav.setViewName("AdminIndex");
		return mav;
	}

	@RequestMapping(value="/adminBook")
	public ModelAndView adminBook(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		Users users = (Users) session.getAttribute("holdingUsers");
		if (users == null) {
			mav.setViewName("redirect:/login");
			mav.addObject("msg1", "检测到未登陆，请先登陆");
			return mav;
		}
		if (users.getPower() > 2) {
			mav.setViewName("redirect:/login");
			mav.addObject("msg1", "检测非管理员账号，请切换账号");
			return mav;
		}
		List<Borrows> allborrrows = borrowsService.Adminlist();
		Calendar now = Calendar.getInstance();
		Calendar cal = Calendar.getInstance();
		for(int index = 0; index < allborrrows.size(); index++) {
			Borrows judge = allborrrows.get(index);
			Date date = judge.getBorrowerdate();
			cal.setTime(date);
			judge.setOverstate(false);
			if(((now.getTimeInMillis() - cal.getTimeInMillis()) / (1000*60*60*24)) >= judge.getFreeday()){
				judge.setOverstate(true);
			}
			allborrrows.set(index, judge);
		}
		mav.addObject("allBorrows", allborrrows);
		mav.setViewName("AdminBookPage");
		return mav;
	}

	@RequestMapping(value="/adminAccount")
	public ModelAndView adminAccount(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		Users users = (Users) session.getAttribute("holdingUsers");
		if (users == null) {
			mav.setViewName("redirect:/login");
			mav.addObject("msg1", "检测到未登陆，请先登陆");
			return mav;
		}
		if (users.getPower() > 2) {
			mav.setViewName("redirect:/login");
			mav.addObject("msg1", "检测非管理员账号，请切换账号");
			return mav;
		}
		List<Users> list = usersService.list();
		mav.addObject("allUsers", list);
		mav.setViewName("AdminAccountPage");
		return mav;
	}

	@RequestMapping("/AdminBorrowPage")
	public ModelAndView toAdminBorrowPage(HttpServletRequest req){
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = req.getSession();
		String searchCode = (String)req.getParameter("searchBookCode");
		String searchAccount = (String)req.getParameter("searchAccount");
		List<Borrows> result = null;
//		System.out.println("书本编号:" + searchCode);
//		System.out.println("用户账号" + searchAccount);
		//优先级 书本编号搜索 > 账号搜索
		if(searchCode !=null && !searchCode.equals("")){
			//TODO 书本ID搜索
			result = borrowsService.AdminlistByBookCode(searchCode);
		}else if(searchAccount != null && !searchAccount.equals("")){
			//TODO 账号搜索
			result = borrowsService.AdminlistByAccount(searchAccount);
		}else{
			//TODO 默认
			result = borrowsService.Adminlist();
		}
		if(result != null){
			Calendar now = Calendar.getInstance();
			Calendar cal = Calendar.getInstance();
			for (Borrows single : result){
				single.setOverstate(false);
				Date borrowTime = single.getBorrowerdate();
				cal.setTime(borrowTime);
				if(((now.getTimeInMillis() - cal.getTimeInMillis()) / (1000*60*60*24)) >= single.getFreeday()){
					single.setOverstate(true);
				}
			}
		}
		modelAndView.addObject("AllBorrowList",result);
		modelAndView.setViewName("AdminBorrowPage");
		return modelAndView;
	}

}
