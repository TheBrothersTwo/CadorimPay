<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Payement</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="static/dist/css/mystyle.css">  
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/js/jquery-3.4.1.min.js"></script>
</head>
<body>
   
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#">Cadorim</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor01">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Profile</a>
      </li>
        <li class="nav-item ${active}">
        <a class="nav-link" href="/payement">Ajouter un payement</a>
      </li>
      <li class="nav-item ${active2}">
        <a class="nav-link" href="#">Payement en attente</a>
      </li>
      <li class="nav-item ${active1}">
        <a class="nav-link" href="/historique">Historique de payements</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0"method="post" action='/'>
      <input class="form-control mr-sm-2" type="hidden" /> 
      <button class="btn btn-danger my-2 my-sm-0" type="submit">Logout</button>
    </form>
  </div>
</nav> 
<br>
<br>
 <div class="container">
    <div class="kpx_login">
    <h3>${client1.nom} ${client1.prenom}</h3>
    </div>
    </div>
 <c:choose>
 <c:when test="${mode=='AJOUTER' }">
    <br>
    
    <div class="container content">
    			<h2>Ajouter un payement</h2>
    			<form action="payer" method="post">
    			 <div class="form-row">
    			 <div class="form-group col-md-7">
                 <label for="montent">Montent</label>
                 <input type="number" class="form-control" name="montent" value="${payement.montent }" placeholder="saisir le montent" required>
                  </div>
				    <div class="form-group col-md-7">
				      <label for="iban">IBAN</label>
				      <input type="text" class="form-control" name="iban"  value="${payement.iban}" placeholder="saisir le IBAN" required>
				    </div>
				     <div class="form-group col-md-7">
				      <label for="entreprise">Nom de l'entreprise</label>
				      <input type="text" class="form-control" name="nom_E"  value="${payement.nom_E }" placeholder="saisir le nom de l'entreprise "  required>
				    </div>
				     <div class="form-group col-md-7">
				      <label for="reference">Referance de payement</label>
				      <input type="text" class="form-control" name="reference"  value="${payement.reference }" placeholder="saisir la referance lié au payement "    required>
				    </div>
				    <div class="form-group col-md-7">
				      <label for="commentaire">Commentaire</label>
				      <input type="text" class="form-control" name="commentaire"  value="${payement.commentaire }"   >
				    </div>
				   
				    <div class="form-group col-md-7">
				    <button type="submit" class="btn btn-primary">Ajouter la commende </button>
				    </div>
                  </div> 
                </form> 
             
    </div>
    </c:when>
    <c:when test="${mode=='HISTORIQUE' }">
    <div class="container content">
    
    <div class="table-responsive">
					<table class="table table-striped table-bordered">
						<thead>
							<tr style='background:black; color:white;'>
								<th>Date</th>
								<th>Montent</th>
								<th>IBAN</th>
								<th>Entreprise</th>
								<th style="background:green;">Statut</th>
								
							</tr>
						</thead>
						<tbody>
						 <c:forEach var="payement" items="${payements }">
								<tr>
									<td>${payement.date}</td>
									<td>${payement.montent}</td>
									<td>${payement.iban}</td>
									<td>${payement.nom_E}</td>
									<c:if test="${payement.statut != 'v'}">
									<td>${payement.statut}</td>
									</c:if>
									<c:if test="${payement.statut =='v'}">
									<td>En cour de traitement...</td>
									</c:if>
								</tr>
							</c:forEach>
							<tr style='background:black; color:white;'>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<th style="background:green;"></th>
								
								
							</tr>
								
							</tr>
						</tbody>
					</table>
				</div>
				</div>
    
    
    </c:when>
    
    </c:choose>
    
    <div class="container footer">
    	<div class="row footer">
    		<ul class="list-inline">
				<li>Copyright © 2020 Cadorim</li>
				
	       </ul>
    	</div>
    </div>

    <script type="text/javascript" src="static/dist/js/bootstrap.js"></script>
    <script type="text/javascript" src="static/dist/js/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="static/dist/js/myScript.js"></script>
</body>
</html>