
	// Product page tabs
	$('.product-tab-header').on("click", function() {

		if ($(this).hasClass('active')) {

			$(this).removeClass('active').parent().find('.product-tab-content').slideUp(100);
		} else {

			$('.product-tab-header').removeClass('active');
			$('.product-tab-content').slideUp(100);
			$(this).addClass('active').parent().find('.product-tab-content').slideDown(100);
		}
	});

	// Product variants - add active class on click unless sold out
	$('.product-variants a').on("click", function() {

		if (!$(this).hasClass('sold-out')) {

			$('.product-variants a').removeClass('active');
			$(this).addClass('active');
		} 
	});