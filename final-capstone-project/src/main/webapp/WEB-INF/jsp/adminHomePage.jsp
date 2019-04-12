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
			<c:url var="tenantsHomePage" value="/tenants" />
			<c:url var="logout" value="/logout" />
			<c:url value="/img/FoxtrotRE.png" var="homepageImage" />
			<a href="${tenantsHomePage}"><img src="${homepageImage}"
				alt="Foxtrot Logo"></a>
		</div>
		<nav>
			<ul>
			<%-- <li><a href="${homePage}">Home</a></li> --%>
			<li><a href="${logout}">Logout</a></li>
			</ul>
		</nav>


	</header>

	<div id="main-content">
	
	<div class="admin-container">
	
		<div class="tab">
		<button class="tablinks" onclick="openOption(event, 'pending')" id="defaultOpen">Pending Rentals</button>
		<button class="tablinks" onclick="openOption(event, 'properties')" >Properties</button>
		<button class="tablinks" onclick="openOption(event, 'rents')" >Rents</button>
		<button class="tablinks" onclick="openOption(event, 'service')">Service Request</button>

	</div>
	
	
		<div class="container">
		<div id=pending class="tabcontent">
			<div class="pending-container">
				<h1 style="margin-left: 0px">Pending Rentals</h1>
				
				<c:forEach items="${applications}" var="application">
				<c:out value="${applicaiton.propertyId}" />
				<c:out value="${applicaiton.firstName}" />
				<c:out value="${applicaiton.lastName}" />
				<c:out value="${applicaiton.currentEmployer}" />
				<c:out value="${applicaiton.annualIncome}" />
				<c:out value="${applicaiton.phone}" />
				<c:out value="${applicaiton.addressLine1}" />
				<c:out value="${applicaiton.addressLine2}" />
				<c:out value="${applicaiton.city}" />
				<c:out value="${applicaiton.state}" />
				<c:out value="${applicaiton.zipcode}" />
				<c:out value="${applicaiton.currentEmployer}" />
				
				<input type="submit" value="Approve" /><br/>
				<input type="submit" value="Decline" /><br/>
				
				</c:forEach>
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
			
			function showPaymentConfirmation() {
		        document.getElementById('paymentConfirmation').innerText = "Thank you for your payment !!!";                    
		    }
			
			function showRequestConfirmation() {
		        document.getElementById('serviceRequestConfirmation').innerText = "Thank you for submitting your request. We will reach out to you shortly !!!";                    
		    }
		</script>

		<%@ include file="footer.jsp"%>