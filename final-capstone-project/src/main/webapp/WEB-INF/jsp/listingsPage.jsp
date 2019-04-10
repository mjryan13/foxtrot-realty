<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>

<c:url var="sortProperties" value="/sortListings" />

<div class="sortBy">
	<form class="sortBy" method="GET" action="${sortProperties}">
		<label for="sortBy"> Sort By:</label> <select name="sortBy"
			id="sortBy">
			<option value="zipcode">Zipcode</option>
			<option value="number_of_bedrooms">Bedrooms</option>
			<option value="rent">Rent</option>
		</select> <input type="submit" value="Search">

	</form>
</div>
<div class="listing-main">
	<%-- <c:url var="searchProperties" value="/searchListings" />
	<p>Search for Properties:</p>
	<form class="search" method="GET" action="${searchProperties}">
		<input type="text" placeholder="Enter Zip..." name="zipcode" id="zipcode" />
		
		<select name="numberOfBedrooms" id="numberOfBedrooms">
			<option value="0">Studio</option>
			<option value="1">1 Bedroom</option>
			<option value="2">2 Bedrooms</option>
			<option value="3">3 Bedrooms</option>
		</select>
		<button type="submit" value="Search">
			<i class="fa fa-search"></i>
		</button>
	</form> --%>


	<c:forEach items="${listings}" var="listing">
		<div class="listingContainer">
			<div class="listingImage">
				<c:url var="listingLink" value="/propertyDetail">
					<c:param name="propertyId">${listing.propertyId}</c:param>
				</c:url>
				<a href="${listingLink}"> <img
					src="img/${listing.propertyId}.jpg" /></a>
			</div>

			<div class="listingInfo">
				<div class="address1">
					<c:out value="${listing.streetAddress1}" />
					<br />
				</div>
				<div class="address2">
					<c:out value="${listing.streetAddress2}" />
					<br />
				</div>
				<div class="city">
					<c:out value="${listing.city}," />
					<c:out value="${listing.state}," />
					<c:out value="${listing.zipcode}" />
					<br />
				</div>
				<br>
				<div class="bedrooms">
					<c:out value="No. of Bedrooms:  ${listing.numberOfBedrooms}" />
				</div>
				<div class="rent">
					<c:out value="Rent: $ ${listing.rent}" />
				</div>
			</div>

		</div>
	</c:forEach>

</div>

<%@ include file="footer.jsp"%>




