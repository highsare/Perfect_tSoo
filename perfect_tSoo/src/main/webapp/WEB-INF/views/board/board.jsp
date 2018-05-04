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
	<link href="resources/css/bootstrap.min.css" rel="stylesheet">
	<script src="resources/js/jquery-3.2.1.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	</script>
	<style type="text/css">
		#board{
			margin-left: 20%;
			margin-right: 20%;
		}
		.num{
			width:50px;
		}
		.title{	
			width:500px;
		}
		.id, .date, .hits{
			width:75px;
		}
		#page{
			margin-left: 40%;
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
        <li><a href="live">Live <span class="sr-only">(current)</span></a></li>
        <li><a href="clips">Clips</a></li>
        <li><a href="my">MyCollections</a></li>
        <li class="active"><a href="tBoard">tGallary</a></li>
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

<div id="board">
	<form action="writeForm" method="post">
		<input type="hidden" name="id" value="id">
		<button class="btn btn-default" type="submit">Write</button>
	</form>
	<table class="table table-condensed">
		<thead>
			<tr>
				<td class="num">num</td>
				<td class="title">title</td>
				<td class="id">id</td>
				<td class="date">date</td>
				<!-- <td class="hits">hits</td> -->
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${bList }">
				<tr>
					<th>${board.bNum }</th>
					<td>
						<a class="board-title" bNum="${board.bNum }" data-toggle="collapse" href="#${board.bNum }" 
							aria-expanded="false" aria-controls="collapseExample">
							${board.title }
						</a>
						<div class="collapse" id="${board.bNum }">
  							<div class="well">
    							${board.context }
  							</div>
  							<span>
  								<c:forEach var="reply" items="${rList}">
  									<c:if test="${reply.bNum == board.bNum }">
  										<pre> ┖ ${reply.id } : ${reply.context}</pre>
  										<br>
  									</c:if>
  								</c:forEach>
  							</span>
  							<div>
  								<c:if test="${logInID != null }">
	    							<form action="replyConfirmed" class="form-inline">
									  <div class="form-group">
									    <input type="text" class="form-control" name="context" placeholder="한 줄 댓글">
									    <input type="hidden" name="id" value="${logInID }">
									    <input type="hidden" name="bNum" value="${board.bNum }">
									  </div>
									  <button type="submit" class="btn btn-default">작성</button>
									</form>
								</c:if>
  							</div>
						</div>
					</td>
					<td>${board.id }</td>
					<td>${board.inputDate }</td>
					<%-- <td>${board.hits }</td> --%>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<nav id="page">
  <ul class="pagination">
    <li>
      <a href="tBoard?reqPage=${pageNum-1}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <c:forEach begin="1" end="${totalBoard }" step="${showNum }" varStatus="s">
    	<li><a href="tBoard?reqPage=${s.count}"> ${s.count} </a></li>
    </c:forEach>
    <li>
      <a href="tBoard?reqPage=${pageNum+1}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

</body>
</html>