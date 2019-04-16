<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>

<c:url var="sortProperties" value="/sortListings" />

<div class="sortBy">
	<form class="sortBy" method="GET" action="${sortProperties}">
		<label for="sortBy" style="font-size: 18px"> Sort By:</label> 
		<select name="sortBy"  style="margin-right: 3px" id="sortBy" onChange = "check(this);">
			<option value="zipcode" <%if((request.getAttribute("sortBy") != null) && request.getAttribute("sortBy").equals("zipcode")){ %> selected <%} %>>Zipcode</option>
			<option value="number_of_bedrooms" <%if((request.getAttribute("sortBy") != null) && request.getAttribute("sortBy").equals("number_of_bedrooms")){ %> selected <%} %>>Bedrooms</option>
			<option value="rent" <%if((request.getAttribute("sortBy") != null) && request.getAttribute("sortBy").equals("rent")){ %> selected <%} %>>Rent</option>
		 
		</select> 
		<input type="submit" value="Search"/>

	</form>
</div>
<div class="listing-main">
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
				<fmt:formatNumber var="rent" value="${listing.rent}"
					type="currency" />
					<c:out value="Rent: ${rent}" />
				</div>
			</div>

		</div>
	</c:forEach>

</div>

<script>

$(function() {
    if (localStorage.getItem('sortBy')) {
        $("#sortBy option").eq(localStorage.getItem('sortBy')).prop('selected', true);
    }

    $("#sortBy").on('change', function() {
        localStorage.setItem('sortBy', $('option:selected', this).index());
    });
});
</script>

<%@ include file="footer.jsp"%>




