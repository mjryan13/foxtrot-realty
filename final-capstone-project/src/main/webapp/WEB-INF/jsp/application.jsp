<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>

<div class="application">

<c:url var="confirmationPage" value="/confirmationPage" />
	
	<div class="applicationForm">
	<form class="search" method="POST" action="${confirmationPage}">
	  
<h1 style="margin-left:0px"> Application </h1>
		<div class="form-group">
				<label for="firstName">First Name: </label>
				<input type="text" id="firstName" name="firstName" placeHolder="First Name" class="form-control" required/>
			</div>
			<div class="form-group">
				<label for="lastName">Last Name: </label>
				<input type="text" id="lastName" name="lastName" placeHolder="Last Name" class="form-control" required/>
			</div>
			<div class="form-group">
				<label for=social>Social Security: </label>
				<input type="number" pattern="^\d{3}-\d{2}-\d{4}$" id="social" name="social" placeHolder="Social Security" class="form-control" required />
			</div>
			<div class="form-group">
				<label for="bday">BirthDay: </label>
				<input type="date" id="bday" name="bday" placeHolder="mm/dd/yyyy" class="form-control" required/>
			</div>
			<div class="form-group">
				<label for="phoneNumber">Phone Number: </label>
				<input type="tel" id="phoneNumber" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" name="phoneNumber" placeHolder="Phone Number" class="form-control" required/>
			</div>
			<div class="form-group">
				<label for="emailId">Email: </label>
				<input type="email" id="emailId" name="emailId" placeHolder="Email" class="form-control" required/>
			</div>
			<div class="form-group">
				<label for="currentAddress">Current Address: </label>
				<input type="text" id="currentAddress" name="currentAddress" placeHolder="Address" class="form-control" required/>
			</div>
			<div class="form-group">
				<label for="currentEmployer">Current Employer: </label>
				<input type="text" id="currentEmployer" name="currentEmployer" placeHolder="Enter current employer" class="form-control" required/>
			</div>
			<div class="form-group">
				<label for="income">Monthly Income: </label>
				<input type="number" id="income" name="income" placeHolder="$" class="form-control" required/>
			</div>
			<div>
			<select name="role">
			<option value="tenant">Tenant</option>
			<option value="owner">Property Owner</option>
			</select>
			</div>
			
			<button type="submit" class="btn btn-primary">Create User</button>
		</div>
	
</form>
</div>

<%@ include file="footer.jsp"%>