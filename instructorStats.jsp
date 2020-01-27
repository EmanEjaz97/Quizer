<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.* , quizer.*" %>
<%-- <%@ page import="./classes/QuizeNInstructorName.java" %> --%>

<%
      boolean isLoggedIn = (boolean) session.getAttribute("loggedIn");
      String insName = (String) session.getAttribute("user");


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
    <link rel="stylesheet" href="assets/css/table.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>        
<body>
    <jsp:include page="nav.jsp" />



<%-- <div class="container">
    <div class="row col-md-6 col-md-offset-2 custyle">
    <table class="table table-striped custab">
    <thead>
        <tr>
            <th>Quiz Name</th>
        </tr>
    </thead>
        <c:forEach var="tempQuiz" items="${quizes_List}">
            <tr>
                <td>
                    ${tempQuiz.quizName}
                </td>
                <td>
                <form action="DeleteQuiz" method="post" style="display:inline;">
                    <input type ="hidden" name="temp" value="<c:out value='${tempQuiz.quizId}'/>">
                    <input type ="hidden" name="qName" value="<c:out value='${tempQuiz.quizName}'/>">
                    
                    <button class='btn btn-danger btn-xs' type="submit">Delete</button>
                </form>   
                </td>
            </tr>
        </c:forEach>



    </table>
    </div>
</div>
 --%>


















    <div class="contact-clean">
            <h1 style="margin-left:520px;">Uploaded Quizes</h1>
            <p class="text-center lead">Mr/Mrs <%=insName%> you've uploaded following Quizes.&nbsp;</p>
            <div class="table-responsive">
                <div class="container" style="padding-left:400px;">
    <div class="row col-md-6 col-md-offset-2 custyle">
    <table class="table table-striped custab">
    <thead>
        <tr>
            <th>Quiz Name</th>
        </tr>
    </thead>
        <c:forEach var="tempQuiz" items="${quizes_List}">
            <tr>
                <td>
                    ${tempQuiz.quizName}
                </td>
                <td>
                <form action="DeleteQuiz" method="post" style="display:inline;">
                    <input type ="hidden" name="temp" value="<c:out value='${tempQuiz.quizId}'/>">
                    <input type ="hidden" name="qName" value="<c:out value='${tempQuiz.quizName}'/>">
                    <a class='btn btn-info btn-xs' href="EditQuiz?quizId=${tempQuiz.quizId}"><span class="glyphicon glyphicon-edit"></span> Edit</a>
                    <button class='btn btn-danger btn-xs' type="submit">Delete</button>
                </form>   
                </td>
            </tr>
        </c:forEach>



    </table>
    </div>
</div>
                
                
                
                <%-- <table class="table">
                    <thead>
                        <tr>
                            <th>Quiz Name</th>
                        </tr>

                    </thead>
                    <tbody>
                       <c:forEach var="tempQuiz" items="${quizes_List}">
                            <tr>
                                <td>
                                    ${tempQuiz.quizName}
                                </td>
                                <td>
                                <form action="DeleteQuiz" method="post" style="display:inline;">
                                    <input type ="hidden" name="temp" value="<c:out value='${tempQuiz.quizId}'/>">
                                    <input type ="hidden" name="qName" value="<c:out value='${tempQuiz.quizName}'/>">
                                    
                                    <button type="submit">Delete</button>
                                </form>   
                                </td>
                            </tr>
                        </c:forEach>
                        <tr></tr>
                    </tbody>
                </table> --%>





<div class="contact-clean">
            <p class="text-center lead">Following is the name and marks of the students who have attempted your quizes.&nbsp;</p>
            <div class="table-responsive">
                <div class="container" style="padding-left:400px;">
    <div class="row col-md-6 col-md-offset-2 custyle">
    <table class="table table-striped custab">
    <thead>
        <tr>
            <th>Student Name</th>
            <th>Quiz Name</th>
            <th>Marks Obtained</th>
        </tr>
    </thead>
        <c:forEach var="tempStudent" items="${attemptedQuizes_List}">
            <tr>
                <td>
                    ${tempStudent.studentName}
                </td>
                <td>
                    ${tempStudent.quizName}
                </td>
                <td>
                    ${tempStudent.marks}
                </td>
            </tr>
        </c:forEach>



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