package controller;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSendException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.UserdataDao;
import dto.Board;
import dto.Leave;
import dto.UserData;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@RequestMapping("/userdata/")
public class UserdataController {

	HttpServletRequest request;
	Model m;
	HttpSession session;

	@Autowired
	UserdataDao ud;
	
	@Autowired
	private JavaMailSender mailSender;

	@ModelAttribute
	void init(HttpServletRequest request, Model m) {
		this.request = request;
		this.m = m;
		this.session = request.getSession();
	}
	
	@RequestMapping("joinForm")
	public String joinForm() {

		return "/view/userdata/joinForm";
	}
	
	@RequestMapping("readId")
	public String readId(String id) {

		if (id == null) {
			id = "";
		}
		
		UserData u = ud.selectUserdata(id);

		String chk = u == null ? "false" : "true"; /* 삼항연산자 */
		
		
		m.addAttribute("chk", chk);

		return "/single/readId";
	}
	

	@RequestMapping("sendMail") 
	@ResponseBody
	public String sendMail(@RequestParam("email") String email) {
		
		//메일 중복 확인 
		
		int u = ud.findMailUser(email); //userdata에서 메일주소 확인
		int l = ud.findMailLeave(email); //leave에서 메일주소 확인
		String key = "";
		
		if (u == 0  && l == 0 ){ //userdata에도 없고 leave에도 없을 경우
	  
	  //랜덤 코드 발생 
		Random random = new Random(); 
		
	  
		for (int i = 0; i < 3; i++) { 
			int index = random.nextInt(25) + 65; // A~Z까지랜덤 알파벳 생성(3자리) 
			key += (char) index; 
		} 
			  
		int numIndex = random.nextInt(8999) +1000; // 4자리 정수를 생성 
		key += numIndex;
	  
	  //메일 보내기 
		final String username = "dalkey23@gmail.com"; 
		final String password = "vision1111*";  
	  
		String subject = "[NOW_CAMPING] 회원가입을 위한 인증코드 입니다."; 
		String body = "[NOW_CAMPING] 인증번호는" + "["+key+"]" + "입니다.";
	  
		
	try {
		MimeMessage mail = mailSender.createMimeMessage();
		MimeMessageHelper mailHelper;
		
			mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
		
		// true는 멀티파트 메세지를 사용하겠다는 의미
      
		/*
		 * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
		 * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
		 */
      
		mailHelper.setFrom(username);
		// 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
		// 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
		//mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
		mailHelper.setTo(email);
		mailHelper.setSubject(subject);
		mailHelper.setText(body, true);
		// true는 html을 사용하겠다는 의미입니다.
      
	    /*
	     * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
	     */
	      
		mailSender.send(mail);

		System.out.println("메일 전송 완료");
	} catch (MailSendException e) {
		key = "error";
	} catch (MessagingException e) {
		key = "error";
	}

	  
	  return key;
	  
	  } else if (u != 0) { 
		  key="alreadyJoin";
	  
		  return key;
	  
	  } else {
		  key="leaveData";

	  
		return key;
	  
	  }
	  
	  
	  }
	
	@RequestMapping("sendSms")
	@ResponseBody
	public String sendSms(@RequestParam("tel") String tel) {
		
		
		String api_key = "NCSR5X5KEQVEOKAK"; 
		String api_secret = "DTWYD4SUF2TM8LSJOWGZWSSMDJRZHHZO"; 
		Message coolsms = new Message(api_key, api_secret); 
		String key = "";
		
		Random random = new Random(); 
		
		int u = ud.findTelUser(tel); //userdata에서 tel 확인
		int l = ud.findTelLeave(tel); //leave에서 tel 확인
		
		if (u == 0  && l == 0 ){ //userdata에도 없고 leave에도 없을 경우
		
			for (int i = 0; i < 3; i++) { 
			int index = random.nextInt(25) + 65; // A~Z까지랜덤 알파벳 생성(3자리) 
			key += (char) index; 
		} 
			  
		int numIndex = random.nextInt(8999) +1000; // 4자리 정수를 생성 
		key += numIndex;
		
		// 4 params(to, from, type, text) are mandatory. must be filled 
		HashMap<String, String> params = new HashMap<String, String>(); 
		params.put("to", tel); // 수신전화번호 
		params.put("from", "01066682963"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨 
		params.put("type", "SMS"); 
		params.put("text", "[NOW_CAMPING] 인증번호는" + "["+key+"]" + "입니다."); // 문자 내용 입력 
		//params.put("app_version", "test app 1.2"); // application name and version

		try { 
			JSONObject obj = (JSONObject) coolsms.send(params); 
			System.out.println(obj.toString()); 
			
			int error_cnt = Integer.parseInt(obj.get("error_count").toString());
			System.out.println(error_cnt);
			
			if(error_cnt != 0) {
				key = "error";
				System.out.println(key);
			} else {
				System.out.println("sms 발송완료 (key :"+key+")");
			}
			
		} catch (CoolsmsException e) { 
			System.out.println(e.getMessage());
			System.out.println(e.getCode()); 
		}
		return key;
		
	} else if (u != 0) { 
			  key="alreadyJoin";
		  
			  return key;
		  
		  } else {
			  key="leaveData";

		  
			return key;
		  
		  }
	}

	@RequestMapping("emailChk")
	@ResponseBody
	public String emailChk(@RequestParam("email") String email) {
		
		int u = ud.findMailUser(email); //userdata에서 메일주소 확인
		int l = ud.findMailLeave(email);
		String msg = "";
		
		if( u == 0 && l == 0) {
			msg = "ok";
		} else if(u != 0) {
			msg = "alreadyJoin";
		} else {
			msg ="leaveData";
		}
		
		return msg;
		
	}
	
	@RequestMapping("smsChk")
	@ResponseBody
	public String smsChk(@RequestParam("tel") String tel) {
		
		int u = ud.findTelUser(tel); 
		int l = ud.findTelLeave(tel);
		String msg = "";
		
		if( u == 0 && l == 0) {
			msg = "ok";
		} else if(u != 0) {
			msg = "alreadyJoin";
		} else {
			msg ="leaveData";
		}
		
		return msg;
		
	}

	@RequestMapping("joinPro")
	public String joinPro(UserData u) {

		u.setUseridx(ud.nextUseridx());
		System.out.println(u.getUserid());
		
		int num = ud.insertUserdata(u);

		String msg = "";
		String url = "";
		if (num > 0) {
			msg = u.getName() + "님의 가입이 완료되었습니다.";
			url = request.getContextPath() + "/userdata/loginForm";
		} else {
			msg = "회원가입이 실패하였습니다.";
			url = request.getContextPath() + "/board/main";
			
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/view/alert";
	
	}

	@RequestMapping("loginForm")
	public String loginForm() {

		return "/view/userdata/loginForm";
	}
	
	@RequestMapping("loginPro")
	public String loginPro(String id, String pw) {


		UserData u = ud.selectUserdata(id);

		String msg = "아이디를 확인하세요";
		String url = request.getContextPath() + "/userdata/loginForm";

		if (u != null) {
			if (pw.equals(u.getPassword())) {			// 비밀번호 확인 
				if (u.getUserid().equals("vision")) { 	// 로그인 아이디가 vision인지 확인
					
					request.getSession().setAttribute("memberId", id);
					msg = u.getName() + "님이 로그인 하셨습니다.";
					url = request.getContextPath() + "/userdata/manager"; // 관리자페이지로 이동
				
				} else { //일반회원 로그인 시 블랙리스트인지 확인
					
					if (!u.getBlack().equals("0")) {
						msg = "로그인이 불가능한 아이디입니다. 관리자에게 문의하세요.";
						url = request.getContextPath() + "/userdata/loginForm";
						
					} else {
						
						request.getSession().setAttribute("memberId", id);
						msg = u.getName() + "님이 로그인 하셨습니다";
						url = request.getContextPath() + "/board/main";
						
					}
				}
				
			} else { //비밀번호 오류
				msg = "비밀번호를 확인하세요";
			}
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/view/alert";

	}
	
	@RequestMapping("manager")
	public String manager() {

		return "/view/manager";
	}

	@RequestMapping("logout")
	public String logout() {

		String login = (String) session.getAttribute("memberId");
		request.getSession().invalidate();

		String msg = login + "님이 로그아웃하였습니다.";
		String url = request.getContextPath() + "/board/main";

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/view/alert";
	}

	@RequestMapping("findIdForm")
	public String findForm() {

		return "/view/userdata/findIdForm";
	}

	@RequestMapping("findId")
	public String findId(String name, String email) {

		String userid = ud.findId(name, email);

		String msg = "";
		String url = "";

		if (userid == null) {
			msg = "일치하는 정보가 없습니다. 다시 확인바랍니다.";
			url = request.getContextPath() + "/userdata/findIdForm";
		} else {

			msg = "아이디는 " + userid + " 입니다.";
			url = request.getContextPath() + "/userdata/loginForm";

		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/view/alert";
	}

	@RequestMapping("findPsaaForm")
	public String findPsaaForm() {

		return "/view/userdata/findPsaaForm";
	}

	@RequestMapping("resetPass")
	public String resetPass(@RequestParam("id") String userid, 
					String name, String email) {

		String password = ud.findPass(userid, name, email);
		Random random = new Random();
		String newpass = "";

		for (int i = 0; i < 6; i++) {
			int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성(6자리)
			newpass += (char) index;
		}

		System.out.println(newpass + "-----------------");

		String msg = "";
		String url = request.getContextPath() + "/userdata/findPsaaForm";

		if (password == null) {

			msg = "일치하는 정보가 없습니다. 다시 확인바랍니다.";
			url = request.getContextPath() + "/userdata/findPsaaForm";

		} else {

			int num = ud.resetPass(userid, newpass);
			
			if (num > 0) {

				msg = "비밀번호가 변경되었습니다 :" + newpass;
				url = request.getContextPath() + "/userdata/loginForm";

			} else {
				msg = "오류 발생";
				url = request.getContextPath() + "/userdata/loginForm";
			}

		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);
		
		return "/view/alert";
	}

	@RequestMapping("mypage")
	public String mypage() {

		return "/view/userdata/mypage";
	}

	@RequestMapping("updateForm")
	public String updateForm() {

		String login = (String) session.getAttribute("memberId");

		UserData u = ud.selectUserdata(login);

		m.addAttribute("u", u);

		return "/view/userdata/updateForm";
	}

	@RequestMapping("userdataUpdate")
	public String userdataUpdate(UserData newUser) {

		UserData oldUser = ud.selectUserdata(newUser.getUserid());
		String msg = "";
		String url = request.getContextPath() + "/userdata/updateForm";
		
		if (newUser.getPassword().equals(oldUser.getPassword())) {
				int num = ud.updateUserdata(newUser);
				if (num > 0) {

					msg = "회원 정보가 수정 되었습니다";
					
				} else {
					msg = "정보 수정이 실패했습니다";
				}

			} else {
				
				msg = "비밀번호가 틀립니다. 다시 확인바랍니다.";
			}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/view/alert";

	}

	@RequestMapping("changePass")
	public String changePass() {

		return "/view/userdata/changePass";
	}

	@RequestMapping("changePassPro")
	public String changePassPro(String password, String newpassword) {

		
		String login = (String) session.getAttribute("memberId");

		UserData u = ud.selectUserdata(login);

		String msg = "비밀번호가 틀립니다. 확인 후 다시 입력하세요";
		String url = request.getContextPath() + "/userdata/changePass";

		if (u.getPassword().equals(password)) {

			int num = ud.resetPass(login, newpassword);

			if (num > 0) {

				msg = "비밀번호가 변경되었습니다. 다시 로그인 바랍니다.";
				request.getSession().invalidate();
				url = request.getContextPath() + "/userdata/loginForm";

			} else {
				msg = "비밀번호 변경이 실패했습니다.";

			}
		} 

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/view/alert";
	}

	@RequestMapping("deleteForm")
	public String deleteForm() {

		String userid = (String) session.getAttribute("memberId");

		m.addAttribute("userid", userid);

		return "/view/userdata/deleteForm";
	}

	@RequestMapping("deleteUserdata")
	public String deleteUserdata(String password) {

		String userid = (String) session.getAttribute("memberId");
		UserData u = ud.selectUserdata(userid);

		String msg = "비밀번호가 틀립니다. 확인 후 다시 입력하세요";
		String url = request.getContextPath() + "/userdata/deleteForm";

		Leave l = new Leave();

		l.setId(u.getUserid());
		l.setPass(u.getPassword());
		l.setName(u.getName());
		l.setGender(u.getGender());
		l.setTel(u.getTel());
		l.setEmail(u.getEmail());

		if (u.getPassword().equals(password)) {

			int num = ud.deleteUserdata(userid);

			if (num > 0) {

				int d = ud.insertLeave(l);
				System.out.println("탈퇴 회원 등록 완료:" + d);
				msg = "회원탈퇴가 완료되었습니다.";
				request.getSession().invalidate();
				url = request.getContextPath() + "/userdata/loginForm";

			} else {

				msg = "회원탈퇴가 실패했습니다.";
			}

		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/view/alert";
	}

	@RequestMapping("myBoardList")
	public String myBoardList() {

		String login = (String) session.getAttribute("memberId");

		List<Board> list = ud.selectMyboard(login);

		m.addAttribute("list", list);

		return "/view/userdata/myBoardList";
	}

	@RequestMapping("userdataList")
	public String userdataList() {

		List<UserData> list = ud.selectUserList();

		m.addAttribute("list", list);

		return "/manager/userdata/userdataList";
	}

	@RequestMapping("leaveList")
	public String leaveList() {

		List<Leave> list = ud.selectLeaveList();

		Calendar today = Calendar.getInstance(); // 추상클래스 new 생성 불가, Calendar.getInstance()이용
		today.setTime(new Date()); // 오늘날짜

		for (Leave li : list) {

			Calendar leaveDate = Calendar.getInstance();
			leaveDate.setTime(li.getLeave_date());

			long diffSec = (today.getTimeInMillis() - leaveDate.getTimeInMillis()) / 1000; // 초차이
			long diffDays = diffSec / (24 * 60 * 60); // 일자수 차이

			System.out.println(li.getId() + " 탈퇴 후 " + diffDays + "일 경과");

			if (diffDays >= 7) {
				ud.deleteLeave(li.getId());
			}

		}

		m.addAttribute("list", list);

		return "/manager/userdata/leaveList";
	}



	@RequestMapping("changeBlack")
	public String changeBlack(String userid) {
	
		int num = 0;
		String msg = " ";
		String url = request.getContextPath() + "/userdata/userdataList";
		

		UserData u = ud.selectUserdata(userid);
		System.out.println(u.getBlack());

		if (u.getBlack().equals("0")) {

			num = ud.changeBlack(userid, "1");
			msg = "블랙리스트에 추가되었습니다";

		} else if (u.getBlack().equals("1")) {

			num = ud.changeBlack(userid, "0");
			msg = "블랙리스트가 해제되었습니다";
		}

		m.addAttribute("msg", msg);
		m.addAttribute("url", url);

		return "/view/alert";

	}

	@RequestMapping("blackList")
	public String blackList() {

		List<UserData> list = ud.selectBlackList();

		m.addAttribute("list", list);

		return "/manager/userdata/blackList";
	}

	@RequestMapping("searchUserForm")
	public String searchUserForm() {

		return "/single/searchUserForm";
	}

	@RequestMapping("changeBlack2")
	public String changeBlack2(String userid) {
	
		int num = 0;
		String msg = " ";
		

		UserData u = ud.selectUserdata(userid);
		System.out.println(u.getBlack());

		if (u.getBlack().equals("0")) {

			num = ud.changeBlack(userid, "1");
			msg = "블랙리스트에 추가되었습니다";

		} else if (u.getBlack().equals("1")) {

			num = ud.changeBlack(userid, "0");
			msg = "블랙리스트가 해제되었습니다";
		}

		m.addAttribute("msg", msg);
	

		return "/view/alert2";

	}
	
	
	
	
	
	@RequestMapping("searchUserList")
	public String searchUserList(String searchId) {
		

		List<UserData> list = ud.searchUserList(searchId);
		System.out.println(list);

		m.addAttribute("list", list);

		return "/single/searchUserForm";
	}

	@RequestMapping("deleteLeave")
	public String deleteLeave() {
		
		String[] arrayParam = request.getParameterValues("check");
		for (int i = 0; i < arrayParam.length; i++) {
			String userid = arrayParam[i];
			System.out.println(arrayParam[i]);
			int num = ud.deleteLeave(userid);
		}

		List<Leave> list = ud.selectLeaveList();

		m.addAttribute("list", list);
		
		return "/manager/userdata/leaveList";
	}

}