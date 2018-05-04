<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		.div-logIn{
			margin-left: 37.5%;
			margin-right: 37.5%;
			margin-top: 10%;
		}
		button[type=submit]{
			margin-left: 25%;
		}
	</style>
	<script type="text/javascript">
		$(document).ready(function () {
			$('#logIn').on('click', logIn)
		});
		
		function logIn(){
			var id = document.getElementById("id");
			var password = document.getElementById("password");
			$.ajax({
				url:'logInConfirmed'
				,type:'get'
				,data: {id:id.value , password:password.value}
				,datatype: 'text'
				,success: function(result){
					if (result == 'id_empty') {
						alert("ID is required");
					}else if (result == 'password_empty') {
						alert("Password is required");
					}else if (result == 'logIn') {
						location.href="/tSoo/live";
					}else{
						alert("logIn Failed please try again");	
					}
				}
				,error: function(){
					alert("logIn Failed please try again");
				}
			})
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

<div class="div-logIn">
<form class="form-horizontal">
  <div class="form-group">
    <label for="id" class="col-sm-2 control-label">ID</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="id" id="id" placeholder="ID">
    </div>
  </div>
  <div class="form-group">
    <label for="password" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" id="password" name="password" placeholder="Password">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <!-- <button type="submit" id="logIn" class="btn btn-info">Log In</button> -->
      <input type="button" id="logIn" class="btn btn-info" value="Log In">
      <a class="btn btn-success" href="signIn" role="button">Sign In</a>
    </div>
  </div>
</form>
</div>
</body>
</html>
