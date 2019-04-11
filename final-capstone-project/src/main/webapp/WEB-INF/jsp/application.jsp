<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>

<div class="application">

<c:url var="confirmationPage" value="/confirmationPage" />
	
	<div class="applicationForm">
	
	<form class="apply" method="POST" action="${confirmationPage}">
	  
	  
	<h1 style="margin-left:0px"> Application </h1>
			<br>
			
				<label for="firstName" style="margin-right:15px">First Name: </label>
				<input type="text" id="firstName" name="firstName" placeHolder="First Name..." class="app-control" required />
			
			<div class="app-group">
				<label for="lastName" style="margin-right: 15px">Last Name: </label>
				<input type="text" id="lastName" name="lastName" placeHolder="Last Name..." class="app-control" required/>
			</div>
			<div class="app-group">
				<label for=social style="margin-right:15px">Social Security: </label>
				<input type="text" pattern="^\d{3}-\d{2}-\d{4}$" id="social" name="ssn" placeHolder="xxx-xx-xxxx" class="app-control" required />
			</div>
			<div class="app-group">
				<label for="bday" style="margin-right:15px">BirthDay: </label>
				<input type="date" id="bday" name="birthDate" placeHolder="mm/dd/yyyy" class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="phoneNumber" style="margin-right:15px">Phone Number: </label>
				<input type="tel" id="phoneNumber" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" name="phoneNumber" placeHolder="xxx-xxx-xxxx" class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="emailId" style="margin-right:15px">Email: </label>
				<input type="email" id="emailId" name="emailId" placeHolder="Email..." class="app-control" required/>
			</div>
			
			<div class="app-group">
				<label for="address1" style="margin-right:15px">Address1: </label>
				<input type="text" id="address1" name="addressLine1" placeHolder="address1..." class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="address2" style="margin-right:15px">Address2: </label>
				<input type="text" id="address2" name="addressLine2" placeHolder="address2..." class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="city" style="margin-right:15px">City: </label>
				<input type="text" id="city" name="city" placeHolder="City..." class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="state" style="margin-right:15px">State: </label>
				<input type="text" id="state" name="state" placeHolder="State..." class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="zipcode" style="margin-right:15px">ZipCode: </label>
				<input type="text" pattern="[0-9]{5}"id="zipcode" name="Zipcode..." placeHolder="zipcode" class="app-control" required/>
			</div>
			
			<div class="app-group">
				<label for="currentEmployer" style="margin-right:15px">Current Employer: </label>
				<input type="text" id="currentEmployer" name="currentEmployer" placeHolder="Enter current employer" class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="income" style="margin-right:15px">Monthly Income: </label>
				<input type="number" id="income" name="annualIncome" placeHolder="$" class="app-control" required/>
			</div>
			<br>
			<input type ="hidden" name="propertyId" value="${property.propertyId}" />
			<button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>
</div>

<%@ include file="footer.jsp"%>