<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>

<h1 style="margin-right: 0px">Thank you for applying!</h1>

<c:url var="home" value="/" />
<a href="${home}">Return Home</a>

<c:url var="listings" value="/listings" />
<a href="${listings}">Browse All Listings</a>

<%@ include file="footer.jsp"%>