<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.* , quizer.*" %>
<%-- <%@ page import="./classes/QuizeNInstructorName.java" %> --%>

<%
      boolean isLoggedIn = (boolean) session.getAttribute("loggedIn");

        if (!isLoggedIn) {
            String redirectURL = "invalidUser.jsp";
            response.sendRedirect(redirectURL);
        }
%>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Quiz List</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/Contact-Form-Clean.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>        
<body>
    <jsp:include page="nav.jsp" />


    <div class="contact-clean">
            <h1 style="margin-left:520px;">Uploaded Quizes</h1>
            <p class="text-center lead">Following Quizes are uploaded by your instructors.&nbsp;</p>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Quiz Name</th>
                            <th>Instructor Name</th>
                            <th>Attemp Quiz</th>
                            <th>Marks Obtained</th>
                        </tr>

                    </thead>
                    <tbody>
                       <c:forEach var="tempQuiz" items="${quizes_List}">
                            <tr>
                                <td>
                                    ${tempQuiz.quizName}
                                </td>
                                <td>
                                    ${tempQuiz.instructorName}
                                </td>
                                <td>
                                <form action="AttemptQuiz" method="post" style="display:inline;">
                                    <input type ="hidden" name="temp" value="<c:out value='${tempQuiz.quizId}'/>">
                                    <c:set var="isAttempted" scope="session" value="${tempQuiz.attempted}" />
                                    <c:choose>
                                        <c:when test="${isAttempted}">
                                            <button type="submit" disabled> Attempt Quiz </button>

                                        </c:when>

                                        <c:otherwise>
                                            <button type="submit"> Attempt Quiz </button>

                                        </c:otherwise>
                                    </c:choose>
                                </form>   
                                </td>
                                <td>
                                    ${tempQuiz.marks}
                                </td>
                            </tr>
                        </c:forEach>
                        <tr></tr>
                    </tbody>
                </table>
            </div>
    </div>
    <p id = "txtHint"> </p>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
    <jsp:include page="footer.jsp"/>

</html>



<script>
function handleClick(id) {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("txtHint").innerHTML = this.responseText;
            }
        };
        xmlhttp.open("POST", "AttemptQuiz?temp=" + id, true);
        xmlhttp.send();
    
}
</script>