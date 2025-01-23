package service.sale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GameDao;
import dao.SaleDao;
import service.CommandProcess;

public class SaleDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int saleid = Integer.parseInt(request.getParameter("saleid"));
		int gameid = Integer.parseInt(request.getParameter("gameid"));
		String userselect = "n";
		SaleDao sd = SaleDao.getInstance();
		GameDao gd = GameDao.getInstance();
		int result = 0;
		result = gd.userselectUpdate(userselect, gameid);
		result = sd.delete(saleid);
		request.setAttribute("result", result);
		return "saleDelete";
	}

}
