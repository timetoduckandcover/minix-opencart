
	// Function to remove class of invalid character
	function removeInvalid() {

		setTimeout(function() {

			$('.card-inputs input').removeClass('invalid-character');
		}, 300);
	};

	// Skip inputs once maxlength == 4 & restrict only to numbers
	$('.card-inputs input').keypress(function(e) {

		var numberBtn = ( !(e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105) ),
			myLength = $(this).val().length;

			console.log(numberBtn)

		if(!numberBtn) {

			$(this).addClass('invalid-character');
			removeInvalid();
			return false;
		}

		if( (myLength == 4) && (numberBtn) ) {

			$(this).next('input').focus();
		}
	});

	// Show new billing profile
	$('.new-billing-profile-link').on("click", function() {

		$('.new-billing-profile').show();
		$(this).hide();
		$('#billing-profiles').prepend('<option value="new" selected>New Billing Address</option>');
	});

	// On change of billing profile, hide form if anything but 'new address' is selected
	$('#billing-profiles').change(function() {

		if($(this).val() != "new") {

			$('.new-billing-profile').hide();
		} else {

			$('.new-billing-profile').show();
		}
	});

	// Complete billing form if checked (for submit) & hide visually
	$('#same-as-shipping-address').change(function() {

		if($(this).is(":checked")) {
            
			alert("Once cart integration is done, write Javascript (checkout-pages/payment-page.js) to complete the form with prev page values (to pass for submission). Form is only visually hidden.")
			$('.checkout-new-address').hide();
			$('.same-as-shipping-address').show();
        } else {

        	alert("After cart integration, do we need to empty the fields once this has been shown again?")
        	$('.checkout-new-address').show();
        	$('.same-as-shipping-address').hide();
        }
	});



