package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dto.Camp;
import dto.Reserve;
import dto.UserData;


//@Component
public class CampDAO {
	private static final String NS="camp.";
	private Map<String, Object> map = new HashMap<>();
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int CampInsert(Camp camp) {
		
		try {
			
			return sqlSession.insert(NS+"CampInsert", camp);
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return 0;
	}
	
	public int CampUpdate(Camp camp) {
		try {
			return sqlSession.update(NS+"CampUpdate",camp);
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return 0;
	}
	
	public int campDelete(Camp c) {

		try {
			return sqlSession.delete(NS+"campDelete", c);
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return 0;
	}
	
	public Camp selectCamp(int campidx) {

		try {
			return sqlSession.selectOne(NS+"selectCamp",campidx);
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return null;
	}
	public Camp chooseCamp(String campname) { //사용하지않는기능?

		try {
			return sqlSession.selectOne(NS+"chooseCamp",campname);
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return null;
	}
	
	public int nextSeq() { //예약번호를 차례로 받는 기능

		try {
			return sqlSession.selectOne(NS+"nextSeq");
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return 0;
	}
	
	public List<Camp> CampList(){

		try {
			return sqlSession.selectList(NS+"CampList");
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return null;
	}
	
	public List<Camp> SearchList(String searchName, String searchType){

		try {
			map.clear();
			map.put("searchType", searchType); 
			map.put("searchName", searchName);
			
			return sqlSession.selectList(NS+"SearchList", map);
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return null;
	}
	
	public Camp CampInfo(String campname){

		try {
			return sqlSession.selectOne(NS+"CampInfo", campname);
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return null;
	}
	
	public String RoomList() {

		try {
			return sqlSession.selectOne(NS+"RoomList");
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return null;

	}
	
	public List<Camp> campListAll(){

		try {
			return sqlSession.selectList(NS+"campListAll");
		} catch (Exception e){
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return null;
	}
	
	
	public List<UserData> blackList(String black) {

		try {
			return sqlSession.selectList(NS+"blackList",black);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
			}
		return null;	} 
	
	public List<Reserve> reserveListAll() {
		
		try {
			return sqlSession.selectList(NS+"reserveListAll");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
			}
		return null;	} 
	public List<Reserve> reserveList() {
	
		try {
			return sqlSession.selectList(NS+"reserveList");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
			}
		return null;	} 
	
	
	public Map monthReserve() {
		
		try {
			return sqlSession.selectOne(NS+"monthReserve");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
			}
		return null;	}
	public List<Reserve> dashboard1() {
		
		try {
			return sqlSession.selectList(NS+"dashboard1");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
			}
		return null;	} 
	public List<Reserve> dashboard2() {
		
		try {
			return sqlSession.selectList(NS+"dashboard2");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();	
			}
		return null;	} 
	
	
} //end class
