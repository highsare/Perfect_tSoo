<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Perfect tSoo</title>
	<script src="resources/js/jquery-3.2.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">

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
        <li><a href="live">Live <span class="sr-only">(current)</span></a></li>
        <li  class="active"><a href="clips">Clips</a></li>
        <li><a href="my">MyCollections</a></li>
        <li><a href="tBoard">tGallary</a></li>
      </ul>
      
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
		            <li><a href="logOut">Log Out</a></li>
		          </ul>
		        </li>
		        <input type="hidden" value="${logInID}" id="logInID">
		        <input type="hidden" value="${channel }" id="channel">
          	</c:when>
       	  	<c:when test="${logInID == null }">
         		<li><a href="logIn">Log In</a></li>
   	      	</c:when>
       	</c:choose>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div>
<iframe src="https://clips.twitch.tv/embed?clip=StupidBitterSeahorseOhMyDog&autoplay=false&tt_medium=clips_embed" width="320" height="180" frameborder="0" scrolling="no" allowfullscreen="true"></iframe>
<iframe src="https://clips.twitch.tv/embed?clip=TenuousBreakableAniseOMGScoots&autoplay=false&tt_medium=clips_embed" width="320" height="180" frameborder="0" scrolling="no" allowfullscreen="true"></iframe>
<iframe src="https://clips.twitch.tv/embed?clip=EsteemedKindCheddarMau5&autoplay=false&tt_medium=clips_embed" width="320" height="180" frameborder="0" scrolling="no" allowfullscreen="true"></iframe>

</div>

</body>
</html>