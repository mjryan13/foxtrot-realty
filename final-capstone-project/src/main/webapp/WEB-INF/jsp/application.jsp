<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>

<div class="application">

	<div class="applicationForm">

	<c:url var="confirmationPage" value="/submitApplication" />
	<form class="apply" method="POST" action="${confirmationPage}">
	  
<h1 style="margin-left:0px"> Application </h1><br>
		<div class="app-group">
				<label for="firstName" style="margin-right:15px">First Name: </label>
				<input type="text" id="firstName" name="firstName" placeHolder="First Name..." class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="lastName" style="margin-right:15px">Last Name: </label>
				<input type="text" id="lastName" name="lastName" placeHolder="Last Name..." class="app-control" required/>
			</div>
			<div class="app-group">
				<label for=ssn style="margin-right:15px">Social Security: </label>
				<input type="text" pattern="^\d{3}\d{2}\d{4}$" id="ssn" name="ssn" placeHolder="Social Security" class="app-control" required />
			</div>
			<div class="app-group">
				<label for="birthDate" style="margin-right:15px">BirthDay: </label>
				<input type="date" id="birthDate" name="birthDate" placeHolder="mm/dd/yyyy" class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="phoneNumber" style="margin-right:15px">Phone Number: </label>
				<input type="tel" id="phoneNumber"  name="phoneNumber" placeHolder="Phone Number" class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="email" style="margin-right:15px">Email: </label>
				<input type="email" id="email" name="email" placeHolder="Email" class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="addressLine1" style="margin-right:15px">Address Line1: </label>
				<input type="text" id="addressLine1" name="addressLine1" placeHolder="Current Address Line1" class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="addressLine2" style="margin-right:15px">Address Line2: </label>
				<input type="text" id="addressLine2" name="addressLine2" placeHolder="Current Address Line1" class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="city" style="margin-right:15px">City: </label>
				<input type="text" id="city" name="city" placeHolder="City" class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="state" style="margin-right:15px">State: </label>
				<input type="text" id="state" name="state" placeHolder="State" class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="zipcode" style="margin-right:15px">Zipcode: </label>
				<input type="text" pattern="[0-9]{5}"id="zipcode" name="zipcode" placeHolder="Zipcode" class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="currentEmployer" style="margin-right:15px">Current Employer: </label>
				<input type="text" id="currentEmployer" name="currentEmployer" placeHolder="Enter current employer" class="app-control" required/>
			</div>
			<div class="app-group">
				<label for="annualIncome" style="margin-right:15px">Annual Income: </label>
				<input type="number" id="annualIncome" name="annualIncome" placeHolder="$" class="app-control" required/>
			</div>
			
			<button type="submit" class="btn btn-primary">Submit Application</button>
	</form>	
</div>
</div>

<%@ include file="footer.jsp"%>