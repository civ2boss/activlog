// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function () {
  
  if ($(".notice") != null) {
    setTimeout(function () {
      $(".notice").fadeOut(2000);
    }, 3000);
  };
  
  if ($(".errorExplanation") != null) {
    $("#welcome").css("visibility", "hidden");
  }
  
});
