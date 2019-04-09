<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FOXTROT Real Estate</title>
<c:url value="/css/site.css" var="cssHref" />
<link rel="stylesheet" href="${cssHref}">
</head>
<body>
	<header>
		<div class="headerTitle">
		<c:url var="homePage" value="/" />
		<c:url value="/img/FoxtrotRE.png" var="homepageImage" />
		<a href="${homePage}" ><img src="${homepageImage}" alt="Foxtrot Logo"></a>
			<!-- <h1 class="foxtrot">FOXTROT</h1>
			<h2>REAL   ESTATE</h2>	 -->		
 		</div>
 <!-- 		<div class="navBar">
 -->			<nav>
				<ul>
					<c:url var="listingsPage" value="/listings" />
					<li><a href="${homePage}">Home</a></li>
					<li><a href="${listingsPage}">Listings</a></li>
					<li><a href="">About Us</a></li>
				<!-- </ul> -->

<!-- 				<div class="login">
 -->					<!-- <ul> -->
						<li><a href="">Login</a></li>
						<li><a href="">Register</a></li>
					</ul>
<!-- 				</div>
 -->			</nav>
<!--  		</div> -->
 
	</header>

	<div id="main-content">