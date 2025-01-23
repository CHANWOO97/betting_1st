package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*import java.util.HashMap;
import java.util.List;
import java.util.Map;
*/
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class UserDao {
	//singleTon
	private static UserDao instance = new UserDao();
	private UserDao() {}
	public static UserDao getInstance() {
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
	public User select(String id) {
		return (User)session.selectOne("userns.select", id);
	}
	public int insert(User user) {
		return session.insert("userns.insert", user);
	}
	public User loginChk(String id) {
		return session.selectOne("userns.select", id);
	}
	public int update(User user) {
		return session.update("userns.update", user);
	}
	public int delete(String id) {
		return session.update("userns.delete", id);
	}
	public int getTotal() {
		return session.selectOne("userns.getTotal");
	}
	public List<User> list(int startRow, int ROW_PER_PAGE) {
		Map<String, Object> params = new HashMap<>();
	    params.put("startRow", startRow - 1);
	    params.put("ROW_PER_PAGE", ROW_PER_PAGE);
	    return session.selectList("userns.list", params);

	}
	public String selectId(User user) {
		return session.selectOne("userns.selectId", user);
	}
	public int updatePw(User user) {
		// TODO Auto-generated method stub
		return session.update("userns.updatePw", user);
	}
	public Integer selectPoint(String userid) {
		return session.selectOne("userns.selectPoint", userid);
	}
	public int updatePoint(int point, String userid) {
		Map<String, Object> params = new HashMap<>();
	    params.put("point", point);
	    params.put("userid", userid);
		return session.update("userns.updatePoint", params);
	}
}
