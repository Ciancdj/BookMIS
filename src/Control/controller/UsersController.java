package Control.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.encryption.Decode;
import model.encryption.EncryKey;
import model.pojo.Borrows;
import model.service.BorrowsService;
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
	@Autowired
	BorrowsService borrowsService;

	@RequestMapping(value="/login")
	public ModelAndView LoginView() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("exponent", EncryKey.getKu().getE().toString());
		mav.addObject("modulus", EncryKey.getKu().getN().toString());
		mav.setViewName("Login");
		return mav;
	}

	@RequestMapping(value="/login/Testing")
	public ModelAndView LoginTesting(Users input, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/login");
		mav.addObject("msg1", "");
		mav.addObject("msg2", "");
		String account = input.getAccount();
		String password = input.getPassword();
		System.out.println(account + "  " + Decode.decode(password));
		Users user = usersService.get(account);
		if(user == null) {		// 没有通过姓名找到对应项
			mav.addObject("msg1", "该账号不存在，清先注册");
		}
		if(user != null && password == null) {
			mav.addObject("msg2", "密码不能为空");
		}
		password = MD5(Decode.decode(password));
		if(user != null && !user.getPassword().equals(password)) {
			mav.addObject("msg2", "密码错误，请重新输出");
		}
		if(user != null && user.getPassword().equals(password)){
			if(user.getState() == 0){
				mav.addObject("msg2", "该账户已经被冻结，请联系管理员000");
				return mav;
			}
			// 以借阅书籍显示
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
			HttpSession session = request.getSession(true);
			if(overTimeNum>0){
//				System.out.println("overTimeNum " + overTimeNum);
				mav.addObject("overTimeBookInformation","当前用户共借阅"+myborrrows.size()+
						"本书 有" + overTimeNum + "本书将要过期，请尽快归还，如果未在规定时间内归还，则将会冻结该账户");
			}
			String tempSessionId = UsersMapHolding.USR_SESSION.get(user.getAccount());
			// 确认是否有其他账号已经登陆
			if(tempSessionId!=null){
				// 判断已登录得账户是否超时
				if(System.currentTimeMillis() -
						UsersMapHolding.SESSIONID_USR.get(tempSessionId).getLastActivityTime() < (5*60*1000)){
					mav.addObject("msg2", "账户已经被登陆");
					return mav;
				}
			}
			UsersMapHolding.USR_SESSION.put(user.getAccount(),session.getId());
			UsersMapHolding.SESSIONID_USR.put(session.getId(), user);
			user.updateLastActivityTime();
			session.setAttribute("holdingUsers", user);
			int TempNum = 0;
			List<TemporaryBook> TempList = new ArrayList<TemporaryBook>();
			session.setAttribute("TempNum", TempNum);
			session.setAttribute("TempList", TempList);
			session.setAttribute("loginErrorTime", 0);
			mav.setViewName("SuccessLogin");
		}
		return mav;
	}

	@RequestMapping(value="/register")
	public ModelAndView RegisterView() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("exponent", EncryKey.getKu().getE().toString());
		mav.addObject("modulus", EncryKey.getKu().getN().toString());
		mav.setViewName("Register");
		return mav;
	}

	@RequestMapping(value="/login/outlogin")
	public ModelAndView OutLogin(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:/search");
		HttpSession session = request.getSession();
		Users users = (Users)session.getAttribute("holdingUsers");
		try{
			judgeAccountNormal(request);
		} catch (ErrorInformationException e){
			mav.addObject("msg1", e.getMessage());
			return errorOutLogin(mav, request);
		}
		UsersMapHolding.USR_SESSION.remove(users.getAccount());
		UsersMapHolding.SESSIONID_USR.remove(session.getId());
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
		System.out.println(input.getPassword());
		System.out.println(input.getAccount() + "  " + Decode.decode(input.getPassword()));
		// 设置密码
		input.setPassword(MD5(Decode.decode(input.getPassword())));
		usersService.add(input);
		HttpSession session = request.getSession(true);
		UsersMapHolding.USR_SESSION.put(input.getAccount(),session.getId());
		UsersMapHolding.SESSIONID_USR.put(session.getId(), input);
		input.updateLastActivityTime();
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
		try{
			judgeAccountNormal(req);
		} catch (ErrorInformationException e){
			mav.addObject("msg1", e.getMessage());
			return errorOutLogin(mav, req);
		}
		return mav;
	}

	@RequestMapping(value="/InformChange/input")
	public ModelAndView ChangeInformInput(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("ReturnPage");
		try{
			judgeAccountNormal(req);
		} catch (ErrorInformationException e){
			mav.addObject("msg1", e.getMessage());
			return errorOutLogin(mav, req);
		}
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
		try{
			judgeAccountNormal(req);
		} catch (ErrorInformationException e){
			mav.addObject("msg1", e.getMessage());
			return errorOutLogin(mav, req);
		}
		mav.addObject("exponent", EncryKey.getKu().getE().toString());
		mav.addObject("modulus", EncryKey.getKu().getN().toString());
		return mav;
	}

	@RequestMapping(value="/changePassword/input")
	public ModelAndView ChangePasswordInput(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("ReturnPage");
		try{
			judgeAccountNormal(req);
		} catch (ErrorInformationException e){
			mav.addObject("msg1", e.getMessage());
			return errorOutLogin(mav, req);
		}
		String nowPassword = req.getParameter("nowPassword");
		nowPassword = MD5(Decode.decode(nowPassword));
		int id = Integer.parseInt(req.getParameter("id"));
		if (!usersService.checkPassword(id, nowPassword)) {
			mav.addObject("returnInformation", "密码错误，将返回密码修改界面");
			mav.addObject("returnUrl", "../changePassword");
			return mav;
		}
		String changePassword = req.getParameter("changePassword");
		changePassword = MD5(Decode.decode(changePassword));
		Users user = new Users();
		user.setId(id);
		user.setPassword(changePassword);
		usersService.updataPassword(user);
		System.out.println(nowPassword + " " + changePassword);
		mav.addObject("returnInformation", "密码修改成功，将退出登陆并返回首页");
		mav.addObject("returnUrl", "../login/outlogin");
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
		if(System.currentTimeMillis() - users.getLastActivityTime() >= (5*60*1000)){
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
