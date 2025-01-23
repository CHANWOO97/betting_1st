package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class UpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		Board board = new Board();
		board.setNum(num);
		board.setSubject(subject);
		board.setContent(content);
		
		BoardDao bd = BoardDao.getInstance();
		int result = bd.update(board);
	
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		return "update";
	}

}
