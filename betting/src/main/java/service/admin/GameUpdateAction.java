package service.admin;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Game;
import dao.GameDao;
import service.CommandProcess;

public class GameUpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		System.out.println("gameid = "+request.getParameter("gameid"));
		int gameid = Integer.parseInt(request.getParameter("gameid"));
		String hometeam = request.getParameter("hometeam");
		String awayteam = request.getParameter("awayteam");
		String gamedate = request.getParameter("gamedate");
		String gametime = request.getParameter("gametime");
		String sporttype = request.getParameter("sporttype");
		String gameresult = request.getParameter("gameresult");
		Date gamedate2 = Date.valueOf(gamedate);
		Game game = new Game();
		game.setGameid(gameid);
		game.setHometeam(hometeam);
		game.setAwayteam(awayteam);
		game.setGamedate(gamedate2);
		game.setGametime(gametime);
		game.setSporttype(sporttype);
		int result = 0;
		GameDao gd = GameDao.getInstance();
		
		if( gameresult == null || gameresult.equals("") ) {
			result = gd.update(game);
		}
		else {
			game.setGameresult(gameresult);
			result = gd.updateResult(game);
		}
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		return "gameUpdate";
	}

}
