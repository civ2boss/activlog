// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function () {
  
  if ($(".notice").length != 0) {
    setTimeout(function () {
      $(".notice").fadeOut(2000);
    }, 3000);
  };
  
  if ($(".errorExplanation").length != 0) {
    $("#welcome").animate({
      opacity: 0
    }, 0);
  }
  
  setTimeout(function () {
    $(".errorExplanation").fadeOut(2000);
    $("#welcome").animate({
        opacity: 1
      }, 2000);
  }, 30000);
  
  $("#signin form").validate({
    rules: {
      "log[name]": {required: true},
      "log[social_security]": {required: true, minlength: 4, maxlength: 4},
      "log[contact_type]": {required: true},
      "log[category]": {required: true},
      "log[description]": {required: function (element) {
                            return $("select#log_category").val() == "Other";
                          }}
    }
  })
  
});
