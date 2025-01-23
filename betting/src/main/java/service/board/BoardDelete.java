package service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import service.CommandProcess;

public class BoardDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		BoardDao bd = BoardDao.getInstance();
		int result = bd.delete(num);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		return "boarddelete";
	}

}
