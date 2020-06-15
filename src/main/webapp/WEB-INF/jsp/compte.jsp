<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css" href="static/dist/css/mystyle.css">  
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="static/js/jquery-3.4.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#">Cadorim</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor01">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Profile</a>
      </li> 
      <li class="nav-item">
        <a class="nav-link" href="/payement">Ajouter un payement</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Payement en attente</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/historique">Historique de payements</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0"method="post" action='/logout' >
      <input class="form-control mr-sm-2" type="hidden" /> 
      <button class="btn btn-danger my-2 my-sm-0" type="submit">Logout</button>
    </form>
  </div>
</nav><br><br>
<div class="container">
    <div class="kpx_login">
    <h3>${client1.nom} ${client1.prenom}</h3>
    </div>
    </div>
<div class="container">
    <div class="kpx_login">
    <img src="static/dist/img/cadorimlogo.png" class="img-responsive" />
    </div>
    
 </div>