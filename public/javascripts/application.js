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
  
});
