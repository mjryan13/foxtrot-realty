<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>


<div class="homePage">
<p class="homePageDesc1">
Building Your Future Together.
</p>
<p class="homePageDesc2">
Find the home that is right for you
</p>
<c:url var="listingsPage" value="/listings" />
<p class="browseListings"><a  href ="${listingsPage}">Browse All Listings</a></p>
</div>









<%@ include file="footer.jsp"%>