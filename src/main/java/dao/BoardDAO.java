package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.util.logging.Level;
import java.util.logging.Logger;

import javax.annotation.PostConstruct;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dto.Board;



@Component
public class BoardDAO {
	private static final String NS="board.";
	private Map<String,Object> map = new HashMap<>();
	
	private final static Logger LOG = Logger.getGlobal();
	
	@Autowired
	MySqlSessionFactory sqlSessionFactory;
	SqlSession sqlSession;
	
	
	@PostConstruct
	public void setSqlSession() {
		this.sqlSession = sqlSessionFactory.sqlmap.openSession();
		
	} 

	public int boardCount(String boardid) {

			return sqlSession.selectOne(NS+"boardCount",boardid);
	}
	public List<Board> boardList(int pageInt, int limit, int boardcount, String boardid ,String searchName, String searchType
			) {


			map.clear();
			map.put("boardid",boardid);
			map.put("start",  (pageInt-1)*limit + 1);
			map.put("end",  pageInt*limit);
			
			map.put("searchType", searchType); map.put("searchName", searchName);
			
			
			 LOG.info("searchName : "+searchName);
			 LOG.info("searchType : "+searchType);
			System.out.println(map);
			return sqlSession.selectList(NS+"boardList",map);
		
	}

	public Board boardOne(int num) {
			return sqlSession.selectOne(NS+"boardOne",num);
			
	}

	public void readCountUp(int num) {

		try {
			
		sqlSession.update(NS+"readCountUp",num);
			
		} catch (Exception p) {
			p.printStackTrace();
		}finally {
			sqlSession.commit();
		}
		
	}

	public int boardUpdate(Board board) {

		try {
			
		 return sqlSession.update(NS+"boardUpdate",board);
			
		} catch (Exception p) {
			p.printStackTrace();
		}finally {
			sqlSession.commit();
		}
		return 0;
	}

	public int boardDelete(int num) {

		try {
			
		 return sqlSession.delete(NS+"boardDelete",num);
			
		} catch (Exception p) {
			p.printStackTrace();
		}finally {
			sqlSession.commit();
		}
		return 0;
	}

	public int nextNum() {	
		
		 return sqlSession.selectOne(NS+"nextNum");
		
	}

	public void refStepAdd(int ref, int refstep) {
		
		map.clear();
		map.put("ref", ref);
		map.put("refstep", refstep);
		

		try {
			
		 sqlSession.update(NS+"refStepAdd",map);
			
		} catch (Exception p) {
			p.printStackTrace();
		}finally {
			sqlSession.commit();
		}

	}

		public int insertBoard(Board board) {

		try {
			
		 return sqlSession.update(NS+"insertBoard", board);
			
		} catch (Exception p) {
			p.printStackTrace();
		}finally {
			sqlSession.commit();
		}
		return 0;
	}
		
		public List<Board> refList(int ref) {

		 return sqlSession.selectList(NS+"refList", ref);
	}
		
		public int refCount(int num) {
			
			 return sqlSession.selectOne(NS+"refCount", num);
			
		}
		
		
		
		
		
	}