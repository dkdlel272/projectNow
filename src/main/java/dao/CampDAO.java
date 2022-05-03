package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import dto.Camp;
import dto.IndexMap;
import dto.Reserve;
import dto.UserData;


@Component
public class CampDAO {
	private static final String NS="camp.";
	private Map<String, Object> map = new HashMap<>();
	
	@Autowired
	MySqlSessionFactory sqlSessionFactory;
	SqlSession sqlSession;
	
	
	
	@PostConstruct
	public void setSqlSession() {
		this.sqlSession = sqlSessionFactory.sqlmap.openSession();
	}

	public int CampInsert(Camp camp) {
		
		try {
			
			return sqlSession.insert(NS+"CampInsert", camp);
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.commit();
		}
		return 0;
	}
	
	public int CampUpdate(Camp idx) {
		try {
			return sqlSession.update(NS+"CampUpdate",idx);
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.commit();
		}
		return 0;
	}
	
	public int campDelete(Camp c) {

		try {
			return sqlSession.delete(NS+"campDelete", c);
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.commit();
		}
		return 0;
	}
	
	public Camp selectCamp(int campidx) {
			return sqlSession.selectOne(NS+"selectCamp",campidx);
	}
	public Camp chooseCamp(String campname) { //사용하지않는기능?

			return sqlSession.selectOne(NS+"chooseCamp",campname);
	}
	public Camp reUpdate(String campname) { //사용하지않는기능?
		
		return sqlSession.selectOne(NS+"reUpdate",campname);
	}
	
	public int nextSeq() { //예약번호를 차례로 받는 기능

			return sqlSession.selectOne(NS+"nextSeq");
	}
	
	public List<Camp> CampList(){

			return sqlSession.selectList(NS+"CampList");
			
	}
	
	public List<Camp> SearchList(String searchName, String searchType){

			return sqlSession.selectList(NS+"SearchList", map);
	}
	
	public Camp CampInfo(String campname){

			return sqlSession.selectOne(NS+"CampInfo", campname);
	}
	
	public String RoomList() {

			return sqlSession.selectOne(NS+"RoomList");

	}
	
	public List<Camp> campListAll(){

			return sqlSession.selectList(NS+"campListAll");
	}
	
	
	public List<Reserve> reserveListAll() {
		
			return sqlSession.selectList(NS+"reserveListAll");
	}
	public List<Reserve> reserveList() {
	
			return sqlSession.selectList(NS+"reserveList");
			}
	
	public Map monthReserve() {
		
			return sqlSession.selectOne(NS+"monthReserve");
		}
	public List<IndexMap> dashboard1() {
		
			return sqlSession.selectList(NS+"dashboard1");
	}
	public List<IndexMap> dashboard2() {
		
			return sqlSession.selectList(NS+"dashboard2");
			}

} //end class
