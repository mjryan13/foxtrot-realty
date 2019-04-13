<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<c:url var="propertyOwnersHomeHomePage" value="/propertyOwners" />
			<c:url var="logout" value="/logout" />
			<c:url value="/img/FoxtrotRE.png" var="homepageImage" />
			<a href="${propertyOwnersHomeHomePage}"><img
				src="${homepageImage}" alt="Foxtrot Logo"></a>
		</div>
		<nav>
			<ul>
				<%-- <li><a href="${homePage}">Home</a></li> --%>
				<li><a href="${logout}">Logout</a></li>
			</ul>
		</nav>


	</header>

	<div id="main-content">

		<div class="tab">
			<button class="tablinks" onclick="openOption(event, 'myProperties')"
				id="defaultOpen">My Properties</button>
			<button class="tablinks" onclick="openOption(event, 'addAProperty')">Add
				a Property</button>

		</div>

		<div class="owner-container">

			<div id="myProperties" class="tabcontent">
			<h2 style="margin-left:0px; text-align: center"> Properties </h2>
			
			<c:forEach items="${properties}" var="property">
				<table>
				<tr>
				<td>Property Name:</td>
				<td>${property.propertyName}</td>
				</tr>
				<tr>
				<td>Rent Amount:</td>
				<td>${property.rent}</td>
				</tr>
				<tr>
				<td>Property Status:</td>
				<td>${property.propertyStatus}</td>
				</tr>
				</table>
				</c:forEach>
			</div>
			

			<div id="addAProperty" class="tabcontent">
			
			<c:url var="addProperty" value="/propertyOwners" />
	<form class="apply" method="POST" action="${addProperty}">
	
	<div class="app-group">
				<label for="propertyName" style="margin-right:15px">Property Name: </label>
				<input type="text" id="propertyName" name="propertyName" placeHolder="Property Name..." class="app-control" required/>
			</div>
			
			<div class="app-group">
				<label for="propertyType" style="margin-right:15px">Property Type: </label>
				<input type="text" id="propertyType" name="propertyType" placeHolder="Property Type..." class="app-control" required/>
			</div>
	
	
	     <div class="app-group">
				<label for="propertyDescription" style="margin-right:15px">Property Description: </label>
				<input type="text" id="propertyDescription" name="propertyDescription" placeHolder="Property Description..." class="app-control" required/>
			</div>

          <div class="app-group">
				<label for="squareFootage" style="margin-right:15px">Square  Feet: </label>
				<input type="text" id="squareFootage" name="squareFootage" placeHolder="Square  Feet..." class="app-control" required/>
			</div>
			
			 <div class="app-group">
				<label for="numberOfBedrooms" style="margin-right:15px">Number Of Bedrooms: </label>
				<input type="text" id="numberOfBedrooms" name="numberOfBedrooms" placeHolder="Number Of Bedrooms..." class="app-control" required/>
			</div>
			
			 <div class="app-group">
				<label for="numberOfBathrooms" style="margin-right:15px">Number Of Bathrooms: </label>
				<input type="text" id="numberOfBathrooms" name="numberOfBathrooms" placeHolder="Number Of Bathrooms..." class="app-control" required/>
			</div>



     <div class="app-group">
				<label for="rent" style="margin-right:15px">Rent: </label>
				<input type="text" id="rent" name="rent" placeHolder="rent..." class="app-control" required/>
			</div>
			
			
			<div class="app-group">
				<label for="streetAddress1" style="margin-right:15px">Address Line 1: </label>
				<input type="text" id="streetAddress1" name="streetAddress1" placeHolder="Address Line 1..." class="app-control" required/>
			</div>
			
			<div class="app-group">
				<label for="streetAddress2" style="margin-right:15px">Address Line 2: </label>
				<input type="text" id="streetAddress2" name="streetAddress2" placeHolder="Address Line 2..." class="app-control" required/>
			</div>
			
			<div class="app-group">
				<label for="city" style="margin-right:15px">City: </label>
				<input type="text" id="city" name="city" placeHolder="city..." class="app-control" required/>
			</div>
			
			<div class="app-group">
				<label for="state" style="margin-right:15px">State: </label>
				<input type="text" id="state" name="state" placeHolder="State..." class="app-control" required/>
			</div>
			
			<div class="app-group">
				<label for="zipcode" style="margin-right:15px">Zipcode: </label>
				<input type="text" id="zipcode" name="zipcode" placeHolder="Zipcode..." class="app-control" required/>
			</div>
			
			
			<div class="app-group">
				<label for="offerAvailable" style="margin-right:15px">Offer Available: </label>
				<input type="text" id="offerAvailable" name="offerAvailable" placeHolder= "Offer Available..." class="app-control" required/>
			</div>
			
			<button type="submit" class="btn btn-primary">Submit Application</button>
			
			</form>
			
			</div>
			
			
		</div>

           

		<script>
			document.getElementById("defaultOpen").click();

			function openOption(evt, cityName) {
				var i, tabcontent, tablinks;
				// Get all elements with class="tabcontent" and hide them
				tabcontent = document
						.getElementsByClassName("tabcontent");
				for (i = 0; i < tabcontent.length; i++) {
					tabcontent[i].style.display = "none";
				}

				// Get all elements with class="tablinks" and remove the class "active"
				tablinks = document.getElementsByClassName("tablinks");
				for (i = 0; i < tablinks.length; i++) {
					tablinks[i].className = tablinks[i].className.replace(
							" active", "");
				}

				// Show the current tab, and add an "active" class to the button that opened the tab
				document.getElementById(cityName).style.display = "block";
				evt.currentTarget.className += " active";
			}
		</script>



		<%@ include file="footer.jsp"%>