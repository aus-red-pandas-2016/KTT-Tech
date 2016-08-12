$(document).ready(function() {
  var commentForm = $("#new_comments_form")
  $("#comments_button").click(function(event){
    event.preventDefault();
    $(this).hide()
    $(commentForm).show();
  });

  $(commentForm).on('submit', function(event){
    event.preventDefault();
    var formData = $(this).serialize()
    if (comment_description == ""){
      alert("You cannot submit an empty comment.");
        $("#comments_button").show();
    }else{
        $.ajax({
          url:'/burns/comments',
          method: 'POST',
          data: formData
        })
        .done(function(result){

          $("ul").append("<li>"+result+"</li>");
          commentForm.trigger("reset")
          $(commentForm).hide();
          $("#comments_button").show();
        });
    }
  });

  var CounterCommentForm = $('#counter_comments_form')
   $("#counter-comment").click(function(event){
    event.preventDefault();
    $(this).hide()
    $(CounterCommentForm).show();
  });

  $(CounterCommentForm).on('submit', function(event){
    event.preventDefault();
    var formData = $(this).serialize()
    if (comment_description == ""){
      alert("You cannot submit an empty comment.");
        $("#counter-comment").show();
    }else{
        $.ajax({
          url:'/counters/comments',
          method: 'POST',
          data: formData
        })
        .done(function(result){

          $("#counter-comment-list").append("<li>"+result+"</li>");
          CounterCommentForm.trigger("reset")
          $(CounterCommentForm).hide();
          $("#counter-comment").show();
        });
    }
  });

  $('#fire-upvote-button').click(function(event){
    event.preventDefault();
    var burn_id = $(this).closest('article').attr('id');
    $.ajax({
      url:'/burns/' + burn_id + '/vote',
      method: 'POST',
      dataType: 'json'
      })
    .done(function(result){
      var upvote = result
      $("#" + burn_id +" .points").html(upvote.votes);
      $("#" + burn_id +" button").addClass('voted_up');
      // debugger
    });
  });

});

