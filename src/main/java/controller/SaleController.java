package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;




//@Controller
@RequestMapping("/sale/")
public class SaleController {
	
	@RequestMapping("list")
	public String sendMailForm(HttpServletRequest request, HttpServletResponse response) {
		
		return "/view/sale/list.jsp";
	}

}
