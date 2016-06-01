$(document).ready(function(){
  $(".check").click(function(e){
    var todo_id = $(this).parents('li');
    done = $(this).hasClass('done')?1:0
    $.ajax({
      type: "POST",
      dataType: "json",
      url: "/todos/" + todo_id,
      data:{_method:'PUT',todo:{done:done}},
      }).done(function(data){
        if(done){
          $("#"+todo_id+"a.done").text('Not done').removeClass('done').addClass('not_done');
          $("#"+todo_id+".todo").wrapInner("<del>");
        }
        else{
          $("#"+todo_id+"a.not_done").text('Done').removeClass('not_done').addClass('done');
          $("#"+todo_id+".todo").html(function(i, h){
            return h.replace("<del>","");
           });
        }
    });
    e.preventDefault();
  });
});
