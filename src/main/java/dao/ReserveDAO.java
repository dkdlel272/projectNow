package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dto.Camp;
import dto.Reserve;

//@Component
public class ReserveDAO {
	private static final String NS="reserve.";
	private Map<String, Object> map = new HashMap();
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
public int ReserveInsert(Reserve r) {//예약추가
	    System.out.println(r);
		
		try {
			
			return sqlSession.insert(NS+"ReserveInsert", r);
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return 0;
	}
	public int ReserveUpdate(Reserve r) {//예약변경
		 
		try {
			return sqlSession.update(NS+"ReserveUpdate",r);
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return 0;
	}
	public int ReserveDelete(int reserveidx) {//예약취소
		 
		try {
			return sqlSession.delete(NS+"ReserveDelete", reserveidx);
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return 0;
	}
	public List<Reserve> ReserveList(String name){
		 
		try {
			return sqlSession.selectList(NS+"ReserveList", name);
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return null;
	}
	public Reserve ReserveInfo(int idx){
		 
		try {
			return sqlSession.selectOne(NS+"ReserveInfo", idx);
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return null;
	}
	public int nextIdx() { //예약번호를 차례로 받는 기능
		 
		try {
			return sqlSession.selectOne(NS+"nextIdx");
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return 0;
	}
	public List<Camp> selectCamp(String campname){
		
		
		try {
			return sqlSession.selectList(NS+"selectCamp",campname);
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return null;
	}
	public List<String> selectroom(String campname){
	
		try {
			return sqlSession.selectList(NS+"selectroom", campname);
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return null;
	}
	public String username(String userid) { //유저이름으로 리스트조회할 때 사용
	
		try {
			return sqlSession.selectOne(NS+"username", userid);
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return null;
	}
	public List<Reserve> Image(int reserveidx){
	
		try {
			return sqlSession.selectList(NS+"Image", reserveidx);
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return null;
	}
} //end class
