$(document).ready(function() {
  $("#burns").on("submit", function(Event){
    var info = $(this).serialize();
      $.ajax({
        url: '/burns'
        method: 'POST'
        data: info
        dataType: 'json'
      })
      .done(function(result){
        $(".burn-list").append(result);
        $("burns").find("input[type=text]").val("");
      })
  })
});

$(document).ready(function() {
  $('.burn-list').on('submit', 'form', function(event){
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
    });
  });

  $('.post-container').on('click', 'a.delete',function(event){
    event.preventDefault();
    var post = $(this).closest('article')
    var post_id = post.attr('id');
    $.ajax({
        url: '/posts/'+ post_id,
        method: "delete",
      })
    .done(function(){
      post.remove();
    });
  });
