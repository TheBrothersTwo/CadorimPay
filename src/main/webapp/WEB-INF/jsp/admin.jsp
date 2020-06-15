<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title> CadorimPay | Administration</title>
	<link rel="stylesheet" type="text/css" href="static/dist/css/materia/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="static/dist/css/style.css">  
	
</head>
<body  style='background:silver;'>
<header>
<nav class="navbar navbar-expand-md navbar-dark bg-dark">
<c:if test="${mode !=  'ADMIN_LOGIN' }">
<span style="color:white; font-size:20px;cursor:pointer" onclick="openNav()">&#9776; open</span>
<link rel="stylesheet" type="text/css" href="static/dist/css/materia/navbar/bar.css">

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="/index">Home</a>
  <a href="/gestionP">Demande de paiement <c:if test="${new != 0}">  <span style="background:red;color:white;"> ${new}</span></c:if></a>
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
			</c:if>	
<c:if test="${mode =='ADMIN_LOGIN' }">
<a class="nav-brand" href="#">
    <h4>Cadorim Admin</h4>
</a>			
</c:if>	

<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#mainNav">
    <span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse" id="mainNav">
    <div class="navbar-nav flex-row ml-md-auto d-md-flex">
        
    </div>
    <c:if test="${mode !=  'ADMIN_LOGIN'}">
      <form class="form-inline my-2 my-lg-0"method="post" action='/'>
      <input class="form-control mr-sm-2" type="hidden" /> 
      <p style='color:white;'>admin</p>
      </form>		
</c:if>	
   
</div>
</nav>


</header>

<c:choose>
      
     <c:when test="${mode=='ADMIN_LOGIN'}">
     <br>
     <div style="background:white;" class="container mySpace">
     <h2>Authentification</h2>
     <br>
     <hr>
     <c:if test="${not empty error }">
			 <div class= "alert alert-danger">
			 <span class="fa fa-exclamation-triangle"> . <c:out value="${error}"></c:out></span></div>
			</c:if>	
		<form  method="post" action='auth'>

			<div class="form-group">
				<label for="email" class="form-control-label">Email</label> <input
					type="email" class="form-control"  id="email" name="email" />
			
			</div>
			<div class="form-group">
				<label for="password" class="form-control-label">Password</label> <input
					type="password" class="form-control" 
					id="password"  name="password"/>
				

			</div>
			
			<input type="submit" value="Submit" class="bt btn-primary" />

		</form>
		<br>
	</div>
 
    	</c:when>
    	<c:when test="${mode=='ADMIN_INDEX'}">
       

 <div class="container">
   <h3>ADMIN</h3>
   </div>
   

    </c:when> 
  
  
     <c:when test="${mode=='DEMANDE_PAYEMENT'}">
     
     <br>
   <div class="container">
   <h3>ADMIN</h3>
   </div>
  <div class="container" style='background:white;'>
            <c:if test="${empty payements}">
    	    <div class="table-responsive">
    	    <h5  align="center" style="color:red">Pas de Demande a traiter !!</h5>
    	    <hr>
    	    </div>
    	    </c:if>
    	    <c:if test="${not empty payements}">
    	 	<div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr style='background:black; color:white;'>
								<th>Date</th>
								<th style='background:green;'>Client_ID</th>
								<th>Montent</th>
								<th>IBAN</th>
								<th>Entreprise</th>
								<th>Plus</th>
								
							</tr>
						</thead>
						<tbody>
					
						 <c:forEach var="payement" items="${payements }">
								<tr>
									<td>${payement.date}</td>
									<td>${payement.idc}</td>
									<td>${payement.montent}</td>
									<td>${payement.iban}</td>
									<td>${payement.nom_E}</td>
									<td><a href="demande_detail?id=${payement.id}"><button class="bt btn-primary">Detail</button></a></td>
								</tr>
							</c:forEach>
							<tr style='background:black; color:white;'>
								<th>Date</th>
								<th style='background:green;'>Client_ID</th>
								<th>Montent</th>
								<th>IBAN</th>
								<th>Entreprise</th>
								<th>Plus</th>
								
							</tr>
								
						</tbody>
					</table>
				</div>
				</c:if>
			</div>
 
   
    </c:when>
    
    <c:when test="${mode=='DEMANDE_DETAIL'}">
    
     <br>
   <div class="container">
   <h3>ADMIN</h3>
   </div>
  <div class="container" style='background:white;'>
    	    <div class="table-responsive">
    	    <hr>
    	    </div>
    	 	<div class="table-responsive">
    	 	<h6>Date d'envoie : ${payement.date}</h6> 
    	 	<h6>Commentaire : ${payement.commentaire}</h6> 
					<table class="table table-striped table-bordered">
						<thead>
							<tr style='background:black; color:white;'>
								<th>Client</th>
								<th>Telephone</th>
								<th>Adresse</th>
								<th>IBAN</th>
								<th>Entreprise</th>
								<th style='background:green;'>Montant</th>
								<th>Action</th>
								
							</tr>
						</thead>
						<tbody>
								<tr>
									<td>${client.prenom}</td>
									<td>${client.telephone}</td>
									<td>${client.adresse}</td>
									<td>${payement.iban}</td>
									<td>${payement.nom_E}</td>
									<td>${payement.montent}</td>
									<td><a href="/approuved?id=${payement.id}"><button class="bt btn-success">Approuver</button> - <a href="rejeted?id=${payement.id}"><button class="bt btn-danger">Rejeter</button></a></a></td>
								</tr>
							
							<tr style='background:black; color:white;'>
							<td></td><td></td><td></td><td></td><td></td><td></td><td></td>
							</tr>
						</tbody>
					</table>
				</div>
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

