
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
	
	<div class="tab">
		<button class="tablinks" onclick="openOption(event, 'payRent')" id="defaultOpen">Pay Rent</button>
		<button class="tablinks" onclick="openOption(event, 'service')">Service Request</button>

	</div>



	
		<div class="container">
		<div id="payRent" class="tabcontent">
			<div class="rentContainer">
				<h1 style="margin-left: 0px">Pay Rent</h1>
				<c:out value="Community: ${property.propertyName}"/><br/>
				<fmt:formatNumber var="rent" value="${property.rent}"
					type="currency" />
				<c:out value="Rent: ${rent}"/>
					
				

				<c:url var="tenantsHomeUrl" value="/tenantsPayRent" />

				<form action="${tenantsHomeUrl}" method="POST">

					<label for="creditCardNumber">Credit Card Number:</label>
					 <input type="text"  name="creditCardNumber" pattern="[0-9]{13,16}" placeHolder= "1234123412341234" style="margin-left: 5px" /><br /> 
						<label for="expiryDate">Expiry Date: </label> 
						<!-- <input type="text" name="expiryDate" style="margin-left: 5px" /><br>  -->
						<select  style="margin-left: 5px">
                    <option value="01">January</option>
                    <option value="02">February </option>
                    <option value="03">March</option>
                    <option value="04">April</option>
                    <option value="05">May</option>
                    <option value="06">June</option>
                    <option value="07">July</option>
                    <option value="08">August</option>
                    <option value="09">September</option>
                    <option value="10">October</option>
                    <option value="11">November</option>
                    <option value="12">December</option>
                </select>
                <select>
                    <option value="20"> 2020</option>
                    <option value="21"> 2021</option>
                    <option value="22"> 2022</option>
                    <option value="23"> 2023</option>
                    <option value="24"> 2024</option>
                    <option value="25"> 2025</option>
                    
                </select><br/>
						<label for="CVV">CVV: </label> 
						<input type="text" name="CVV" pattern="[0-9]{3,4}" placeHolder="3-digit code" style="margin-left: 5px" /><br> 
						<br>
						<img alt="flat fee mls" title="flat fee mls" src="http://www.free-credit-card-logos.com/paypal_mc_visa_amex_disc_210x80.gif" width="210" height="80" border="0" /><br/>
						<input type="submit" value="Submit Payment"/><br/>
						<!-- <p><span id='paymentConfirmation'></span></p> -->

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

					<input type="submit" value="Submit Service Request" /><br/>
					<!-- onclick="showRequestConfirmation();" -->
					<!-- <p><span id='serviceRequestConfirmation'></span></p> -->


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
			
			function showPaymentConfirmation() {
		        document.getElementById('paymentConfirmation').innerText = "Thank you for your payment !!!";                    
		    }
			
			function showRequestConfirmation() {
		        document.getElementById('serviceRequestConfirmation').innerText = "Thank you for submitting your request. We will reach out to you shortly !!!";                    
		    }
		</script>

		<%@ include file="footer.jsp"%>