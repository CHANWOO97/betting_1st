package service.sale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Game;
import dao.GameDao;
import dao.Sale;
import dao.SaleDao;
import service.CommandProcess;

public class SaleTableAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String userid = request.getParameter("userid");
		int targetGameid = Integer.parseInt(request.getParameter("gameid"));
		String bettype = request.getParameter("bettype");
		String userresult = "y";
		// int odds = (int) Float.parseFloat(request.getParameter("odds"));
		int result = 0;
		SaleDao sd = SaleDao.getInstance(); 
		GameDao gd = GameDao.getInstance();
		
		Sale saleInsert = new Sale();
		saleInsert.setUserid(userid);
		saleInsert.setGameid(targetGameid);
		saleInsert.setUserresult(bettype);
		
		int isDuplicate= sd.isDuplicate(saleInsert);
		if (isDuplicate > 0) {
			result = -1;
	    }else {
	    	result = sd.insert(saleInsert);
	    	result = gd.userselectUpdate(userresult, targetGameid);
	    }
		request.setAttribute("result", result);
		request.setAttribute("gameid", targetGameid);
		return "saleTable";
	}

}
