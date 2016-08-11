// $(document).ready(function() {
//   $("#new_burn_button").on("submit", function(Event){
//     var info = $(this).serialize();
//       $.ajax({
//         url: '/burns',
//         method: 'POST',
//         data: info,
//         dataType: 'json'
//       })
//       .done(function(result){
//         $(".burn-list").append(result);
//         $("burns").find("input[type=text]").val("");
//       })
//   })

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

  $('.burn-list').on('click', 'a.delete',function(event){
    event.preventDefault();
    var burn = $(this).closest('article');
    var burn_id = burn.attr('id');
    $.ajax({
        url: '/burns/'+ burn_id,
        method: "delete",
      })
    .done(function(){
      post.remove();
    });
  });
});
