package controller;

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

import dao.CampDAO;
import dao.ReserveDAO;
import dto.Camp;
import dto.Reserve;



@Controller
@RequestMapping("/reserve/")
public class ReserveController {
	HttpServletRequest request;
    Model m;
    HttpSession session;

    @Autowired
    ReserveDAO rd;
    CampDAO cd;
    
    @ModelAttribute //이렇게 잡아놓는작업을 해두면 이걸로 계속 사용할 수 있다.
    void init(HttpServletRequest request, Model m) {
        this.request = request;
        this.m = m;
        this.session = request.getSession();
        
       
    }
	
	
	
	@RequestMapping("selectroom")
	public String selectroom(HttpServletRequest request, HttpServletResponse response) { 
        
			m.addAttribute("campname", request.getParameter("campname"));
		    return "/single/roomlist";
	}
	
	@RequestMapping("ReserveInsert") //완료
	public String ReserveInsert(HttpServletRequest request, HttpServletResponse response) {
		
		String login = (String) session.getAttribute("memberId");
		String msg = "";
		String url = "";
		if (login == null || login.trim().equals("")) { //login check
			msg = "로그인이 필요합니다.";
			url = request.getContextPath()+"/userdata/loginForm";
		}
		
		String name = rd.username(login);
		m.addAttribute("name", name);
		m.addAttribute("campname", request.getParameter("campname")); //파라미터로 받아온 campname를 그대로 사용
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		
		return "/view/reserve/ReserveInsert";
	}
	@RequestMapping("ReserveInsertPro") //완료
	public String ReserveInsertPro(HttpServletRequest request, HttpServletResponse response) {
		String login = (String) session.getAttribute("memberId");
		String msg = "";
		String url = "";
		if (login == null || login.trim().equals("")) { //login check
			msg = "로그인이 필요합니다.";
			url = request.getContextPath()+"/userdata/loginForm";
		}
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
//		rd.ReserveInsert(r);
		Reserve r = new Reserve();
		r.setUsername(request.getParameter("username"));
		r.setCampname(request.getParameter("campname"));
		r.setRoom(request.getParameter("room"));
		r.setCheckin(request.getParameter("checkin"));
		r.setCheckout(request.getParameter("checkout"));
		r.setPerson(Integer.parseInt(request.getParameter("person")));
		r.setPayidx(Integer.parseInt(request.getParameter("payidx")));
		r.setKid(Integer.parseInt(request.getParameter("kid")));
		r.setRoomno(Integer.parseInt(request.getParameter("roomno")));
		
		r.setReserveidx(rd.nextIdx());
		System.out.println(r.getReserveidx());
		int idx = rd.ReserveInsert(r);
		if (idx >= 1) {
			msg = "예약이 완료되었습니다.";
			url = request.getContextPath()+"/reserve/ReserveList";
		}else {
				msg = "예약이 실패하였습니다.";
				url = request.getContextPath()+"/reserve/ReserveInsert";
			}
			m.addAttribute("msg", msg);
			m.addAttribute("url", url);
			return "/view/alert";
		}
	@RequestMapping("ReserveDelete") //예약취소 완성
	public String ReserveDelete(HttpServletRequest request, HttpServletResponse response) {
		String login = (String) session.getAttribute("memberId");
		String msg = "로그인이 필요합니다.";
		String url = request.getContextPath()+"/userdata/loginForm";
		if (login == null || login.trim().equals("")) {

			m.addAttribute("msg", msg);
			m.addAttribute("url", url);
			return "/view/alert";
		}
		m.addAttribute("login", login);
		return "/view/reserve/ReserveDelete";
	}
	@RequestMapping("ReserveDeletePro") //팝업은 구현완료 체크인날짜와 오늘날짜비교 테스트
	public String ReserveDeletePro(HttpServletRequest request, HttpServletResponse response) {
		int idx = Integer.parseInt(request.getParameter("reserveidx"));
		String login = (String) session.getAttribute("memberId");
		String msg = "";
		String url = "";
		if (login == null || login.trim().equals("")) { //login check
			msg = "로그인이 필요합니다.";
			url = request.getContextPath()+"/userdata/loginForm";
		}
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String name = rd.username(login);
		int num = rd.ReserveDelete(idx);
			if (num == 0) { //delete no
				msg = name + "님의 예약취소시 오류 발생";
				url = request.getContextPath()+"/reserve/reserveinfo";
			} else { //delete ok
				msg = name + "님의 예약이 취소되었습니다";
				url = request.getContextPath()+"/reserve/ReserveList";
			}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/view/alert";
	}
	
	@RequestMapping("ReserveInfo")
	public String ReserveInfo(HttpServletRequest request, HttpServletResponse response) {
		int idx = Integer.parseInt(request.getParameter("reserveidx"));
		String login = (String) session.getAttribute("memberId");
		String msg = "";
		String url = "";
		if (login == null || login.trim().equals("")) { //login check
			msg = "로그인이 필요합니다.";
			url = request.getContextPath()+"/userdata/loginForm";
		}
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String name = rd.username(login);
		System.out.println(name);
		Reserve Rinfo = rd.ReserveInfo(idx);
		m.addAttribute("Rinfo", Rinfo);
		
		
		Camp camp = cd.CampInfo(Rinfo.getCampname());
		m.addAttribute("camp", camp);
		
		
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/view/reserve/ReserveInfo";
	}
	
	@RequestMapping("ReserveUpdate") //예약 변경 , 취소
	public String ReserveUpdate(HttpServletRequest request, HttpServletResponse response) {
		int idx = Integer.parseInt(request.getParameter("reserveidx"));
		String login = (String) session.getAttribute("memberId");
		String msg = "";
		String url = "";
		if (login == null || login.trim().equals("")) { //login check
			msg = "로그인이 필요합니다.";
			url = request.getContextPath()+"/userdata/loginForm";
		}
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Reserve Rinfo = rd.ReserveInfo(idx);
		List<String>   roomlist = rd.selectroom(Rinfo.getCampname());
		m.addAttribute("Rinfo", Rinfo);
		m.addAttribute("roomlist", roomlist);
		
		
		Camp camp = cd.CampInfo(Rinfo.getCampname());
		m.addAttribute("camp", camp);
		
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/view/reserve/ReserveUpdate";
	}
	
	@RequestMapping("ReserveUpdatePro") //완성
	public String ReserveUpdatePro(HttpServletRequest request, HttpServletResponse response) {
		
		String msg = "";
		String url = "";
		String login = (String) session.getAttribute("memberId");
		if (login == null || login.trim().equals("")) { //login check
			msg = "로그인이 필요합니다.";
			url = request.getContextPath()+"/userdata/loginForm";
		}
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Reserve r = new Reserve();
		r.setUsername(request.getParameter("username"));
		r.setCampname(request.getParameter("campname"));
		r.setRoom(request.getParameter("room"));
		r.setCheckin(request.getParameter("checkin"));
		r.setCheckout(request.getParameter("checkout"));
		r.setPerson(Integer.parseInt(request.getParameter("person")));
		r.setPayidx(Integer.parseInt(request.getParameter("payidx")));
		r.setKid(Integer.parseInt(request.getParameter("kid")));
		r.setRoomno(Integer.parseInt(request.getParameter("roomno")));
		r.setReserveidx(Integer.parseInt(request.getParameter("reserveidx")));
		
		String name = rd.username(login);
		int num = rd.ReserveUpdate(r);
			if (num == 0) { //update no
				msg = name + "님의 예약변경이 불가능합니다";
				url = request.getContextPath()+"/reserve/ReserveList";
			} else { //update ok
				msg = name + "님의 예약이 변경되었습니다";
				url = request.getContextPath()+"/reserve/ReserveList";
			}
			int idx = Integer.parseInt(request.getParameter("reserveidx"));
			Reserve Rinfo = rd.ReserveInfo(idx);
			m.addAttribute("Rinfo", Rinfo);
			
			
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/view/alert";
	}
	
	@RequestMapping("ReserveList") //예약 조회  완성
	public String ReserveList(HttpServletRequest request, HttpServletResponse response) {
		
		String login = (String) session.getAttribute("memberId");
		String msg = "";
		String url = "";
		if (login == null || login.trim().equals("")) { //login check
			msg = "로그인이 필요합니다.";
			url = request.getContextPath()+"/userdata/loginForm";
		}
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String name = rd.username(login);
		List<Reserve> li = rd.ReserveList(name);
		
		m.addAttribute("li", li);
		
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/view/reserve/ReserveList";
	}
	
}// end class