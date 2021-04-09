<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 원</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<h1>member one</h1>
	<%
		//int boardNo = Integer.parseInt(request.getParameter("boardNo"));	
		//= 문자열을 int형으로 변환한다.
		String memberId = request.getParameter("memberId");
	System.out.println("member_id : "+memberId);
		//method="post"
		
		//최재현씨 String memberId = request.getParameter("memberId");
		//문자열 받기....
	
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/blog","root","java1004");
			String selectValue = 	"SELECT member_id, member_pw, member_name, member_date, member_email";
			String fromTable = 		" from member";
			String where = 			" where member_id = ?";
	System.out.println("string : "+selectValue+fromTable+where);
		PreparedStatement stmt = conn.prepareStatement(selectValue+fromTable+where);
	System.out.println("stmt : "+ stmt);
		stmt.setString(1, memberId);
	System.out.println("stmt : "+ stmt);
	
		ResultSet rs = stmt.executeQuery();
	%>

<table class="table table-stripe">
			<thead>
				<tr>
					<th>id</th>
					<th>name</th>
					<th>date</th>
					<th>email</th>
				</tr>
			</thead>
			<tbody>
		<% if(rs.next()) 
			{ //결과값에 다음이 있다면,%>
				<tr>
					<td><%=rs.getString("member_id")%></td>
					<td><%=rs.getString("member_name")%></td>
					<td><%=rs.getString("member_date")%></td>
					<td><%=rs.getString("member_email")%></td>
			<%} %>
				</tr>
			</tbody>
		</table>
		
		<a class="btn btn-secondary active"  href="<%=request.getContextPath()%>/memberList.jsp?currentPage=1">홈(첫페이지로)</a>
		<a class="btn btn-secondary active"  href="<%=request.getContextPath()%>/memberDeleteForm.jsp?memberId=<%=rs.getString("member_id")%>">삭제하기</a>			
	
	

</body>
</html>