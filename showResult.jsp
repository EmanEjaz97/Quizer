<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <%  
    

		int score = (int)session.getAttribute("marks"); 
        String userName = (String)session.getAttribute("user");
        
  
		 

  %>





<!DOCTYPE html>
<html>

<head>
    <c:set var="marks" scope="session" value="${score}" />

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Quiz Result</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/Contact-Form-Clean.css">
    <link rel="stylesheet" href="assets/css/Highlight-Clean.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
    <jsp:include page="nav.jsp"/>
    <div class="highlight-clean">
        <div class="container">
            <div class="intro">
                <h2 class="text-center" style="font-size: 83px;">Great!</h2>
                <p class="text-center" style="font-size: 16px;">Mr./Mrs. <%=userName%>, You've scored <%=score%> marks in this quiz. </p>
            </div>
            <div class="buttons"><a class="btn btn-primary" role="button" href="index.jsp">Go to Home</a></div>
        </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
    <jsp:include page="footer.jsp"/>

</html>