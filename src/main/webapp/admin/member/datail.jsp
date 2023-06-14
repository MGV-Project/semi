<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String err = request.getParameter("err");
	String id = request.getParameter("id");	

	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getDetailMemberById(id);
	if (id == null) {
		response.sendRedirect("../loginform.jsp?err&job=" + URLEncoder.encode("회원목록조회", ("utf-8")));
		return;
	}
	
%>
<!doctype html>
<html lang="ko">
<head>
<link rel="icon" href="/mgv/images/member/mgv.ico" type="images/x-icon">
<title>회원관리 &#60; 관리자</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../../admin/nav.jsp">
	<jsp:param name="menu" value="ADMIN"/>
</jsp:include>
<div class="container">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="border bg-light fs-4 p-2">회원 상세 정보</h1>
      	</div>
   	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>회원 상세정보를 확인하세요</p>
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th class="table-dark" style="width: 10%;">아이디</th>
						<td style="width: 90%;"><%=member.getId() %></td>
					</tr>	
					<tr>
						<th class="table-dark " style="width: 10%;">이름</th>
						<td style="width: 40%;"><%=member.getName() %></td>
						<th class="table-dark" style="width: 10%;">성별</th>
						<td style="width: 40%;"><%=member.getGender() %></td>
					</tr>
					<tr>
						<th class="table-dark " style="width: 10%;">비밀번호</th>
						<td style="width: 40%;"><%=member.getPassword() %></td>
						<th class="table-dark" style="width: 10%;">생년월일</th>
						<td style="width: 40%;"><%=member.getBirth() %></td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 10%;">연락처</th>
						<td style="width: 40%;"><%=member.getTel() %></td>
						<th class="table-dark" style="width: 10%;">이메일</th>
						<td style="width: 40%;"><%=member.getEmail() %></td>
					</tr>
					<tr>
						<th class="table-dark" style="width:10%;">주소</th>
						<td style="width: 90%;" colspan="3"><%=member.getAddress1() + ", " + member.getAddress2() %></td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 10%;">가입일자</th>
						<td style="width: 90%;" colspan="3"><%=member.getCreateDate() %></td>
						<th class="table-dark" style="width: 10%;">가입일자</th>
						<td style="width: 90%;" colspan="3"><%=member.getCreateDate() %></td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 10%;">추천인</th>
						<td style="width: 40%;"><%=member.getReferee() == null ? "" : member.getReferee() %></td>
						<th class="table-dark" style="width: 10%;">탈퇴여부</th>
						<td>
<%
	if ("No".equals(member.getDisabled())) {
%>						
							<span class="badge text-bg-success" style="width: 20%;">사용중</span>
<%
	} else if ("Yes".equals(member.getDisabled())) {
%>
							<span class="badge text-bg-secondary" style="width: 20%">탈퇴</span>
<%
	}	
%>
						</td>					
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12 text-end">
			<a href="list.jsp" class="btn btn-outline-secondary">목록</a>
			<a href="../admin/center/oneonone/list.jsp?id=<%=member.getId() %>" class="btn btn-outline-info">문의내역</a>
<%
	if ("No".equals(member.getDisabled())) {
%>
			<a href="enable.jsp?id=<%=member.getId() %>" class="btn btn-outline-primary">복구</a>
<%
	}
%>	
		</div>
	</div>
	
</div>
</body>
</html>