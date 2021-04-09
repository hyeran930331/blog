<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 리스트</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>
<body class="container">
	<h1>member list</h1>
<%
		Class.forName("org.mariadb.jdbc.Driver");
		//대입하는게 아니라 메소드를 쓰는것. Class.forName=("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/blog","root","java1004");
	//DB불러오기 성공
%>

<%
		int currentPage= 1;
		//맨처음 페이지니깐.
		
	//페이징을 위한 작업1
		if(request.getParameter("currentPage") != null)
		{
		//현재페이지가 널값이 아니라면
         currentPage = Integer.parseInt(request.getParameter("currentPage"));
		//integer.parseInt?
		}
	//페이질을 위한 작업2
		int rowPerPage = 10;
         //한페이지에 몇행씩 볼래? 고정
		int beginRow = (currentPage-1)*10;
		//이걸 활용해서 쿼리에  limit ?,?
		//stmt.setInt(1,beginRow);
		//stmt.setInt(2,rowPerPage);
	
	//그다음 쿼리 실행
    	PreparedStatement stmt = conn.prepareStatement("SELECT member_id, member_pw, member_name, member_date, member_email from member order by member_date desc");
		ResultSet rs = stmt.executeQuery();
%>

<table class="table table-hover">
			<thead>
				<tr>
					<th>member_id</th>
					<th>member_name</th>
					<th>member_date</th>
					<th>member_email</th>
				</tr>
			</thead>
			<tbody>
				<%
					while(rs.next()){
					//결과값에 다음이 있다면,
				%>
				<tr>
					<td>
					<a href="<%=request.getContextPath()%>/memberOne.jsp?memberId=<%=rs.getString("member_id")%>">
					<%=rs.getString("member_id")%>
					</a>
					</td>
					<td><%=rs.getString("member_name")%></td>
					<td><%=rs.getString("member_date")%></a>
					</td>
					<td><%=rs.getString("member_email")%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		
		<a class="btn btn-secondary active"  href="<%=request.getContextPath()%>/memberList.jsp?currentPage=1">홈(첫페이지로)</a>
		<a class="btn btn-secondary active"  href="<%=request.getContextPath()%>/memberInsertForm.jsp">가입하기</a>
		<a class="btn">현재페이지 : <%=currentPage%></a>
		<a class="btn btn-secondary active"  href="<%=request.getContextPath()%>/memberList.jsp?currentPage=<%=currentPage+1%>">다음</a>
		
</body>
</html>