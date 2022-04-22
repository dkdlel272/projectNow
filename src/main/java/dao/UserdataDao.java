package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dto.Board;
import dto.Leave;
import dto.UserData;


//@Component
public class UserdataDao {
	private static final String ns = "userdata.";
	private Map<String, Object> map = new HashMap<>();
	
	
	@Autowired
	SqlSessionTemplate sqlSession;

	
	public int insertUserdata(UserData ud) {
	
		try {
			
			return sqlSession.insert(ns+"insertUserdata",ud);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			sqlSession.close();
			
		}
		
		return 0;
		
	}
	
	 public int nextUseridx() {
		 
		  
		 
		 try {
	
			 return sqlSession.selectOne(ns+"nextUseridx");
			 
		 } catch(Exception e) {
			 e.printStackTrace();
		 } finally {
			 sqlSession.close();
		 }	
		 
		 return 0;
		
	 }
	
	public UserData selectUserdata (String id) {
		
		 
		
		try {
			
			return sqlSession.selectOne(ns+"selectUserdata",id);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			sqlSession.close();
			
		}
		
		return null;
		
	}
	
	public List<Board> selectMyboard (String id) {
		
		 
		
		try {
			
			return sqlSession.selectList(ns+"selectMyboard",id);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			sqlSession.close();
			
		}
		
		return null;
		
	}
	
	public String findId (String name, String email) {
		
		 
		
		map.clear();
	
		map.put("name", name);
		map.put("email", email);
		
		try {
			
			return sqlSession.selectOne(ns+"findId",map);
			
		} catch (Exception e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			sqlSession.close();
			
		}
		
		return null;
		
	}
	
	public String findPass (String userid, String name, String email) {
			
			 
			
			map.clear();
			map.put("userid", userid);
			map.put("name", name);
			map.put("email", email);
			
			try {
				
				return sqlSession.selectOne(ns+"findPass",map);
				
			} catch (Exception e) {
				
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				sqlSession.close();
				
			}
			
			return null;
			
	}
	
	public int resetPass (String userid, String newpass) {
		
		 
		
		map.clear();
		map.put("userid", userid);
		map.put("newpass", newpass);

		
		try {
			
			return sqlSession.update(ns+"resetPass",map);
			
		} catch (Exception e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			sqlSession.close();
			
		}
		
		return 0;
		
}
	
	public int updateUserdata (UserData u) {
			
			 
			
	
			
			try {
				
				return sqlSession.update(ns+"updateUserdata",u);
				
			} catch (Exception e) {
				
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				sqlSession.close();
				
			}
			
			return 0;
			
	}
	
	public int deleteUserdata (String userid) {
		
		 
		

		
		try {
			
			return sqlSession.delete(ns+"deleteUserdata",userid);
			
		} catch (Exception e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			sqlSession.close();
			
		}
		
		return 0;
		
}
	
	public int insertLeave (Leave leave) {
		
		 
		

		
		try {
			
			return sqlSession.insert(ns+"insertLeave", leave);
			
		} catch (Exception e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			sqlSession.close();
			
		}
		
		return 0;
			
	}
	
	public List<Leave> selectLeaveList () {
		
		 
		

		
		try {
			
			return sqlSession.selectList(ns+"selectLeaveList");
			
		} catch (Exception e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			sqlSession.close();
			
		}
		
		return null;
			
	}
	
	public List<UserData> selectUserList () {
		
		 
		

		
		try {
			
			return sqlSession.selectList(ns+"selectUserList");
			
		} catch (Exception e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			sqlSession.close();
			
		}
		
		return null;
			
	}
	
	public int findMailUser (String email) {
		
		 
		
		try {
			
			return sqlSession.selectOne(ns+"findMailUser",email);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			sqlSession.close();
			
		}
		
		return 0;
		
	}
	
	public int findMailLeave (String email) {
		
		 
		
		try {
			
			return sqlSession.selectOne(ns+"findMailLeave",email);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			sqlSession.close();
			
		}
		
		return 0;
		
	}
	
	public int changeBlack(String userid, String black){
		
		 
		
		map.clear();
		map.put("userid", userid);
		map.put("black", black);
		
		try {
			
			return sqlSession.update(ns+"changeBlack",map);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			
			sqlSession.close();
		
		}
		return 0;	
		
	}

	public List<UserData> selectBlackList () {
		
		 
		

		
		try {
			
			return sqlSession.selectList(ns+"selectBlackList");
			
		} catch (Exception e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			sqlSession.close();
			
		}
		
		return null;
			
	}
	
	public List<UserData> searchUserList (String searchId) {
		
		 
		

		
		try {
			
			return sqlSession.selectList(ns+"searchUserList",searchId);
			
		} catch (Exception e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			sqlSession.close();
			
		}
		
		return null;
			
	}
	
public int deleteLeave (String userid) {
			
		try {
			
			return sqlSession.delete(ns+"deleteLeave",userid);
			
		} catch (Exception e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			sqlSession.close();
			
		}
		
		return 0;
		
}
	
}
