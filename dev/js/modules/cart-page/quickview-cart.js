
// Get cart details
console.log("test");

$.ajax({
	url: 'index.php?route=checkout/cart',
	type: 'get',
	dataType: 'json',
	// beforeSend: function() {
	// },
	// complete: function() {
	// },
	success: function(data) {

		console.log(data)

	    if (data.length > 0) {
	        // do something here with the products in data array
	    }
	},
	error: function(err) {

		console.log(err)
	}
});
