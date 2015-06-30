

// Flexslider
$('.flexslider').flexslider({

	slideshow: false,
	animation: 'slide'
});

// Toggle through slides with thumbnails on product page
$('.product-thumbnails li a').on("click", function () {

	var dataIndex = parseInt($(this).attr('data-index'));

    $('.flexslider').flexslider(dataIndex);
});


// Skip to content fix for chrome
$("#skip-to-content").on("click", function () {

    $('#content').attr('tabIndex', -1).focus();
});


// Burger
$('.burger').on("click", function() {

	$(this).parent().find('.burger-nav').slideToggle();
});

// Get sub-nav lists height
function getSubNavHeight() {

	if ($(window).width() >= 767) { 

	  	setTimeout(function() {

		    var heightArray = [],
		        maxHeight = 0;

		    $('.sub-nav-list').each(function() {

		        heightArray.push($(this).height());
		        maxHeight = Math.max.apply(Math, heightArray);
		    });

		    $('.sub-nav-list').each(function() {

		      $(this).css({"min-height" : maxHeight});
		    });

	  	},1000);
	} 
}
getSubNavHeight();

$('.has-mobile-sub-nav').on("click", function() {

	$('.mobile-sub-nav').slideUp();
	$(this).parent().find('.mobile-sub-nav').slideToggle();
});

// Get screen height for home & lookbook slides
var screenHeight = $(window).height() - 60; //subtract height of header, remove if we add a fixed header

function getScreenHeight() {
	
	// Home promos height
	$('.home-promo-1').css({"height" : screenHeight});

	if ($(window).width() >= 767) { 

		$('.home-promo-2, .home-promo-3, .home-slider-inner').css({"height" : screenHeight});

	} else {

		$('.home-promo-2, .home-promo-3, .home-slider-inner').css("height", "370px");
	}

	// Lookbooks slides height
	$('#lookbooks li div').css({"height" : screenHeight});

};

getScreenHeight();

window.onresize = function() {

	getScreenHeight();
};

// Header promo banner 
setTimeout(function() {

	$('.header-promo-banner').slideDown().addClass('active');

	// Set top value of sub-nav based on whether promo message is visible or not
	if($('.header-promo-banner').hasClass('active')) {

		$('.sub-nav').css({"top" : "89px"});
	} else {

		$('.sub-nav').css({"top" : "59px"});
	}
}, 2000);

// Add & remove fixed header
$(window).scroll(function() {    
    var scroll = $(window).scrollTop();

    if (scroll >= 30) { //height of promo banner

        $(".global-header").addClass("fixed");
        $(".global-content").addClass("fixed-header");

    } else {

        $(".global-header").removeClass("fixed");
        $(".global-content").removeClass("fixed-header");
    }
});


// Toggle currency menu
$('.select-currency').on("click", function() {

	$('#currency').slideToggle();
});






// Fitvids
//$('.video-wrapper').fitVids();



