<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

</div>
<footer>

<div class="social-footer">

    <img src="<c:url value="/img/twitter.png"/>" />
     <img src="<c:url value="/img/facebook.png"/>" /> 
     <img src="<c:url value="/img/instagram.png"/>" />

</div>

<div class="copywrite">
    <p class="copyright">© FOXTROT Real Estate Inc. 2019</p>

</div>

<div class="contactUs">
    <c:url var="aboutUs" value="/aboutUs" />
    <a href="${aboutUs}" style="color: white">Contact Us</a>
    <p style="margin: 0px; font-size: 11px; padding-top: 5px;">
        FoxTrot Realty<br> 1275 Kinnear Rd. #121<br> Columbus, OH
        43212
    </p>
</div>
</footer>

</body>
</html>