<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 딜리트폼</title>
</head>
<body>
<h1>member Delete 하시겠습니까?</h1>
<%
String memberId = request.getParameter("memberId");
//맨처음 멤버아이디 프라이머 인덱스값 받아오기
%>
	<form action="<%=request.getContextPath()%>/memberDeleteAction.jsp" method="post">
	
		<div>
			아이디 : 
			<input type="text" name="memberId" value="<%=memberId%>" readonly="readonly">
			<!-- readonly 는 수정할수가 없다. -->
		</div>
		
		<div>
			비번확인 : 
			<input type="text" name="memberPw">
		</div>
		
		<div>
			<button type="submit">바로삭제</button>
		</div>
	</form>
</body>
</html>