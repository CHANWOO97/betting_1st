package service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.User;
import dao.UserDao;
import service.CommandProcess;

public class LoginAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		
		UserDao ud = UserDao.getInstance();
		int result = 0; // 암호가 다름
		User user = ud.select(userid);
		if(user == null || user.getDel().equals("y"))
				result = -1; // 삭제되었거나, 없는 아이디
		else if(user.getPassword().equals(password)) {
			HttpSession session = request.getSession();
			session.setAttribute("userid", userid);
			session.setAttribute("user_role", user.getUser_role());
			result = 1; // 로그인 성공
		}
		request.setAttribute("result", result);
		return "login";
	}

}
