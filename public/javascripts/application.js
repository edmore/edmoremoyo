// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function(){
    // Randomize profile description
    var description = ["The Official Web Footprint",
                       "Computer Scientist, Husband and Father",
                       "Ruby, JavaScript, Lisp and Erlang Enthusiast",
		       "Est. 1982"
                       ];
    var randomizer = function(){
        var random_number = Math.floor(Math.random() * description.length),
            random_description = description[random_number];
        $(".page_header > p").text(random_description);
        };

    randomizer();

    // Twitter plugin
    $(".tweet").tweet({
            username: "etmoyo",
            avatar_size: 32,
            count: 1,
            loading_text: "Loading tweets..."
        });

   // Projects page - project information
   $(".projects article > p").hide();

   $(".projects header > a").click(function(){
       var content$ = $(this).closest('header').parent().find('p');
       content$.toggle('fast', function(){
           var link$ = $(this).parent().find('header').find('a');
           $(this).is(':hidden') ? link$.text("[+]") : link$.text("[-]");
       });
   });

   // Open popups on a separate page
    $(".popup").click(function(event){
        event.preventDefault();
        var href = $(this).attr("href"),
            popup = window.open (href,"");
    });

    // Ensure that the top level links indicate page one is on
    if(window.location.pathname !== "/"){
        $("a[href='"+ window.location.pathname +"']").css("border-top", "2px solid #333");
    }

    // On load hide the description on the projects page
    $(".description").hide();

    // Show the description on hover
    $(".projects li").each(function(){
    $(this).hover(function(){
       $(this).find(".description").toggle();
      })
     });
 });
