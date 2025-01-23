package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SaleDao {
	//singleTon
	private static SaleDao instance = new SaleDao();
	private SaleDao() {}
	public static SaleDao getInstance() {
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
	public Sale select(String userid) {
		return (Sale)session.selectOne("salens.select", userid);
	}
	public int isDuplicate(Sale saleInsert) {
		return session.selectOne("salens.isDuplicate", saleInsert);
	}
	public int insert(Sale saleInsert) {
		return session.insert("salens.insert", saleInsert);
	}
	public int getTotal(String userid) {		
		return session.selectOne("salens.getTotal", userid);
	}
	public List<Sale> list(int startRow, int ROW_PER_PAGE, String userid) {
		Map<String, Object> params = new HashMap<>();
		params.put("startRow", startRow - 1);
		params.put("ROW_PER_PAGE", ROW_PER_PAGE);
		params.put("userid", userid);
		return session.selectList("salens.list", params);
	}
	public int delete(int saleid) {
		return session.delete("salens.delete", saleid);
	}
	public int buyUpdate(Sale buysale) {
		// TODO Auto-generated method stub
		return session.update("salens.buyUpdate", buysale);
	}
	public List<Sale> paylist(String userid) {
		return session.selectList("salens.paylist",userid);
	}
	public int updateChecked(String userid) {
		return session.update("salens.updateChecked", userid);
	}
	public int getTotal() {
		// TODO Auto-generated method stub
		return session.selectOne("salens.getTotal1");
	}
	

}
