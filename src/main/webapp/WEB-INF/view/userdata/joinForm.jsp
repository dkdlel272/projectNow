<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/ajax.js"></script>
<link rel="stylesheet" type="text/css" 
		href="<%=request.getContextPath() %>/resouces/css/joinForm.css">

<script>

	function idChk(){
	
	const id = document.f.userid.value
	let result = document.querySelector("#result")  
	const param ="id="+id
	
	if(id.length <8){
		result.style.color='red'
		result.innerHTML = 'ID는 8자리 이상 입력하세요'
		
	} else{
		
		ajax("<%=request.getContextPath()%>/userdata/readId", param,callback, 'post')
		}
	}

	function callback() {
		if (this.readyState == 4 && this.status == 200) {
			let result = document.querySelector("#result")
			let chk = this.responseText.trim();
			if (chk == "false") {
				result.style.color = 'blue'
				result.innerHTML = '사용가능한 ID입니다'

			} else {
				result.style.color = 'red'
				result.innerHTML = '사용중인 ID입니다'

			}
		}
	}

	function passChk(f) {

		if (f.password.value != f.password1.value) {
			alert("설정된 비밀번호가 다릅니다.")
			f.password.value = ""
			f.password1.value = ""
			f.password.focus()
			return false;
		}

		return true;
	}
	
	//라디오버튼 클릭시 이벤트 발생
	$(document).ready(function() {
			$("input:radio[name=certify]").click(function() {

				var btn_mail = document.getElementById('btn_mail')
				var btn_sms = document.getElementById('btn_sms')
				var btn_emailChk = document.getElementById('btn_emailChk')
				var btn_smsChk = document.getElementById('btn_smsChk')
				
				
				if ($("input[name=certify]:checked").val() == "sms") { //sms인증일 경우
					btn_sms.type = 'button'
					btn_emailChk.type = 'button'
					btn_mail.type ='hidden'
					btn_smsChk.type ='hidden'

				} else if ($("input[name=certify]:checked").val() == "email") {//email인증일 경우
					btn_sms.type= 'hidden'
					btn_emailChk.type = 'hidden'
					btn_mail.type ='button'
					btn_smsChk.type ='button'
				}
			});
		});
	
	

	//이메일 인증코드
	var emailCode = ""
	
	function sendMail() {
		
		var email = $("#email").val();
		
		$.ajax({
			type : "GET",
			url : "<%=request.getContextPath()%>/userdata/sendMail?email="+ email,
			success : function(data) {/* data -> return 값 */

						if (data == "error") {
							alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요.");
							f.email.value = ""
							f.email.focus()
							$(".successEmailChk").text("유효한 이메일 주소를 입력해주세요.");
							$(".successEmailChk").css("color", "red");
						} else if (data == "alreadyJoin") {
							alert("이미 가입한 이메일입니다. 다른 이메일을 입력해주세요.");
							f.email.value = ""
							f.email.focus()
							$(".successEmailChk").text(
									"이미 가입한 이메일입니다.다른 이메일을 입력해주세요.");
							$(".successEmailChk").css("color", "red");
						} else if (data == "leaveData") {
							alert("가입할 수 없는 이메일입니다. 다른 이메일을 입력해주세요.");
							f.email.value = ""
							f.email.focus()
							$(".successEmailChk").text(
									"가입할 수 없는 이메일입니다. 다른 이메일을 입력해주세요.");
							$(".successEmailChk").css("color", "red");
						} else {
							alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
							document.getElementById('email').readOnly = true
							document.getElementById('btn_mail').disabled = true
							var keyChk = document.getElementById('emailCode')
							keyChk.type = 'text'
							var keyChk = document.getElementById('btn_emailKey')
							keyChk.type = 'button'
							$(".successEmailChk").text(
									"인증번호를 입력한 뒤 이메일 인증을 눌러주십시오.");
							$(".successEmailChk").css("color", "green");
							emailCode = data
						}
					}
				});
	};

	//이메일 인증번호 대조 
	function emailKeyChk() {

		if ($("#emailCode").val() == emailCode) {
			$(".successEmailChk").text("인증번호가 일치합니다.");
			$(".successEmailChk").css("color", "green");
			document.getElementById('emailCode').disabled = true
			document.getElementById('btn_emailKey').disabled = true
		} else {
			$(".successEmailChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
			$(".successEmailChk").css("color", "red");
			f.emailCode.value = ""
			f.emailCode.focus()
		}
	};

	//sms 인증
	var SMScode = "";
	function sendSms() {
		
		var tel = $("#tel").val();
		$.ajax({
			type : "GET",
			url : "<%=request.getContextPath()%>/userdata/sendSms?tel="+ tel,
			cache : false,
			success : function(data) {
				if (data == "error") {
					alert("휴대폰 번호가 올바르지 않습니다. 유효한 번호를 입력해주세요.");
					f.tel.value = ""
					f.tel.focus()
					$(".successSmsChk").text("유효한 번호를 입력해주세요.");
					$(".successSmsChk").css("color", "red");
				} else if (data == "alreadyJoin") {
					alert("이미 가입한 번호입니다.다른 번호을 입력해주세요.");
					f.tel.value = ""
					f.tel.focus()
					$(".successSmsChk").text("이미 가입한 번호입니다.다른 번호을 입력해주세요.");
					$(".successSmsChk").css("color", "red");
				} else if (data == "leaveData") {
					alert("가입할 수 없는 번호입니다. 다른 번호를 입력해주세요.");
					f.tel.value = ""
					f.tel.focus()
					$(".successSmsChk").text("가입할 수 없는 번호입니다. 다른 번호를 입력해주세요.");
					$(".successSmsChk").css("color", "red");
				} else {
					alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
					document.getElementById('tel').readOnly = true
					document.getElementById('btn_sms').disabled = true
					var keyChk = document.getElementById('telCode')
					keyChk.type = 'text'
					var keyChk = document.getElementById('btn_smsKey')
					keyChk.type = 'button'
					$(".successSmsChk").text("인증번호를 입력한 뒤 본인인증을 눌러주십시오.");
					$(".successSmsChk").css("color", "green");
					SMScode = data
				}
			}
		});
	};
	
	//sms인증코드 확인
		function smsKeyChk() {

		if ($("#telCode").val() == SMScode) {
			$(".successSmsChk").text("인증번호가 일치합니다.");
			$(".successSmsChk").css("color", "green");
			document.getElementById('telCode').disabled = true
			document.getElementById('btn_smsKey').disabled = true
		} else {
			$(".successSmsChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
			$(".successSmsChk").css("color", "red");
			f.telCode.value = ""
			f.telCode.focus()
		}
	};
	
	//중복확인 email
	function emailChk() {
		
		var email = $("#email").val();
		$.ajax({
			type : "GET",
			url : "<%=request.getContextPath()%>/userdata/emailChk?email="+ email,
			cache : false,
			success : function(data) {
				if (data == "alreadyJoin") {
					alert("이미 가입한 이메일입니다.다른 이메일을 입력해주세요.");
					f.email.value = ""
					f.email.focus()
					$(".successEmailChk").text("이미 가입한 이메일입니다.다른 이메일을 입력해주세요.");
					$(".successEmailChk").css("color", "red");
				} else if (data == "leaveData") {
					alert("가입할 수 없는 이메일입니다. 다른 이메일를 입력해주세요.");
					f.email.value = ""
					f.email.focus()
					$(".successEmailChk").text("가입할 수 없는 이메일입니다. 다른 이메일를 입력해주세요.");
					$(".successEmailChk").css("color", "red");
				} else {
					alert("중복확인 완료. 가입 가능한 이메일입니다.");
					document.getElementById('email').readOnly = true
					$(".successEmailChk").text("중복확인 완료. 가입 가능한 이메일입니다.");
					$(".successEmailChk").css("color", "green");
				}
			}
		});
	};
	
	//중복확인 tel
	function smsChk() {
		
		var tel = $("#tel").val();
		$.ajax({
			type : "GET",
			url : "<%=request.getContextPath()%>/userdata/smsChk?tel="+ tel,
			cache : false,
			success : function(data) {
				if (data == "alreadyJoin") {
					alert("이미 가입한 번호입니다.다른 번호를 입력해주세요.");
					f.tel.value = ""
					f.tel.focus()
					$(".successSmsChk").text("이미 가입한 번호입니다.다른 번호를 입력해주세요.");
					$(".successSmsChk").css("color", "red");
				} else if (data == "leaveData") {
					alert("가입할 수 없는 번호입니다. 다른 번호를 입력해주세요.");
					f.tel.value = ""
					f.tel.focus()
					$(".successSmsChk").text("가입할 수 없는 번호입니다. 다른 번호를 입력해주세요.");
					$(".successSmsChk").css("color", "red");
				} else {
					alert("중복확인 완료. 가입 가능한 번호입니다.");
					document.getElementById('tel').readOnly = true
					$(".successSmsChk").text("중복확인 완료. 가입 가능한 번호입니다.");
					$(".successSmsChk").css("color", "green");
				}
			}
		});
	};
</script>
</head>
<body>
	<div class="subback">
		<h2 id="center">회원가입</h2>
	</div>
	<form class="container pt-5"
		action="<%=request.getContextPath()%>/userdata/joinPro" name="f"
		onsubmit="return passChk(this)">

		<div class="form-group ">
			<label>ID</label> 
			<input type="text" class="form-control in" name="userid" onkeyup="idChk()" /> 
			<span id="result" class="form-text">ID는8자리 이상 입력하세요</span>

		</div>

		<div class="form-group row">
			<div class="col">
				<label>Password</label> 
				<input type="password" class="form-control in" name="password">
			</div>
			<div class="col">
				<label>Confirm Password</label> 
				<input type="password" class="form-control in" name="password1">
			</div>
		</div>

		<div class="form-group row">
			<div class="col">
				<label>Name</label> <input type="text"
					class="form-control inwidthfull" name="name">
			</div>
			<div class="col">
				<label>Birth</label> <input type="text"
					class="form-control inwidthfull" name="birthday">
			</div>
		</div>
		<div class="form-group">
			<label for="gender">Gender:</label> <input type="radio" name="gender"
				value="1">남 <input type="radio" name="gender" value="2">여
		</div>
		<div class="form-group">

			<div class="form-check">
				인증 방법 선택 : 
				<input type="radio" name="certify" checked="checked" value="sms"> SMS인증 
				<input type="radio" name="certify" value="email"> EMAIL 인증
			</div>

			<label>Phone</label><br> 
			<input type="text" class="inwidth" id="tel" name="tel"> 
			<input type="button" id="btn_sms" value="인증코드전송" onclick="sendSms()">
			<input type="hidden" class="inwidth" id="telCode" name="telCode">
			<input type="hidden" id="btn_smsKey" value="인증코드확인" onclick="smsKeyChk()"> 
			<input type="hidden" id="btn_smsChk" value="중복확인" onclick="smsChk()"> 
			<span class="successSmsChk"> -을 제외한 숫자만 입력해주세요</span> <br>
				
				
			<label>Email</label><br> 
			<input type="text" id="email" class="inwidth" name="email"> 
			<input type="hidden" id="btn_mail" value="인증코드전송" onclick="sendMail()" > 
			<input type="hidden" class="inwidth" id="emailCode" name="emailCode"> 
			<input type="hidden" id="btn_emailKey" value="인증코드확인" onclick="emailKeyChk()"> 
			<input type="button" id="btn_emailChk" value="중복확인" onclick="emailChk()"> 
			<span class="successEmailChk"></span>

		</div>
		<div class="form-group">
			<label>Address</label><br> 
			<input type="text" class="inwidth" id="address" placeholder="주소" name="address"> 
			<input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"><br>
		</div>
			
		<div id="wrap" 
			style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
			<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
				id="btnFoldWrap"
				style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
				onclick="foldDaumPostcode()" alt="접기 버튼">
		</div>
		<br>
		
		<div align="center">
			<button type="submit" class="btn btn-info">회원 가입</button>
		</div>

	</form>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		// 우편번호 찾기 찾기 화면을 넣을 element
		var element_wrap = document.getElementById('wrap');

		function foldDaumPostcode() {
			// iframe을 넣은 element를 안보이게 한다.
			element_wrap.style.display = 'none';
		}

		function sample3_execDaumPostcode() {
			// 현재 scroll 위치를 저장해놓는다.
			var currentScroll = Math.max(document.body.scrollTop,
					document.documentElement.scrollTop);
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								

							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('address').value = "("+data.zonecode+") "+addr + extraAddr;
							

							// iframe을 넣은 element를 안보이게 한다.
							// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
							element_wrap.style.display = 'none';

							// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
							document.body.scrollTop = currentScroll;
						},
						// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
						onresize : function(size) {
							element_wrap.style.height = size.height + 'px';
						},
						width : '100%',
						height : '100%'
					}).embed(element_wrap);

			// iframe을 넣은 element를 보이게 한다.
			element_wrap.style.display = 'block';
		}
	</script>
</body>
</html>