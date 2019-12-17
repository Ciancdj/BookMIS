package Control.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.pojo.Users;
import model.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.mapper.ListsMapper;
import model.pojo.Couple;
import model.pojo.Lists;

import model.service.ListsService;


@Controller
public class ListsController {
	@Autowired
	UsersService usersService;
	@Autowired
	ListsService listsService;

	@RequestMapping(value="/result")
	public ModelAndView getResult(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = req.getSession();
		Users users = (Users)session.getAttribute("holdingUsers");
		if(users != null){
			try{
				judgeAccountNormal(req);
			} catch (ErrorInformationException e){
				accountDis(req);
			}
		}
		String way = req.getParameter("ways");
		String input = req.getParameter("input");
		if (way != null && input != null) {
			if(way.equals("任意词")) {
				way = "Name";
			} else if(way.equals("出版社")) {
				way = "Region";
			}
			mav.addObject("method", way);
			mav.addObject("input", input);
			mav.setViewName("Research");
			List<Lists> list = listsService.list(way, input);
			if(list == null)
				return mav;
			int len = list.size();
			mav.addObject("listLen", len);
			List<Couple> regionInfor = new ArrayList<Couple>();
			Map<String, String> mapregion = new HashMap<String, String>();
			List<Couple> positionInfor = new ArrayList<Couple>();
			Map<String, String> mapposition = new HashMap<String, String>();
			List<Couple> pressInfor = new ArrayList<Couple>();
			Map<String, String> mappress = new HashMap<String, String>();
			for(Lists alone: list) {
				// 记录分类词与分类数量
				String Sindex = mapregion.get(alone.getRegioname());
				int index = 0;
				if(Sindex == null) {
					index = regionInfor.size();
					regionInfor.add(new Couple(alone.getRegioname(), 1));
					mapregion.put(alone.getRegioname(), Integer.toString(index));
				} else {
					index = Integer.parseInt(Sindex);
					Couple tem = regionInfor.get(index);
					tem.setAmount(tem.getAmount()+1);
					regionInfor.set(index, tem);
				}
				// 记录管藏地与分布数量
				Sindex = mapposition.get(alone.getBookposition());
				index = 0;
				if(Sindex == null) {
					index = positionInfor.size();
					positionInfor.add(new Couple(alone.getBookposition(), 1));
					mapposition.put(alone.getBookposition(), Integer.toString(index));
				} else {
					index = Integer.parseInt(Sindex);
					Couple tem = positionInfor.get(index);
					tem.setAmount(tem.getAmount()+1);
					positionInfor.set(index, tem);
				}
				// 记录出版社与对应数量
				Sindex = mappress.get(alone.getBookpress());
				index = 0;
				if(Sindex == null) {
					index = pressInfor.size();
					pressInfor.add(new Couple(alone.getBookpress(), 1));
					mappress.put(alone.getBookpress(), Integer.toString(index));
				} else {
					index = Integer.parseInt(Sindex);
					Couple tem = pressInfor.get(index);
					tem.setAmount(tem.getAmount()+1);
					pressInfor.set(index, tem);
				}
			}
			mav.addObject("regionInfor", regionInfor);
			mav.addObject("positionInfor", positionInfor);
			mav.addObject("pressInfor", pressInfor);
			mav.addObject("regionsize", regionInfor.size());
			mav.addObject("positionsize", positionInfor.size());
			mav.addObject("presssize", pressInfor.size());
		} else {
			mav.addObject("errorType", "信息栏为空！");
			mav.setViewName("index");
		}
		return mav;
	}

	@RequestMapping(value="/getList")
	public ModelAndView getList(HttpServletRequest req) {
		int limitPage = 9;
		ModelAndView mav = new ModelAndView("Return");
		HttpSession session = req.getSession();
		Users users = (Users)session.getAttribute("holdingUsers");
		if(users != null){
			try{
				judgeAccountNormal(req);
			} catch (ErrorInformationException e){
				accountDis(req);
			}
		}
		String method = req.getParameter("key1");
		String ParentID = req.getParameter("key2");
		if (method != null || ParentID != null) {
//			System.out.println("method: " + method + " ParentID" + ParentID);
			List<Lists> list = listsService.list(method, ParentID);
			if(list == null)
				return mav;
			int len = list.size();
			int maxPage;
			int tempLen = len - 1;
			if(tempLen % limitPage == 0) {
				maxPage = tempLen / limitPage;
			} else {
				maxPage = (tempLen / limitPage) + 1;
			}
//			System.out.println(maxPage);
			session.setAttribute("GetList", list);
			session.setAttribute("maxPage", maxPage);
			mav.addObject("returnListSize",len);
			List<Lists> rL = new ArrayList<Lists>();
			for(int index = 0; index < limitPage && index < len; index++) {
				rL.add(list.get(index));
			}
//			System.out.println(rL == null);
			mav.addObject("returnList",rL);
			mav.addObject("nowPage",1);
			mav.addObject("leftPage",1);
			mav.addObject("pageURL","getList/page");
			mav.addObject("detailURL","books?BookId=");
			if(maxPage < 10) {
				mav.addObject("rightPage",maxPage);
			} else {
				mav.addObject("rightPage",10);
			}
		}
		return mav;
	}

	@RequestMapping(value="/getList/page")
	public ModelAndView switchPage(HttpServletRequest req) {
		int limitPage = 9;
		ModelAndView mav = new ModelAndView("Return");
		HttpSession session = req.getSession();
		Users users = (Users)session.getAttribute("holdingUsers");
		if(users != null){
			try{
				judgeAccountNormal(req);
			} catch (ErrorInformationException e){
				accountDis(req);
			}
		}
		int page = Integer.parseInt(req.getParameter("page"));
		int index = (page-1) * limitPage + 1;
		List<Lists> rL = new ArrayList<Lists>();
		List<Lists> list = (List<Lists>) session.getAttribute("GetList");
		int maxPage = (int) session.getAttribute("maxPage");
		int len = list.size();
//		System.out.println("index: " + index);
//		System.out.println("list.size: " + list.size());
		for(int i = 0; i < limitPage && index + i < len; i++) {
			rL.add(list.get(index+i));
		}
		mav.addObject("returnList",rL);
		mav.addObject("nowPage",page);
		mav.addObject("pageURL","page");
		mav.addObject("detailURL","../books?BookId=");
		if(page - 4 > 0) {
			mav.addObject("leftPage",page - 4);
		} else {
			mav.addObject("leftPage",1);
		}
		if(page + 5 < maxPage) {
			mav.addObject("rightPage",page + 5);
		} else {
			mav.addObject("rightPage",maxPage);
		}
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
