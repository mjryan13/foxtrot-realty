<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>

<c:forEach items="${searchListings}" var="listing">
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

			</div>

		</div>
	</c:forEach>



<%@ include file="footer.jsp"%>
