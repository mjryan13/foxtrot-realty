<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>


<div class="detailContainer">

<div class="propertyDetailImg" >
<c:url var= "imageLink"
value= "img/${property.propertyId}.jpg" />

 <img alt="Property Detail Img" src="${imageLink}" />  

</div>

	<div class="details">
	<c:choose>
	 <c:when test="${property.offerAvailable == true }">
	  <p style="margin-top: 0px; color:red"> Special offer: Get $100 off when you sign within a week!!</p>
		</c:when>
		<c:otherwise>
		</c:otherwise>
		
		</c:choose>
	
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
		<fmt:formatNumber var="rent" value="${property.rent}"
					type="currency" />
		<p> Rent: <c:out value="${rent}" /> </p>
	</div>
	<div class="squareFootage">
		<p> Square Feet: <c:out value="${property.squareFootage} sq. ft." /> </p>
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
	<br>
	<c:url var="application" value="/application" />
	
	<div class="applyNow">
	<form class="search" method="GET" action="${application}">
	  
	     <!-- <h3>Enter your email below to Apply</h3>
	     
		<input type="email" placeholder="Enter your Email.." size="30" name="email" id="email" required /> -->
		<input type ="hidden" name="propertyId" value="${property.propertyId}" />
		
		
		<input type="submit" value="Apply Now">
			<i class="fa fa-search"></i>
		</input>
		
	</form>
	</div>
<div id="map">
</div>
	</div>




</div>



<script>

function initMap() {
	  var myLatLng = {lat: 40.1379741, lng: -83.0157467};

	  var map = new google.maps.Map(document.getElementById('map'), {
	    zoom: 15,
	    center: myLatLng
	  });

	  var marker = new google.maps.Marker({
	    position: myLatLng,
	    map: map,
	    title: 'Hello World!'
	  });
	}
</script>

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVOSanLpECyzPhbvZuIdFCbPwsILITf2Y&callback=initMap">

</script>

<%-- <%@ include file="footer.jsp"%> --%>