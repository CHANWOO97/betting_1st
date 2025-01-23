package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Game;
import dao.GameDao;
import service.CommandProcess;

public class GameUpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		System.out.println("pageNum = "+pageNum);
		int gameid = Integer.parseInt(request.getParameter("gameid"));
		GameDao gd = GameDao.getInstance();
		Game game = gd.select(gameid);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("game", game);
		return "gameUpdateForm";
	}

}
