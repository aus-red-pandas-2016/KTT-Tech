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
      $(".counter-list").find("form").last().append(response);
    }); //for done
    $("#new-counter-form").remove();
    $(this).find("input[name=description]").val("");
  }); //new-counter-form

  $(".counter-list").on("submit", "form", function(e) {
    e.preventDefault();

    var form_url = $(this).attr("action");
    var id = $(this).attr("id");
    var this_one = $(this);
    $.ajax({
      url: form_url,
      method: "DELETE"
    })
    .done(function(response) {
    var attr =  $("form").attr("action");
debugger
    // if (attr == response) {
      // $("#" + id).parent().remove();
      $(this_one); //grabs the form delete was pressed on 

    // }
      // $(form).attr("action").val(form_url).closest("div").remove();
    })//done
  }); //.counter-list
}); //document
