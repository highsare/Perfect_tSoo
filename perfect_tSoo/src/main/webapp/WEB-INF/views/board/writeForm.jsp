<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> Perfect tSoo </title>
	<script src="resources/js/jquery-3.2.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<style type="text/css">
		#div-writeForm{
			margin-left: 30%;
			margin-right: 30%;
			margin-top: 5%;
		}
	</style>
	<script type="text/javascript">
		function formCheck(){
			var title = document.getElementById("title");
			var context = document.getElementById("context");
			
			if (title.value == '') {
				alert("글 제목을 입력해주세요");
				title.focus();
				return false;
			}
			if (context.value == '') {
				alert("글 내용을 입력해주세요");
				context.focus();
				return false;
			}
			return true;
		}
	</script>
</head>

<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/tSoo">tSoo</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="live">Live</a></li>
        <li><a href="#">Clips</a></li>
        <li><a href="#">MyCollections</a></li>
        <li class="active"><a href="tBoard">tGallary <span class="sr-only">(current)</span> </a></li>
      </ul>
  <!--     <form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form> -->
      <ul class="nav navbar-nav navbar-right">
        <c:choose>
      		<c:when test="${logInID != null }">
        		<li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		          			${logInID }          		
		          <span class="caret"></span></a>
		          <ul class="dropdown-menu" role="menu">
		            <li><a href="#"> 개인정보 수정 </a></li>
		            <li class="divider"></li>
		            <li><a href="#">Log Out</a></li>
		          </ul>
		        </li>
          	</c:when>
       	  	<c:when test="${logInID == null }">
         		<li><a href="logIn">Log In</a></li>
   	      	</c:when>
       	</c:choose>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div id="div-writeForm">
	<form action="boardConfirmed" method="post" onsubmit="return formCheck()">
	  <div class="form-group">
	    <label for="title">글 제목</label>
	    <input type="text" class="form-control" name="title" id="title" placeholder="글 제목을 입력하세요">
	  </div>
	  <div class="form-group">
	    <label for="context">글 내용</label>
	    <textarea class="form-control" rows="3" name="context" id="context"></textarea>
	  </div>
	  <div>
	  	<input type="hidden" name="id" value="${logInID}">
	  </div>
	  <button type="submit" class="btn btn-default">작성</button>
	  <a class="btn btn-default" href="/tSoo/tBoard" role="button">뒤로</a>
	</form>
</div>
</body>
</html>