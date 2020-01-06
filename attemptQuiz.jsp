<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.util.* , quizer.*" %>

<%
  String temporary = request.getParameter("temp");
  int quizId = Integer.parseInt(temporary);

  boolean isLoggedIn = (boolean) session.getAttribute("loggedIn");

  if (!isLoggedIn) {
     String redirectURL = "invalidUser.jsp";
    response.sendRedirect(redirectURL);
  }

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
    <link rel="stylesheet" href="assets/css/abcd.css" />
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
     <form onsubmit="return _handleSubmit();" style="margin-top: -10px;">
      <h2 style="margin-top: -30px;" class="text-center">Attempt Quiz</h2>
        <c:forEach var="tempQuestions" items="${questions_List}">
          
          


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

          

          <input
            class="form-control form-control-sm"
            type="text"
            required
            placeholder="Correct Answer (Statement)"
          />




          <hr />
          <hr />

          <c:set var="secCount" value="${secCount + 1}" scope="page"/>

        </c:forEach>
        <button type="submit" >Submit Quiz</button>
      </form>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <p>Suggestions: <span id="txtHint"></span></p>
  </body>

  <jsp:include page="footer.jsp"/>

  <script type="text/javascript">
    function _handleSubmit() {
      var input_fields = document.getElementsByTagName("input");
      var h1_fields = document.getElementsByTagName("h1");

      var answers = [];
      var correctAnswers = [];
      for(let i = 0; i < input_fields.length ; i++) {
        if( ((i+1)) % 6 == 0) {
          var s = input_fields[i].value;
          s.trim();
          answers.push(s.toLowerCase());
        }
      } 
      for(let i = 0; i < h1_fields.length; i++) {
          var temp = h1_fields[i].innerText;
          temp = temp.trim();
          correctAnswers.push(temp.toLowerCase());  
        }
      var qId = "<%=quizId%>";
      var marks = 0;

      var counter;

      if(correctAnswers.length > answers.length) {
        counter = answers.length;
      }
      else {
        counter = correctAnswers.length;
      }

    for(let i = 0; i < counter; i++){
      if(answers[i] == correctAnswers[i]) {
        marks++;
      }
    }
    console.log(marks, counter, answers, correctAnswers, input_fields);
      loadDoc(qId, marks);
      return false;
    }

    function loadDoc(qId, marks) {
      console.count("here");
      
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                // document.getElementById("txtHint").innerHTML = this.responseText;
              // alert("you have scored " + marks + " in this quiz");
              window.location.href = "showResult.jsp";
            }
        };
        xmlhttp.open("POST", "AddQuizScore?q=" + qId + "&marks=" + marks, true);
        xmlhttp.send();
    }



  </script>
</html>


