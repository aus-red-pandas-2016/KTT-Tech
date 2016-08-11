// $(document).ready(function() {
//   $("#new_burns").on('submit', fucntion(event){
//       event.preventDefault();

//   })

  // $('.burn-list').on('submit', 'form', function(event){
  //   event.preventDefault();
  //   var burn_id = $(this).closest('article').attr('id');
  //   $.ajax({
  //     url:'/burns/' + burn_id + '/vote',
  //     method: 'POST',
  //     dataType: 'json'
  //     })
  //   .done(function(result){
  //     var upvote = result
  //     $("#" + burn_id +" .points").html(upvote.votes);
  //     $("#" + burn_id +" button").addClass('voted_up');
  //   });
  // });

//   $('.burn-list').on('click', 'a.delete',function(event){
//     event.preventDefault();
//     var burn = $(this).closest('article');
//     var burn_id = burn.attr('id');
//     $.ajax({
//         url: '/burns/'+ burn_id,
//         method: "delete",
//       })
//     .done(function(){
//       post.remove();
//     });
//   });
// });

$(document).ready(function() {
  $("#counters").submit(function(e) {
    e.preventDefault();

        var form_url = $("#counters").attr("action");
        $.ajax({
          url: form_url,
          method: "GET"
        })
        .done(function(response) {
          $(".counter-list").append(response);
        }); // for .done
  }); //#counters

  $("body").on("submit", "#new-counter-form", function(e) {
  // have to use .on for elements that aren't on the page
    e.preventDefault();
    var form_url = $(this).attr("action");
    var counter_description = $(this).find("input[name=description]").val();
    $.ajax({
      url: form_url,
      method: "POST",
      data: {description: counter_description}
    }) //ajax
    .done(function(response) {
      $(".counter-list").find(".description").last().append(response);
    }); //for done
  }); //new-counter-form

}); //document
