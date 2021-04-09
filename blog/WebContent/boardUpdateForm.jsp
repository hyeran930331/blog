<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보드 업데이트</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<%
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
	%>
	<h1>boardUpdateForm</h1>
	<%
	//System.out.println("baordNo : " + boardNo);
		// String boardNo = request.getParameter("boardNo");
		// int intboardNo = Integer.parseInt(boardNo);
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/blog","root","java1004");
	//System.out.println("conn : "+conn);
		// SELECT board_no,board_category,board_title,board_content,board_user,board_date 
		// from board 
		// WHERE board_no = ?
		PreparedStatement stmt = conn.prepareStatement("SELECT board_no, board_category, board_title, board_content, board_user, board_date from board WHERE board_no = ?");
		stmt.setInt(1, boardNo);
		ResultSet rs = stmt.executeQuery();

		String boardCategory = "";
		String boardTitle = "";
		String boardContent = "";
		String boardUser = "";
		String boardDate = "";

		if(rs.next()) {
		//if문안에 태그를 줄이려고.if밖에 테이블 만들기
			boardCategory = rs.getString("board_category");
			boardTitle = rs.getString("board_title");
			boardContent = rs.getString("board_content");
			boardUser = rs.getString("board_User");
			boardDate = rs.getString("board_Date");
		}
	%>
		
	<form class="container" align="center" method="post" action="<%=request.getContextPath()%>/boardUpdateAction.jsp">
			<table class="table table-borderless table-secondary">
				<tr>
					<td></td>
					<td>no</td>
					<th> <input type="text" name="boardNo" value="<%=boardNo%>" readonly="readonly"> 
					<!-- 정보를 넘겨줘야해서 INPUT으로 적어야함 -->
					</th>
					<td></td>
				</tr>
				
				<tr>
					<td></td>
					<td>category</td>
					<th>
							<%=boardCategory%>
							<select name="boardCategory">
							<%
								String[] submenu = {"html","css","javascript","java","jsp","rdbms","sql","spring"};
								for(String sm : submenu) {
									if(sm.equals(boardCategory)) {
							%>
										<option value="<%=sm%>" selected="selected"><%=sm%></option>
							<% 
									} else {
							%>
										<option value="<%=sm%>"><%=sm%></option>
							<%	
									}
								}
							%>
							</select>
					</th>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td style="color:green;"> title </td>
					<th style="color:green; border-bottom:1px solid green;" >
					<input type="text" name="boardTitle" value="<%=boardTitle%>" >
					</th>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>content</td>
					<th><textarea rows="5" cols="88" name="boardContent"><%=boardContent%></textarea></th>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td>user</td>
					<th> <%=boardUser%></th>
					<td></td>
				</tr>
			
				
				<tr>
					<td></td>
					<td> password </td>
					<th>
					<input type="text" name="boardPw">
					</th>
					<td></td>
				</tr>
				
				<tr style="border-bottom:1px solid grey;">
					<td></td>
					<td>date</td>
					<th><%=boardDate%></th>
					<td></td>
				</tr>
				
				<tr>
					<td></td>
					<td><button type="submit">수정</button></td>
					<td></td>
					<td></td>
				</tr>
			</table>
	</form>
	
</body>
</html>