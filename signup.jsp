
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
        <form method="post" action="StudentRegister" onsubmit="return validateForm()">
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
              id = "username"
              onfocusout="checkUsernameAvailability()"
            />
            <p id="username_error" style="font-size: small;"></p>

          </div>
          <div class="form-group">
            <input
              class="form-control"
              type="email"
              placeholder="Email"
              name="email"
              onchange="validateEmail()"
              id = "email"
              required=""
            />
            <p id="email_error" style="font-size: small; color:red"></p>

          </div>
          <div class="form-group">
            <input
              class="form-control"
              type="password"
              name="password"
              id="password"
              placeholder="Password"
              required=""
              minlength="6"
              onchange="checkPass()"

            />
            <p id="password_error" style="font-size: small; color:red"></p>

          </div>
          <div class="form-group">
            <input
              class="form-control"
              type="password"
              name="password-repeat"
              placeholder="Password (repeat)"
              id = "repeat_password"
              onchange="checkRepass()"

            />
          <p id="repeat_password_error" style="font-size: small; color:red"></p>

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
        <form method="post" action="InstructorRegister" onsubmit="return validateFormIns()">
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
              onfocusout="checkInstUsernameAvailability()"

              id = "instUsername"
            />
            <p id="instUsername_error" style="font-size: small;"></p>
          </div>
          <div class="form-group">
            <input
              class="form-control"
              type="email"
              placeholder="Email"
              name="email"
              required=""
              onchange="validateEmailIns()"
              id = "instEmail"


            />
            <p id="instEmail_error" style="font-size: small; color:red"></p>

          </div>
          <div class="form-group">
            <input
              class="form-control"
              type="password"
              name="password"
              placeholder="Password"
              required=""
              minlength="6"
              onchange="checkPassIns()"
              id = "instPassword"


            />
            <p id="instPassword_error" style="font-size: small; color:red"></p>
          </div>
          <div class="form-group">
            <input
              class="form-control"
              type="password"
              name="password-repeat"
              placeholder="Password (repeat)"
              onchange="checkRepassIns()"
              id = "instRepeat_password"


            />
            <p id="instRepeat_password_error" style="font-size: small; color:red"></p>
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
  
    <script src="validate.js"></script>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>

<script>
  function checkUsernameAvailability(e) {


    let username = document.querySelector("#username").value;
    console.log(username);
      
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
              if(this.responseText.trim() == "Username available.") {
                document.getElementById("username_error").style.color = "green";
              } else {
                document.getElementById("username_error").style.color = 'red';
              }
                // console.log(this.responseText);

                document.getElementById("username_error").innerHTML = this.responseText;
              // alert("you have scored " + marks + " in this quiz");
              // window.location.href = "showResult.jsp";
            }
        };
        xmlhttp.open("GET", "CheckUsername?q=" + username, true);
        xmlhttp.send();
  }


  function checkInstUsernameAvailability() {
    
    let email = document.querySelector("#instUsername").value;
      
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
              if(this.responseText.trim() == "Username available.") {
                document.getElementById("instUsername_error").style.color = "green";
              } else {
                document.getElementById("instUsername_error").style.color = 'red';
              }
                // console.log(this.responseText);

                document.getElementById("instUsername_error").innerHTML = this.responseText;
              // alert("you have scored " + marks + " in this quiz");
              // window.location.href = "showResult.jsp";
            }
        };
        xmlhttp.open("GET", "CheckUsername?q=" + email, true);
        xmlhttp.send();
  }

</script>

