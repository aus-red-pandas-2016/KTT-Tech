$(document).ready(function() {
  var commentForm = $("#new_comments_form")
  $("#comments_button").click(function(event){
    event.preventDefault();
    $(this).hide()
    $(commentForm).show();
  });

  $(commentForm).on('submit', function(event){
    event.preventDefault();
    var comment_description = $("textarea[name=description]").val()
    debugger
    if (comment_description == ""){
      alert("You cannot submit an empty comment.");
        $("#comments_button").show();
    }else{
        $.ajax({
          url:'/comments',
          method: 'POST',
          data: {comment_description: comment_description}
        })
        .done(function(result){
          $(".burn-comment-list").append(result);
          commentForm.trigger("reset")
          $(commentForm).hide();
          $("#comments_button").show();
        });
    }
  });
});
