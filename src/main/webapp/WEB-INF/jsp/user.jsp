<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title> CadorimPay | Administration</title>
	<link rel="stylesheet" type="text/css" href="static/dist/css/materia/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="static/dist/css/style.css">  
	<link rel="stylesheet" type="text/css" href="static/dist/css/materia/navbar/bar.css">
	
	
</head>
<body  style='background:silver;'>
<header>
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
<span style="color:white; font-size:20px;cursor:pointer" onclick="openNav()">&#9776; open</span>

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="/index">Home</a>
  <a href="/gestionP">Demande de paiement<c:if test="${new != 0}">  <span style="background:red;color:white;"> ${new}</span></c:if></a>
  <a href="#">Clients</a>
  <ul class="menu">
<li class="title"><a href="#">Users</a>
<ul class="sous__menu">
<li><a href="/ajouUser">Ajouter</a></li>
<li><a href="/editUser">Editer</a></li>
</ul>
</li>
</ul>
</div>
<script type="text/javascript" src="static/dist/css/materia/navbar/bar.js"></script>



<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainNav">
    <span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse" id="mainNav">
    <div class="navbar-nav flex-row ml-md-auto d-md-flex">
        
    </div>
     <form class="form-inline my-2 my-lg-0"method="post" action='/'>
      <input class="form-control mr-sm-2" type="hidden" /> 
      <p style='color:white;'>admin</p>
      </form>		
   
</div>
</nav>


</header>

<c:choose>
<c:when test="${mode=='AddUser'}">
     <br>
     <div style="background:white;" class="container mySpace">
     <h2>Add a New User</h2>
     <br>
     <hr>
		<form  method="post" action="add">

			<div class="form-group">
				<label for="nom" class="form-control-label">Nom</label> <input
					type="text" class="form-control"  id="nom" name="nom" value="${user.nom}" />
			
			</div>
			<div class="form-group">
				<label for="prenom" class="form-control-label">Prenom</label> <input
					type="text" class="form-control"  id="prenom" name="prenom" value="${user.prenom}" />
			
			</div>
			<div class="form-group">
				<label for="email" class="form-control-label">Email</label> 
				<input type="email" class="form-control"  id="email" name="email" value="${user.email }"/>
			</div>
			<div class="form-group">
				<label for="password" class="form-control-label">Password</label> <input
					type="password" class="form-control" value="${user.password}"
					id="password"  name="password"/>
				

			</div>
			
			<input type="submit" value="Submit" class="bt btn-primary" />

		</form>
		<br>
	</div>
 
    	</c:when>
<c:when test="${mode=='EditeUser'}">
<br>
   <div class="container">
   <h3>ADMIN</h3>
   </div>
  <div class="container" style='background:white;'>
    	    <div class="table-responsive">
    	    <p>search</p>
    	    <hr>
    	    </div>
    	 	<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr style='background:black; color:white;'>
								<th>Nom</th>
								<th>Prenom</th>
								<th>Email</th>
								<th>Role</th>
								<th  style='background:green;'>Action</th>
								
							</tr>
						</thead>
						<tbody>
						 <c:forEach var="user" items="${users}">
								<tr>
									<td>${user.nom}</td>
									<td>${user.prenom}</td>
									<td>${user.email}</td>
									<td>${user.role}</td>
									<td><a href="modifier?id=${user.id}"><button class="bt btn-success">Modifier</button></a>
									<a href="supprimer?id=${user.id}"><button class="bt btn-danger">Supprimer</button></a></td>
									
								</tr>
							</c:forEach>
							<tr style='background:black;'>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th  style='background:green;'></th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
    	

</c:when>
<c:when test="${mode=='Modifier'}">
<br>
     <div style="background:white;" class="container mySpace">
     <h2>Add a New User</h2>
     <br>
     <hr>
		<form  method="post" action="changer">

			<div class="form-group">
				<label for="nom" class="form-control-label">Nom</label> 
				<input type="text" class="form-control"  id="nom" name="nom" value="${user.nom}" />
				<input type="hidden"   id="id" name="id" value="${user.id}" />
			
			</div>
			<div class="form-group">
				<label for="prenom" class="form-control-label">Prenom</label> <input
					type="text" class="form-control"  id="prenom" name="prenom" value="${user.prenom}" />
			
			</div>
			<div class="form-group">
				<label for="email" class="form-control-label">Email</label> 
				<input type="email" class="form-control"  id="email" name="email" value="${user.email }"/>
			</div>
			<div class="form-group">
				<label for="password" class="form-control-label">Password</label> <input
					type="password" class="form-control" value="${user.password}"
					id="password"  name="password"/>
				

			</div>
			
			<input type="submit" value="Modifier" class="bt btn-primary" />

		</form>
		<br>
	</div>
</c:when>
</c:choose>
<br>
<br>
    <div style='background:white;' class="container footer">
    	<div class="row footer">
    		<ul class="list-inline">
				<li>Copyright © 2020 cadorim</li>
	       </ul>
    	</div>
    </div>

    <script type="text/javascript" src="static/dist/js/bootstrap.js"></script>
    <script type="text/javascript" src="static/dist/js/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="static/dist/js/myScript.js"></script>
</body>
</html>
