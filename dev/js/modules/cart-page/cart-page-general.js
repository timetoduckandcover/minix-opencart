
	// Get height of VIP image
	function getCartVipImageHeight() {

		var cartVipImage = $('.cart-footer-vip').height();
		$('.cart-footer-checkout-btn').css({"height" : cartVipImage});
	};
	getCartVipImageHeight();

	window.onresize = function() {

		getCartVipImageHeight();
	};

	// Quantity buttons on cart page
	var $minus = $('.incrementors .dec'),
	    $plus  = $('.incrementors .inc');

	$minus.on("click", function() {

		console.log("minus")

		var $numinput = $(this).parent().find('.quantity-number');

	   if ($numinput.val() > 0) {

			$numinput.val( parseInt( $numinput.val(), 10 ) -1 );
	   } 
	});

	$plus.on("click", function() {

		console.log("plus")

		var $numinput = $(this).parent().find('.quantity-number');

		$numinput.val( parseInt( $numinput.val(), 10 ) +1 );
	});