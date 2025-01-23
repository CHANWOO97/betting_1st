package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import dao.BoardDao;

public class BoardDao {
	// singleton
	private static BoardDao instance = new BoardDao();
	private BoardDao() {}
	public static BoardDao getInstance() {
		return instance;
	}
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	public int getTotal() {
		return session.selectOne("boardns.getTotal");
	}
	public List<Board> list(int startRow, int rOW_PER_PAGE) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("rOW_PER_PAGE", rOW_PER_PAGE);
		return session.selectList("boardns.list" , map);
	}
	public int insert(Board board) {

		return session.insert("boardns.insert" , board);
	}
	public int selectNum() {
		return session.selectOne("boardns.selectNum");
	}
}
