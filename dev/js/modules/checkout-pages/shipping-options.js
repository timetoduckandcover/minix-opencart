

// Hide & show address form
$('#add-new-address').on("click", function() {

	$('.checkout-current-address').hide();
	$('.checkout-new-address').show();
});

$('.cancel-add-new-address').on("click", function() {

	$('.checkout-current-address').show();
	$('.checkout-new-address').hide();	
});
