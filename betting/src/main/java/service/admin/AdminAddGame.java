package service.admin;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Game;
import dao.GameDao;
import service.CommandProcess;

public class AdminAddGame implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String hometeam = request.getParameter("hometeam");
		String awayteam = request.getParameter("awayteam");
		String gamedate = request.getParameter("gamedate");
		String gametime = request.getParameter("gametime");
		String sporttype = request.getParameter("sporttype");
		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date gamedate2 = Date.valueOf(gamedate);
		Game game = new Game();
		game.setHometeam(hometeam);
		game.setAwayteam(awayteam);
		game.setGamedate(gamedate2);
		game.setGametime(gametime);
		game.setSporttype(sporttype);
		int result = 0;
		GameDao gd = GameDao.getInstance();
		result = gd.insert(game);
		request.setAttribute("result", result);
		
		return "adminAddGame";
	}

}
