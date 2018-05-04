<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> PERFECT tSoo </title>
	<script src="resources/js/jquery-3.2.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="https://embed.twitch.tv/embed/v1.js"></script>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript">
	   	var cList = [];
	   	var embed = null;
		$(document).ready(function(){
			
			var sWidth = screen.width - 20;
			var sHeight = screen.height - 220;
			
			if (${init == null}) {			
				$.ajax({
					url:'init'
					,type:'post'
					,success:function(){
						
					}
					,error:function(){
						
					}
				});
			}
			
			var logInID = document.getElementById("logInID");
			var channel = '${channel}';
			var searchID = '${searchID}';
			var currChan = '';
			
			if (channel == null) {
				channel = 0;
			}
			if (logInID != null) {
				$.ajax({
					url:'loadFollow'
					,type:'get'
					,data: {id:logInID.value}
					,dataType: 'text'
					,success: function() {
					}
					,error: function() {
					}
				});
				var listSize = document.getElementById("listSize");
				for (var i = 0; i < listSize.value; i++) {
					var str = '#'+(i+1);
					cList.push($(str).val());
				
				}
				
				$('#prev').on('click',function(){
					$.ajax({
						url:"changingStream"
						,type: 'post'
						,data: {key:'prev', currChannel:channel}
						,dataType: 'text'
						,success: function(chan){
							channel = chan;
							location.reload();
						}
						,error: function(){
							
						}
					});
					$.ajax({
						url:"searchRefresh"
						,type: "post"
						,data: {searchID:searchID}
						,success: function(){
						}
						,error: function(){
						}
					});
				})
				$('#next').on('click',function(){
					$.ajax({
						url:"changingStream"
						,type: 'post'
						,data: {key:'next', currChannel:channel}
						,dataType: 'text'
						,success: function(chan){
							channel = chan;
							location.reload();
						}
						,error: function(){
							
						}
					});
					$.ajax({
						url:"searchRefresh"
						,type: "post"
						,data: {searchID:searchID}
						,success: function(){
						}
						,error: function(){
						}
					});
				})
				if (searchID != '') {
					embed = new Twitch.Embed("twitch-embed", {
			        	width: sWidth,
			        	height: sHeight,
			        	channel: searchID
			      	});
					
					currChan = searchID;
					
					$.ajax({
						url:"searchRefresh"
						,type: "post"
						,data: {searchID:searchID}
						,success: function(){
						}
						,error: function(){
						}
					});
					
				}else{
					embed = new Twitch.Embed("twitch-embed", {
			        	width: sWidth,
			        	height: sHeight,
			        	channel: cList[channel]
			      	});
					
					currChan = cList[channel]
				}
			}else{
				$('#prev').on('click',function(){
					alert("please Log In");
				})
				$('#next').on('click',function(){
					alert("please Log In");
				})
				
				
				if (searchID != '') {
					embed = new Twitch.Embed("twitch-embed", {
			        	width: sWidth,
			        	height: sHeight,
			        	channel: searchID
			      	});
					
					currChan = searchID;
					
					$.ajax({
						url:"searchRefresh"
						,type: "post"
						,data: {searchID:searchID}
						,success: function(){
						}
						,error: function(){
						}
					});
				}else{
					embed = new Twitch.Embed("twitch-embed", {
			        	width: sWidth,
			        	height: sHeight,
			        	channel: "hanryang1125"
			      	});
					
					currChan = "hanryang1125";
				}
			}
			
			$('#fBtn').on('click',function(){
				//팔로우 추가
				if (logInID != null) {
					$.ajax({
						url:"addFollow"
						,type:"post"
						,data:{streamID:currChan, id:logInID.value}
						,dataType:'text'
						,success:function(key){
							if (key == 'Added') {
								alert("Added in your Follow List");
							}else{
								alert("This channel already added in your Follow List");
							}
							
						}
						,error:function(){
							
						}
					});		
				}else{
					alert("please Log In");
				}
			})
			
			$('#f-cBtn').on('click',function(){
				//팔로우 삭제
				if (logInID != null) {
					$.ajax({
						url:"deleteFollow"
						,type:"post"
						,data:{streamID:currChan, id:logInID.value}
						,dataType:'text'
						,success:function(key){
							if (key == 'deleted') {
								alert("Deleted this channel in your Follow List");
							}else{
								alert("This channel never added in your Follow List");
							}
							
						}
						,error:function(){
							
						}
					});		
				}else{
					alert("please Log In");
				}
			})
			
		});
	</script>
	
	<style type="text/css">
		#nav-menu a {
			margin-left: 11%;
			margin-right: 11%;
		}
		
		#div-body{
			margin-top: 1px;
		}
		#div-streaming {
			display: inline;
			float: left;
			padding-top: 0px;
			margin-top: 0px;
		}
		#div-chat {
			display: inline;
			float: right;
		}
		#twitch-embed{
			display: inline;
		}
		.pager a{
			margin-top: 350px;
		}
		#btn-logIn{
			margin-top: 10px;
		}
	</style>
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
        <li class="active"><a href="live">Live <span class="sr-only">(current)</span></a></li>
        <li><a href="clips">Clips</a></li>
        <li><a href="my">MyCollections</a></li>
        <li><a href="tBoard">tGallary</a></li>
      </ul>
      
      <div class="navbar-left">
      <ul class="nav navbar-nav">
      	<li>
      		<a href="#" id="prev"><span class="glyphicon glyphicon-triangle-left"></span></a>
      	</li>
      </ul>
      
      <form action="search" method="post"  class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" name="searchID" class="form-control" placeholder="Search">
        </div>
        <button id="searchBtn" type="submit" class="btn btn-default">Search</button>
      </form>
      
      <ul class="nav navbar-nav">
      	<li>
      		<a href="#" id="f-cBtn"><span class="glyphicon glyphicon-minus"></span></a>
      	</li>
      	<li>
      		<a href="#" id="fBtn"><span class="glyphicon glyphicon-plus"></span></a>
      	</li>
      </ul>
      
      <ul class="nav navbar-nav">
      	<li>
      		<a href="#" id="next"><span class="glyphicon glyphicon-triangle-right"></span></a>
      	</li>
      </ul>
      </div>
      
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
	<c:if test="${fList != null }">
		<input type="hidden" value="${fListSize}" id="listSize">
		<c:forEach var="follow" items="${fList }" varStatus="s">	
			<input type="hidden" value="${follow }" id="${s.count }">
		</c:forEach>	
	</c:if>
	<c:if test="${fList == null }">
		
	</c:if>
</div>
 
<div id="div-body">
	<div id="div-streaming">
	    <!-- Add a placeholder for the Twitch embed -->
	    <div id="twitch-embed"></div>
	
	    <!-- Load the Twitch embed script -->
	    <!-- <script src="https://embed.twitch.tv/embed/v1.js"></script> -->
	
	    <!-- Create a Twitch.Embed object that will render within the "twitch-embed" root element. -->
	    <script type="text/javascript">
	      	/* new Twitch.Embed("twitch-embed", {
	        	width: 1550,
	        	height: 680,
	        	channel: "hanryang1125"
	      	}); */
	    </script>
	</div>
</div>

</body>
</html>