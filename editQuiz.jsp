<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.util.* , quizer.*" %>

<%
  String temporary = request.getParameter("quizId");
  int quizId = Integer.parseInt(temporary);



  boolean isLoggedIn = (boolean) session.getAttribute("loggedIn");

  if (!isLoggedIn) {
     String redirectURL = "invalidUser.jsp";
    response.sendRedirect(redirectURL);
  }
    String temp = "";
%>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    />
    <title>Attempt Quiz</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/tableForm.css" />
    <link rel="stylesheet" href="assets/css/styles.css" />
    

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"
    />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/sema function callSubmitQuizServlet() {ntic.min.js"></script>


  </head>
  <body>
    <jsp:include page="nav.jsp"/>

    <div class="contact-clean" style="margin-top: -60px;">
          <c:set var="secCount" value="1" scope="page" />
      <h2 style="margin-top: -10px;" class="text-center">Attempt Quiz</h2>
        <c:forEach var="tempQuestions" items="${questions_List}">
        <div class="tableForm">
          
          


        </br>
          <h5 style="margin-top: -30px;" class="text-center">Question # ${secCount}</h5>
        </br>

          <h1 style="display:none;">${tempQuestions.correctOpt} </h1>
          <div class="form-group" style="margin-top: -25px;"> 
            <hr/>
            <input
              class="form-control"
              type="text"
              
              name="qStatement"
              readonly
              value="<c:out value='${tempQuestions.questionStatement}'/>"
            />
          </div>

          <hr />
          <input
            class="form-control form-control-sm"
            type="text"
            name="option1"
            readonly
            placeholder="<c:out value='${tempQuestions.option1}'/>"
          />
          <hr />
          <input
            class="form-control form-control-sm"
            type="text"
            name="option2"
            readonly
            placeholder="<c:out value='${tempQuestions.option2}'/>"
          />
          <hr />
          <input
            class="form-control form-control-sm"
            type="text"
            name="option3"
            readonly
            placeholder="<c:out value='${tempQuestions.option3}'/>"
          />
          <hr />
          <input
            class="form-control form-control-sm"
            type="text"
            placeholder="<c:out value='${tempQuestions.option4}'/>"
            readonly
            name="option4"
          />
          <hr />


         <button style="margin-top:20px;" onclick="handleDelete('<c:out value='${tempQuestions.questionStatement}'/>')" type="submit" class='btn btn-danger'>Delete this Question</button>

          <hr />
          <hr />
          </div>
          <c:set var="secCount" value="${secCount + 1}" scope="page"/>
          
        </c:forEach>

          <br />
          <div class="ui buttons" style="margin-left:440px;">
            <a  href="Stats"  class="ui green button">Done </a>
            <div class="or"></div>
            <input type="button" class="ui teal button"  onclick="handleAddAnotherQuestion()" value="Add another Question"/>
          </div>
          <hgroup></hgroup>


         <%-- <button style="margin-left:100px;" onclick="handleAddAnotherQuestion()" type="submit" class='btn btn-primary'>Add Another Question</button> --%>

        
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <p>Suggestions: <span id="txtHint"></span></p>
  </body>

  <jsp:include page="footer.jsp"/>

  <script type="text/javascript">
    function handleAddAnotherQuestion() {
      var quizId = <%= quizId%>;
      window.location.href = "EditAddAnotherQuestion.jsp?qId=" + quizId;


    }

    function handleDelete(qName) {
      // var qStatement = document.getElementsByTagName("input");

      var quizId = <%= quizId%>;
      // return false;

      var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                // document.getElementById("txtHint").innerHTML = this.responseText;
              // alert("you have scored " + marks + " in this quiz");
              // window.location.href = "EditQuiz?quizId" + quizId;
              window.location.reload();
            }
        };
        xmlhttp.open("POST", "DeleteQuestion?q=" + qName + "&qId=" + quizId, true);

        xmlhttp.send();
      
      
    }


  </script>
</html>


