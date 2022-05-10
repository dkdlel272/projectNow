package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dto.Sale;


@Component
public class SaleDAO {
	private static final String ns = "sale.";
	private Map<String, Object> map = new HashMap<>();

	@Autowired
	MySqlSessionFactory sqlSessionFactory;
	SqlSession sqlSession;

	@PostConstruct
	public void setSqlSession() {
		this.sqlSession = sqlSessionFactory.sqlmap.openSession();

	}

	public int insertSale(Sale s) {

		try {

			return sqlSession.insert(ns + "insertSale", s);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			sqlSession.commit();

		}

		return 0;

	}

	public int nextSaleidx() {

		return sqlSession.selectOne(ns + "nextSaleidx");

	}

	public List<Sale> selectSaleList() {

		return sqlSession.selectList(ns + "selectSaleList");

	}

	public List<Sale> selectCondition() {

		return sqlSession.selectList(ns + "selectCondition");

	}

	public Sale selectSaleOne(int saleidx) {

		return sqlSession.selectOne(ns + "selectSaleOne", saleidx);

	}

	public void readCountUp(int saleidx) {

		try {

			sqlSession.update(ns + "readCountUp", saleidx);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
		}

	}
	
	public int updateSale(Sale sale) {

		try {

			return sqlSession.update(ns + "updateSale", sale);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
		}

		return 0;

	}
	
	public int deleteSale(int saleidx) {

		try {

			return sqlSession.delete(ns + "deleteSale", saleidx);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
		}

		return 0;

	}
	
	public List<String> selectCampList() {

		return sqlSession.selectList(ns + "selectCampList");

	}
	
	public List<Sale> mySaleList(String writer) {

		return sqlSession.selectList(ns + "mySaleList",writer);

	}
	
	public int changeCon(int saleidx, String condition) {
		map.clear();
		map.put("saleidx", saleidx);
		map.put("condition", condition);
		
		try {

			return sqlSession.update(ns + "changeCon", map);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
		}

		return 0;

	}
	

}
