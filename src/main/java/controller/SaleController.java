package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dao.SaleDAO;
import dto.Sale;

@Controller
@RequestMapping("/sale/")
public class SaleController {

	HttpServletRequest request;
	Model m;
	HttpSession session;

	@Autowired
	SaleDAO sd;

	@ModelAttribute // 이렇게 잡아놓는작업을 해두면 이걸로 계속 사용할 수 있다.
	void init(HttpServletRequest request, Model m) {
		this.request = request;
		this.m = m;
		this.session = request.getSession();
	}

	@RequestMapping("saleList")
	public String saleList() {

		List<Sale> list = sd.selectSaleList();
		
	
		m.addAttribute("list", list);

		return "/view/sale/saleList";
	}

	@RequestMapping("selectCondition")
	public String selectCondition() {

		List<Sale> list = sd.selectCondition();

		m.addAttribute("list", list);

		return "/view/sale/saleList";
	}

	@RequestMapping("saleWriteForm")
	public String saleWriteForm() {

		String userid = (String) session.getAttribute("memberId");

		if (userid == null) {
			String msg = "로그인이 필요합니다.";
			String url = request.getContextPath() + "/userdata/loginForm";

			m.addAttribute("msg", msg);
			m.addAttribute("url", url);

			return "/view/alert";
		} else {

			m.addAttribute("userid", userid);

			return "/view/sale/saleWriteForm";
		}

	}

	@RequestMapping("saleWritePro")
	public String saleWritePro(Sale sale, MultipartHttpServletRequest mhRequest,
			@RequestParam("image") MultipartFile[] file) {

		String path = request.getServletContext().getRealPath("/") + "/saleupload/";

		String fileOriginName = "";
		String fileMultiName = "";

		for (int i = 0; i < file.length; i++) {

			fileOriginName = file[i].getOriginalFilename();
			

			File f = new File(path, fileOriginName);
			try {
				file[i].transferTo(f);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (i == 0) {
				fileMultiName += fileOriginName;
				sale.setImage1(fileMultiName); 
			} else {
				fileMultiName += "," + fileOriginName;
			}
		}
		System.out.println("*" + fileMultiName);

		sale.setSaleidx(sd.nextSaleidx());
		sale.setImage2(fileMultiName);

		int num = sd.insertSale(sale);

		String msg = "게시물 등록 실패";
		String url = request.getContextPath() + "/sale/saleWriteForm";

		if (num == 1) {

			msg = "게시물 등록 성공";
			url = request.getContextPath() + "/sale/saleList";

		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/view/alert";

	}

	@RequestMapping("saleInfo")
	public String saleInfo(int num) {

		
		Sale s = sd.selectSaleOne(num);
		sd.readCountUp(num);
		
		String[] images = s.getImage2().split(",");
		List<String> image = new ArrayList<String>();
		
		for (String i : images) {
			image.add(i);
		}
		
		String userid = (String) session.getAttribute("memberId");
		
		m.addAttribute("image",image);
		m.addAttribute("s", s);
		m.addAttribute("userid", userid);

		return "/view/sale/saleInfo";
	}
	
	@RequestMapping("saleUpdateForm")
	public String saleUpdateForm(int num) {

		Sale s = sd.selectSaleOne(num);
		
		m.addAttribute("s", s);

		return "/view/sale/saleUpdateForm";
	}

}
