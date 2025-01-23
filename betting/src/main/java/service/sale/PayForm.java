package service.sale;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GameDao;
import dao.Sale;
import dao.SaleDao;
import dao.User;
import dao.UserDao;
import service.CommandProcess;

public class PayForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String userid = (String)request.getSession().getAttribute("userid");
		SaleDao sd = SaleDao.getInstance();
		GameDao gd = GameDao.getInstance();
		UserDao ud = UserDao.getInstance();
		List<Sale> list = gd.paylist(userid); 
		for (Sale sale : list) {
			if (sale.getChecked().equals("n")) {
				if (sale.getGameresult() != null && sale.getGameresult().equals(sale.getUserresult())) {
					int addpoint = sale.getSalepoint() * 2;
					User user = ud.select(userid);
					int point = user.getPoint() + addpoint;
					ud.updatePoint(point, userid);	
					sd.updateChecked(userid);
				}
			}
		}
		User user = ud.select(userid);
		request.setAttribute("list", list);
		request.setAttribute("user", user);
		
		return "payForm";
	}

}
