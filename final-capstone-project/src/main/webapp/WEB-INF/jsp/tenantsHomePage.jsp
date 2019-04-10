<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>

<div class="rentContainer">
	<p>Pay Rent</p>
	<h1>Rent for this property: <c:out value="${rent}" /></h1>

	<c:url var="tenantsHomeUrl" value="/tenants" />

	<form action="${tenantsHomeUrl}" method="POST">
	
		<label for="propertyName">Property Name:</label> 
		<input type="text" name="propertyName" /><br /> 
		
		<label for="rent">Rent Amount:</label> 
		<input type="text" name="rent" /><br /> 
		
		<input type="submit" value="Pay Rent" />
		
	</form>
</div>


<div class="serviceRequestContainer">

	<p>Service Request</p>

	<c:url var="tenantsHomeUrl" value="/tenants" />

	<form action="${tenantsHomeUrl}" method="POST">
	
		<label for="propertyId">Property Id:</label> 
		<input type="text" name="propertyId" /><br /> 
		
		<label for="description">Description:</label>
		<input type="text" name="description" /><br /> 
		
		<label for="userId">User Id:</label> 
		<input type="text" name="userId" /><br /> 
		
		<input type="submit" value="Submit Service Request" />


	</form>
</div>


<%@ include file="footer.jsp"%>