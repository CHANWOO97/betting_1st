package service.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User;
import dao.UserDao;
import service.CommandProcess;

public class MailToIdAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		int result = 1;
		User user = new User();
		user.setUsername(name);
		user.setTel(tel);
		UserDao ud = UserDao.getInstance();
		String userid = ud.selectId(user);
		if (userid == null || userid.equals("")) result = 0;
		request.setAttribute("userid", userid);
		request.setAttribute("result", result);
		return "mailToId";
	}
}
