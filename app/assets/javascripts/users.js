// document.addEventListener("DOMContentLoaded", function() {
  var logInForm = document.querySelector("#log_in")
    var logInEmail = document.querySelector("#log_in #email");
    // var log = document.forms["log_in"]["email"].value

    var newItem = document.querySelector("#new_item")
    console.log(newItem)
  console.log(logInEmail)
  var logIn;

//   var form = () => === "" ? alert("Email must be filled out") : (null) 

function validateForm() {
    var newItemTitle = document.querySelector("#new_item #item_title")

    // var x = document.forms["log_in"]["email"].value;
    if ( newItemTitle.value == "") {
      alert("Name must be filled out");
      return false;
      
    }
  
}



//   logInForm.addEventListener("submit", function(e) {
    
    //  () => logInEmail.value === "" ? alert("Email must be filled out") : (null) 




//   });
// });
