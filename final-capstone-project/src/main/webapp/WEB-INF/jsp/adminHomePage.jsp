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
			<c:url var="adminHomePage" value="/admin" />
			<c:url var="logout" value="/logout" />
			<c:url value="/img/FoxtrotRE.png" var="homepageImage" />
			<a href="${adminHomePage}"><img src="${homepageImage}"
				alt="Foxtrot Logo"></a>
		</div>
		<nav>
			<ul>
			<li><a href="${logout}">Logout</a></li>
			</ul>
		</nav>


	</header>

	<div id="main-content">
	
	
		<div class="tab">
		<button class="tablinks" onclick="openOption(event, 'pending')" id="defaultOpen">Pending Rentals</button>
		<button class="tablinks" onclick="openOption(event, 'properties')" >Properties</button>
		<button class="tablinks" onclick="openOption(event, 'rents')" >Rents</button>
		<button class="tablinks" onclick="openOption(event, 'service')">Service Request</button>
		</div>
					
					<!-- <h1 style="margin-left: 0px; text-align: center">Pending Rentals</h1> -->
	
	

		<div class="containers">
		
					
			<div class="pending-container" id="pending">
			<h1 style="margin-left: 0px; text-align: center">Pending Rentals</h1>
			<c:forEach items="${applications}" var="application">
			
			<h2 style="margin-left: 0px; text-align: center">Application</h2>
				<table>
				<tr>
				<td>Property Name:</td>
				<td>${application.property.propertyName}</td>
				</tr>
				<tr>	
				<td>First Name:</td>
				<td>${application.firstName}</td>
				</tr>
				<tr>
				<td>Last Name:</td>
				<td>${application.lastName}</td>
				</tr>
				<tr>
				<td>Current Employer:</td>
				<td>${application.currentEmployer}</td>
				</tr>
				<tr>
				<td>Annual Income:</td>
				<fmt:formatNumber var="annualIncome" value="${application.annualIncome}"
					type="currency" />
				<td>${annualIncome}</td>
				</tr>
				<tr>
				<td>Phone:</td>
				<td>${application.phoneNumber}</td>
				</tr>
				<tr>
				<td>Address:</td>
				<td><c:out value="${application.addressLine1} ${application.addressLine2},  ${application.city}, ${application.state},  ${application.zipcode}" /></td>
				</tr>
				
				</table>
				<c:url var="approveOrDeny" value="/adminConfirm" />
				<form  method="POST" action="${approveOrDeny}">
				<input type="hidden" id="applicationId" name=applicationId value="${application.applicationId}"/>
				<input type="submit" style="background-color:green; color: white; border-radius: 5px" value="Approve" />
				</form>
				<form  method="POST" action="${approveOrDeny}">
				<input type="hidden" id="applicationId" name=applicationId value="${application.applicationId}"/>
				<input type="submit" style="background-color:red; color: white; border-radius: 5px"value="Decline" />
				</form>
				</c:forEach>
			</div>
			
				

		<div id="properties"  class="pending-container">
			<div class="property-container">
				<h1 style="margin-left: 0px">Properties</h1>
				
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
		</div>
		
		<div id="rents"  class="pending-container">
			<div class="property-container">
				<h1 style="margin-left: 0px">Rents</h1>
				
				<c:forEach items="${rents}" var="rent">
				<table>
				<tr>
				<td>Property Name:</td>
				<td>${rent.property.propertyName}</td>
				</tr>
				<tr>
				<td>Rent Amount:</td>
				<td>${rent.rent}</td>
				</tr>
				<tr>
				<td>Tenant Name:</td>
				<td>${rent.user.firstName}  ${rent.user.lastName}</td>
				</tr>
				</table>
				</c:forEach>
			</div>
		</div>
		
		<div id="service"  class="pending-container">
			<div class="property-container">
				<h1 style="margin-left: 0px">Service Requests</h1>
				
				<c:forEach items="${serviceRequests}" var="service">
				<table>
				<tr>
				<td>Service Description:</td>
				<td>${service.description}</td>
				</tr>
				<tr>
				<td>Property Name:</td>
				<td>${service.property.propertyName}</td>
				</tr>
				<tr>
				<td>Tenant Name:</td>
				<td>${service.user.firstName}  ${service.user.lastName}</td>
				</tr>
				<tr>
				<td>Tenant Phone Number:</td>
				<td>${service.user.phoneNumber}</td>
				</tr>
				<tr>
				<td>Tenant Email:</td>
				<td>${service.user.emailId}</td>
				</tr>
				</table>
				</c:forEach>
			</div>
		</div>
		</div>
		
	
	<script>
			document.getElementById("defaultOpen").click();
			
			function openOption(evt, cityName) {
			var i, tabcontent, tablinks;
			// Get all elements with class="tabcontent" and hide them
			  tabcontent = document.getElementsByClassName("pending-container");
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