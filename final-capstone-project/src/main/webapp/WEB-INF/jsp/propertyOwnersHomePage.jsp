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
		
		<div class="slideshow-container">
			<ul class="slideshow">
				<li><span>Image 01</span></li>
				<li><span>Image 02</span></li>
				<li><span>Image 03</span></li>
				<li><span>Image 04</span></li>
				<li><span>Image 05</span></li>
				<li><span>Image 06</span></li>
			</ul>

			<div class="display-container">
				<div class="displayMainContainer" style="padding: 50px">

		<div class="owner-container">
				<div style="border-style: solid; border-width: 1px; border-radius: 5px; padding: 15px">
			<div id="myProperties" class="tabcontent">
			<h2 style="margin-left:0px; text-align: center; color: #8faab3; -webkit-text-stroke: 1px black; font-size: 40px"> Properties </h2>
			
			<c:forEach items="${properties}" var="property">
				<table style= "border-style: solid; border-width: 1px; border-radius: 5px; padding: 10px; margin: 10px; width: 100%">
				<tr>
				<td>Property Name:</td>
				<td>${property.propertyName}</td>
				</tr>
				<tr>
				<td>Rent:</td>
				<fmt:formatNumber var="rent" value="${property.rent}"
					type="currency" />
				<td>${rent}</td>
				</tr>
				<tr>
				<td>Property Status:</td>
				<td>${property.propertyStatus}</td>
				</tr>
				<tr>
				<td>Property Address:</td>
				<td><c:out value="${property.streetAddress1} ${property.streetAddress2},  ${property.city}, ${property.state},  ${property.zipcode}" /></td>
				</tr>
				</table>
				</c:forEach>
			</div>

			<div id="addAProperty" class="tabcontent">
			
			<c:url var="addProperty" value="/propertyOwners" />
	<form class="apply" method="POST" action="${addProperty}">
	  <h2  style="margin-left:0px; text-align: center; color: #8faab3; -webkit-text-stroke: 1px black; font-size: 40px">Add Property</h2>
	<div class="app-group">
				<label for="propertyName" style= "display: inline-block; width:160px; text-align: right">Property Name: </label>
				<input type="text" id="propertyName" name="propertyName" placeHolder="Property Name..." class="app-control" required/>
			</div>
			
			<div class="app-group">
				<label for="propertyType" style= "display: inline-block; width:160px; text-align: right">Property Type: </label>
				<select name="propertyType" required>
				<option value="Apartment">Apartment</option>
				<option value="Condo">Condo</option>
				</select>
			</div>
	
	
	     <div class="app-group">
				<label for="propertyDescription" style= "display: inline-block; width:160px; text-align: right">Property Description: </label>
				<input type="text" id="propertyDescription" name="propertyDescription" placeHolder="Property Description..." class="app-control" required/>
			</div>

          <div class="app-group">
				<label for="squareFootage" style= "display: inline-block; width:160px; text-align: right">Square  Feet: </label>
				<input type="number" id="squareFootage" name="squareFootage" placeHolder="Square  Feet..." class="app-control" required/>
			</div>
			
			 <div class="app-group">
				<label for="numberOfBedrooms" style= "display: inline-block; width:200px; text-align: right">Number Of Bedrooms: </label>
				<select name="numberOfBedrooms" required>
				<option value="0">Studio</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				</select>
			</div>
			
			 <div class="app-group">
				<label for="numberOfBathrooms" style= "display: inline-block; width:200px; text-align: right">Number Of Bathrooms: </label>
				<select name="numberOfBathrooms" required>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				</select>
			</div>



     <div class="app-group">
				<label for="rent" style= "display: inline-block; width:100px; text-align: right">Rent: </label>
				<input type="number" id="rent" name="rent" placeHolder="rent..." class="app-control" required/>
			</div>
			
			
			<div class="app-group">
				<label for="streetAddress1" style= "display: inline-block; width:160px; text-align: right">Address Line 1: </label>
				<input type="text" id="streetAddress1" name="streetAddress1" placeHolder="Address Line 1..." class="app-control" required/>
			</div>
			
			<div class="app-group">
				<label for="streetAddress2" style= "display: inline-block; width:160px; text-align: right">Address Line 2: </label>
				<input type="text" id="streetAddress2" name="streetAddress2" placeHolder="Address Line 2..." class="app-control" required/>
			</div>
			
			<div class="app-group">
				<label for="city" style= "display: inline-block; width:160px; text-align: right">City: </label>
				<input type="text" id="city" name="city" placeHolder="city..." class="app-control" required/>
			</div>
			
			<div class="app-group">
				<label for="state" style= "display: inline-block; width:160px; text-align: right">State: </label>
				<input type="text" id="state" name="state" placeHolder="State..." class="app-control" required/>
			</div>
			
			<div class="app-group">
				<label for="zipcode" style= "display: inline-block; width:160px; text-align: right">Zipcode: </label>
				<input type="number" id="zipcode" name="zipcode" placeHolder="Zipcode..." class="app-control" required/>
			</div>
			
			
			<div class="app-group">
				<label for="offerAvailable" style= "display: inline-block; width:160px; text-align: right">Offer Available: </label>
				<select name="offerAvailable" required>
				<option value="Yes">Yes</option>
				<option value="No">No</option>
				</select>
			</div>
			<br>
			<button type="submit" class="btn btn-primary" style="background-color:green; color: white; border-radius: 5px; height: 3em; margin: 0px">Add Property</button>
			
			</form>
			
			</div>
			
			
		</div>

   </div>
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