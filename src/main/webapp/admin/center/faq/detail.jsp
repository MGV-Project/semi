<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="vo.Faq"%>
<%@page import="dao.FaqDao"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%

	//세션에서 로그인된 사용자 정보를 조회한다.
	String id = (String) session.getAttribute("loginId");
	String type = (String) session.getAttribute("loginType");		

	MemberDao memberDao = MemberDao.getInstance();
	Member member = memberDao.getMemberById(id);
	
	if (member == null) {
		response.sendRedirect("../../../member/login/form.jsp?err=req&job="+URLEncoder.encode("고객센터 관리", "utf-8"));
		return;
	}

	if (!"ADMIN".equals(type)) {
		response.sendRedirect("../../../member/login/form.jsp?err=req&job="+URLEncoder.encode("고객센터 관리", "utf-8"));
		return;
	}
	
	int no = Integer.parseInt(request.getParameter("no"));

	FaqDao faqDao = FaqDao.getInstance();
	Faq faq = faqDao.getFaqByNo(no);
	
%>
<!doctype html>
<html lang="ko">
<head>
<link rel="icon" href="/mgv/images/member/mgv.ico" type="images/x-icon">
<title>상세페이지 | 자주묻는 질문 &#60; MGV 고객센터</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../../nav.jsp">
	<jsp:param name="menu" value="고객센터"/>
</jsp:include>

<div class="container mt-3">
	<div class="row">
		<div class="col-3">
    				<div class="card">
       	  		<div class="card-header text-center" >고객센터</div>
            		<div class="list-group">
  <a href="../home.jsp" class="list-group-item list-group-item-action">고객센터 홈</a>
  <a href="../lostitem/list.jsp" class="list-group-item list-group-item-action">분실물 문의</a>
  <a href="../oneonone/list.jsp" class="list-group-item list-group-item-action">1:1 문의</a>
  <a href="list.jsp" class="list-group-item list-group-item-action">자주 묻는 질문</a>
  <a href="../notice/list.jsp" class="list-group-item list-group-item-action">공지사항</a>
    <a class="list-group-item list-group-item-action disabled" style="color:gray; font-size:15px;">
  		MGV 고객센터 <br> 
  		Dream center <br><br>
  		TEL 0607-0620<br> 
  		<img src="../../../images/center/clock.png" width="13" height="13"> 10:00~19:00
  </a>
					</div>
				</div>
    	</div>
    	<div class="col-9">
        	<h1 class="fs-2 p-2">자주 묻는 질문</h1>
	
		<hr>
			<a style="font-size : 19px;">[카테고리] [<%=faq.getFaqCategory().getName() %>] <%=faq.getTitle() %></a><br>
			<a style="font-size : 12px;">카테고리 <%=faq.getFaqCategory().getName() %> | </a>
			<a style="font-size : 12px;">등록일 <%=faq.getCreateDate() %></a>
		<hr>
			<br>
			<a><%=faq.getContent() %></a><br><br>
		<hr>
		
		<div style="text-align: center; padding:30px;">
				<a href="list.jsp" class="btn btn-secondary btn-sm">목록</a>
				<a href="modifyform.jsp?no=<%=faq.getNo() %>" class="btn btn-warning btn-sm">수정</a>
				<a href="delete.jsp?no=<%=faq.getNo() %>" class="btn btn-danger btn-sm">삭제</a>
				

			</div>
		</div>
	</div>	
</div>
</body>
</html>










