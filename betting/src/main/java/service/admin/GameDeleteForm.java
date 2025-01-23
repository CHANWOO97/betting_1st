package service.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

public class GameDeleteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		int gameid = Integer.parseInt(request.getParameter("gameid"));
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("gameid", gameid);
		return "gameDeleteForm";
	}

}
