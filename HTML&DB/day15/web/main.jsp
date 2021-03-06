<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
*{
	margin:0;
	padding:0;
}

a{
	text-decoration: none;
	color:black;
}
header,nav,section,footer{
	margin:0 auto;
}
header{
	width:900px;
	height:150px;
	
	
}
h1{

	font-size:20px;

}
nav{
	width:900px;
	height:30px;
	background:white;
}
section{
	width:900px;
	height:600px;
	background:gray;
	
}
footer{
	width:900px;
	height:50px;
	background:black;
}
.center_page{
	width:880px;
	height:580px;
	margin:0 auto;
	background:white;
}
</style>
</head>
<body>
<header>
<h3>
<a href="main.do?view=login">LOGIN</a>
<a href="main.do?view=register">REGISTER </a>
<a href="main.do?view=aboutus">ABOUT US</a>
</h3>

<h1>
<br>
<!-- user -->
<a href="user.do?view=useradd">USERADD</a>   <!-- .do면 diptcher로 이동   user servlet에 요청  -->
<a href="user.do?view=userdelete">USERDELETE</a>
<a href="user.do?view=userupdate">USERUPDATE</a>
<a href="user.do?cmd=userlist">USERLIST</a>

<!-- product -->
<br>
<a href="user.do?view=productadd">PRODUCTADD</a> 
<a href="user.do?view=productadd">PRODUCTDELETE</a> 
<a href="user.do?view=productadd">PRODUCTUPDATE</a> 
<a href="user.do?cme=productadd">PRODUCTLIST</a> 

</h1>
</header>
<nav>
<c:choose>
	<c:when test="${navi==null}">
		<a href="main.do">HOME </a>
	</c:when>
	<c:otherwise>
		${navi }
	</c:otherwise>
</c:choose>>
</nav>
<section>
<c:choose>
	<c:when test="${center == null }">
		<jsp:include page="center.jsp"></jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="${center }.jsp"></jsp:include>
	</c:otherwise>
</c:choose>
</section>
<footer></footer>
</body>
</html>