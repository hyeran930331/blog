<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
// <!-- 1 수집request과 전처리 -->
	request.setCharacterEncoding("UTF-8");
	
	String guestBookContent = request.getParameter("guestBookContent");
	String guestBookPw = request.getParameter("guestBookPw");
	String guestBookMember = request.getParameter("guestBookMember");

//<!-- 2 처리 (DB table 핸들링)-->	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/blog","root","java1004");
	String sql = "INSERT INTO guestbook(guestbook_content, guestbook_pw, guestbook_member, guestbook_date) values(?,?,?, now())";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, guestBookContent);
	stmt.setString(2, guestBookPw);
	stmt.setString(3, guestBookMember);
	System.out.println("삽입쿼리 INSERT : "+stmt);
	
	stmt.executeUpdate();
	
//<!-- 3 출력-->
	response.sendRedirect(request.getContextPath()+"/guestBookList.jsp");
%>