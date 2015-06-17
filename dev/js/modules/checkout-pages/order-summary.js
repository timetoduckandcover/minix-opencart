
	// Add or remove promo / gift card
	$('.apply-promo-gift-card').on("click", function(){

		$('.promo-gift-card input').toggleClass("active");
		$(this).toggleClass('active');

		if( $(this).hasClass('active') ) {

			$(this).text("Remove");
		} else {

			$(this).text("Apply Now");
			$('.promo-gift-card input').val("");
		}
	});