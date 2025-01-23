package service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User;
import dao.UserDao;
import service.CommandProcess;

public class UpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		
		User user = new User();
		user.setUserid(userid);
		user.setPassword(password);
		user.setUsername(name);
		user.setAddress(address);
		user.setTel(tel);
		user.setEmail(email);
		
		int result = 0;
		UserDao ud = UserDao.getInstance();
		result = ud.update(user);
		request.setAttribute("result", result);
		
		return "update";
	}

}
