// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function(){
    // Randomize profile description
    var description = ["The Official Web Footprint",
                       "Computer Scientist, Husband and Father",
                       "Ruby, JavaScript and Lisp Enthusiast"
                       ];
    var randomizer = function(){
        var random_number = Math.floor(Math.random() * description.length),
            random_description = description[random_number];
        $(".page_header > p > span").text(random_description);
    };

    // Transform group of selectors
    var transfoglify = function(selector, min, max){
	$(selector).each(function(){
	    var rotation = Math.floor(Math.random() * (max - min + 1)) + min,
            i = 0,
            browsers = ["-o-", "-moz-", "-webkit-",""];
            for(i=0; i < browsers.length; i+=1){
		$(this).css(browsers[i] + "transform", "rotate(" + rotation +"deg)");
            }
	});
    }

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
        $("a[href='"+ window.location.pathname +"']").css("border-top", "2px solid #640B00");
    }

    // On load hide the description on the projects page
    $(".description").hide();

    // Show the description on hover
    $(".projects li").mouseover(function(){
	$(this).children().find("img").css("opacity", 0.9);
	$(this).children().find(".description").show();
    }).mouseout(function(){
	$(this).children().find("img").css("opacity", 1);
	$(this).children().find(".description").hide();
    });

    transfoglify("article.blogs > header", -2, 2);
    transfoglify(".about header", -2, 0);

   $(".posts blockquote").css({"border-left" : "5px solid #DDD", "padding-left" : 10});
});
