<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>

<ul class="slideshow">
  <li><span>Image 01</span></li>
  <li><span>Image 02</span></li>
  <li><span>Image 03</span></li>
  <li><span>Image 04</span></li>
  <li><span>Image 05</span></li>
  <li><span>Image 06</span></li>
</ul>
  <div class="container">
    
      <!-- <h1>CSS3 <span>Fullscreen Slideshow</span></h1> -->
      <p class="homePageDesc1">Building Your Future Together.</p>
	<p class="homePageDesc2">Find the home that is right for you</p>
	<c:url var="listingsPage" value="/listings" />
	<p class="browseListings">
		<a href="${listingsPage}">Browse All Listings</a>
	</p>
      
  
</div>
<%-- <div class="homePage">
	<p class="homePageDesc1">Building Your Future Together.</p>
	<p class="homePageDesc2">Find the home that is right for you</p>
	<c:url var="listingsPage" value="/listings" />
	<p class="browseListings">
		<a href="${listingsPage}">Browse All Listings</a>
	</p>
</div> --%>



<%@ include file="footer.jsp"%>