$('.input-large').click(function() {
  var checked;
  if ($(this).is(':checked')) {
    checked = true;
  } else {
    checked = false;
  }
  $.ajax({
      type: "POST",
      url: "/tasks/done",
      data: { id: $(this).data('todo-id'), checked: checked }
   });
});
