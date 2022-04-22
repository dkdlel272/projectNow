package controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import dao.CampDAO;
import dao.ReserveDAO;
import dao.UserdataDao;
import dto.Camp;
import dto.Reserve;
import dto.UserData;

//@Controller
@RequestMapping("/camp/")
public class CampController{	
		
		HttpServletRequest request;
	    Model m;
	    HttpSession session;
	
	    @ModelAttribute //이렇게 잡아놓는작업을 해두면 이걸로 계속 사용할 수 있다.
	    void init(HttpServletRequest request, Model m) {
	        this.request = request;
	        this.m = m;
	        this.session = request.getSession();
	    }
    
	    
		@RequestMapping("main")
		public String main(HttpServletRequest request, HttpServletResponse response) {
			try {
				request.setCharacterEncoding("UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			    return "/view/main.jsp";
		}
		
		@RequestMapping("CampInsert")
		public String ReservatIoninput(HttpServletRequest request, HttpServletResponse response) {
			System.out.println("insert");
			return "/single/CampInsert.jsp";
		}
		
		@RequestMapping("CampInsertPro") //관리자만 등록가능하게if문 추가예정
		public String CampInsertPro(Camp camp) {
			String path = request.getServletContext().getRealPath("/")+"/campupload/";
			int size=10*1024*1024;
			
			MultipartFile multipartFile = camp.getF();
			if(!multipartFile.isEmpty()) {
				File file = new File(path, multipartFile.getOriginalFilename());
				try {
					multipartFile.transferTo(file);
					camp.setCampimg(multipartFile.getOriginalFilename());
					camp.setCampimg2(multipartFile.getOriginalFilename());
					camp.setCampimg3(multipartFile.getOriginalFilename());
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else {
				camp.setCampimg("");
				camp.setCampimg2("");
				camp.setCampimg3("");
			}
			
			CampDAO cd =  new CampDAO();
			
			int seq = cd.CampInsert(camp);
			String msg="캠핑장 등록 실패";
			String url=request.getContextPath()+"/manager/camp/CampInsert";
			if(seq>=1) {
				msg="캠핑장 등록 성공";
				url = request.getContextPath()+"/manager/camp/CampList";
			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "/view/alert2.jsp";
		}
		
		@RequestMapping("CampList") // 완성
		public String CampList(HttpServletRequest request, HttpServletResponse response) {
			CampDAO cd = new CampDAO();
			List<Camp> list = cd.CampList();
			request.setAttribute("list", list);
			
			
			return "/view/camp/CampList.jsp";
		}
		
		@RequestMapping("CampSearch")
		public String CampSearch(HttpServletRequest request, HttpServletResponse response) {
			String searchName = request.getParameter("searchName"); 
			 String searchType = request.getParameter("searchType");
			CampDAO cd = new CampDAO();
			List<Camp> search = cd.SearchList(searchName, searchType);
			request.setAttribute("search", search);
			
			return "/view/camp/CampSearch.jsp";
		}
		
		@RequestMapping("CampInfo") //캠핑장 상세보기 해당캠핑장의 정보가 넘어와야 함
		public String CampInfo(HttpServletRequest request, HttpServletResponse response) {
			String campname = request.getParameter("campname");
			CampDAO cd = new CampDAO();
			Camp info = cd.CampInfo(campname);
			request.setAttribute("info", info);
			
			return "/view/camp/CampInfo.jsp";
		}
		
		@RequestMapping("payManager")
		public String payManager(HttpServletRequest request, HttpServletResponse respon) {

			return "/manager/camp/payManager.jsp";
		}
		
		
//		@RequestMapping("CampUpdate") //관리자권한 (캠핑장 수정)
//		public String CampUpdate(HttpServletRequest request, HttpServletResponse response) {
//			int campidx = Integer.parseInt(request.getParameter("campidx"));
//			CampDAO cd = new CampDAO();
//			Camp c = cd.CampUpdate(camp);
//			request.setAttribute("c", c);
//			return "/view/camp/CampUpdate.jsp";
//		}
		
	
		
		
		@RequestMapping("CampManager")
		public String CampManager(HttpServletRequest request, HttpServletResponse response) {
			CampDAO cd = new CampDAO();
			List<Reserve> rl = cd.reserveListAll();
			List<Camp> cl = cd.campListAll();
			request.setAttribute("cl", cl);
			request.setAttribute("rl", rl);
			return "/manager/camp/CampManager.jsp";
		}
		@RequestMapping("chart")
		public String chart(HttpServletRequest request, HttpServletResponse response) {
			CampDAO cd = new CampDAO();
			List<Reserve> d1 = cd.dashboard1();
			List<Reserve> d2 = cd.dashboard1();
			request.setAttribute("d1", d1);
			request.setAttribute("d2", d2);
			return "/manager/camp/chart.jsp";
		}
		
		
		
		
		@RequestMapping("campListAll")
		public String campListAll(HttpServletRequest request, HttpServletResponse respon) {
			HttpSession session = request.getSession();
			String login = (String) session.getAttribute("memberId");
			// 로그인 불가이면
			String msg = "";
			String url = "";
			if (login !=null) {
				CampDAO cd = new CampDAO();
				List<Camp> cl = cd.campListAll(); 
				request.setAttribute("cl", cl);
				return "/manager/camp/CampManager";
			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "/view/alert.jsp";
		}
		@RequestMapping("blackList")
		public String blackList(HttpServletRequest request, HttpServletResponse respon) {
			HttpSession session = request.getSession();
			String login = (String) session.getAttribute("memberId");
			// 로그인 불가이면
			String msg = "권한이 없습니다";
			String url = request.getContextPath()+"/userdata/loginForm";
			if (login != null) {
				CampDAO ud = new CampDAO();
				List<UserData> bl = ud.blackList("1"); 
				System.out.println(bl);
				request.setAttribute("bl", bl);
				return "/manager/camp/blackList.jsp";
			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "/view/alert.jsp";
		}
		@RequestMapping("campDelete")
		public String campDelete(HttpServletRequest request, HttpServletResponse respon) {
			HttpSession session = request.getSession();
			String  login = (String) session.getAttribute("memberId");
			String msg = "로그인이 필요 합니다";
			String url = request.getContextPath() + "/userdata/loginForm";
		
			CampDAO cd = new CampDAO();  
			int idx = Integer.parseInt(request.getParameter("campidx"));
			Camp ci = cd.selectCamp(idx);
		
			
			if (login!=null && login.equals("vision")) {
				int cl = cd.campDelete(ci);
						msg = "삭제완료";
						url = request.getContextPath() + "/camp/CampManager";
					}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "/view/alert.jsp";
		}
		
		@RequestMapping("reserveListAll")
		public String reserveListAll(HttpServletRequest request, HttpServletResponse respon) {
			HttpSession session = request.getSession();
			String login = (String) session.getAttribute("memberId");
			// 로그인 불가이면
			String msg = "";
			String url = "";
			if (login!=null && login.equals("vision")) {
				CampDAO cd = new CampDAO();
				List<Reserve> rl = cd.reserveListAll();
				request.setAttribute("rl", rl);
				return "/manager/camp/CampManager";
			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "/view/alert.jsp";
		}
		@RequestMapping("reserveManager")
		public String reserveManager(HttpServletRequest request, HttpServletResponse respon) {
			HttpSession session = request.getSession();
			String  login = (String) session.getAttribute("memberId");
			String msg = "로그인이 필요 합니다";
			String url = request.getContextPath() + "/userdata/loginForm";
			
			if (login!=null && login.equals("vision")) {
				CampDAO cd = new CampDAO();
				
				Map map = cd.monthReserve();
				List<Reserve> d1 = cd.dashboard1();
				List<Reserve> d2 = cd.dashboard2();
				request.setAttribute("map", map);
				request.setAttribute("d1", d1);
				request.setAttribute("d2", d2);
				return  "/manager/camp/reserveManager.jsp";
			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			return "/view/alert.jsp";
		}
		
		
	} //end class
