
$(document).ready(function() {
  $("#new_return_user").hide();
  $("#edit_item_1").hide();

  $('#select_person').click(function() {
    console.log("saw select person click!");
    $("#edit_item_1").show(200);
  });

  $('#create_person').click(function() {
    console.log("saw create person click!");
    $("#new_return_user").show(200);
  });
});
