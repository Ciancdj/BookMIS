package Control.controller;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
			mav.addObject("msg1", "ºÏ≤‚µΩŒ¥µ«¬Ω£¨«Îœ»µ«¬Ω");
			return mav;
		}
		if (users.getPower() > 2) {
			mav.setViewName("redirect:/login");
			mav.addObject("msg1", "ºÏ≤‚∑«π‹¿Ì‘±’À∫≈£¨«Î«–ªª’À∫≈");
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
			mav.addObject("msg1", "ºÏ≤‚µΩŒ¥µ«¬Ω£¨«Îœ»µ«¬Ω");
			return mav;
		}
		if (users.getPower() > 2) {
			mav.setViewName("redirect:/login");
			mav.addObject("msg1", "ºÏ≤‚∑«π‹¿Ì‘±’À∫≈£¨«Î«–ªª’À∫≈");
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
			mav.addObject("Error", "√‹‘ø ‰»Î¥ÌŒÛ¥Œ ˝ : " + loginErrorTime + "(»Ù «¥ÌŒÛ¥Œ ˝3¥Œ‘Ú«ø÷∆’À∫≈œ¬œﬂ)");
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
			mav.addObject("msg1", "ºÏ≤‚µΩŒ¥µ«¬Ω£¨«Îœ»µ«¬Ω");
			return mav;
		}
		if (users.getPower() > 2) {
			mav.setViewName("redirect:/login");
			mav.addObject("msg1", "ºÏ≤‚∑«π‹¿Ì‘±’À∫≈£¨«Î«–ªª’À∫≈");
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
			mav.addObject("msg1", "ºÏ≤‚µΩŒ¥µ«¬Ω£¨«Îœ»µ«¬Ω");
			return mav;
		}
		if (users.getPower() > 2) {
			mav.setViewName("redirect:/login");
			mav.addObject("msg1", "ºÏ≤‚∑«π‹¿Ì‘±’À∫≈£¨«Î«–ªª’À∫≈");
			return mav;
		}
		List<Users> list = usersService.list();
		mav.addObject("allUsers", list);
		mav.setViewName("AdminAccountPage");
		return mav;
	}
	
}
