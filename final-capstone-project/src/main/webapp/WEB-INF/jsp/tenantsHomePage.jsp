<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
			<a href="${homePage}"><img src="${homepageImage}"
				alt="Foxtrot Logo"></a>
		</div>
		<nav>
			<ul>
			<li><a href="${homePage}">Home</a></li>
			<li><a href="">Logout</a></li>
			</ul>

		</nav>


	</header>

	<div id="main-content">




		<div class="container">
			<div class="rentContainer">
				<h1 style="margin-left: 0px">Pay Rent</h1>
				<h3>
					Rent for this property:
					<c:out value="${rent}" />
				</h3>

				<c:url var="tenantsHomeUrl" value="/tenants" />

				<form action="${tenantsHomeUrl}" method="POST">

					<label for="propertyName">Property Name:</label> <input type="text"
						name="propertyName" /><br /> <label for="rent">Rent
						Amount:</label> <input type="text" name="rent" /><br /> <input
						type="submit" value="Pay Rent" />

				</form>
			</div>


			<div class="serviceRequestContainer">

				<h1 style="margin-left: 0px">Service Request</h1>

				<c:url var="tenantsHomeUrl" value="/tenants" />

				<form action="${tenantsHomeUrl}" method="POST">

					<label for="Confirm Address">Confirm Address</label> <input
						type="text" name="propertyId" /><br />

					<!-- <label for="description">Description:</label> -->

					<textarea placeholder="Description..." rows="4" cols="50"
						name="description"></textarea>
					<br />

					<!-- 		<label for="userId">User Id:</label> 
		<input type="text" name="userId" /><br />  -->

					<input type="submit" value="Submit Service Request" />


				</form>
			</div>
		</div>

		<%@ include file="footer.jsp"%>