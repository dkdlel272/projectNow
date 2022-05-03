package controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/reserve")
public class KakaoPayController {
	
	@RequestMapping("/reserve.cls")
	public ModelAndView main(ModelAndView mv, HttpSession s, RedirectView rv) {
		mv.setViewName("jq/test");
		return mv;
	}
	
	@RequestMapping("/pay.cls")
	public ModelAndView serve(ModelAndView mv, HttpSession s, RedirectView rv) {
		mv.setViewName("jq/serve");
		return mv;
	}
	
	@RequestMapping("/kakaopay.cls")
	@ResponseBody
	public String kakappay() {
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Authorization", "KakaoAK b6cac69f90f07cc627e1c79507abe757");
			con.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8\r\n");
			con.setDoOutput(true);
			String param = "cid=TC0ONETIME & "
					+ "partner_order_id=partner_order_id &"
					+ "partner_user_id=partner_user_id &"
					+ "item_name=Reserve &"
					+ "quantity=1 &"
					+ "total_amount=2200 &"
					+ "vat_amount=200 &"
					+ "tax_free_amount=0 &"
					+ "approval_url=http://localhost:8080 &"
					+ "fail_url=http://localhost:8080 &"
					+ "cancel_url=http://localhost:8080";
			OutputStream op = con.getOutputStream();
			DataOutputStream dop = new DataOutputStream(op);
			dop.writeBytes(param);
			dop.close();
			
			int result = con.getResponseCode();
			
			InputStream ip;
			if(result == 200) {
				ip = con.getInputStream();
			}else {
				ip = con.getErrorStream();
			}
			InputStreamReader readip = new InputStreamReader(ip);
			BufferedReader br = new BufferedReader(readip);
			return br.readLine();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "{\"result\":\"NO\"}";
	}
} //end class
