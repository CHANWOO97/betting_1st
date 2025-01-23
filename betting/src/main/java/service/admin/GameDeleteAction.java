package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.GameDao;
import dao.User;
import dao.UserDao;
import service.CommandProcess;

public class GameDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		String userid = (String)request.getSession().getAttribute("userid");
		System.out.println("userid = "+userid);
		int gameid = Integer.parseInt(request.getParameter("gameid"));
		String password = request.getParameter("password");
		UserDao ud = UserDao.getInstance();
		GameDao gd = GameDao.getInstance();
		int result = 0; // 암호가 다름
		User user = ud.select(userid);
		if(user == null || user.getDel().equals("y") || !user.getUser_role().equals("admin"))
				result = -1; // 삭제되었거나, 없는 아이디 혹은 관리자 권한이 아닌경우
		else if(user.getPassword().equals(password)) {
			HttpSession session = request.getSession();
			session.setAttribute("userid", userid);
			session.setAttribute("user_role", user.getUser_role());
			result = gd.delete(gameid); // 패스워드 일치, 삭제 성공 여부
		}
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		return "gameDelete";
	}

}
