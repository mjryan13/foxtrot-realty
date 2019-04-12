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
			<c:url var="homePage" value="/tenants" />
			<c:url var="logout" value="/logout" />
			<c:url value="/img/FoxtrotRE.png" var="homepageImage" />
			<a href="${homePage}"><img src="${homepageImage}"
				alt="Foxtrot Logo"></a>
		</div>
		<nav>
			<ul>
			<li><a href="${homePage}">Home</a></li> 
			<li><a href="${logout}">Logout</a></li>
			</ul>

		</nav>
	</header>
	
	<p>Thanks for submitting your request. We will  reach out to you shortly!!!</p>
	
	<%@ include file="footer.jsp"%>