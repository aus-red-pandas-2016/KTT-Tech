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

          $("#burn-comments").append("<li>"+result+"</li>");
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


  // for new counters

  $("#counters").submit(function(e) {
    e.preventDefault();

        var form_url = $("#counters").attr("action");
        $.ajax({
          url: form_url,
          method: "GET"
        })
        .done(function(response) {
          $("#new-counter-container").append(response);
        });
  });

  $("body").on("submit", "#new-counter-form", function(e) {
    e.preventDefault();

    var form_url = $("#new-counter-form").attr("action");
    var counter_description = $("input[name=description]").val();
    $.ajax({
      url: form_url,
      method: "POST",
      data: {description: counter_description}
    }).done( function(response) {
      $('#burn-container').append(response);
      $("#new-counter-form").trigger("reset");
      $("#new-counter-form").hide();
    })
  });

  $("#form-burn-voteup").submit(function(event){
    event.preventDefault();
    var burn_id = $(this).closest("div").attr("id")
    $.ajax({
      url:'/burns/' + burn_id + '/voteup',
      method: 'POST',
      dataType:'json'
    })
    .done(function(result){
      var upvote = result
      $("#" + burn_id +" p ").html(upvote.points + " Points");
      $("#" + burn_id +" .plus").addClass('voted-up');
    });
  });

  $("#form-burn-votedown").submit(function(event){
    event.preventDefault();
    var burn_id = $(this).closest("div").attr("id")
    $.ajax({
      url:'/burns/' + burn_id + '/votedown',
      method: 'POST',
      dataType:'json'
    })
    .done(function(result){
      var downvote = result
      $("#" + burn_id +" p ").html(downvote.points + " Points");
      $("#" + burn_id +" .minus").addClass('voted-down');
    });
  });
});

