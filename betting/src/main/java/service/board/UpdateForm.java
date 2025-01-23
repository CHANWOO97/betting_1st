package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class UpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDao bd = BoardDao.getInstance();
		Board board = bd.select(num);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("board", board);
		
		return "updateform";
	}

}
