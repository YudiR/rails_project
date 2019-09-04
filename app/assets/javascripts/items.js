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
  var titleNew = document.querySelector(" #item_title");
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

  if (
    titleNew.value === "" ||
    priceNew.value === "" ||
    locationNew.value === "" ||
    descriptionNew.value === ""
  ) {
    titleNew.value === ""
      ? ((titleDiv.innerHTML = " Please enter a Title"),
        (titleDiv.style.color = "red"))
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
    event.preventDefault();
    return false;
  } else {
    return true;
  }
};

document.addEventListener("DOMContentLoaded", function() {
  var number = document.querySelector("#hidden_watch");
  console.log(`hey ${number.value}`);

  var button = document.querySelector("#button");
  button.addEventListener("click", e => {
    console.log("e", e);
    console.log(button.innerText);
    var change_watcher =
      button.innerText === "Add Item to Watch List"
        ? "Remove Item From Watch List"
        : "Add Item to Watch List";
    
    fetch(`/items/watch/${number.value}`)
      .then(res => res.json())
      .then(function(response) {
        console.log("Success::", response);
        var people = response === 2 && button.innerText === "Remove Item From Watch List"
        || response === 0 && button.innerText === "Add Item to Watch List"
        ? "watcher" : "watchers";
      
        let TotalWatchers = button.innerText === "Add Item to Watch List" ?
        response + 1 : response - 1

        var h5 = document.querySelector(".h5_watchers");
        h5.innerText = `This Item Has ${TotalWatchers} ${people} `;

        button.innerText = `${change_watcher}`;
      });
  });
});
