<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link href="static/dist/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="static/dist/css/mystyle.css">  
<script src="static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/dist/js/jquery-3.4.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
 <img src="static/dist/img/cadorim.png" class="img-responsive" />
<br>
<br>
<div class="container">
    <div class="kpx_login">
    <c:choose>
        <c:when test="${type=='login'}">
        <h3 class="kpx_authTitle">Se Connecter ou <a href="/signin">Créer un compte </a></h3>
		<div class="row kpx_row-sm-offset-3 kpx_loginOr">
			<div class="col-xs-12 col-sm-6">
				<hr class="kpx_hrOr">
				
			</div>
		</div>

		<div class="row kpx_row-sm-offset-3">
			<div class="col-xs-12 col-sm-6">
			 <c:if test="${not empty error }">
			 <div class= "alert alert-danger">
			 <span class="fa fa-exclamation-triangle"> . <c:out value="${error}"></c:out></span></div>
			</c:if>	
			    <form class="kpx_loginForm" action="/login" autocomplete="off" method="POST">
					<div class="input-group">
						<span class="input-group-addon"><span class="fa fa-envelope"></span></span>
						<input type="text" class="form-control" value="${client.email }" name="email" placeholder="Email" required>
					</div>
                    <hr />
										
					<div class="input-group">
						<span class="input-group-addon"><span class="fa fa-key"></span></span>
						<input value="${client.password}"  type="password" class="form-control" name="password" placeholder="Password" required>
					</div>
                    <hr />
					<button class="btn btn-lg btn-outline-primary btn-block" type="submit"><i class="fa fa-sign-in"></i> Login</button>
				</form>
				<a href='/signin'><button class="btn btn-lg btn-outline-success btn-block"><i class="fa fa-user-plus"></i> Signup</button></a>
			</div>
    	</div>
    	</c:when>
    	 
    	<c:when test="${type=='signin'}">
    	
    	<h3 class="kpx_authTitle">Créer un compte </h3>
		<div class="row kpx_row-sm-offset-3 kpx_loginOr">
			<div class="col-xs-12 col-sm-6">
				<hr class="kpx_hrOr">
				
			</div>
		</div>
    	<div class="row kpx_row-sm-offset-3">
			<div class="col-xs-12 col-sm-6">	
			    <form class="kpx_loginForm" action="register" autocomplete="off" method="POST">
					<div class="input-group">
						<span class="input-group-addon"><span class="fa fa-user"></span></span>
						
						<input type="text" value="${client.nom }" class="form-control" name="nom" placeholder="Nom" required/>
					</div>
					 <hr />
					<div class="input-group">
						<span class="input-group-addon"><span class="fa fa-user"></span></span>
						<input type="text" value="${client.prenom }" class="form-control" name="prenom" placeholder="Prenom" required/>
					</div>
					 <hr />
					<div class="input-group">
						<span class="input-group-addon"><span class="fa fa-envelope"></span></span>
						<input type="email" value="${client.email}" class="form-control" name="email" placeholder="Email" required/>
					</div>
					 <hr />
					<div class="input-group">
						<span class="input-group-addon"><span class="fa fa-phone"></span></span>
						<input type="number" value="${client.telephone}" class="form-control" name="telephone" placeholder="votre numero de telephone" required/>
					</div>
					 <hr />
					<div class="input-group">
						<span class="input-group-addon"><span class="fa fa-map"></span></span>
						<input type="text" class="form-control" value="${client.adresse}" name="adresse" placeholder="Adresse" required/>
					</div>
                    <hr />
					 <c:if test="${not empty error }">
			        <div class="input-group alert alert-danger">
			        <c:out value="${error}"></c:out></div>
			        </c:if>					
					<div class="input-group">
						<span class="input-group-addon"><span class="fa fa-key"></span></span>
						<input  type="password" class="form-control" value="${client.password}" name="password" placeholder="Mot de passe" required/>
					</div>
					 <hr />
					<div class="input-group">
						<span class="input-group-addon"><span class="fa fa-key"></span></span>
						<input  type="password" class="form-control" name="confirmation" placeholder="Confirmer votre mot de passe" required/>
					</div>
                    <hr />
					<button class="btn btn-lg btn-outline-primary btn-block" type="submit"><i class="fa fa-user-plus"></i>Créer</button>
				</form>
				
			</div>
    	</div>
    	</c:when>
    	</c:choose>
    		<h6 align="center">Copyright © 2020 CadoRim</h6>
	</div>
	
        </div>
        