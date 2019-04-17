<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>

<div class="confirmation">
	<p>Thanks for applying, We will reach out to you shortly!</p>
	<br>
	<c:url var="listingsPage" value="/listings" />
	<a href="${homePage}" style="font-size: 20px;">Return Home</a>
</div>

<%@ include file="footer.jsp"%>