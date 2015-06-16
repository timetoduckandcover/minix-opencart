
// Variables
var giftCardOverlay  = $('.add-gift-card-wrapper'),
	giftCardBtn      = $('.add-gift-card-btn'),
	giftCardInner    = $('.gift-card'),
	giftCardFrontBtn = $('.gift-card-add-message'),
	giftCardFront    = $('.gift-card-front'),
	giftCardBack     = $('.gift-card-back'),
	giftCardAdd      = $('.gift-card-submit');

// Click events
giftCardBtn.on("click", function() {

	giftCardOverlay.fadeIn().addClass('visible');
});

giftCardFrontBtn.on("click", function() {

	giftCardFront.fadeOut();
	giftCardBack.fadeIn();
});

giftCardAdd.on("click", function() {

	giftCardOverlay.fadeOut();
});

// if(giftCardOverlay.hasClass('visible')) {

// 	giftCardInner.on('click', function(e) {

// 	    e.stopPropagation();
// 	});
// }

// $(document).on('click', function (e) {
 
// 	giftCardOverlay.hide();
// });