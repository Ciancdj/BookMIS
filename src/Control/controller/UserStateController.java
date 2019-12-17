package Control.controller;

import model.pojo.Users;
import model.service.UsersService;
import model.service.impl.UsersServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


public class UserStateController {
    @Autowired
    private UsersService usersService;

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
