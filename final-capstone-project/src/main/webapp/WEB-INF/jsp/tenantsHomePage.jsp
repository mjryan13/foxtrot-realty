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

	<div id="main-content">
	
	<div class="tab">
		<button class="tablinks" onclick="openOption(event, 'payRent')" id="defaultOpen">Pay Rent</button>
		<button class="tablinks" onclick="openOption(event, 'service')">Service Request</button>

	</div>



	
		<div class="container">
		<div id="payRent" class="tabcontent">
			<div class="rentContainer">
				<h1 style="margin-left: 0px">Pay Rent</h1>
				<c:out value="Community: ${property.propertyName}"/></br>
				<c:out value="Rent: ${property.rent}"/>
					
				

				<c:url var="tenantsHomeUrl" value="/tenantsPayRent" />

				<form action="${tenantsHomeUrl}" method="POST">

					<label for="creditCardNumber">Credit Card Number:</label>
					 <input type="text"  name="creditCardNumber" style="margin-left: 5px" /><br /> 
						<label for="expiryDate">Expiry Date: </label> 
						<input type="text" name="expiryDate" style="margin-left: 5px" /><br> 
						<label for="CVV">CVV: </label> 
						<input type="text" name="CVV" style="margin-left: 5px" /><br> 
						<br>
						<input type="submit" value="Submit Payment" />

				</form>
			</div>
			</div>

			<div id="service" class="tabcontent">
			<div class="serviceRequestContainer">

				<h1 style="margin-left: 0px">Service Request</h1>
				
				<c:url var="tenantsHomeUrl" value="/tenantsServiceRequest" />
				<br>
				<form action="${tenantsHomeUrl}" method="POST">

					

					<label for="description">Service Description:</label> 
					<br>
					<textarea placeholder="Service Description..." rows="4" cols="50"
						name="description" style="margin-left: 5px"></textarea>
					<br />
					<br>
					<!-- 		<label for="userId">User Id:</label> 
		<input type="text" name="userId" /><br />  -->

					<input type="submit" value="Submit Service Request" />


				</form>
			</div>
			</div>
		</div>
		
		<script>
			document.getElementById("defaultOpen").click();
			
			function openOption(evt, cityName) {
			var i, tabcontent, tablinks;
			// Get all elements with class="tabcontent" and hide them
			  tabcontent = document.getElementsByClassName("tabcontent");
			  for (i = 0; i < tabcontent.length; i++) {
			    tabcontent[i].style.display = "none";
			  }

			  // Get all elements with class="tablinks" and remove the class "active"
			  tablinks = document.getElementsByClassName("tablinks");
			  for (i = 0; i < tablinks.length; i++) {
			    tablinks[i].className = tablinks[i].className.replace(" active", "");
			  }

			  // Show the current tab, and add an "active" class to the button that opened the tab
			  document.getElementById(cityName).style.display = "block";
			  evt.currentTarget.className += " active";
			}
			
			
		</script>

		<%@ include file="footer.jsp"%>