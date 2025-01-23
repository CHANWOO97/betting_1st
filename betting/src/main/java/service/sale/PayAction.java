package service.sale;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Sale;
import dao.SaleDao;
import dao.User;
import dao.UserDao;
import service.CommandProcess;

public class PayAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String userid = request.getParameter("userid");
		int point = Integer.parseInt(request.getParameter("point"));
		int saleid = Integer.parseInt(request.getParameter("saleid"));
		int gameid = Integer.parseInt(request.getParameter("gameid"));

		int result1 = 0;
		int result2 = 0;
		// 유저 보유포인트-구매포인트 (Users DB update)
		SaleDao sd = SaleDao.getInstance();

		Sale buysale = new Sale();
		buysale.setSalepoint(point);
		buysale.setSaleid(saleid);
		result1 = sd.buyUpdate(buysale);
		
		UserDao ud = UserDao.getInstance();
		User user = ud.select(userid);
		
		point = user.getPoint() - point;
		result2 = ud.updatePoint(point, userid);
	
		request.setAttribute("gameid", gameid);
		request.setAttribute("result1", result1);
		request.setAttribute("result2", result2);
			
		return "pay";
	}
}
