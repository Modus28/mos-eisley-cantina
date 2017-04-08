// This script adds a button that goes back to the previous page
// And also counts down to a time when the page automatically goes back 
$(function() {
  $(document).on('click', '.button', function() {
    history.go(-1);
  })

  // Get button name, init timer value
  var buttonName = $('.button').val();
  var time = 5;

  function updateButton() {
    // Set button name to "Go back to previus page (X)"
    $('.button').val(buttonName + ' (' + time + ')');

    if (time <= 0) {
      // If we reached 0, redirect
      history.go(-1);
    } else {
      //decrement time counter
      time--;
      // otherwise, wait a second and do it again
      setTimeout(updateButton, 1000);
    }
  }

  // Start the counter
  updateButton();
});
