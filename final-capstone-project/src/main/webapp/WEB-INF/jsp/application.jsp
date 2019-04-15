<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FOXTROT Real Estate</title>
<link href='http://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>
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
					<!-- <li><a href="" >Admin</a></li>
					<li><a href="" >Property Owners</a></li> -->
					<c:url var="aboutUs" value="/aboutUs" />
					<li><a href="${aboutUs}">About Us</a></li>
				<!-- </ul> -->

<!-- 				<div class="login">
 -->					<!-- <ul> -->
 						<c:url var="login" value="/login" />
						<li><a href="${login}">Login</a></li>
						
						<c:url var="register" value="/users/new" />
						<li><a href="${register}">Register</a></li>
					</ul>

 			</nav>

 
	</header>

	<div id="main-content">
	
	<h1 style="margin-left:0px; text-align: center"> You are one click away from your dream home !!! </h1><br>
	

<div class="application">


	<div class="propertyApplicationImg" >
		<c:url var= "imageLink"
			value= "img/${property.propertyId}.jpg" />

 			<img alt="Property Detail Img" src="${imageLink}" />  

	</div>

	<div class="applicationForm">

	<c:url var="confirmationPage" value="/submitApplication" />	
	<form class="apply" method="POST" action="${confirmationPage}">
	  
		<div class="app-group">
				<label for="firstName" style="margin-right:15px">First Name: </label>
				<input type="text" id="firstName" name="firstName" placeHolder="First Name..." class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="lastName" style="margin-right:15px">Last Name: </label>
				<input type="text" id="lastName" name="lastName" placeHolder="Last Name..." class="app-control" required/>
			</div>
			<div class="app-group">
				<label for=ssn style="margin-right:15px">Social Security: </label>
				<input type="text" pattern="^\d{3}\d{2}\d{4}$" id="ssn" name="ssn" placeHolder="Social Security" class="app-control" required />
			</div>
			<div class="app-group">
				<label for="birthDate" style="margin-right:15px">BirthDay: </label>
				<input type="date" id="birthDate" name="birthDate" placeHolder="mm/dd/yyyy" class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="phoneNumber" style="margin-right:15px">Phone Number: </label>
				<input type="tel" id="phoneNumber"  name="phoneNumber" placeHolder="Phone Number" class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="email" style="margin-right:15px">Email: </label>
				<input type="email" id="email" name="email" placeHolder="Email" class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="addressLine1" style="margin-right:15px">Address Line1: </label>
				<input type="text" id="addressLine1" name="addressLine1" placeHolder="Current Address Line1" class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="addressLine2" style="margin-right:15px">Address Line2: </label>
				<input type="text" id="addressLine2" name="addressLine2" placeHolder="Current Address Line1" class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="city" style="margin-right:15px">City: </label>
				<input type="text" id="city" name="city" placeHolder="City" class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="state" style="margin-right:15px">State: </label>
				<input type="text" id="state" name="state" placeHolder="State" class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="zipcode" style="margin-right:15px">Zipcode: </label>
				<input type="text" pattern="[0-9]{5}"id="zipcode" name="zipcode" placeHolder="Zipcode" class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="currentEmployer" style="margin-right:15px">Current Employer: </label>
				<input type="text" id="currentEmployer" name="currentEmployer" placeHolder="Enter current employer" class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="annualIncome" style="margin-right:15px">Annual Income: </label>
				<input type="number" id="annualIncome" name="annualIncome" placeHolder="$" class="app-control" required/>
			</div>
			<br>
			
			<button type="submit" class="btn btn-primary" style="background-color:green; color: white; border-radius: 5px">Submit Application</button>
	</form>	
</div>
</div>

<%@ include file="footer.jsp"%>