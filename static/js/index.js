$(document).ready(function(){
	$(".title_background .jumbotron").click(function() {
	    $('html, body').animate({
	        scrollTop: $('.list_events_filter').offset().top - 40
	    }, 1000);
	});

    $(".title_background .jumbotron").mouseover(function(){
        $('.scroll_down_button').addClass('is-showing');
    });

    $( ".title_background .jumbotron" ).mouseleave(function() {
        $('.scroll_down_button').removeClass('is-showing');
    });
});