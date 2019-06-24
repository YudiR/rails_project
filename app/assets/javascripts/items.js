// alert for title#item
function validateForm() {
    var newItemTitle = document.querySelector("#new_item #item_title")

    if ( newItemTitle.value == "") {
      alert("Name must be filled out");
      return false;
      
    }
  
}