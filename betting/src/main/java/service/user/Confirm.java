package service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User;
import dao.UserDao;
import service.CommandProcess;

public class Confirm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		UserDao ud = UserDao.getInstance();
		User user = ud.select(id);
		String msg = "";
		if (user == null) msg = "사용 가능한 아이디 입니다.";
		else msg = "중복되니 다른 아이디를 사용하세요.";
		request.setAttribute("msg", msg);
		return "confirm";
	}

}
