// This forces the user to reload the page when pressing back, so they don't need to manually
onload = function() {
  var e = document.getElementById("refreshed");
  if (e.value == "no") e.value = "yes";
  else {
    e.value = "no";
    location.reload();
  }
}

// This manages hiding and showing elements with the tab buttons
function openContent(evt, tabName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(tabName).style.display = "block";
  evt.currentTarget.className += " active";
}
// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();