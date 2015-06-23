
// Home page popups

	var rlpWrapper       = $('.rlp-wrapper'),
		loginSwitch      = $('.rlp-switch-to-login'),
		registerSwitch   = $('.rlp-switch-to-register'),
		loginSection     = $('.rlp-login-section'),
		registerSection  = $('.rlp-register-section'),
		closePopup       = $('.black-popup-close'),
		signInLinkHeader = $('.sign-in-link'),
		generalPopup     = $('.black-popup'),
		referPopup       = $('.gcp-wrapper'),
		referPopupLink   = $('.raf-link');


	// Fade in popup - needs cookie here!
	setTimeout(function() {

		generalPopup.hide();
		//rlpWrapper.fadeIn();
	}, 5000);

	// Switch between login & register forms
	loginSwitch.on("click", function() {

		registerSection.hide();
		loginSection.show();
	});

	registerSwitch.on("click", function() {

		registerSection.show();
		loginSection.hide();
	});

	// Hide popup on X click
	closePopup.on("click", function() {

		generalPopup.hide();
	});

	// Sign in show popup
	signInLinkHeader.on("click", function() {

		generalPopup.hide();
		rlpWrapper.show();
		registerSection.hide();
		loginSection.show();
	});

	// Refer a friend show popup
	referPopupLink.on("click", function() {

		generalPopup.hide();
		referPopup.fadeIn();
	});



	