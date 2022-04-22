package controller;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.logging.Level;
import java.util.logging.Logger;

import dao.BoardDAO;
import dto.Board;



@Controller
@RequestMapping("/board/")
public class BoardController{
	
	private final static Logger LOG = Logger.getGlobal();
	
	HttpServletRequest request;
	Model m;
	HttpSession session;
	
	@Autowired
	BoardDAO bd;

    @ModelAttribute //이렇게 잡아놓는작업을 해두면 이걸로 계속 사용할 수 있다.
    void init(HttpServletRequest request, Model m) {
        this.request = request;
        this.m = m;
        this.session = request.getSession();
    }
	
	//@WebServlet("/board/*")
	@RequestMapping("boardinquiryForm")
	public String boardinquiryForm(HttpServletRequest request,
			HttpServletResponse response) {
		
		 
		int boardcount = bd.boardCount("1");    
		List<Board> list = bd.boardList(1, 10, boardcount, "1","","");
		m.addAttribute("list", list);
		return "/view/board/boardinquiryForm";  
	}
	
	@RequestMapping("boardReview")
	public String boardReview(HttpServletRequest request, 
			HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String boardid = "1";
		int pageInt = 1;
		int limit = 3;


		//boardid이 파라미터로 넘어왔을때만 session에 저장한다
		if(request.getParameter("boardid") != null){
			session.setAttribute("boardid",request.getParameter("boardid"));
			session.setAttribute("pageNum", "1");
			
		}
		boardid=(String) session.getAttribute("boardid");
		if(boardid ==null){
			boardid ="1";
		}
		
		

		//pageNum이 파라미터로 넘어왔을때만 session에 저장한다
		if(request.getParameter("pageNum") != null){
			session.setAttribute("pageNum",request.getParameter("pageNum"));
		}
		String pageNum = (String)session.getAttribute("pageNum");
		if(pageNum ==null){pageNum ="1";}

		pageInt = Integer.parseInt(pageNum);


		
		 String searchName = request.getParameter("searchName"); 
		 String searchType = request.getParameter("searchType"); 
		 LOG.info("searchName : "+searchName);
		 LOG.info("searchType : "+searchType);

		 
		int boardcount = bd.boardCount(boardid);    


		/* 
		-- 1, 4, 7, 10
		-- start : (pageInt-1)*limit + 1;
		-- end : start + limit - 1;
		-- 1 p --> 1 ~ 3
		-- 2 p --> 4
		-- 3 p --> 7 
		*/

		List<Board> list = bd.boardList(pageInt, limit, 
			boardcount, boardid ,searchName,searchType);

		/* 
		-- 1 p --> boardcount ~ 
		-- 2 p --> boardcount - 1 * limit ~ 
		-- 3 p --> boardcount - 2 * limit
		*/ 
		int boardnum = boardcount - (pageInt - 1) * limit;


		int bottomLine = 3;
		int startPage = (pageInt -1 )/ bottomLine * bottomLine + 1;
		int endPage = startPage + bottomLine -1;
		int maxPage = (boardcount / limit) + (boardcount % limit == 0 ?0 : 1);
		if (endPage > maxPage) endPage = maxPage;


		/* 
		-- 1 p --> startpage = 1      (p-1)/3*3+1
		-- 2 p -->  startpage = 1    
		-- 3 p -->  startpage = 1     
		-- 4 p --> startpage = 4
		-- 5 p -->  startpage = 4
		-- 6 p -->  startpage = 4
		  1 2 3 , 4 5 6 , 7 ,8,9 
		*/
		String boardName="공지사항";
		switch(boardid){
		case "3": 
			boardName="QNA";
			break;
		case "2":
			boardName="리뷰게시판";
			break;

		}

		m.addAttribute("boardName", boardName);
		m.addAttribute("pageInt", pageInt);
		m.addAttribute("boardid", boardid);
		m.addAttribute("boardcount", boardcount);
		m.addAttribute("list", list);
		m.addAttribute("boardnum", boardnum);
		m.addAttribute("startPage", startPage);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("endPage", endPage);
		m.addAttribute("maxPage", maxPage);
		
		 
		return "/view/board/boardReview";
	}
	
		
		@RequestMapping("list")
		public String list(HttpServletRequest request, 
				HttpServletResponse response) {
			
			HttpSession session = request.getSession();
			
			String boardid = "1";
			int pageInt = 1;
			int limit = 3;


			//boardid이 파라미터로 넘어왔을때만 session에 저장한다
			if(request.getParameter("boardid") != null){
				session.setAttribute("boardid",request.getParameter("boardid"));
				session.setAttribute("pageNum", "1");
				
			}
			boardid=(String) session.getAttribute("boardid");
			if(boardid ==null){
				boardid ="1";
			}


			//pageNum이 파라미터로 넘어왔을때만 session에 저장한다
			if(request.getParameter("pageNum") != null){
				session.setAttribute("pageNum",request.getParameter("pageNum"));
			}
			String pageNum = (String)session.getAttribute("pageNum");
			if(pageNum ==null){pageNum ="1";}

			pageInt = Integer.parseInt(pageNum);



			 
			int boardcount = bd.boardCount(boardid);    


			/* 
			-- 1, 4, 7, 10
			-- start : (pageInt-1)*limit + 1;
			-- end : start + limit - 1;
			-- 1 p --> 1 ~ 3
			-- 2 p --> 4
			-- 3 p --> 7 
			*/

			
			String searchName = request.getParameter("searchName"); 
			String searchType = request.getParameter("searchType"); 
			
			List<Board> list = bd.boardList(pageInt, limit, 
					boardcount, boardid , searchName, searchType );

			/* 
			-- 1 p --> boardcount ~ 
			-- 2 p --> boardcount - 1 * limit ~ 
			-- 3 p --> boardcount - 2 * limit
			*/ 
			int boardnum = boardcount - (pageInt - 1) * limit;


			int bottomLine = 3;
			int startPage = (pageInt -1 )/ bottomLine * bottomLine + 1;
			int endPage = startPage + bottomLine -1;
			int maxPage = (boardcount / limit) + (boardcount % limit == 0 ?0 : 1);
			if (endPage > maxPage) endPage = maxPage;


			/* 
			-- 1 p --> startpage = 1      (p-1)/3*3+1
			-- 2 p -->  startpage = 1    
			-- 3 p -->  startpage = 1     
			-- 4 p --> startpage = 4
			-- 5 p -->  startpage = 4
			-- 6 p -->  startpage = 4
			  1 2 3 , 4 5 6 , 7 ,8,9 
			*/
			String boardName="공지사항";
			switch(boardid){
			case "3": 
				boardName="QNA";
				break;
			case "2":
				boardName="리뷰게시판";
				break;

			}

			m.addAttribute("boardName", boardName);
			m.addAttribute("pageInt", pageInt);
			m.addAttribute("boardid", boardid);
			m.addAttribute("boardcount", boardcount);
			m.addAttribute("list", list);
			m.addAttribute("boardnum", boardnum);
			m.addAttribute("startPage", startPage);
			m.addAttribute("bottomLine", bottomLine);
			m.addAttribute("endPage", endPage);
			m.addAttribute("maxPage", maxPage);
			

			
			return "/view/board/list";  //${list}
		}
		
		@RequestMapping("list_admin")
		public String list_admin(HttpServletRequest request, 
				HttpServletResponse response) {
			
			HttpSession session = request.getSession();
			
			String boardid = "1";
			int pageInt = 1;
			int limit = 3;


			//boardid이 파라미터로 넘어왔을때만 session에 저장한다
			if(request.getParameter("boardid") != null){
				session.setAttribute("boardid",request.getParameter("boardid"));
				session.setAttribute("pageNum", "1");
				
			}
			boardid=(String) session.getAttribute("boardid");
			if(boardid ==null){
				boardid ="1";
			}


			//pageNum이 파라미터로 넘어왔을때만 session에 저장한다
			if(request.getParameter("pageNum") != null){
				session.setAttribute("pageNum",request.getParameter("pageNum"));
			}
			String pageNum = (String)session.getAttribute("pageNum");
			if(pageNum ==null){pageNum ="1";}

			pageInt = Integer.parseInt(pageNum);



			 
			int boardcount = bd.boardCount(boardid);    


			/* 
			-- 1, 4, 7, 10
			-- start : (pageInt-1)*limit + 1;
			-- end : start + limit - 1;
			-- 1 p --> 1 ~ 3
			-- 2 p --> 4
			-- 3 p --> 7 
			*/

			
			String searchName = request.getParameter("searchName"); 
			 String searchType = request.getParameter("searchType"); 
			
			List<Board> list = bd.boardList(pageInt, limit, 
					boardcount, boardid,searchName, searchType);

			/* 
			-- 1 p --> boardcount ~ 
			-- 2 p --> boardcount - 1 * limit ~ 
			-- 3 p --> boardcount - 2 * limit
			*/ 
			int boardnum = boardcount - (pageInt - 1) * limit;
				System.out.println(list);

			int bottomLine = 3;
			int startPage = (pageInt -1 )/ bottomLine * bottomLine + 1;
			int endPage = startPage + bottomLine -1;
			int maxPage = (boardcount / limit) + (boardcount % limit == 0 ?0 : 1);
			if (endPage > maxPage) endPage = maxPage;


			/* 
			-- 1 p --> startpage = 1      (p-1)/3*3+1
			-- 2 p -->  startpage = 1    
			-- 3 p -->  startpage = 1     
			-- 4 p --> startpage = 4
			-- 5 p -->  startpage = 4
			-- 6 p -->  startpage = 4
			  1 2 3 , 4 5 6 , 7 ,8,9 
			*/
			String boardName="공지사항";
			switch(boardid){
			case "3": 
				boardName="QNA";
				break;
			case "2":
				boardName="리뷰게시판";
				break;

			}

			m.addAttribute("boardName", boardName);
			m.addAttribute("pageInt", pageInt);
			m.addAttribute("boardid", boardid);
			m.addAttribute("boardcount", boardcount);
			m.addAttribute("list", list);
			m.addAttribute("boardnum", boardnum);
			m.addAttribute("startPage", startPage);
			m.addAttribute("bottomLine", bottomLine);
			m.addAttribute("endPage", endPage);
			m.addAttribute("maxPage", maxPage);
			

			
			return "/manager/board/list_admin";  
		}
		

		@RequestMapping("boardWriteForm")
		public String boardWriteForm(HttpServletRequest request, 
				HttpServletResponse response) {

			return "/view/board/boardWriteForm";
		}
		
		@RequestMapping("boardWritePro")
		public String boardWritePro(Board board) {

			String path = request.getServletContext().getRealPath("/")+"/boardupload/";
			MultipartFile multipartFile = board.getF();
			if(!multipartFile.isEmpty()) {
				File file = new File(path, multipartFile.getOriginalFilename());
				try {
					multipartFile.transferTo(file);
					board.setFile1(multipartFile.getOriginalFilename());
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else {
				board.setFile1("");
			}
			

			
			//boardid setting
			String boardid = (String) request.getSession().getAttribute("boardid");
			if(boardid==null){boardid="1";}
			board.setBoardid(boardid);

			

			//새글인 경우
			board.setNum(bd.nextNum());
			board.setRef(board.getNum());
			int num = bd.insertBoard(board);
			String msg="게시물 등록 실패";
			String url=request.getContextPath() + "/board/boardWriteForm";
		
			if(num==1){
				msg="게시물 등록 성공";
				if(boardid.equals("1")) {
					url= request.getContextPath() +"/board/list?pageNum=1";
				}else if(boardid.equals("2")) {
				url= request.getContextPath() +"/board/boardReview?pageNum=1";
				}
			}
				
			
		    
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		
		return "/view/alert";
		}	
		
		
		@RequestMapping("boardReviewForm")
		public String boardReviewForm(HttpServletRequest request, 
				HttpServletResponse response) {

			return "/view/board/boardWriteForm";
		}
		
		
		@RequestMapping("boardInfo")
		public String boardInfo(HttpServletRequest request, 
				HttpServletResponse response) {
			
			int num = Integer.parseInt(request.getParameter("num"));
			
			Board b = bd.boardOne(num);
			bd.readCountUp(num);
			
			String boardName="공지사항";
			switch(b.getBoardid()){
			case "3": 
				boardName="QNA";
				break;
			case "2":
				boardName="리뷰게시판";
				break;

			}

			m.addAttribute("boardName", boardName);
			
			m.addAttribute("b", b);
			
			return "/view/board/boardInfo";
		}
		
		@RequestMapping("boardReviewInfo")
		public String boardReviewInfo(HttpServletRequest request, 
				HttpServletResponse response) {
			
			int num = Integer.parseInt(request.getParameter("num"));
			
			Board b = bd.boardOne(num);
			
			int ref = b.getNum();
			List<Board> li = bd.refList(ref);
			
			int refCount = bd.refCount(num);
			
			
			bd.readCountUp(num);
			
			String boardName="공지사항";
			switch(b.getBoardid()){
			case "3": 
				boardName="QNA";
				break;
			case "2":
				boardName="리뷰게시판";
				break;

			}

			m.addAttribute("boardName", boardName);
			m.addAttribute("li", li);
			m.addAttribute("refCount", refCount);
			
			m.addAttribute("b", b);
			
			return "/view/board/boardReviewInfo";
		}
		
		@RequestMapping("boardUpdateForm")
		public String boardUpdateForm(HttpServletRequest request, 
				HttpServletResponse response) {
			
			int num = Integer.parseInt(request.getParameter("num"));
			
			Board b = bd.boardOne(num);
			bd.readCountUp(num);
			
			m.addAttribute("b", b);
			
			return "/view/board/boardUpdateForm";  
		}
		
		 

		@RequestMapping("boardUpdatePro")
		public String boardUpdatePro(Board board) {
			
			
			String path = request.getServletContext().getRealPath("/")+"/boardupload/";
			int size=10*1024*1024;
			
			MultipartFile multipartFile = board.getF();
			if(!multipartFile.isEmpty()) {
				File file = new File(path, multipartFile.getOriginalFilename());
				try {
					multipartFile.transferTo(file);
					board.setFile1(multipartFile.getOriginalFilename());
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
			
			
			
			Board dbboard = bd.boardOne(board.getNum());
			String msg ="비밀번호가 틀렸습니다";
			String url ="boardUpdateForm?num=" + board.getNum();

			//비밀번호 확인
			if(board.getPass().equals(dbboard.getPass())){
				//수정하기
				if(bd.boardUpdate(board)>0){
					msg="수정완료하였습니다.";
					url="boardInfo?num=" + board.getNum();
				}else{
					msg="수정 실패";
					
				}
			}
			m.addAttribute("msg", msg);
			m.addAttribute("url", url);
			return "/view/alert";  
		}
		
		@RequestMapping("boardDeleteForm")
		public String boardDeleteForm(HttpServletRequest request, 
				HttpServletResponse response) {
			
			int num = Integer.parseInt(request.getParameter("num"));
			
			Board b = bd.boardOne(num);
			bd.readCountUp(num);
			
			m.addAttribute("num", num);
			
			
			return "/view/board/boardDeleteForm";  
		}
		
		@RequestMapping("boardReviewDeleteForm")
		public String boardReviewDeleteForm(HttpServletRequest request, 
				HttpServletResponse response) {
			
			int num = Integer.parseInt(request.getParameter("num"));
			
			Board b = bd.boardOne(num);
			bd.readCountUp(num);
			
			m.addAttribute("num", num);
			
			
			return "/view/board/boardReviewDeleteForm";  
		}
		
		@RequestMapping("boardDeletePro")
		public String boardDeletePro(HttpServletRequest request, 
				HttpServletResponse response) {
			
			String pass = request.getParameter("pass");
			int num = Integer.parseInt(request.getParameter("num"));
			
			Board board = bd.boardOne(num);
			String msg = "비밀번호가 틀렸습니다";
			String url = request.getContextPath()+"/board/boardDeleteForm?num=" + num;

			//비밀번호 확인
			if(pass.equals(board.getPass())) {
				if(bd.boardDelete(num)>0) {
					msg="게시글이 삭제되었습니다.";
					url=request.getContextPath()+"/board/list";
				}else {
					msg="게시글 삭제를 실패하였습니다.";
				}
				url=request.getContextPath()+"/board/list";
			}
			
			m.addAttribute("msg", msg);
			m.addAttribute("url", url);
			
			return "/view/alert"; 
		}
		
		@RequestMapping("boardReviewDeletePro")
		public String boardReviewDeletePro(HttpServletRequest request, 
				HttpServletResponse response) {
			
			String pass = request.getParameter("pass");
			int num = Integer.parseInt(request.getParameter("num"));
			
			Board board = bd.boardOne(num);
			String msg = "비밀번호가 틀렸습니다";
			String url = request.getContextPath()+"/board/boardReviewDeleteForm?num=" + num;

			//비밀번호 확인
			if(pass.equals(board.getPass())) {
				if(bd.boardDelete(num)>0) {
					msg="게시글이 삭제되었습니다.";
					url=request.getContextPath()+"/board/boardReview?boardid=2";
				}else {
					msg="게시글 삭제를 실패하였습니다.";
				}
				url=request.getContextPath()+"/board/boardReview?boardid=2";
			}
			
			m.addAttribute("msg", msg);
			m.addAttribute("url", url);
			
			return "/view/alert"; 
		}
		

		@RequestMapping("boardReplyPro")
		public String boardReplyPro(HttpServletRequest request, 
				HttpServletResponse response) {
			HttpSession session = request.getSession();
			
			try {
				request.setCharacterEncoding("utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			Board board = new Board();
			 

			board.setWriter(request.getParameter("writer"));
			board.setPass(request.getParameter("pass"));
			board.setSubject(request.getParameter("subject"));
			board.setContent(request.getParameter("content"));
			board.setFile1(" ");
			board.setBoardid("2");
			board.setRefcount(0);
			
			//boardid setting
			//String boardid = (String)session.getAttribute("boardid");
			//if(boardid==null){boardid="1";}
			//board.setBoardid(boardid);


			int num = Integer.parseInt(request.getParameter("num"));
			int ref = Integer.parseInt(request.getParameter("ref"));
			int reflevel = Integer.parseInt(request.getParameter("reflevel"));
			int refstep = Integer.parseInt(request.getParameter("refstep"));
			String msg ="답변 등록시 오류 발생";
			String url = request.getContextPath()+"/board/boardReviewInfo?num=" + num;
			
			
			
			
			//restep add(추가)
			bd.refStepAdd(ref, refstep);


			board.setNum(bd.nextNum());
			board.setRef(ref);  //원조 새글 ref
			board.setReflevel(reflevel+1); // 기준글 reflevel+1
			board.setRefstep(refstep+1); 

			if (bd.insertBoard(board)>0){
				msg="답변 등록 완료";
				
			}
			m.addAttribute("msg", msg);
			m.addAttribute("url", url);
			
			return "/view/alert"; 
		}
		
		@RequestMapping("main")
		public String main(HttpServletRequest request, 
				HttpServletResponse response) {
			
			 
			List<Board> list1 = bd.boardList(1, 4, 0, "1","","");
			List<Board> list2 = bd.boardList(1, 5, 0, "2","","");
			List<Board> list3 = bd.boardList(1, 5, 0, "3","","");
			
			
			m.addAttribute("list1", list1);
			m.addAttribute("list2", list2);
			m.addAttribute("list3", list3);
			
			
			
			
			
			return "/view/main";
	}
		
		@RequestMapping("map")
		public String map(HttpServletRequest request, 
				HttpServletResponse response) {
		
			
			
			return "/view/map";
	}
		
		@RequestMapping("company")
		public String company(HttpServletRequest request, 
				HttpServletResponse response) {
		
			
			
			return "/view/company";
	}		
}
