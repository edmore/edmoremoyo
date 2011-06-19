// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function(){
  $(".popup" ).click(function(event){
 event.preventDefault();
 var href = $(this).attr("href");
 var width = $(this).attr("data-width");
 var height = $(this).attr("data-height");
 var popup = window.open (href,"popup",
 "height=" + height +",width=" + width + "");
 });
});

