<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


 <%  
		boolean statementAdded = (boolean)session.getAttribute("quizNameAdded");
		boolean quizUploaded = (boolean)session.getAttribute("quizUploaded");

     boolean isLoggedIn = (boolean) session.getAttribute("loggedIn");
     boolean isInstructor = (boolean) session.getAttribute("isInstructor");


        if (!isLoggedIn || !isInstructor) {
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
    <title>Make your Quiz</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/abcd.css" />
    <link rel="stylesheet" href="assets/css/styles.css" />

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.css"
    />
    <%-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> --%>
    <%-- <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/1.11.8/semantic.min.js"> --%>


    <script type="text/javascript">
      function callAddAnotherQuestionServlet() {
          document.forms[0].action = "AddQuestion";
          document.forms[0].submit();
      }

      function callSubmitQuizServlet() {
          document.forms[0].action = "SubmitQuiz";
          document.forms[0].submit();
      }
    </script>
  </head>
<c:set var="quizNameAdded" scope="session" value="${quizNameAdded}" />
<c:set var="quizUploaded" scope="session" value="${quizUploaded}" />

  <body>
    <jsp:include page="nav.jsp"/>

    <div class="contact-clean" style="margin-top: -60px;">
      <form method="post" style="margin-top: -10px;">
        <h2 style="margin-top: -30px;" class="text-center">Make Quiz</h2>
        <div class="form-group" style="margin-top: -25px;"> 
        <c:if test="${not quizNameAdded}">
            <input
            class="form-control"
            type="text"
            name="qName"
            required
            placeholder="Quiz Name"
          />
        </c:if>
        
          <hr/>
          <input
            class="form-control"
            type="text"
            name="qStatement"
            required
            placeholder="Question Statement"
          />
        </div>

        <hr />
        <input
          class="form-control form-control-sm"
          type="text"
          name="option1"
          required
          placeholder="Option A"
        />
        <hr />
        <input
          class="form-control form-control-sm"
          type="text"
          name="option2"
          required
          placeholder="Option B"
        />
        <hr />
        <input
          class="form-control form-control-sm"
          type="text"
          name="option3"
          required
          placeholder="Option C"
        />
        <hr />
        <input
          class="form-control form-control-sm"
          type="text"
          placeholder="Option D"
          required
          name="option4"
        />
        <hr />
        <input
          class="form-control form-control-sm"
          type="text"
          name="correctAnswer"
          required
          placeholder="Correct Answer (Statement)"
        />
        <div class="form-group">
          <br />
          <div class="ui buttons">
            <input type="submit" onclick="callSubmitQuizServlet();"  class="ui green button"/>
            <div class="or"></div>
            <input type="submit" class="ui teal button"  onclick="callAddAnotherQuestionServlet();" value="Add another Question"/>
          </div>
          <hgroup></hgroup>
        </div>
      </form>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  </body>
    <jsp:include page="footer.jsp"/>

</html>
