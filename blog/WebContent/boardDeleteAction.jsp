<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	String boardPw = request.getParameter("boardPw");
	System.out.println("boardNo: "+boardNo);
	System.out.printf("boardPw : %s\n",boardPw);
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/blog","root","java1004");
	String sql = "delete from board where board_no=? and board_pw=?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setInt(1, boardNo);
	stmt.setString(2, boardPw);
	int row = stmt.executeUpdate();
	if(row == 0) { // 삭제 실패
		response.sendRedirect(request.getContextPath()+"/boardDeleteForm.jsp?boardNo="+boardNo);
	} else { // 삭제 성공
		response.sendRedirect(request.getContextPath()+"/boardList.jsp");
	}
%>