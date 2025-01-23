package service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import service.CommandProcess;

public class DeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("userid");
		request.setAttribute("userid", userid);
		UserDao ud = UserDao.getInstance();
		int result = 0;
		result = ud.delete(userid);
		if (result > 0) {
			session.invalidate();
		}
		request.setAttribute("result", result);
		return "delete";
	}

}
