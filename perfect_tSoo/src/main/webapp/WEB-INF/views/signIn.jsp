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
	<style type="text/css">
		.div-signIn{
			margin-left: 35%;
			margin-right: 35%;
			margin-top: 10%;
		}	
		#id{
			width:325px;
			display: inline;
		}
		#idCheck{
			display: inline;
		}
		button[type=submit]{
			margin-left: 45%;
		}
	</style>
	<script type="text/javascript">
		$(document).ready( function(){
			$('#idCheck').on('click',idCheck)
		});
		
		function idCheck(){
			var id = document.getElementById("id");
			var idd = document.getElementById("idd");
			$.ajax({
				url:'idCheck'
				,type: 'get'
				,data: {id:id.value}
				,datatype: 'text'
				,success: function(result){
					if (result == 'true') {
						if (confirm("The id is available. Use this?")) {
							$('#id').attr('readonly',true);
						}else{
							$('#id').attr('readonly',false);
						}
					}else if(result == 'empty') {
						alert("The id isn't available - [empty]");
					}else{
						alert("The id isn't available - [Too short or long]");
					}
				}
				,error: function(){
					alert("error occured, please try again");
				}
			})
		}
		
		function formCheck(){
			var id = document.getElementById("id");
			var password = document.getElementById("password");
			var re_password = document.getElementById("re_password");
			var nickname = document.getElementById("nickname");
			
			if (id.value == '') {
				alert("id is required");
				id.focus();
				return false;
			}
			if (password.value == '') {
				alert("password is required");
				password.focus();
				return false;
			}
			if (re_passowrd.value == '') {
				alert("re_password is required");
				re_password.focus();
				return false;
			}
			if (password.value != re_password.value) {
				alert("please check password again");
				password.focus();
				password.value = '';
				re_password.value = '';
				return false;
			}
			if (nickname.value == '') {
				alert("nickname is required");
				nickname.focus();
				return false;
			}
			if (nickname.value.length > 15 || nickname.value.length < 2) {
				alert("The nickname isn't available");
				nickname.focus();
				nickname.value = '';
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
        <li><a href="clips">Clips</a></li>
        <li><a href="my">MyCollections</a></li>
        <li><a href="tBoard">tGallary</a></li>
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

<div class="div-signIn">
	<form action="signInConfirmed" method="post" onsubmit="return formCheck()" class="form-horizontal">
	  <div class="form-group">
	    <label for="id" class="col-sm-2 control-label">ID</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" name="id" id="id" placeholder="ID">
	      <input type="button" id="idCheck" value="Check" class="btn btn-primary">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="password" class="col-sm-2 control-label">Password</label>
	    <div class="col-sm-10">
	      <input type="password" class="form-control" name="password" id="password" placeholder="Password">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="password2" class="col-sm-2 control-label"></label>
	    <div class="col-sm-10">
	      <input type="password" class="form-control" id="re_password" placeholder="Password again">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="nickname" class="col-sm-2 control-label">Nickname</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" name="nickname" id="nickname" placeholder="Nickname">
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <button type="submit" class="btn btn-success">Sign In</button>
	    </div>
	  </div>
	</form>
</div>
</body>
</html>