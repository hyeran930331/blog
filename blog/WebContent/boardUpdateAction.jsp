<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	String boardPw = request.getParameter("boardPw");
	String boardTitle = request.getParameter("boardTitle");
	String boardCategory = request.getParameter("boardCategory");
	String boardContent = request.getParameter("boardContent");
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/blog","root","java1004");
	String sql = "update board Set board_category=?, board_title=?, board_content=? where board_no=? and board_pw=?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, boardCategory);
	stmt.setString(2, boardTitle);
	stmt.setString(3, boardContent);
	
	stmt.setInt(4, boardNo);
	stmt.setString(5, boardPw);
	
	System.out.print(stmt);
	
	int row = stmt.executeUpdate();
	
	if(row == 0) { // 수정 실패
		response.sendRedirect(request.getContextPath()+"/boardUpdateForm.jsp?boardNo="+boardNo);
	} else { // 수정 성공
		response.sendRedirect(request.getContextPath()+"/boardOne.jsp?boardNo="+boardNo);
	}
%>