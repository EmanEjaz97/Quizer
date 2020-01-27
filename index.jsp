<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%

    if (session.getAttribute("isStudent") == null && session.getAttribute("isInstructor") == null && session.getAttribute("loggedIn") == null ) {  
        boolean isStudent = false;
        boolean isInstructor = false;  
    } else {        
        boolean isStudent = (boolean)session.getAttribute("isStudent"); 
        boolean isInstructor = (boolean)session.getAttribute("isInstructor");
    }

    if(session.getAttribute("loggedIn") == null ) {
    } else {
        boolean isStudent = (boolean)session.getAttribute("loggedIn"); 
    }

%>

<!DOCTYPE html>


<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Quizer</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/Features-Clean.css">
    <link rel="stylesheet" href="assets/css/Footer-Basic.css">
    <link rel="stylesheet" href="assets/css/Highlight-Clean.css">
    <link rel="stylesheet" href="assets/css/Navigation-with-Button.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<c:set var="isStudent" scope="session" value="${isStudent}" />
<c:set var="isInstructor" scope="session" value="${isInstructor}" />
<c:set var="loggedIn" scope="session" value="${loggedIn}" />

<body>
	<jsp:include page="nav.jsp"/>


<c:choose>
  <c:when test="${isStudent}">
	<jsp:include page="helloStudent.jsp"/>
    
  </c:when>

  <c:when test="${isInstructor}">
	<jsp:include page="helloInstructor.jsp"/>
  
  </c:when>
  <c:otherwise>
	<jsp:include page="helloNonUser.jsp"/>
    
  </c:otherwise>
</c:choose>




























    
    
    <div class="features-clean">
        <div class="container">
            <div class="intro">
                <h2 class="text-center">Features</h2>
                <hr>
                <p class="text-center">Providing the best facilities to ease your efforts of testing the abilities of your pals at your institute.</p>
            </div>
            <div class="row features">
                <div class="col-sm-6 col-lg-4 item"><i class="fa fa-map-marker icon"></i>
                    <h3 class="name">Works everywhere</h3>
                    <p class="description">All you need to access the services of Quizer is a valid working internet connection even if you're on Mars then.</p>
                </div>
                <div class="col-sm-6 col-lg-4 item"><i class="fa fa-clock-o icon"></i>
                    <h3 class="name">Always available</h3>
                    <p class="description">Quizer servers are always up and working (unless there is some maintainace underway.</p>
                </div>
                <div class="col-sm-6 col-lg-4 item"><i class="fa fa-list-alt icon"></i>
                    <h3 class="name">Customizable</h3>
                    <p class="description">Given the creator of the quiz all the possible actions of editing the quiz to the best of one's choice.</p>
                </div>
                <div class="col-sm-6 col-lg-4 item"><i class="fa fa-history icon"></i>
                    <h3 class="name">History</h3>
                    <p class="description">View the progress of your quizes which have been attempted.</p>
                </div>
                <div class="col-sm-6 col-lg-4 item"><i class="fa fa-plane icon"></i>
                    <h3 class="name">Fast</h3>
                    <p class="description">Results of the attempted quizes are generated on the go, no need to wait for days to get back the results.</p>
                </div>
                <div class="col-sm-6 col-lg-4 item"><i class="fa fa-money icon"></i>
                    <h3 class="name">Free</h3>
                    <p class="description">All services are provided are free of any cost.</p>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>