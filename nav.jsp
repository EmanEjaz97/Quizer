<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <%  
     if (session.getAttribute("isStudent") == null && session.getAttribute("isInstructor") == null && session.getAttribute("loggedIn") == null ) {  
		 
		session.setAttribute("loggedIn", false);
		session.setAttribute("isStudent", false); 
		session.setAttribute("isInstructor",false);
    session.setAttribute("quizNameAdded", false);
    session.setAttribute("quizUploaded", false);
    session.setAttribute("questionList", null);
    




		boolean loggedIn = (boolean)session.getAttribute("loggedIn"); 
		boolean isStudent = (boolean)session.getAttribute("isStudent"); 
		boolean isInstructor = (boolean)session.getAttribute("isInstructor");
  
    } 
	else {
		boolean loggedIn = (boolean)session.getAttribute("loggedIn"); 

	}
		 

  %>





<head>

  <meta charset="utf-8" />
  <meta
    name="viewport"
    content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
  />
  <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
  <link rel="stylesheet" href="assets/css/Navigation-with-Button.css" />
  <link rel="stylesheet" href="assets/css/styles.css" />
</head>
<c:set var="isStudent" scope="session" value="${isStudent}" />
<c:set var="isInstructor" scope="session" value="${isInstructor}" />
<c:set var="loggedIn" scope="session" value="${loggedIn}" />
<c:choose>
  <c:when test="${isStudent}">
    <nav class="navbar navbar-light navbar-expand-md navigation-clean-button">
      <div class="container"
        ><a
          class="navbar-brand text-success"
          href="index.jsp"
          style="font-size: 36px;"
          >Quizer</a
        ><button
          data-toggle="collapse"
          class="navbar-toggler"
          data-target="#navcol-1"
          ><span class="sr-only">Toggle navigation</span
          ><span class="navbar-toggler-icon"></span
        ></button>
        <div class="collapse navbar-collapse" id="navcol-1">
          <ul class="nav navbar-nav mr-auto">
            <li class="nav-item" role="presentation">
              <%-- <form method="Get" action="QuizList">
                <button type="submit">Attempt Quiz</button>
              </form> --%>
            <a class="nav-link" href="QuizList">Attempt Quiz</a>
            </li>
            <li class="nav-item" role="presentation"
              ><a class="nav-link" href="about.jsp">About</a></li
            > </ul
          ><span class="navbar-text actions">
            <a class="login" href="Logout">Log out</a>
			<a class="btn btn-light action-button" role="button" >
			Welcome <% String name = (String) session.getAttribute("user");
		out.println(name);%>
			</a></span
          ></div
        >
      </div>
    </nav>
  </c:when>

  <c:when test="${isInstructor}">
    <nav class="navbar navbar-light navbar-expand-md navigation-clean-button">
      <div class="container"
        ><a
          class="navbar-brand text-success"
          href="index.jsp"
          style="font-size: 36px;"
          >Quizer</a
        ><button
          data-toggle="collapse"
          class="navbar-toggler"
          data-target="#navcol-1"
          ><span class="sr-only">Toggle navigation</span
          ><span class="navbar-toggler-icon"></span
        ></button>
        <div class="collapse navbar-collapse" id="navcol-1">
          <ul class="nav navbar-nav mr-auto">
            <li class="nav-item" role="presentation"
              ><a class="nav-link" href="makeQuiz.jsp">Upload Quiz</a></li
            >
            <li class="nav-item" role="presentation"
              ><a class="nav-link" href="Stats">Stats</a></li
            >
            <li class="nav-item" role="presentation"
              ><a class="nav-link" href="about.jsp">About</a></li
            >
             </ul
          ><span class="navbar-text actions">
            <a class="login" href="Logout">Log out</a
            ><a class="btn btn-light action-button" role="button">
			Welcome <% String name = (String) session.getAttribute("user");
		out.println(name);%>
			</a
            ></span
          ></div
        >
      </div>
    </nav>
  </c:when>
  <c:otherwise>
    <nav class="navbar navbar-light navbar-expand-md navigation-clean-button">
      <div class="container"
        ><a
          class="navbar-brand text-success"
          href="index.jsp"
          style="font-size: 36px;"
          >Quizer</a
        ><button
          data-toggle="collapse"
          class="navbar-toggler"
          data-target="#navcol-1"
          ><span class="sr-only">Toggle navigation</span
          ><span class="navbar-toggler-icon"></span
        ></button>
        <div class="collapse navbar-collapse" id="navcol-1">
          <ul class="nav navbar-nav mr-auto">
            <li class="nav-item" role="presentation"
              ><a class="nav-link" href="login.jsp">Get Started</a></li
            >
            <li class="nav-item" role="presentation"
              ><a class="nav-link" href="about.jsp">About</a></li
            > </ul
          ><span class="navbar-text actions">
            <a class="login" href="./login.jsp">Log In</a
            ><a
              class="btn btn-light action-button"
              role="button"
              href="signup.jsp"
              >Sign Up</a
            ></span
          ></div
        >
      </div>
    </nav>
  </c:otherwise>
</c:choose>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
