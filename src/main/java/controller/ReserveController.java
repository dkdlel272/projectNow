package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
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
import dto.UserData;



@Controller
@RequestMapping("/reserve/")
public class ReserveController {
	HttpServletRequest request;
    Model m;
    HttpSession session;

    @Autowired
    ReserveDAO rd;
    @Autowired
    CampDAO cd;
    
    @ModelAttribute
    void init(HttpServletRequest request, Model m) {
        this.request = request;
        this.m = m;
        this.session = request.getSession();
        
       
    }
	
	
	
	@RequestMapping("selectroom")
	public String selectroom() { 
			m.addAttribute("campname", request.getParameter("campname"));
		    return "/single/roomlist";
	}
	
	@RequestMapping("ReserveInsert")
	public String ReserveInsert(String campname) {
		
		String login = (String) session.getAttribute("memberId");
		String name = rd.username(login);
		Camp camp = cd.chooseCamp(campname);
		List<UserData> user = rd.userInfo(login);
		
		m.addAttribute("user", user);
		m.addAttribute("name", name);
		m.addAttribute("camp", camp);
		
		return "/view/reserve/ReserveInsert";
	}
	@RequestMapping("ReserveInsertPro")
	public String ReserveInsertPro(Reserve reserve) {
		String msg = "";
		String url = "";
		reserve.setReserveidx(rd.nextIdx());
		int idx = rd.ReserveInsert(reserve);
		
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
	
	@RequestMapping("ReserveDelete")
	public String ReserveDelete() {
		return "/view/reserve/ReserveDelete";
	}
	
	@RequestMapping("ReserveDeletePro")
	public String ReserveDeletePro(int reserveidx) {
		
		String login = (String) session.getAttribute("memberId");
		String msg = "";
		String url = "";
		String name = rd.username(login);
		
		int idx = rd.ReserveDelete(reserveidx);
			if (idx == 0) { //delete no
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
	public String ReserveInfo(int reserveidx) {
		String msg = "";
		String url = "";
		Reserve Rinfo = rd.ReserveInfo(reserveidx);
		Camp camp = cd.CampInfo(Rinfo.getCampname());
		
		m.addAttribute("camp", camp);
		m.addAttribute("Rinfo", Rinfo);
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/view/reserve/ReserveInfo";
	}
	
	@RequestMapping("ReserveList")
	public String ReserveList() {
		String login = (String) session.getAttribute("memberId");
		String msg = "";
		String url = "";
		String name = rd.username(login);
		List<Reserve> li = rd.ReserveList(name);
		
		SimpleDateFormat  sf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String currdate = sf.format(date);
		
		m.addAttribute("li", li);
		m.addAttribute("currdate", currdate);
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/view/reserve/ReserveList";
	}
	
	@RequestMapping("CampList")
	public String CampList() {
		List<Camp> list = cd.CampList();
		m.addAttribute("list", list);
		return "/view/reserve/CampList";
	}

	@RequestMapping("CampSearch")
	public String CampSearch(String searchName, String searchType) {
		List<Camp> search = cd.SearchList(searchName, searchType);
		m.addAttribute("search", search);
		
		return "/view/reserve/CampSearch";
	}

	@RequestMapping("CampInfo")
	public String CampInfo(String campname) {
		Camp info = cd.CampInfo(campname);
		m.addAttribute("info", info);

		return "/view/reserve/CampInfo";
	}
	
}// end class