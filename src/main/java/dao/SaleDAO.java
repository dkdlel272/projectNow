package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dto.Sale;
import util.MybatisConnection;

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

			sqlSession.update(ns + "selectSaleOne", saleidx);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
		}

	}

}
