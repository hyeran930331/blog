<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardOne</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<p align="left">
		<a href="<%=request.getContextPath()%>/boardList.jsp?currentPage=1">
		<img src="<%=request.getContextPath()%>/img/home.PNG">
		</a>
	</p>
</head>
<body>
	<h1 align="center">board One</h1>
	<%
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		System.out.println("baordNo : " + boardNo);
		// String boardNo = request.getParameter("boardNo");
		// int intboardNo = Integer.parseInt(boardNo);
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/blog","root","java1004");
		System.out.println("conn : "+conn);
		// SELECT board_no,board_category,board_title,board_content,board_user,board_date 
		// from board 
		// WHERE board_no = ?
		PreparedStatement stmt = conn.prepareStatement("SELECT board_no,board_category,board_title,board_content,board_user,board_date from board WHERE board_no = ?");
		stmt.setInt(1, boardNo);
		ResultSet rs = stmt.executeQuery();
if(rs.next()) {
	%>
	<div class="container" align="center">
			<table class="table table-borderless table-secondary">
				<tr>
					<td></td>
					<td>category</td>
					<th><%=rs.getString("board_category") %></th>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td style="color:green;"> title </td>
					<th style="color:green; border-bottom:1px solid green;" ><%=rs.getString("board_title") %></th>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>content</td>
					<th><%=rs.getString("board_content") %></th>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>user</td>
					<th><%=rs.getString("board_user") %></th>
					<td></td>
				</tr>
				<tr style="border-bottom:1px solid grey;">
					<td></td>
					<td>date</td>
					<th><%=rs.getString("board_date") %></th>
					<td></td>
				</tr>
				<tr style="text-align:center">
					<td></td>
					<td>
						<a class="btn btn-secondary" href="<%=request.getContextPath()%>/boardList.jsp?currentPage=1">
							홈
						</a>
					</td>
					<td style="color:green;">
					<%
						PreparedStatement stm2 = conn.prepareStatement("select count(*) from board");
		       			ResultSet rs2 = stm2.executeQuery();
		         		int totalRow=0;
		
		         		if(rs2.next()){        
		               		 totalRow=rs2.getInt("count(*)");
		                        		}
		        
				        if (boardNo==totalRow){
				                out.println("다음글은 없습니다.");
				        } else {
				    %>	
				    	<a class="btn btn-secondary" href="<%=request.getContextPath()%>/boardOne.jsp?boardNo=<%=boardNo+1%>">
				    		다음글
				        </a>
				     <% } %>
					</td>
				</tr>
				
				<tr style="text-align:center">
					<td></td>
					<td> <a class="btn btn-secondary" href="<%=request.getContextPath()%>/boardDeleteForm.jsp?boardNo=<%=boardNo%>">
						삭제
					</td>
					<td> <a class="btn btn-secondary" href="<%=request.getContextPath()%>/boardUpdateForm.jsp?boardNo=<%=boardNo%>">
						수정
					</td>
				</tr>
			</table>
	</div>		
		<%			
		}
		%>
</body>
</html>