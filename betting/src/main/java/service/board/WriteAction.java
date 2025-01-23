package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class WriteAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("userid");
		System.out.println("id = "+id);
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pageNum = request.getParameter("pageNum");
		
		BoardDao bd = BoardDao.getInstance();
		int num = bd.selectNum();
		Board board = new Board();
		board.setNum(num);
		board.setSubject(subject);
		board.setId(id);
		board.setContent(content);
		
		
		int result  = bd.insert(board);
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		
		return "write";
	}

}
