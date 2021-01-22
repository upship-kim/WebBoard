<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %> 
<%@ taglib prefix="function"  uri="http://java.sun.com/jsp/jstl/functions"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/infoBoard.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
	});

</script>

</head>

<body>
	<header>
 		<jsp:include page="../include/header.jsp"/>
	</header>

	<nav>
		<jsp:include page="../include/menuBar.jsp"/>
	</nav>
	<div class="page">
		<h3>카테고리명</h3>  
		<h5>새 글 쓰기</h5>  

		<%-- <%=request.getParameter("category")+"이네?"%> --%>
		<br>
		<hr>
		<div class="board">
			<jsp:include page="summerNote.jsp"></jsp:include>
		</div>



</div>
</body>
</html>