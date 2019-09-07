package Control.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.pojo.ClassifyLists;
import model.pojo.TemporaryBook;
import model.pojo.Users;
import model.service.ClassifyListsService;

@Controller
public class OtherController {
	@Autowired
	ClassifyListsService classifyLists;
	
	@RequestMapping(value="/search")
	public ModelAndView GoSearch() {
		ModelAndView mav = new ModelAndView("index");
		return mav;
	}
	
	@RequestMapping(value="/search/switch")
	public ModelAndView switchSearch(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("redirect:/search");
		String s = req.getParameter("s");
		mav.addObject("swit", s);
		return mav;
	}
	
	@RequestMapping(value="/classify")
	public ModelAndView getParent(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("Classify");
		List<ClassifyLists> parentList = classifyLists.listAll();
		mav.addObject("parentList", parentList);
		String method = req.getParameter("key1");
		String ParentID = req.getParameter("key2");
		if(method != null || ParentID != null) {
			mav.addObject("method",method);
			mav.addObject("ParentID",ParentID);
		}
		List<List<ClassifyLists>> sonList = new ArrayList<List<ClassifyLists>>();
		for(ClassifyLists parent: parentList) {
			sonList.add(classifyLists.listSon(parent.getId()));
		}
		mav.addObject("sonList", sonList);
		return mav;
	}
	
	@RequestMapping(value="/temporary")
	public ModelAndView TemporaryPlace(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("Temporary");
		return mav;
	}
	
	@RequestMapping(value="/addTemporary")
	public ModelAndView AddTemporary(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String url = req.getParameter("ReturnURL");
		String bookpress = req.getParameter("bookpress");
		String bookindex = req.getParameter("bookindex");
		String bookname = req.getParameter("bookname");
		String bookcode = req.getParameter("bookcode");
		String bookauthor = req.getParameter("bookauthor");
		String bookid = req.getParameter("bookid");
		TemporaryBook temp = new TemporaryBook(bookcode, bookname, bookauthor, bookindex, bookpress, bookid);
		HttpSession session = req.getSession();
		Users users = (Users) session.getAttribute("holdingUsers");
		if (users == null) {
			mav.setViewName("redirect:/login");
			mav.addObject("msg1", "¼ì²âµ½Î´µÇÂ½£¬ÇëÏÈµÇÂ½");
			return mav;
		}
		List<TemporaryBook> TempList = (List<TemporaryBook>) session.getAttribute("TempList");
		int num = (int) session.getAttribute("TempNum");
		for(int i = 0; i < TempList.size(); i++) {
			TemporaryBook b = TempList.get(i);
			if(b.getBookid().equals(bookid)) {
				TempList.remove(i);
				num -= 1;
				break;
			}
		}
		session.setAttribute("TempNum", num + 1);
		TempList.add(temp);
		session.setAttribute("TempList", TempList);
		mav.setViewName("redirect:/" + url);
		return mav;
	}

	@RequestMapping(value="/deleteTemporary")
	public ModelAndView DeleteTemporary(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("Temporary");
		int deleteID = Integer.parseInt(req.getParameter("deleteID")); 
		HttpSession session = req.getSession();
		session.setAttribute("TempNum", ((int) session.getAttribute("TempNum") - 1));
		List<TemporaryBook> TempList = (List<TemporaryBook>) session.getAttribute("TempList");
		TempList.remove(deleteID-1);
		session.setAttribute("TempList", TempList);
		return mav;
	}
	
	@RequestMapping(value="/deleteTemporaryAll")
	public ModelAndView DeleteTemporaryAll(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("Temporary");
		HttpSession session = req.getSession();
		session.setAttribute("TempNum", 0);
		List<TemporaryBook> TempList = new ArrayList<TemporaryBook>();
		session.setAttribute("TempList", TempList);
		return mav;
	}
	
	@RequestMapping(value="/MyLibrary")
	public ModelAndView myLibary(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("MyLibrary");
		return mav;
	}
	
}
