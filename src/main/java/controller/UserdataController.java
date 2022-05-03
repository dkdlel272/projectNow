package controller;


import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.UserdataDao;
import dto.Board;
import dto.Leave;
import dto.UserData;






@Controller
@RequestMapping("/userdata/")
public class UserdataController  {
	//로그인 세션 안썼는데 그거 확인하기
	//메일 보내기 다시 작업해야 할 듯
	
	HttpServletRequest request;
	Model m;
	HttpSession session;
	
	@Autowired
	UserdataDao ud;
	
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
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("sendMailForm")
	public String sendMailForm() {
		
		return "/view/userdata/sendMailForm";
	}
	
	@RequestMapping("sendMail")
	public String sendMail(String toMail) {
		
		//메일 중복 확인 
		System.out.println(toMail);
		
		UserdataDao ud = new UserdataDao();
		int u = ud.findMailUser(toMail);
		int l = ud.findMailLeave(toMail);
		String msg = "";
		String url = "";
		
		
		if(u == 0 && l == 0){
			
			//랜덤 코드 발생
			Random random = new Random();
			String key = "";
			
			for (int i = 0; i < 3; i++) {
				int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성(3자리)
				key += (char) index;
			}
			int numIndex = random.nextInt(8999) + 1000; // 4자리 정수를 생성
			key += numIndex;
			
			
			//메일 보내기
			final String username = "dalkey23";
			final String password = "vision1111*";
			
			
			String subject = "회원가입을 위한 인증코드 입니다.";
			String body = "인증코드: "+key;
			
			
			
			// 정보를 담기 위한 객체 생성 
			Properties props = new Properties();
			
			// SMTP 서버 정보 설정 
	
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");
	
		
			Session session = Session.getDefaultInstance(props,
					new javax.mail.Authenticator() { String un=username; String pw=password; 
						protected javax.mail.PasswordAuthentication getPasswordAuthentication() { 
							return new javax.mail.PasswordAuthentication(un, pw); } }); 
			session.setDebug(true); //for debug 
							
			MimeMessage mimeMessage = new MimeMessage(session); 
			//MimeMessage 생성 
			try {
				mimeMessage.setFrom(new InternetAddress("dalkey23@gmail.com"));
				//발신자 셋팅 ,이메일 풀 주소
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(toMail)); 
				//수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음 
				mimeMessage.setSubject(subject);
				
				mimeMessage.setText(body); 
				
				Transport.send(mimeMessage); 
				
				System.out.println("메일 전송 완료");
				
				//javax.mail.Transport.send() 이용
			} catch (AddressException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
			request.setAttribute("toMail", toMail);
			request.setAttribute("key", key);
			
			return "/view/userdata/certifyForm.jsp";
			
		} else if (u != 0) {
			msg ="이미 가입한 이메일입니다.";
			url =  request.getContextPath()+"/userdata/loginForm";
			
			request.setAttribute("msg", msg);
		  	request.setAttribute("url", url);
		  	
			return "/view/alert.jsp"; 
			
		} else  {
			
			msg ="가입할 수 없는 이메일입니다. 관리자에게 문의하세요";
			url = request.getContextPath()+"/board/main";
			
			request.setAttribute("msg", msg);
		  	request.setAttribute("url", url);
		  	
			return "/view/alert.jsp"; 
			
		} 


	}
	
	
	

	
	
	
	@RequestMapping("joinPro")
	public String joinPro() {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			String addr1 = request.getParameter("addr1");
			String addr2 = request.getParameter("addr2");
			String addr3 = request.getParameter("addr3");
			String addr4 = request.getParameter("addr4");
			String address = "("+addr1+") "+addr2+ " " + addr3 + " " + addr4;
			
			String name = request.getParameter("name");
		
			
			UserData u = new UserData();
			
			u.setUseridx(ud.nextUseridx());
			u.setUserid(request.getParameter("id"));
			u.setPassword(request.getParameter("pw"));
			u.setName(name);
			u.setGender(Integer.parseInt(request.getParameter("gender")));
			u.setBirthday(request.getParameter("birthday"));
			u.setTel(request.getParameter("tel"));
			u.setEmail(request.getParameter("email"));
			u.setAddress(address);
			
			
			
			
			int num =ud.insertUserdata(u);
			
			
		  	String msg = "";
		  	String url = "";
		  	if(num > 0){
		  		msg = name + "님의 가입이 완료되었습니다.";
		  		url = request.getContextPath()+"/userdata/loginForm";
		  	} else {
		  		msg = "회원가입이 실패하였습니다.";
		  		url = request.getContextPath()+"/board/main";
		  		///member/main : url-pattern
		  	}
		  	
		  	m.addAttribute("msg", msg);
		  	m.addAttribute("url", url);
		  	
			return "/view/alert"; 
			//기존 pro 페이지는 다 alert페이지(temporary페이지로 이동)
		
	}
	
	@RequestMapping("loginForm")
	public String loginForm() {
		
	
		
		return "/view/userdata/loginForm";
	}
	
	
	@RequestMapping("findIdForm")
	public String findForm() {
		
	
		
		return "/view/userdata/findIdForm";
	}
	
	@RequestMapping("findId")
	public String findId() {
		
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		
		
		String userid = ud.findId(name, email);
		
		String msg = "";
		String url = "";
		
		if(userid == null) {
			msg = "일치하는 정보가 없습니다. 다시 확인바랍니다.";
			url = request.getContextPath()+"/userdata/findIdForm";
		} else {
			
			msg = "아이디는 "+userid+" 입니다.";
			url = request.getContextPath()+"/userdata/loginForm";
			
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
	public String resetPass() {
		
		String userid = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
	

		String password = ud.findPass(userid, name, email);
		System.out.println(password+"===================");
		Random random = new Random();
		String newpass = "";
		
	
		
		for (int i = 0; i < 6; i++) {
			int index = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성(6자리)
			newpass += (char) index;
		}
		
		System.out.println(newpass+"-----------------");
		
		String msg = "";
		String url = request.getContextPath()+"/userdata/findPsaaForm";
		
		if(password == null) {
			
			msg = "일치하는 정보가 없습니다. 다시 확인바랍니다.";
			url = request.getContextPath()+"/userdata/findPsaaForm";
			
		} else {
			
			int num = ud.resetPass(userid, newpass);
		//	int num=0;
			if( num > 0) {
				
				msg = "비밀번호가 변경되었습니다 :" + newpass;
				url = request.getContextPath()+"/userdata/loginForm";
				
			} else {
				msg = "오류 발생" ;
				url = request.getContextPath()+"/userdata/loginForm";
			}

			
		}
		
		
		m.addAttribute("msg", msg);
	  	m.addAttribute("url", url);
	  	System.out.println(password+"===================2");	
		
		
		return "/view/alert";
	}
	
	
	
	
	@RequestMapping("manager")
	public String manager() {
		
	
		
		return "/view/manager";
	}

	@RequestMapping("loginPro")
	public String loginPro() {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pw");
		
		UserData u = ud.selectUserdata(id);
		
		String msg = "아이디를 확인하세요";
		String url = request.getContextPath()+"/userdata/loginForm"; 
		
		if(u != null){  
			
			if(u.getUserid().equals("vision")) { //로그인 아이디가 vision인지 확인
				if(pass.equals(u.getPassword())){ //비밀번호 확인
				
					request.getSession().setAttribute("memberId", id);
					msg = u.getName()+"님이 로그인 하셨습니다.";
					url = request.getContextPath()+"/userdata/manager"; //관리자페이지로 이동
		
				} else { //비밀번호 틀린경우
					msg = "비밀번호를 확인하세요";
				}
			} else {
				if(pass.equals(u.getPassword())){
					if(!u.getBlack().equals("0")) {
						msg = "블랙회원입니다. 관리자에게 문의하세요.";
						url = request.getContextPath()+"/userdata/loginForm";
					} else {
						request.getSession().setAttribute("memberId", id);
						msg = u.getName() + "님이 로그인 하셨습니다";
						url = request.getContextPath() + "/board/main";}
					} else {
						msg = "비밀번호를 확인하세요";
					}
					
				}
			}
		
			m.addAttribute("msg", msg);
	  		m.addAttribute("url", url);
		
			return "/view/alert";		
		
	}
	
	@RequestMapping("logout") 
	public String logout() {
		
		HttpSession session = request.getSession(); 
		//import 하고 session.getAttribute만 써도 됨 
		String login = (String) session.getAttribute("memberId");
		request.getSession().invalidate();
		
		String msg = login+"님이 로그아웃하였습니다.";
		String url = request.getContextPath()+"/board/main";
		
		m.addAttribute("msg", msg);
  		m.addAttribute("url", url);
  	
		return "/view/alert";
	}
	
	
	@RequestMapping("mypage")
	public String mypageForm() {
	
	
		
		return "/view/userdata/mypage";
	}
	
	@RequestMapping("updateForm")
	public String updateForm() {
		
		HttpSession session = request.getSession(); 
		String login = (String) session.getAttribute("memberId");
		
		
		UserData u = ud.selectUserdata(login);
		
		m.addAttribute("u", u);
	
		
		return "/view/userdata/updateForm";
	}
	
		
	@RequestMapping("userdataUpdate")
	public String userdataUpdate() {
		

		try {
			request.setCharacterEncoding("utf-8");
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	
		HttpSession session = request.getSession();
		String login = (String) session.getAttribute("memberId");
		
		
		int num = 0;
		String msg = "비밀번호가 틀립니다. 확인 후 다시 입력하세요";
		String url = request.getContextPath() + "/userdata/updateForm";
		
		
		// 로그인이 불가하면
		if (login == null || login.trim().equals("")) {
			msg = "로그인이 필요 합니다";
			url = request.getContextPath() + "/userdata/loginForm";
		} else {
			
			String name = request.getParameter("name");
			String pass = request.getParameter("password");
			int gender = Integer.parseInt(request.getParameter("gender"));
			String birthday = request.getParameter("birthday");
			String tel = request.getParameter("tel");
			String address = request.getParameter("address");

		
			UserData u = ud.selectUserdata(login);
			
			
			
			u.setName(name);
			u.setGender(gender);
			u.setBirthday(birthday);
			u.setTel(tel);
			u.setAddress(address);
			
			
	
			if (u.getPassword().equals(pass)) {
				num = ud.updateUserdata(u);
				if( num > 0) {
					
					msg = "회원 정보가 수정 되었습니다";
					url = request.getContextPath() + "/userdata/updateForm";
					
				} else {
				   msg = "정보 수정이 실패했습니다";
				}
	
			}
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
	public String changePassPro() {
		
		HttpSession session = request.getSession(); 
		String login = (String) session.getAttribute("memberId");
		
		String pass = request.getParameter("password");
		String newpass = request.getParameter("newpassword");
	
	
		UserData u = ud.selectUserdata(login);
		
		String msg = "비밀번호가 틀립니다. 확인 후 다시 입력하세요";
		String url = request.getContextPath() + "/userdata/changePass";
		
		
		if(u.getPassword().equals(pass)) {
			
			int num = ud.resetPass(login, newpass);
			
			if(num > 0 ) {
				
				msg = "비밀번호가 변경되었습니다.";
				request.getSession().invalidate();
				url = request.getContextPath()+"/userdata/loginForm";
			
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
		
		HttpSession session = request.getSession(); 
		String userid = (String) session.getAttribute("memberId");
		
		
		m.addAttribute("userid", userid);
		
		return "/view/userdata/deleteForm";
	}
	
	@RequestMapping("deleteUserdata")
	public String deleteUserdata() {
		
		HttpSession session = request.getSession(); 
		String userid = (String) session.getAttribute("memberId");
		
		String pass	= request.getParameter("password");
		
		
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
			
		
		if(u.getPassword().equals(pass)) {
			
			int num = ud.deleteUserdata(userid);
			
			if(num > 0) {
				
				
				int d = ud.insertLeave(l);
				System.out.println("탈퇴 회원 등록 완료:"+d);
				msg = "회원탈퇴가 완료되었습니다.";
				request.getSession().invalidate();
				url = request.getContextPath()+"/userdata/loginForm";
						
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
		
		HttpSession session = request.getSession(); 
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
		today.setTime(new Date()); //오늘날짜
		
		for(Leave li : list) {
			
			Calendar leaveDate = Calendar.getInstance();
			leaveDate.setTime(li.getLeave_date());
	
			long diffSec = (today.getTimeInMillis() - leaveDate.getTimeInMillis()) / 1000; //초차이
			long diffDays = diffSec / (24*60*60); //일자수 차이
			
			System.out.println(li.getId()+" 탈퇴 후 "+diffDays + "일 경과");
			
			
			if(diffDays >= 7) {
				ud.deleteLeave(li.getId());
			}
			
		}
		
	
		
		m.addAttribute("list", list);
	
		
		return "/manager/userdata/leaveList";
	}
	
	@RequestMapping("readId") 
	public String readId() {
		
		String id = request.getParameter("id");

		if(id==null) id ="";

		
		UserData u = ud.selectUserdata(id);

		String chk = u==null?"false":"true";  /* 삼항연산자 */
		
		m.addAttribute("chk", chk);
		
			return "/single/readId";
	}
	@RequestMapping("changeBlack")
	public String changeBlack() {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int num = 0;
		String msg = " ";
		String url = request.getContextPath() + "/userdata/userdataList";
		String userid = request.getParameter("userid");
			
		
		UserData u = ud.selectUserdata(userid);
		System.out.println(u.getBlack());
		
			if(u.getBlack().equals("0")) {
					
				num = ud.changeBlack(userid, "1");
				msg = "블랙리스트에 추가되었습니다";
				
			} else if(u.getBlack().equals("1")) { 
				
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
	
	@RequestMapping("searchUserList")
	public String searchUserList() {
		String searchId = request.getParameter("searchId");
		
		
		List<UserData> list = ud.searchUserList(searchId);
		System.out.println(list);
		
		m.addAttribute("list", list);
		
		
		return "/single/searchUserForm";
	}
	
	@RequestMapping("deleteLeave")
	public String deleteLeave() {
		
		List<String> checkIds = new ArrayList<String>();
		
		for(String checkId : checkIds) {
			checkId = request.getParameter("check");
			System.out.println(checkId);
		}
		
		

		return "/manager/userdata/leaveList";
	}
	
	
	
	
}