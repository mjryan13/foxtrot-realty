<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>

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
     <div class="container">
    
    <p class="homePageDesc1">Building Your Future Together</p>
	<p class="homePageDesc2">Find the home that is right for you</p>
	<c:url var="listingsPage" value="/listings" />
	<p class="browseListings">
		<a href="${listingsPage}">Browse All Listings</a>
	</p>
      
  </div>
</div>

</div> 


</body>
</html> 
