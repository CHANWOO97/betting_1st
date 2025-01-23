package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class ContentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		String userid = (String)request.getSession().getAttribute("userid");
		
		BoardDao bd = BoardDao.getInstance();
		bd.updateReadCount(num);
		Board board = bd.select(num);
		
		request.setAttribute("userid", userid);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("board", board);
		return "/views/board/content";
	}

}
