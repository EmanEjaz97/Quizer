 <%  
		
     boolean isLoggedIn = (boolean) session.getAttribute("loggedIn");


        if (isLoggedIn) {
            String redirectURL = "alreadyLoggedIn.jsp";
            response.sendRedirect(redirectURL);
        }
  
  %>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Log in</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
    <link rel="stylesheet" href="assets/css/styles.css">
</head>

<body>
    <jsp:include page="nav.jsp" />

    <div class="login-clean">
        <form method="post" action="Login" style="margin-top: -50px";>
            <h2 class="sr-only">Login Form</h2>
            <div class="illustration"><i class="fa fa-edit" style="color: rgb(40,167,69);"></i>
                <h1 style="color: rgb(40,167,69);">Quizer</h1>
            </div>
            <div class="form-group"><input class="form-control" type="text" name="username" placeholder="Username" required=""></div>
            <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password" required=""></div>
            <div class="form-group"><button class="btn btn-primary btn-block" type="submit" style="background-color: rgb(40,167,69);">Log In</button></div>
        </form>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
    <jsp:include page="footer.jsp"/>

</html>