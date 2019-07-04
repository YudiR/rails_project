//                                  ALERTS FOR LOGIN
function logIn() {
  //   email:
  var logInEmail = document.querySelector("#log_in #email");
  var emailAlertDiv = document.querySelector(".alert_email");
  //  password:
  var logInPass = document.querySelector(".log_in_password #password");
  var passwordAlertDiv = document.querySelector(
    ".log_in_password .alert_password"
  );
  // validation:
  if (logInPass.value === "" || logInEmail.value === "") {
    logInPass.value === ""
      ? ((passwordAlertDiv.innerHTML = " Please enter your password"),
        (passwordAlertDiv.style.color = "red"))
      : null;

    logInEmail.value === ""
      ? ((emailAlertDiv.innerHTML = "Please enter your email"),
        (emailAlertDiv.style.color = "red"))
      : null;

    logInEmail.value !== "" ? (emailAlertDiv.innerHTML = null) : null;
    logInPass.value !== "" ? (passwordAlertDiv.innerHTML = null) : null;

    return false;
  }   
}

//                            ALERTS FOR SIGN UP

var validateUser = () => {
  // name
  var nameNew = document.querySelector("#user_name");
  var nameDiv = document.querySelector(".nameSign");
  // email
  var emailNew = document.querySelector("#user_email");
  var emailDiv = document.querySelector(".emailSign");
  // password
  var passwordNew = document.querySelector("#user_password");
  var passwordDiv = document.querySelector(".passwordSign");
  // password confirmation 
  var passwordConfirmationNew = document.querySelector("#user_password_confirmation");
  var passwordConfirmationDiv = document.querySelector(".passwordConfirmationSign");

  // Use control find!!!!!!!!!!!
  if (nameNew.value === "" || emailNew.value === "" || passwordNew.value === "" || passwordConfirmationNew.value === "") {
    nameNew.value === ""
      ? ((nameDiv.innerHTML = " Please enter your Name"),
        (nameDiv.style.color = "red"))
      : null;

    emailNew.value === ""
      ? ((emailDiv.innerHTML = "Please enter your Email"),
        (emailDiv.style.color = "red"))
      : null;
    
      passwordNew.value === ""
      ? ((passwordDiv.innerHTML = "Please enter your Password"),
        (passwordDiv.style.color = "red"))
      : null;
    
      passwordConfirmationNew.value === ""
      ? ((passwordConfirmationDiv.innerHTML = "Please enter your Password Confirmation"),
        (passwordConfirmationDiv.style.color = "red"))
      : null;
      
      
      nameNew.value !== "" ? (nameDiv.innerHTML = null) : null;
      emailNew.value !== "" ? (emailDiv.innerHTML = null) : null;
      passwordNew.value !== "" ? (passwordDiv.innerHTML = null) : null;
      passwordConfirmationNew.value !== "" ? (passwordConfirmationDiv.innerHTML = null) : null;

      return false;

  }   

}

var validateUserEdit = () => {
  // name
  var nameNew = document.querySelector("#user_name");
  var nameDiv = document.querySelector(".nameSign");
  // email
  var emailNew = document.querySelector("#user_email");
  var emailDiv = document.querySelector(".emailSign");
  if (nameNew.value === "" || emailNew.value === ""){
    
    nameNew.value === ""
    ? ((nameDiv.innerHTML = " Please enter your Name"),
      (nameDiv.style.color = "red"))
    : null;

  emailNew.value === ""
    ? ((emailDiv.innerHTML = "Please enter your Email"),
      (emailDiv.style.color = "red"))
    : null;    

    nameNew.value !== "" ? (nameDiv.innerHTML = null) : null;
    emailNew.value !== "" ? (emailDiv.innerHTML = null) : null;

    return false
  }

}

