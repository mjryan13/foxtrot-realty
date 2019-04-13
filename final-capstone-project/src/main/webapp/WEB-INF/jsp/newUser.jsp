<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>

<script type="text/javascript">
	$(document).ready(function () {
		$.validator.addMethod('capitals', function(thing){
			return thing.match(/[A-Z]/);
		});
		$("form").validate({
			
			rules : {
				userName : {
					required : true
				},
				password : {
					required : true,
					minlength: 8,
					capitals: true,
				},
				confirmPassword : {
					required : true,		
					equalTo : "#password"  
				}
			},
			messages : {			
				password: {
					minlength: "Password too short, make it at least 8 characters",
					capitals: "Field must contain a capital letter",
				},
				confirmPassword : {
					equalTo : "Passwords do not match"
				}
			},
			errorClass : "error"
		});
	});
</script>

<c:url var="formAction" value="/users" />
<form method="POST" action="${formAction}">
<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
	<div class="register-page">
		<h1 style="margin-left:0px"> Register </h1>
		<br>
		<div class="form-group">
				<label for="firstName" style="margin-right:15px">First Name: </label>
				<input type="text" id="firstName" name="firstName" placeHolder="First Name" required="true" class="form-control" />
			</div>
			<div class="form-group">
				<label for="lastName" style="margin-right:15px">Last Name: </label>
				<input type="text" id="lastName" name="lastName" placeHolder="Last Name" required="true" class="form-control" />
			</div>
			<div class="form-group">
				<label for="userName" style="margin-right:15px">User Name: </label>
				<input type="text" id="userName" name="userName" placeHolder="User Name" required="true" class="form-control" />
			</div>
			<div class="form-group">
				<label for="password" style="margin-right:15px">Password: </label>
				<input type="password" id="password" name="password" placeHolder="Password" required="true" class="form-control" />
			</div>
			<div class="form-group">
				<label for="confirmPassword" style="margin-right:15px">Confirm Password: </label>
				<input type="password" id="confirmPassword" name="confirmPassword" placeHolder="Re-Type Password" required="true" class="form-control" />	
			</div>
			<div class="form-group">
				<label for="phoneNumber" style="margin-right:15px">Phone Number: </label>
				<input type="tel" id="phoneNumber" name="phoneNumber" placeHolder="Phone Number" required="true" class="form-control" />
			</div>
			<div class="form-group">
				<label for="emailId" style="margin-right:15px">Email: </label>
				<input type="email" id="emailId" name="emailId" placeHolder="Email" required="true" class="form-control" />
			</div>
			<div>
			<label for="role" style="margin-right:15px">Role: </label>
			<select name="role">
			<option value="tenant" >Tenant</option>
			<option value="owner">Property Owner</option>
			</select>
			</div>
			
			<button type="submit" class="btn btn-primary">Create User</button>
		</div>
	
</form>

<%@ include file="footer.jsp"%>
		