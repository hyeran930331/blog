<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String boardCategory = request.getParameter("boardCategory");
	System.out.println("boardCategory : "+boardCategory);
	String boardTitle = request.getParameter("boardTitle");
	System.out.println("boardTitle : "+boardTitle);
	String boardContent = request.getParameter("boardContent");
	System.out.println("boardContent : "+boardContent);
	String boardPw = request.getParameter("boardPw");
	System.out.println("boardPw : "+boardPw);
	String boardUser = request.getParameter("boardUser");
	System.out.println("boardUser : "+boardUser);
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/blog","root","java1004");
	String sql = "insert into board(board_category,board_title,board_content,board_pw,board_user,board_date) values(?,?,?,?,?, now())";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, boardCategory);
	stmt.setString(2, boardTitle);
	stmt.setString(3, boardContent);
	stmt.setString(4, boardPw);
	stmt.setString(5, boardUser);
	stmt.executeUpdate();
System.out.println("stmt.executeUpdate :"+ stmt.executeUpdate());
	
	response.sendRedirect(request.getContextPath()+"/boardList.jsp");
%>