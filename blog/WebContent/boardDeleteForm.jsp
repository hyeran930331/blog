<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardDeleteForm</title>
</head>
<body>
	<%
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	%>
	<h1>boardDelete</h1>
	<form action="<%=request.getContextPath()%>/boardDeleteAction.jsp" method="post">
		<div>
			board_no : 
			<input type="text" name="boardNo" value="<%=boardNo%>" readonly="readonly">
		</div>
		<div>
			board_pw : 
			<input type="password" name="boardPw">
		</div>
		<div>
			<button type="submit">삭제</button>
		</div>
	</form>
</body>
</html>
