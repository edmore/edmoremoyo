// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function(){
  $(".popup" ).click(function(event){
 event.preventDefault();
 var href = $(this).attr("href");
 var popup = window.open (href,"");
 });
});

$(document).ready(function(){
        $(".tweet").tweet({
            username: "etmoyo",
            avatar_size: 32,
            count: 1,
            loading_text: "Loading tweets..."
        });
 });


