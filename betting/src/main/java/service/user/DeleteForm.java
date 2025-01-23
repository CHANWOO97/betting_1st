package service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.User;
import dao.UserDao;
import service.CommandProcess;

public class DeleteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("userid");
		UserDao ud = UserDao.getInstance();
		User user = ud.select(userid);
		request.setAttribute("user", user);
		return "deleteForm";
	}

}
