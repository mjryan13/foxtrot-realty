<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>



<script type="text/javascript">
	$(document).ready(function () {
	
		$("form").validate({
			
			rules : {
				userName : {
					required : true
				},
				password : {
					required : true
				}
			},
			messages : {			
				confirmPassword : {
					equalTo : "Passwords do not match"
				}
			},
			errorClass : "error"
		});
	});
	
	
</script>


<!-- <div class="loginPage"> -->

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

	<%-- <div class="loginImg" >
		<c:url var= "imageLink"
			value= "img/1.jpg" />

 			<img alt="Property Detail Img" src="${imageLink}" />  
 --%>
	
	<div class="login-form">
	
		<c:url var="formAction" value="/login" />
		<form method="POST" action="${formAction}">
		<input type="hidden" name="destination" value="${param.destination}"/>
			<div class="form-group">
			<h1 style="margin-left: 0px">Login</h1>
			<br>
				<label for="userName" style="margin-right: 5px">User Name: </label>
				<input type="text" id="userName" name="userName" placeHolder="User Name" class="form-control" />
			</div>
			<div class="form-group">
				<label for="password" style="margin-right: 5px">Password: </label>
				<input type="password" id="password" name="password" placeHolder="Password" class="form-control" />
			</div>
			<br>
			<button type="submit" class="btn btn-primary" style="background-color:green; color: white; border-radius: 5px; height: 2em; width: 5em">Login</button>
			<br>
			<br>
			<c:url var="register" value="/users/new" />
			<a href="${register}" style="font-size: 13px">Create Login</a>
			
			</div>
			
		</form>
	</div>
</div>
</div>
<!-- </div> -->

<%@ include file="footer.jsp"%>
