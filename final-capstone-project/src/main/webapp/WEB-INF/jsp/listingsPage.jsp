<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>

<div class="listing-main">

	<form class="search" action="">
		<input type="text" placeholder="Enter Zip..." name="search">
		<button type="submit"><i class="fa fa-search"></i></button> 
	</form>

<c:forEach items="${listings}" var="listing">
	<div class="listingContainer">
		<div class="listingImage">
			<c:url var="listingLink" value="/listingDetail">
				<c:param name="propertyId">${listing.propertyId}</c:param>
			</c:url>
			<a href="${listingLink}"> <img
				src="img/${listing.propertyId}.jpg" /></a>
		</div>

		<div class="listingInfo">
			<div class="address1" ><c:out value="${listing.streetAddress1}" /><br /></div>
			<div class="address2" ><c:out value="${listing.streetAddress2}" /><br /></div>
			<div class="city"><c:out value="${listing.city}," />
			<c:out value="${listing.state}," />
			<c:out value="${listing.zipcode}" /><br /></div> <br>
			<div class="bedrooms"><c:out value="No. of Bedrooms:  ${listing.numberOfBedrooms}" /></div>

		</div>

	</div>
</c:forEach>

</div>

<%@ include file="footer.jsp"%>




