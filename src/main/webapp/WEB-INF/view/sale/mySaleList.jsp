<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style >

.notosanskr * { 
 font-family: 'Noto Sans KR', sans-serif;
}

h2#center {
    text-align:center;
    margin-bottom:50px;
    color:#fff;
    line-height:500px;
    font-weight:bold;
    font-size: 35px;
    font-family: 'Noto Sans KR', sans-serif;
}
.subback {
    width:100%;
    height:500px;
    overflow:hidden;
    background:url("<%=request.getContextPath()%>/image/sale.jpg");
}
.container {
    margin-top:150px;
    margin-bottom:150px;
}
tr, td.center {
	text-align: center;
}
td.right{
	text-align: right;}
}

</style>
<%-- <script>

	
	var saleidx
	
	function changeCon() {
		for (let i = 1; i < saleList.rows.length; i++) {
			saleList.rows[i].cells[4].onclick = function () {
				saleidx = saleList.rows[i].cells[0].innerText;
				console.log("1:"+saleidx)
				$.ajax({
					type : "GET",
					url : "<%=request.getContextPath()%>/sale/changeCon?saleidx="+saleidx,
					cache : false,
					success : function(data) {
						console.log(data)
						if(data == "error"){
							alert("변경 실패");
						} else if(data == "ok"){
							alert("변경 완료");
									
						} else {
							alert("변경 완료");
							
						}

					}
				})
			}}
	}

</script> --%>
</head>
<body>
<div class="subback">
    <h2 id="center">MY PAGE</h2>
</div>

	<div class="container">

		<table class="table" id="saleList">
			<thead>
				<tr class="center">
					<th>번호</th>
					<th>제목</th>
					<th>장소</th>
					<th>금액</th>
					<th>거래상태</th>
				</tr>
			</thead>
			<tbody>
			
			<c:forEach var="s" items="${list}">
				<tr class="saleidx">
					<td>${s.saleidx}</td>				
					<td class="center">
						<a href="<%=request.getContextPath() %>/sale/saleInfo?num=${s.saleidx}">${s.subject}</a>
					</td>
					<td>${s.location}</td>
					<td class="right">
						<fmt:formatNumber value="${s.price}" pattern="#,###"/>
					</td>
					<td>
					<input type="button" value="${s.condition}" 
						onclick="location.href='<%=request.getContextPath()%>/sale/changeCon?num='+${s.saleidx}"> 
					</td>				
				</tr>
			</c:forEach>	
			</tbody>
		</table>
	
	</div>
</body>
</html>

</body>
</html>