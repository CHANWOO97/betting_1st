package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class GameDao {
	//singleTon
	private static GameDao instance = new GameDao();
	private GameDao() {}
	public static GameDao getInstance() {
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
	public List<Game> list(int startRow, int ROW_PER_PAGE) {
		Map<String, Object> params = new HashMap<>();
	    params.put("startRow", startRow - 1);
	    params.put("ROW_PER_PAGE", ROW_PER_PAGE);
		return session.selectList("gamens.list", params);
	}
	public int getTotal() {
		// TODO Auto-generated method stub
		return session.selectOne("gamens.getTotal");
	}
	public int delete(int gameid) {
		return session.update("gamens.delete", gameid);
	}
	public int insert(Game game) {
		return session.insert("gamens.insert", game);
	}
	public Game select(int gameid) {
		return (Game)session.selectOne("gamens.select", gameid);
	}
	public int update(Game game) {
		return session.update("gamens.update", game);
	}
	public int updateResult(Game game) {
		return session.update("gamens.updateResult", game);
	}
	public int userselectUpdate(String userselect, int gameid) {
		Map<String, Object> params = new HashMap<>();
		params.put("userselect", userselect);
	    params.put("gameid", gameid);
		return session.update("gamens.userSelectUpdate", params);
		
	}
	public List<Sale> list1(int startRow, int ROW_PER_PAGE) {
		Map<String, Object> params = new HashMap<>();
		params.put("startRow", startRow - 1);
		params.put("ROW_PER_PAGE", ROW_PER_PAGE);
		return session.selectList("salens.list1", params);
	}
	public List<Sale> paylist(String userid) {
		// TODO Auto-generated method stub
		return session.selectList("salens.paylist",userid);
	}
}
