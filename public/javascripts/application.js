// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function(){
    // Twitter plugin
    $(".tweet").tweet({
            username: "etmoyo",
            avatar_size: 32,
            count: 1,
            loading_text: "Loading tweets..."
        });

   // Projects page - project information
   $(".projects article > p").addClass("hidden_content");

   $(".projects header > a").click(function(){
       var content = $(this).closest('header').parent().find('p');
       content.toggle('slow');
   });

   // Open poups on a separate page
    $(".popup" ).click(function(event){
        event.preventDefault();
        var href = $(this).attr("href");
        var popup = window.open (href,"");
    });

 });





