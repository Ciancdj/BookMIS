package Control.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.pojo.TemporaryBook;
import model.pojo.Users;
import model.service.UsersService;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Controller
public class UsersController {
	@Autowired
	UsersService usersService;

	@RequestMapping(value="/login")
	public ModelAndView LoginView() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Login");
		return mav;
	}

	@RequestMapping(value="/listUsers")
	public ModelAndView listUsers() {
		ModelAndView mav = new ModelAndView();
		List<Users> users = usersService.list();
		mav.addObject("users", users);
		mav.setViewName("listUsers");
		return mav;
	}

	@RequestMapping(value="/login/Testing")
	public ModelAndView LoginTesting(Users input, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg1", "");
		mav.addObject("msg2", "");
		String account = input.getAccount();
		String password = input.getPassword();
		// System.out.println(account + "  " + password);
		Users user = usersService.get(account);
		if(user == null) {		// 没有通过姓名找到对应项
			mav.addObject("msg1", "该账号不存在，清先注册");
		}
		if(user != null && password == null) {
			mav.addObject("msg2", "密码不能为空");
		}
		password = MD5(password);
		if(user != null && !user.getPassword().equals(password)) {
			mav.addObject("msg2", "密码错误，请重新输出");
		}
		if(user != null && user.getPassword().equals(password)){
			mav.addObject("user", user);
			HttpSession session = request.getSession(true);
			session.setAttribute("holdingUsers", user);
			int TempNum = 0;
			List<TemporaryBook> TempList = new ArrayList<TemporaryBook>();
			session.setAttribute("TempNum", TempNum);
			session.setAttribute("TempList", TempList);
			session.setAttribute("loginErrorTime", 0);
			mav.setViewName("SuccessLogin");
		} else {
			mav.setViewName("redirect:/login");
		}
		return mav;
	}

	@RequestMapping(value="/register")
	public String RegisterView() {
		return "Register";
	}

	@RequestMapping(value="/login/outlogin")
	public ModelAndView OutLogin(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:/search");
		HttpSession session = request.getSession();
		session.setAttribute("holdingUsers", null);
		return mav;
	}

	@RequestMapping(value="/register/Testing")
	public ModelAndView RegisterTesting(Users input, String lastname, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg1", "");
		mav.addObject("msg2", "");
		mav.addObject("msg3", "");
		mav.addObject("msg4", "");
		mav.addObject("msg5", "");
		boolean isNull = false;
		if(lastname == null) {
			mav.addObject("msg2", "姓名为空，请重新填写");
			isNull = true;
		}
		if(input.getUsersname() == null) {
			mav.addObject("msg1", "姓氏为空，请重新填写");
			isNull = true;
		}
		if(input.getAccount() == null) {
			mav.addObject("msg3", "账户为空，请重新填写");
			isNull = true;
		}
		if(input.getPassword() == null) {
			mav.addObject("msg4", "密码为空，请重新填写");
			isNull = true;
		}
		if(input.getUsersphone() == null) {
			mav.addObject("msg5", "电话号码为空，请重新填写");
			isNull = true;
		}
		if(isNull) {
			mav.setViewName("redirect:/register");
			return mav;
		}
		input.setUsersname(input.getUsersname() + lastname);
		Users users = usersService.get(input.getAccount());
		if (users != null) {
			mav.addObject("msg3", "该账户已被注册，请重新填写");
			mav.setViewName("redirect:/register");
			return mav;
		}
		input.setPower(3);
		input.setPassword(MD5(input.getPassword()));
		usersService.add(input);
		HttpSession session = request.getSession(true);
		session.setAttribute("holdingUsers", input);
		int TempNum = 0;
		List<TemporaryBook> TempList = new ArrayList<TemporaryBook>();
		session.setAttribute("TempNum", TempNum);
		session.setAttribute("TempList", TempList);
		session.setAttribute("loginErrorTime", 0);
		mav.setViewName("SuccessRegister");
		return mav;
	}

	private String MD5(String input) {
		char[] chars = new char[] { '0', '1', '2', '3', '4', '5',
				'6', '7' , '8', '9', 'A', 'B', 'C', 'D', 'E','F' };
		StringBuffer output = null;
		try {
			MessageDigest md5 = MessageDigest.getInstance("md5");
			byte[] b = input.getBytes();
			byte[] digest = md5.digest(b);
			output = new StringBuffer();
			for (byte bb : digest) {
				output.append(chars[(bb >> 4) & 15]);
				output.append(chars[bb & 15]);
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return output.toString();
	}

	@RequestMapping(value="/InformChange")
	public ModelAndView ChangeInform(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("InformInstall");
		return mav;
	}

	@RequestMapping(value="/InformChange/input")
	public ModelAndView ChangeInformInput(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("ReturnPage");
		String changename = req.getParameter("changename");
		String changephone = req.getParameter("changephone");
		String nowchangename = req.getParameter("nowchangename");
		String nowchangephone = req.getParameter("nowchangephone");
		if((changename.equals("") && changephone.equals("")) || (changename == null && changephone == null)) {
			mav.addObject("returnInformation", "信息修改失败, 内容两处都为空，将返回我的图书馆页面");
			mav.addObject("returnUrl", "../MyLibrary");
			return mav;
		}
		if(changename == null || changename.equals("")) {
			changename = nowchangename;
		}
		if(changephone == null || changephone.equals("")) {
			changephone = nowchangephone;
		}
		int id = Integer.parseInt(req.getParameter("id"));
		Users user = new Users();
		user.setId(id);
		user.setUsersname(changename);
		user.setUsersphone(changephone);
		usersService.updataInform(user);
		mav.addObject("returnInformation", "信息修改成功,将退出登陆并返回首页");
		mav.addObject("returnUrl", "../login/outlogin");
		return mav;
	}

	@RequestMapping(value="/changePassword")
	public ModelAndView ChangePassword(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("PasswordInstall");
		return mav;
	}

	@RequestMapping(value="/changePassword/input")
	public ModelAndView ChangePasswordInput(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("ReturnPage");
		String nowPassword = req.getParameter("nowPassword");
		nowPassword = MD5(nowPassword);
		int id = Integer.parseInt(req.getParameter("id"));
		if (!usersService.checkPassword(id, nowPassword)) {
			mav.addObject("returnInformation", "密码错误，将返回密码修改界面");
			mav.addObject("returnUrl", "../changePassword");
			return mav;
		}
		String changePassword = req.getParameter("changePassword");
		changePassword = MD5(changePassword);
		Users user = new Users();
		user.setId(id);
		user.setPassword(changePassword);
		usersService.updataPassword(user);
		mav.addObject("returnInformation", "密码修改成功，将退出登陆并返回首页");
		mav.addObject("returnUrl", "../login/outlogin");
		return mav;
	}

//	@RequestMapping(value="/login/success")
//	public ModelAndView Loginsuccess(Users user, HttpServletRequest request) {
//		ModelAndView mav = new ModelAndView();
//		Users u = (Users) request.getAttribute("user");
//		System.out.println(u == null);
//		System.out.println(user.getAccount() + " + " + user.getPassword());
//		System.out.println("---------------------");
//		mav.setViewName("SuccessLogin");
//		return mav;
//	}


//	@RequestMapping(value="/register/success")
//	public ModelAndView Registersuccess(Users user, HttpServletRequest request) {
//		ModelAndView mav = new ModelAndView();
//		HttpSession session = request.getSession();
//		session.setAttribute("holdingUsers", user);
//		mav.setViewName("SuccessRegister");
//		return mav;
//	}
}
