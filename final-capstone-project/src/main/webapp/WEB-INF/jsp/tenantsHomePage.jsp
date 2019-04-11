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
	
	<div class="tab">
		<button class="tablinks" onclick="openOption(event, 'payRent')" id="defaultOpen">Pay Rent</button>
		<button class="tablinks" onclick="openOption(event, 'service')">Service Request</button>

	</div>



	
		<div class="container">
		<div id="payRent" class="tabcontent">
			<div class="rentContainer">
				<h1 style="margin-left: 0px">Pay Rent</h1>
				<h3>
					Rent for this property:
					<c:out value="${rent}" />
				</h3>

				<c:url var="tenantsHomeUrl" value="/tenants" />

				<form action="${tenantsHomeUrl}" method="POST">

					<label for="propertyName">Property Name:</label>
					 <input type="text"  name="propertyName" style="margin-left: 5px" /><br /> 
						<label for="rent">Rent Amount: </label> 
						<input type="text" name="rent" style="margin-left: 5px" /><br> 
						<br>
						<input type="submit" value="Pay Rent" />

				</form>
			</div>
			</div>

			<div id="service" class="tabcontent">
			<div class="serviceRequestContainer">

				<h1 style="margin-left: 0px">Service Request</h1>
				
				<c:url var="tenantsHomeUrl" value="/tenants" />
				<br>
				<form action="${tenantsHomeUrl}" method="POST">

					<label for="Confirm Address">Confirm Address: </label> 
					<input type="text" name="propertyId" style="margin-left: 5px" /><br>

					<!-- <label for="description">Description:</label> -->
					<br>
					<textarea placeholder="Description..." rows="4" cols="50"
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