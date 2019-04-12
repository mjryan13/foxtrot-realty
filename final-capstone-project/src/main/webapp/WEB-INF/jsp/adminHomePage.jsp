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
					
					<h1 style="margin-left: 0px; text-align: center">Pending Rentals</h1>
	
	

		<div class="containers">
		
					
			<div class="pending-container">
			<c:forEach items="${applications}" var="application">
			
			<h2 style="margin-left: 0px; text-align: center">Application</h2>
				<table>
				<tr>
				<td>Property Id:</td>
				<td>${application.propertyId}</td>
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
				<td>${application.annualIncome}</td>
				</tr>
				<tr>
				<td>Phone:</td>
				<td>${application.phoneNumber}</td>
				</tr>
				<tr>
				<td>Address:</td>
				<td>${application.addressLine1}${" "}${application.addressLine2}${" "} ${application.city} ${" "} ${application.state} ${" "} 
					${application.zipcode}</td>
				</tr>
				
				</table>
				<input type="submit" style="background-color:green; color: white; border-radius: 5px" value="Approve" />
				<input type="submit" style="background-color:red; color: white; border-radius: 5px"value="Decline" />
				</c:forEach>
			</div>
			</div>
				
				
				
				<%-- <c:forEach items="${applications}" var="application">
				<label style= "display: inline-block; width:100px; text-align: right; margin-right: 10px" >Property Id:</label>
				<c:out value="${application.propertyId}" />
				<br>
				<label style= "display: inline-block; width:100px; text-align: center; margin-right: 10px" >First Name:</label>
				<c:out value="${application.firstName}" />
				<br>
				<label style= "display: inline-block; width:150px; text-align: center; margin-right: 10px" >Last Name:</label>
				<c:out value="${application.lastName}" />
				<br>
				<label style= "display: inline-block; width:150px; text-align: center; margin-right: 10px" >Current Employer:</label>
				<c:out value="${application.currentEmployer}" />
				<br>
				<label style= "display: inline-block; width:150px; text-align: center; margin-right: 10px" >Annual Income:</label>
				<c:out value="${application.annualIncome}" />
				<br>
				<label style= "display: inline-block; width:150px; text-align: center; margin-right: 10px" >Phone:</label>
				<c:out value="${application.phoneNumber}" />
				
				<p>Address:<c:out value="${application.addressLine1}" /></p>
				
				<p>City:<c:out value="${application.city}" /></p>
				
				<p>State:<c:out value="${application.state}" /></p>
				
				<p>Zipcode:<c:out value="${application.zipcode}" /></p>
				<br> --%>
		
				<%-- </c:forEach> --%>
		
		
		
		<div id="properties"  class="tabcontent">
			<div class="property-container">
				<h1 style="margin-left: 0px">Properties</h1>
				
				<c:forEach items="${properties}" var="property">
				<table>
				<tr>
				<td>Property Id</td>
				<td>${property.property_id}</td>
				<tr>
				<td>Property Name</td>
				<td>${property.property_name}</td>
				</tr>
				<tr>
				<td>Rent Amount</td>
				<td>${property.rent}"</td>
				</tr>
				<tr>
				<td>User Id</td>
				<td>${property.user_id}</td>
				</tr>
				</table>
				</c:forEach>
			</div>
		</div>
		</div>
		
	<%-- 	<div id="service" class="tabcontent">
			<div class="service-container">
				<h1 style="margin-left: 0px">Service Requests</h1>
				
				<c:forEach items="${serviceRequests}" var="service">
					<c:out value="${service.property_id}" />
				</c:forEach>
			</div> --%>
	
	
	
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