
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
    />
    <title>Sign Up</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/Registration-Form-with-Photo.css" />
    <link rel="stylesheet" href="assets/css/styles.css" />
  </head>

  <body>
    <jsp:include page="nav.jsp" />
    <div class="register-photo">
      <div class="form-container">
        <form method="post" action="StudentRegister">
          <h2
            class="text-center"
            style="font-size: 20px;color: rgb(48,60,167);"
          >
            <strong>Create</strong> an account as a Student.
          </h2>
          <div class="form-group">
            <input
              class="form-control"
              type="text"
              name="username"
              placeholder="Username"
              required=""
              minlength="6"
            />
          </div>
          <div class="form-group">
            <input
              class="form-control"
              type="email"
              placeholder="Email"
              name="email"
              required=""
            />
          </div>
          <div class="form-group">
            <input
              class="form-control"
              type="password"
              name="password"
              placeholder="Password"
              required=""
              minlength="8"
            />
          </div>
          <div class="form-group">
            <input
              class="form-control"
              type="password"
              name="password-repeat"
              placeholder="Password (repeat)"
            />
          </div>
          <div class="form-group">
            <button
              class="btn btn-primary btn-block"
              type="submit"
              style="background-color: rgb(48,60,167);"
            >
              Sign Up
            </button>
          </div>
          <a class="already" href="./login.jsp"
            >You already have an account? Login here.</a
          >
        </form>
        <form method="post" action="InstructorRegister">
          <h2 class="text-center" style="font-size: 20px;color: rgb(43,142,9);">
            <strong>Create</strong> an account as an Instructor.
          </h2>
          <div class="form-group">
            <input
              class="form-control"
              type="text"
              name="username"
              placeholder="Username"
              required=""
              minlength="6"
            />
          </div>
          <div class="form-group">
            <input
              class="form-control"
              type="email"
              placeholder="Email"
              name="email"
              required=""
            />
          </div>
          <div class="form-group">
            <input
              class="form-control"
              type="password"
              name="password"
              placeholder="Password"
              required=""
              minlength="8"
            />
          </div>
          <div class="form-group">
            <input
              class="form-control"
              type="password"
              name="password-repeat"
              placeholder="Password (repeat)"
            />
          </div>
          <div class="form-group">
            <button
              class="btn btn-primary btn-block"
              type="submit"
              style="background-color: rgb(43,142,9);"
            >
              Sign Up
            </button>
          </div>
          <a class="already" href="./login.jsp"
            >You already have an account? Login here.</a
          >
        </form>
      </div>
    </div>
  
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
