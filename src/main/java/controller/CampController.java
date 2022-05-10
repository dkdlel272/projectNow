package controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.CampDAO;
import dto.Camp;
import dto.IndexMap;
import dto.Reserve;

@Controller
@RequestMapping("/camp/")
public class CampController {

	HttpServletRequest request;
	Model m;
	HttpSession session;

	@Autowired
	CampDAO cd;
	/*
	 * @Autowired ViewCampDao vcd;
	 */

	@ModelAttribute // 이렇게 잡아놓는작업을 해두면 이걸로 계속 사용할 수 있다.
	void init(HttpServletRequest request, Model m) {
		this.request = request;
		this.m = m;
		this.session = request.getSession();
	}

	@RequestMapping("CampInsert")
	public String CampInsert() {
		return "/single/CampInsert";
	}

	@RequestMapping("CampInsertPro") // 관리자만 등록가능하게if문 추가예정
	public String CampInsertPro(Camp camp) {
		String path = request.getServletContext().getRealPath("/") + "/campupload/";
		int size = 10 * 1024 * 1024;
		System.out.println(path);
		MultipartFile multipartFile1 = camp.getF1();
		MultipartFile multipartFile2 = camp.getF2();
		MultipartFile multipartFile3 = camp.getF3();
		if (!multipartFile1.isEmpty()) {  
			File file = new File(path, multipartFile1.getOriginalFilename());
			try {
				multipartFile1.transferTo(file);
				camp.setCampimg(multipartFile1.getOriginalFilename());
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			camp.setCampimg("");

		}
		if (!multipartFile2.isEmpty()) {
			File file = new File(path, multipartFile2.getOriginalFilename());
			try {
				multipartFile2.transferTo(file);
				camp.setCampimg2(multipartFile2.getOriginalFilename());
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			camp.setCampimg2("");
		}
		if (!multipartFile3.isEmpty()) {
			File file = new File(path, multipartFile3.getOriginalFilename());
			try {
				multipartFile3.transferTo(file);
				camp.setCampimg3(multipartFile3.getOriginalFilename());
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			camp.setCampimg3("");
		}

		int seq = cd.CampInsert(camp); 
		String msg = "캠핑장 등록 실패";
		String url = request.getContextPath() + "/manager/camp/CampInsert";
		if (seq >= 1) {
			msg = "캠핑장 등록 성공";
			url = request.getContextPath() + "/manager/camp/CampList";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/view/alert2";
	}

	@RequestMapping("CampManager") 
	public String CampManager(Camp camp) {
		List<Reserve> rl = cd.reserveListAll();
		List<Camp> cl = cd.campListAll();
		m.addAttribute("cl", cl);
		m.addAttribute("rl", rl);
		return "/manager/camp/CampManager";
	}

	@RequestMapping("campDelete")
	public String campDelete(int campidx) {
		String msg = "";
		String url = "";
		Camp ci = cd.selectCamp(campidx);
		int cl = cd.campDelete(ci);
		msg = "삭제완료";
		url = request.getContextPath() + "/camp/CampManager";
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/view/alert";
	}

	@RequestMapping("reserveManager")
	public String reserveManager(HttpServletRequest request, HttpServletResponse respon) {
		Map map = cd.monthReserve();
		List<IndexMap> d1 = cd.dashboard1();
		List<IndexMap> d2 = cd.dashboard2();
		Map<Integer, String> md1 = new HashMap<Integer, String>();
		for (IndexMap im : d1) {
			md1.put(Integer.parseInt(im.getCo1()), im.getCo2());
		}
		Map<Integer, String> md2 = new HashMap<Integer, String>();
		for (IndexMap im : d2) {
			md2.put(Integer.parseInt(im.getCo1()), im.getCo2());
		}
		m.addAttribute("map", map);
		m.addAttribute("md1", md1);
		m.addAttribute("md2", md2);
		return "/manager/camp/reserveManager";
	}

	@RequestMapping("campUpdate")
	public String campUpdate(int campidx) {
		Camp c = cd.selectCamp(campidx);
		System.out.println(c);
		m.addAttribute("c", c);
		return "/single/campUpdate";
	}

	@RequestMapping("CampUpdatePro")
	public String CampUpdatePro(Camp camp) {
		String path = request.getServletContext().getRealPath("/") + "/campupload/";
		int size = 10 * 1024 * 1024;
		System.out.println(path);
		MultipartFile multipartFile1 = camp.getF1();
		MultipartFile multipartFile2 = camp.getF2();
		MultipartFile multipartFile3 = camp.getF3();
		if (!multipartFile1.isEmpty()) {  
			File file = new File(path, multipartFile1.getOriginalFilename());
			try {
				multipartFile1.transferTo(file);
				camp.setCampimg(multipartFile1.getOriginalFilename());
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			camp.setCampimg("");

		}
		if (!multipartFile2.isEmpty()) {
			File file = new File(path, multipartFile2.getOriginalFilename());
			try {
				multipartFile2.transferTo(file);
				camp.setCampimg2(multipartFile2.getOriginalFilename());
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			camp.setCampimg2("");
		}
		if (!multipartFile3.isEmpty()) {
			File file = new File(path, multipartFile3.getOriginalFilename());
			try {
				multipartFile3.transferTo(file);
				camp.setCampimg3(multipartFile3.getOriginalFilename());
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			camp.setCampimg3("");
		}
		String msg = "";
		String url = "";
		Camp c = cd.selectCamp(camp.getCampidx());
		if (c.getCampidx() == camp.getCampidx()) {
			cd.CampUpdate(camp);
			msg = "캠프 정보가 수정 되었습니다";
			url = request.getContextPath() + "/camp/CampManager";
		}
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		return "/view/alert2";
	} 

	@RequestMapping("payManager") 
	public String payManager() {

		return "/manager/camp/payManager"; 
	} 
	
	@RequestMapping("viewChk")
	@ResponseBody 
	public void viewChk(int idx, String chk) {
		cd.viewCampUpdate(idx, chk);
	}
	@RequestMapping("reserveSearch") 
	public String reserveSearch(String searchName, String searchType) {
		List<Camp> reserveSearch = cd.reserveSearchList(searchName, searchType);
		List<Camp> cl = cd.campListAll();
		m.addAttribute("cl", cl);
		m.addAttribute("reserveSearch", reserveSearch);
		
		return "/manager/camp/reserveSearch";
	}
	@RequestMapping("chartSearch")
	public String chartSearch(String searchType) {
		List<Camp> cl = cd.campListAll();
		Map map = cd.monthReserve();
		List<IndexMap> d1 = cd.chartMonthBoard1(searchType);
		List<IndexMap> d2 = cd.chartMonthBoard2(searchType);
		Map<Integer, String> md1 = new HashMap<Integer, String>();
		for (IndexMap im : d1) {
			md1.put(Integer.parseInt(im.getCo1()), im.getCo2());
		}
		Map<Integer, String> md2 = new HashMap<Integer, String>();
		for (IndexMap im : d2) {
			md2.put(Integer.parseInt(im.getCo1()), im.getCo2());
		}
		m.addAttribute("map", map);
		m.addAttribute("md1", md1);
		m.addAttribute("md2", md2);
		m.addAttribute("cl", cl);
		
		return "/manager/camp/chartSearch";
	}
	
} // end class
