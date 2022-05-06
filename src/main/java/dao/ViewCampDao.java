package dao;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dto.Camp;
import dto.ViewCamp;

@Component
public class ViewCampDao {
	private static final String NS = "viewcamp.";

	@Autowired
	MySqlSessionFactory sqlSessionFactory;
	SqlSession sqlSession; 

	@PostConstruct
	public void setSqlSession() {
		this.sqlSession= sqlSessionFactory.sqlmap.openSession();
	}

	public int viewCampOne(int idx) {
		return sqlSession.selectOne(NS + "viewCampOne", idx);
	}

	public int viewCampInsert(int idx, String chk) {
		Map<String, Object> map = new HashMap<>();
		map.clear();
		map.put("campidx", idx);
		map.put("chk", chk);
		try {

			return sqlSession.insert(NS + "viewCampInsert", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
		}
		return 0;
	}

	public int viewCampUpdate(int idx,String chk) {
		Map<String, Object> map = new HashMap<>();
		map.clear();
		map.put("campidx", idx);
		map.put("chk", chk);
		try {
			int num = sqlSession.selectOne(NS + "viewCampOne", idx);

			if (num == 0)
				return sqlSession.insert(NS + "viewCampInsert", map);
			else
				return sqlSession.update(NS + "viewCampUpdate", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
		}
		return 0;
	}
}
