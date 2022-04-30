package dao;

import java.util.List;
import javax.annotation.PostConstruct;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import dto.Camp;
import dto.Reserve;
import dto.UserData;

@Component
public class ReserveDAO {
	private static final String NS="reserve.";
	
	@Autowired
	MySqlSessionFactory sqlSessionFactory;
	SqlSession sqlSession;
	
	
	@PostConstruct
	public void setSqlSession() {
		this.sqlSession = sqlSessionFactory.sqlmap.openSession();
		
	} 
	
public int ReserveInsert(Reserve r) {//예약추가
		try {
			return sqlSession.insert(NS+"ReserveInsert", r);
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.commit();
		}
		return 0;
	}

	public int ReserveUpdate(Reserve r) {//예약변경
		try {
			return sqlSession.update(NS+"ReserveUpdate",r);
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.commit();
		}
		return 0;
	}
	public int ReserveDelete(int reserveidx) {//예약취소
		try {
			return sqlSession.delete(NS+"ReserveDelete", reserveidx);
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.commit();
		}
		return 0;
	}
	
	public List<Reserve> ReserveList(String name){
			return sqlSession.selectList(NS+"ReserveList", name);
	}
	
	public Reserve ReserveInfo(int idx){
			return sqlSession.selectOne(NS+"ReserveInfo", idx);
	}
	
	public int nextIdx() { //예약번호를 차례로 받는 기능
			return sqlSession.selectOne(NS+"nextIdx");
	}
	
	public List<Camp> selectCamp(String campname){
			return sqlSession.selectList(NS+"selectCamp",campname);
	}
	
	public List<String> selectroom(String campname){
			return sqlSession.selectList(NS+"selectroom", campname);
	}
	
	public String username(String userid) { //유저이름으로 리스트조회할 때 사용
			return sqlSession.selectOne(NS+"username", userid);
	}
	
	public List<UserData> userInfo(String userid) {
		return sqlSession.selectList(NS+"userInfo", userid);
	}
	
	public List<Reserve> Image(int reserveidx){
			return sqlSession.selectList(NS+"Image", reserveidx);
	}
	
} //end class
