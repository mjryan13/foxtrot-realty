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
<script type="text/javascript">
function checkPassword(str)
{
  var re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}$/;
  return re.test(str);
}
  function checkForm(form)
  {
    if(form.userName.value == "") {
      alert("Error: Username cannot be blank!");
      form.userName.focus();
      return false;
    }
    re = /^\w+$/;
    if(!re.test(form.userName.value)) {
      alert("Error: Username must contain only letters, numbers and underscores!");
      form.userName.focus();
      return false;
    }
    if(form.password.value != "" && form.password.value == form.confirmPassword.value) {
      if(!checkPassword(form.password.value)) {
        alert("The password you have entered is not valid!");
        form.password.focus();
        return false;
      }
    } else {
      alert("Error: Please check that you've confirmed your password!");
      form.password.focus();
      return false;
    }
    return true;
  }

</script>
<div class="slideshow-container">
<ul class="slideshow">
  <li><span>Image 01</span></li>
  <li><span>Image 02</span></li>
  <li><span>Image 03</span></li>
  <li><span>Image 04</span></li>
  <li><span>Image 05</span></li>
  <li><span>Image 06</span></li>
</ul>

 <div class="display-container">
     <div class="displayMainContainer">


<c:url var="formAction" value="/users" />
<form method="POST" action="${formAction}" onsubmit="return checkForm(this);">
<input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
	<div class="register-page">
		<h1 style="margin-left:0px"> Register </h1>
		<br>
		<div class="form-group">
				<label for="firstName" style="margin-right:15px">First Name: <span style = "color:red;">*</span></label>
				<input type="text" id="firstName" name="firstName" placeHolder="First Name" required="true" class="form-control" />
			</div>
			<div class="form-group">
				<label for="lastName" style="margin-right:15px">Last Name: <span style = "color:red;">*</span></label>
				<input type="text" id="lastName" name="lastName" placeHolder="Last Name" required="true" class="form-control" />
			</div>
			<div class="form-group">
				<label for="userName" style="margin-right:15px">User Name: <span style = "color:red;">*</span></label>
				<input type="text" id="userName" name="userName" placeHolder="User Name" required="true" class="form-control" />
			</div>
			<div class="form-group">
				<label for="password" style="margin-right:15px">Password: <span style = "color:red;">*</span></label>
				<input type="password" id="password" name="password" placeHolder="Password" required="true" class="form-control" />
			</div>
			<div class="form-group">
				<label for="confirmPassword" style="margin-right:15px">Confirm Password: <span style = "color:red;">*</span></label>
				<input type="password" id="confirmPassword" name="confirmPassword" placeHolder="Re-Type Password" required="true" class="form-control" />	
			</div>
			<div class="form-group">
				<label for="phoneNumber" style="margin-right:15px">Phone Number: <span style = "color:red;">*</span></label>
				<input type="tel" id="phoneNumber" name="phoneNumber" placeHolder="Phone Number" required="true" class="form-control" />
			</div>
			<div class="form-group">
				<label for="emailId" style="margin-right:15px">Email: <span style = "color:red;">*</span></label>
				<input type="email" id="emailId" name="emailId" placeHolder="Email" required="true" class="form-control" />
			</div>
			<div>
			<label for="role" style="margin-right:15px">Role: </label>
			<select name="role">
			<option value="tenant" >Tenant</option>
			<option value="owner">Property Owner</option>
			</select>
			</div>
			<br>
			<button type="submit" class="btn btn-primary" style="background-color:green; color: white; border-radius: 5px; height: 3em">Register</button>
		</div>
	
</form>
</div>
</div>
</div>
<%@ include file="footer.jsp"%>
		