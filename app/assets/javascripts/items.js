// // alert for title#item

// function validateForm() {
//   var newItemTitle = document.querySelector("#new_item #item_title")
  
  
//   if ( newItemTitle.value == "") {
//     alert("Name must be filled out");
//     return false;
    
//   }
  
// }


// New Items Form::::::::
var validateItem = () => {
  // Title:
  var titleNew = document.querySelector("#new_item #item_title");
  var titleDiv = document.querySelector(".titleNew");
  // Price:
  var priceNew = document.querySelector("#item_price_cents");
  var priceDiv = document.querySelector(".priceNew");
  // Location
  var locationNew = document.querySelector("#item_location");
  var locationDiv = document.querySelector(".locationNew");
  // description
  var descriptionNew = document.querySelector("#item_description");
  var descriptionDiv = document.querySelector(".descriptionNew");

  if (titleNew.value === "" || priceNew.value === "" || locationNew.value === "" || descriptionNew.value === "") {
    
    titleNew.value === ""
    ? (
      titleDiv.innerHTML = " Please enter a Title",
    titleDiv.style.color = "red"
    )
    : null;
    
        priceNew.value === ""
      ? ((priceDiv.innerHTML = "Please enter a Price"),
        (priceDiv.style.color = "red"))
      : null;
    
      locationNew.value === ""
      ? ((locationDiv.innerHTML = "Please enter a Location"),
        (locationDiv.style.color = "red"))
      : null;
    
      descriptionNew.value === ""
      ? ((descriptionDiv.innerHTML = "Please enter a Description"),
        (descriptionDiv.style.color = "red"))
      : null;
      
      
      titleNew.value !== "" ? (titleDiv.innerHTML = null) : null;
      priceNew.value !== "" ? (priceDiv.innerHTML = null) : null;
      locationNew.value !== "" ? (locationDiv.innerHTML = null) : null;
      descriptionNew.value !== "" ? (descriptionDiv.innerHTML = null) : null;

return false
  }   

}