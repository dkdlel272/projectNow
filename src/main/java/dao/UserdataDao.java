package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dto.Board;
import dto.Leave;
import dto.UserData;

@Component
public class UserdataDao {
	private static final String ns = "userdata.";
	private Map<String, Object> map = new HashMap<String, Object>();

	@Autowired
	MySqlSessionFactory sqlSessionFactory;
	SqlSession sqlSession;

	@PostConstruct
	public void setSqlSession() {
		this.sqlSession = sqlSessionFactory.sqlmap.openSession();
	}

	public int insertUserdata(UserData ud) {

		try {

			return sqlSession.insert(ns + "insertUserdata", ud);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			sqlSession.commit();

		}

		return 0;

	}

	public int nextUseridx() {

		return sqlSession.selectOne(ns + "nextUseridx");

	}

	public UserData selectUserdata(String id) {

		return sqlSession.selectOne(ns + "selectUserdata", id);

	}

	public List<Board> selectMyboard(String id) {

		return sqlSession.selectList(ns + "selectMyboard", id);

	}

	public String findId(String name, String email) {

		map.clear();

		map.put("name", name);
		map.put("email", email);

		return sqlSession.selectOne(ns + "findId", map);

	}

	public String findPass(String userid, String name, String email) {

		map.clear();
		map.put("userid", userid);
		map.put("name", name);
		map.put("email", email);

		return sqlSession.selectOne(ns + "findPass", map);

	}

	public int resetPass(String userid, String newpass) {

		map.clear();
		map.put("userid", userid);
		map.put("newpass", newpass);

		try {

			return sqlSession.update(ns + "resetPass", map);

		} catch (Exception e) {

			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			sqlSession.commit();

		}

		return 0;

	}

	public int updateUserdata(UserData u) {

		try {

			return sqlSession.update(ns + "updateUserdata", u);

		} catch (Exception e) {

			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			sqlSession.commit();

		}

		return 0;

	}

	public int deleteUserdata(String userid) {

		try {

			return sqlSession.delete(ns + "deleteUserdata", userid);

		} catch (Exception e) {

			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			sqlSession.commit();

		}

		return 0;

	}

	public int insertLeave(Leave leave) {

		try {

			return sqlSession.insert(ns + "insertLeave", leave);

		} catch (Exception e) {

			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			sqlSession.commit();

		}

		return 0;

	}

	public List<Leave> selectLeaveList() {

		return sqlSession.selectList(ns + "selectLeaveList");

	}

	public List<UserData> selectUserList() {

		return sqlSession.selectList(ns + "selectUserList");

	}

	public int findMailUser(String email) {

		return sqlSession.selectOne(ns + "findMailUser",email);

	}

	public int findMailLeave(String email) {

		return sqlSession.selectOne(ns + "findMailLeave", email);

	}

	public int changeBlack(String userid, String black) {

		map.clear();
		map.put("userid", userid);
		map.put("black", black);

		try {

			return sqlSession.update(ns + "changeBlack", map);

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			sqlSession.commit();

		}
		return 0;

	}

	public List<UserData> selectBlackList() {

		return sqlSession.selectList(ns + "selectBlackList");

	}

	public List<UserData> searchUserList(String searchId) {

		return sqlSession.selectList(ns + "searchUserList", searchId);

	}

	public int deleteLeave(String userid) {

		try {

			return sqlSession.delete(ns + "deleteLeave", userid);

		} catch (Exception e) {

			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			sqlSession.commit();

		}

		return 0;

	}

}
