<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>


<div class="detailContainer">

<div class="propertyDetailImg" >
<c:url var= "imageLink"
value= "img/${property.propertyId}.jpg" />

<img alt="Property Detail Img" src="${imageLink}" /> 
</div>
	<div class="offerAvailable">
	<c:choose>
	 <c:when test="${property.offerAvailable == true }">
	  <p> Special offer: Get $100 off when you sign within a week!!</p>
		</c:when>
		<c:otherwise>
		</c:otherwise>
		
		</c:choose>
	</div>
	<div class="propertyName">
		<c:out value="${property.propertyName}" />
	</div>
	<div class="propertyDescription">
		<c:out value="${property.propertyDescription}" />
	</div>
	<div class="propertyType">
		<p> Property Type: <c:out value="${property.propertyType}" /> </p>
	</div>
	<div class=rent>
		<p> Rent: <c:out value="${property.rent}" /> </p>
	</div>
	<div class="squareFootage">
		<p> Square Feet: <c:out value="${property.squareFootage}" /> </p>
	</div>
	<div class="numberOfBedrooms">
		<p> No. of Bedrooms: <c:out value="${property.numberOfBedrooms}" /> </p>
		
	</div>
	<div class="numberOfBathrooms">
		<p> No. of Bathrooms: <c:out value="${property.numberOfBathrooms}" /> </p>
		
	</div>
	<div class="streetAddress1">
		<c:out value="${property.streetAddress1}" />
	</div>
	<div class="streetAddress2">
		<c:out value="${property.streetAddress2}" />
	</div>
	<div class="city">
		<c:out value="${property.city}" />
	</div>
	<div class="state">
		<c:out value="${property.state}" />
	</div>
	<div class="zipcode">
		<c:out value="${property.zipcode}" />
	</div>
	
	<c:url var="visitorConfirmation" value="/visitorConfirmation" />
	
	<form class="search" method="POST" action="${visitorConfirmation}">
		<input type="email" placeholder="Enter your Email.." pattern="[a-z0-9._%+-]+@[a-z0-9.-]+.[a-z]{2,}$" size="30" name="email" id="email" required />
		<input type ="hidden" name="propertyId" value="${property.propertyId}" />
		
		<button type="submit" value="Apply Now">
			<i class="fa fa-search"></i>
		</button>
	</form>
</div>

<%@ include file="footer.jsp"%>