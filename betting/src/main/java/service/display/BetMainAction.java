package service.display;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Game;
import dao.GameDao;
import dao.User;
import dao.UserDao;
import service.CommandProcess;

public class BetMainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String userid = (String)request.getSession().getAttribute("userid");
		HttpSession session = request.getSession();
		session.setAttribute("userid", userid);
		System.out.println("userid = "+ userid);
		if (userid != null && !userid.equals("")) {
		  UserDao ud = UserDao.getInstance(); 
		  User user = ud.select(userid);
		  request.setAttribute("user", user);
		}
	
		// 한블럭에 보여줄 게시글 개수
		final int ROW_PER_PAGE = 12;
		// 블럭당 페이지 개수
		final int PAGE_PER_BLOCK = 10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum.equals("")){
			pageNum = "1";
		}
		// 현재페이지
		int currentPage = Integer.parseInt(pageNum);
		// 시작페이지
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		GameDao gd = GameDao.getInstance();
		int total = gd.getTotal();
		//int num = total - startRow + 1;
		// 블럭별 페이지 개수 
		int totalPage = (int)Math.ceil((double)total/ROW_PER_PAGE);
		// 블럭별 시작 페이지 시작(현재페이지 - (현재페이지 - 1)%블록당 개수)
		int startPage = currentPage - (currentPage - 1)%PAGE_PER_BLOCK;
		// 블럭별 끝 페이지 시작페이지 + 블럭당 페이지 수 - 1
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		if (endPage > totalPage ) endPage = totalPage;
		List<Game> list = gd.list(startRow, ROW_PER_PAGE);
		request.setAttribute("list", list);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		request.setAttribute("pageNum", pageNum);
		return "betMain";
	}

}
