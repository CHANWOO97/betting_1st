package service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User;
import dao.UserDao;
import service.CommandProcess;

public class AdminUserManage implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// 한블럭에 보여줄 유저 수
		final int ROW_PER_PAGE = 10;
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
		UserDao ud = UserDao.getInstance();
		int total = ud.getTotal();
		//int num = total - startRow + 1;
		// 블럭별 페이지 개수 
		int totalPage = (int)Math.ceil((double)total/ROW_PER_PAGE);
		// 블럭별 시작 페이지 시작(현재페이지 - (현재페이지 - 1)%블록당 개수)
		int startPage = currentPage - (currentPage - 1)%PAGE_PER_BLOCK;
		// 블럭별 끝 페이지 시작페이지 + 블럭당 페이지 수 - 1
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		if (endPage > totalPage ) endPage = totalPage;
		List<User> list = ud.list(startRow, ROW_PER_PAGE);
		request.setAttribute("list", list);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		return "adminUserManage";
	}

}
