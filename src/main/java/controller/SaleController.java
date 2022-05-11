package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dao.SaleDAO;
import dto.Sale;
import dto.SaleReply;

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
		List<String> campNames = sd.selectCampList();
		
		m.addAttribute("userid", userid);
		m.addAttribute("campNames", campNames);

		return "/view/sale/saleWriteForm";
		
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
	
		if(s.getImage2() == null) {
			s.setImage2("");
		}
		String[] images = s.getImage2().split(",");
		List<String> image = new ArrayList<String>();
		
		for (String i : images) {
			image.add(i);
		}
		
		String userid = (String) session.getAttribute("memberId");
		
		List<SaleReply> reply = sd.saleReplyList(num);
		
		m.addAttribute("image",image);
		m.addAttribute("s", s);
		m.addAttribute("userid", userid);
		m.addAttribute("reply",reply);

		return "/view/sale/saleInfo";
	}
	
	@RequestMapping("saleUpdateForm")
	public String saleUpdateForm(int num) {

		Sale s = sd.selectSaleOne(num);
		List<String> campNames = sd.selectCampList();
		

		m.addAttribute("campNames", campNames);
		m.addAttribute("s", s);

		return "/view/sale/saleUpdateForm";
	}
	
	@RequestMapping("saleUpdatePro")
	public String saleUpdatePro(Sale sale, MultipartHttpServletRequest mhRequest,
			@RequestParam("image") MultipartFile[] file) {

		String path = request.getServletContext().getRealPath("/") + "/saleupload/";

		String fileOriginName = "";
		String fileMultiName = "";
		Sale oldSale = sd.selectSaleOne(sale.getSaleidx());
	
	
			for (int i = 0; i < file.length; i++) {
				
				if(file[i].getOriginalFilename() == "") {
					
					sale.setImage1(oldSale.getImage1());
					sale.setImage2(oldSale.getImage2());
					
				} else {
					
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
						sale.setImage2(fileMultiName);
					}
				}
	
			}

	
		String msg = "비밀번호가 틀렸습니다";
		String url = request.getContextPath() + "/sale/saleUpdateForm?num="+sale.getSaleidx();

		if(oldSale.getPassword().equals(sale.getPassword())) {
			
			int num = sd.updateSale(sale);
		
			if (num > 0) {
				msg = "게시물 수정 성공";
				url = request.getContextPath() + "/sale/saleInfo?num="+sale.getSaleidx();
				
			} else {
				msg = "게시물 수정 실패";
			
			}
				
		} 
		

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/view/alert";

	}
	
	@RequestMapping("saleDeleteForm")
	public String saleDeleteForm(int num) {

		Sale s = sd.selectSaleOne(num);
		
		m.addAttribute("s", s);

		return "/view/sale/saleDeleteForm";
	}
	
	@RequestMapping("saleDeletePro")
	public String saleDeletePro(int saleidx, String pass) {

		Sale s = sd.selectSaleOne(saleidx);
		
		String msg = "";
		String url = request.getContextPath() + "/sale/saleDeleteForm?num="+saleidx;
				
		if(s.getPassword().equals(pass)) {
			int num = sd.deleteSale(saleidx);
			
			if (num > 0) {
				msg = "게시물 삭제 성공";
				url = request.getContextPath() + "/sale/saleList";
				
			} else {
				msg = "게시물 삭제 실패";
				
			} 
		} else {
			msg = "비밀번호가 틀립니다. 다시 확인 바랍니다.";
			
					
		}
		
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/view/alert";
	}
	

	@RequestMapping("mySaleList")
	public String mySaleList() {

		String userid = (String) session.getAttribute("memberId");
		
		List<Sale> list = sd.mySaleList(userid);
		
	
		m.addAttribute("list", list);

		return "/view/sale/mySaleList";
	}
	
	@RequestMapping("changeCon")
	public String changeCon(@RequestParam("num") int saleidx) {
 
		Sale s = sd.selectSaleOne(saleidx);
		String msg	=	"error";
		String url = request.getContextPath() + "/sale/mySaleList";
		
		if(s.getCondition().equals("거래가능")) {
			int num = sd.changeCon(saleidx, "거래완료");
			if(num == 1) {
				msg="거래완료 처리되었습니다";
			} 
		} else {
			int num = sd.changeCon(saleidx, "거래가능");
			if(num == 1) {
				msg="거래가능";
			} 
		}
		
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/view/alert";
	}
	
	@RequestMapping("saleReply")
	public String saleReply(SaleReply sr) {

		sr.setReplyidx(sd.nextReplyidx());
		

		int num = sd.insertSaleReply(sr);

		String msg = "댓글 등록 실패";
		String url = request.getContextPath() + "/sale/saleInfo?num="+sr.getSalenum();

		if (num == 1) {

			msg = "댓글 등록 성공";
			

		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/view/alert";

	}

	@RequestMapping("saleReplyDelete")
	public String saleReplyDelete(int replyidx, int salenum) {

		
		
		String msg = "";
		String url = request.getContextPath() + "/sale/saleInfo?num="+salenum;
				
	
		int num = sd.deleteSaleReply(replyidx);
		
		if (num > 0) {
			msg = "댓글 삭제 성공";
			
			
		} else {
			msg = "댓글 삭제 실패";
			
		} 
	
		
		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/view/alert";
	}
}
