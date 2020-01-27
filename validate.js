const checkPass = () => {
  let pass = document.querySelector("#password").value;
  if (pass.length < 6) {
    document.getElementById("password_error").innerHTML =
      "*Password is short!*";
    return false;
  } else {
    document.getElementById("password_error").innerHTML = "";
    return false;
  }
};

const validateEmail = () => {
  let email = document.querySelector("#email").value;
  if (email == "") {
    document.getElementById("email_error").innerHTML =
      "*This field cannot be Empty!*";
    return false;
  } else {
    document.getElementById("email_error").innerHTML = "";
    return false;
  }
};

const checkRepass = () => {
  let pass = document.querySelector("#password").value;
  let passRe = document.querySelector("#repeat_password").value;
  if (pass != passRe) {
    document.getElementById("repeat_password_error").innerHTML =
      "*Passwords don't Match!*";
    return false;
  } else if (pass == passRe) {
    document.getElementById("repeat_password_error").innerHTML = "";
    return false;
  }
};

const validateForm = () => {
  let name = document.querySelector("#username").value;
  if (name.length == 0) {
    document.getElementById("username_error").innerHTML =
      "*This field cannot be Empty!*";
    return false;
  }

  let pass = document.querySelector("#password").value;
  if (pass.length == 0) {
    document.getElementById("password_error").innerHTML =
      "*This field cannot be empty!*";
    return false;
  }
  let cpass = document.querySelector("#repeat_password").value;
  if (cpass.length == 0) {
    document.getElementById("repeat_password_error").innerHTML =
      "*Passwords don't Match!*";
    return false;
  }
  return true;
};




const checkPassIns = () => {
  let pass = document.querySelector("#instPassword").value;
  if (pass.length < 6) {
    document.getElementById("instPassword_error").innerHTML =
      "*Password is short!*";
    return false;
  } else {
    document.getElementById("instPassword_error").innerHTML = "";
    return false;
  }
};

const validateEmailIns = () => {
  let email = document.querySelector("#instEmail").value;
  if (email == "") {
    document.getElementById("instEmail_error").innerHTML =
      "*This field cannot be Empty!*";
    return false;
  } else {
    document.getElementById("instEmail_error").innerHTML = "";
    return false;
  }
};

const checkRepassIns = () => {
  let pass = document.querySelector("#instPassword").value;
  let passRe = document.querySelector("#instRepeat_password").value;
  if (pass != passRe) {
    document.getElementById("instRepeat_password_error").innerHTML =
      "*Passwords don't Match!*";
    return false;
  } else if (pass == passRe) {
    document.getElementById("instRepeat_password_error").innerHTML = "";
    return false;
  }
};

const validateFormIns = () => {
  let name = document.querySelector("#instUsername").value;
  if (name.length == 0) {
    document.getElementById("instUsername_error").innerHTML =
      "*This field cannot be Empty!*";
    return false;
  }

  let pass = document.querySelector("#instPassword_error").value;
  if (pass.length == 0) {
    document.getElementById("instPassword_error").innerHTML =
      "*This field cannot be empty!*";
    return false;
  }
  let cpass = document.querySelector("#instRepeat_password_error").value;
  if (cpass.length == 0) {
    document.getElementById("instRepeat_password_error").innerHTML =
      "*Passwords don't Match!*";
    return false;
  }
  return true;
};
