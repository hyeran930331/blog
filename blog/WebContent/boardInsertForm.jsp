<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력폼</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	<p align="right">
		<a href="<%=request.getContextPath()%>/boardList.jsp?currentPage=1">
		<img src="<%=request.getContextPath()%>/img/home.PNG">
		</a>
	</p>
</head>
<body>
	<h1 align="center">board Insert Form</h1>
	
	<%
	String[] submenu = {"html","css","javascript","java","jsp","sql","spring","rdbms"};
	%>			
	<form action="<%=request.getContextPath()%>/boardInsertAction.jsp" method="post">
	
	<div class="container" align="center">
	
			<table class="table table-borderless table-secondary">
				<tr>
					<td style="align:left"> 
					category
					</td>
					<th>
						<select class="input-group-text" name="boardCategory">
							<%
							for (String sm : submenu){
								//무슨 의미지?
								//선언 sm : submenu만큼 할때깢?
							%>
								<option value="<%=sm %>" %><%=sm%></option>
							<%
							}
							%>	
						</select>
					</th>
				</tr>
	
				<tr>
					<td style="text-align:left">
					title
					</td>
					<th>
					<input class="input-group-text" type="text" name="boardTitle" required="required" placeholder="필수">
					</th>
				<tr>
				
				<tr>
					<td style="text-align:left">
					content
					</td>
					<th>
					<textarea class="input-group-text" name ="boardContent" rows="5" cols="88"></textarea>
					</th>
				<tr>
				
				<tr>
					<td style="text-align:left">
					user
					</td>
					<th>
					<input class="input-group-text" type="text" name="boardUser">
				</th>
				
				<tr>
					<td style="text-align:left">
					pw
					</td>
					<th>
					<input class="input-group-text" type="password" name="boardPw">
				</th>
				
				<tr style="text-align:center">
					<td>
						<a class="btn btn-primary" href="<%=request.getContextPath()%>/boardList.jsp?currentPage=1">첫 페이지로</a>
					</td>
					<td>
						<button class="btn btn-info" type="submit">보내기</button>
					</td>
				</tr>
				
				
	</table>
	</form>
</body>
</html>