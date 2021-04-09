<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- navbar 메뉴 -->
<nav class="navbar navbar-expand-sm navbar-blight bg-blight">
	
<!-- links -->
<ul class="navbar-nav">
	<li class="nav-item"> 
		<a class="nav-link" 
				href="<%=request.getContextPath()%>/boardList.jsp"> 
				보드게시판</a>
	</li>			
	<li class="nav-item">
		<a class="nav-link" 
				href="<%=request.getContextPath()%>/memberList.jsp"> 
				멤버게시판</a>			
	</li>			
	<li class="nav-item"> 
		<a class="nav-link" 
				href="<%=request.getContextPath()%>/guestBookList.jsp"> 
				방명록</a>
	</li>
</ul>    
<!-- Navbar text -->
		<span class="navbar-text text-warning">
			Copyright. 강혜란
		</span>
	</nav>