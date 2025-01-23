package service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Board;
import dao.BoardDao;
import service.CommandProcess;

public class ListAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		//  한페이지에 보여줄 게시글 갯수
		final int ROW_PER_PAGE = 10;
	//  한 블럭에 보여줄 페이지 갯수
		final int PAGE_PER_BLOCK = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		// 시작번호	(페이지번호 - 1) * 페이지당 갯수+ 1		 233, 1	=> 223	
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		BoardDao bd = BoardDao.getInstance();
		int total = bd.getTotal();
		int num = total - startRow + 1;   // 233 
		List<Board> list = bd.list(startRow, ROW_PER_PAGE);
//		List<Board> list = bd.list();
	//  총페이지 Math.ceil(개수/페이지당 개수) 정수/정수 => 정수이므로 double형으로 변환
	//  Math.ceil의 결과는 double형이므로 int로 형변환
		int totalPage = (int)Math.ceil((double)total/ROW_PER_PAGE);
	//  블럭별 시작 페이지 시작 : 현재페이지 - (현재페이지 - 1)% 블록당 갯수
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
	//  블럭별 끝 페이지 시작페이지 + 블록당페이지 수 -1 
		int endPage = startPage + PAGE_PER_BLOCK - 1;
	    if (endPage > totalPage) endPage = totalPage;
	    
	    // jsp에 보낼 데이터를 request에 저장
	    request.setAttribute("num", num);
	    request.setAttribute("list", list);
	    request.setAttribute("startPage", startPage);
	    request.setAttribute("endPage", endPage);
	    request.setAttribute("totalPage", totalPage);
	    request.setAttribute("currentPage", currentPage);
	    request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		return "list";
	}

}
