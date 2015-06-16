

<div class="header-push less">
	<div id="checkout-payment">
		<div class="wrapper padding">
			<?php include('partials/pages/page-partials/breadcrumbs-checkout.php');?>
			<div class="row mb">
				<div class="col-xs-12 mb">
					<h1 class="gamma">Checkout</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-md-7">
					<div class="payment-details">
						<h2 class="epsilon">Payment Details</h2>
						<div class="payment-type">
							<ul>
								<li class="card-labels">
									<input type="radio" name="payment-type" id="payment-type-card" checked="checked" />
									<label for="payment-type-card" class="name">Credit Card</label>
									<div class="card-inputs">
										<input type="text" maxlength="4" />
										<input type="text" maxlength="4" />
										<input type="text" maxlength="4" />
										<input type="text" maxlength="4" />
									</div>
								</li>
								<li class="card-labels">
									<input type="radio" name="payment-type" id="payment-type-paypal" />
									<label for="payment-type-paypal" class="name">Paypal</label>
									<div class="card-inputs">
										<input type="text" maxlength="4" />
										<input type="text" maxlength="4" />
										<input type="text" maxlength="4" />
										<input type="text" maxlength="4" />
									</div>
								</li>
								<li>
									<div class="styled-select">
										<select name="" id="billing-profiles">
											<option value="">First Last - XXXX XXXX XXXX 1234</option>
										</select>
									</div>
									<a href="javascript:;" class="new-billing-profile-link upper underline">Add a new billing profile</a>
								</li>
							</ul>
							<ul class="new-billing-profile">
								<li class="new-billing-profile-item">
									<label for="">Card Number:</label>
									<input type="text" placeholder="Card Number" />
								</li>
								<li class="new-billing-profile-item">
									<label for="">Expiry Date:</label>
									<div class="expiry-wrapper">
										<div class="expiry-holder">
											<div class="styled-select">
												<select name="" id="">
													<option value="" disabled selected>Month</option>
													<option value="January">January</option>
													<option value="February">February</option>
													<option value="March">March</option>
													<option value="April">April</option>
													<option value="May">May</option>
													<option value="June">June</option>
													<option value="July">July</option>
													<option value="August">August</option>
													<option value="September">September</option>
													<option value="October">October</option>
													<option value="November">November</option>
													<option value="December">December</option>
												</select>
											</div>
										</div>
										<div class="expiry-holder">
											<input type="text" placeholder="Year" />
										</div>
										<div class="expiry-holder">
											<input type="text" placeholder="CVC" />
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div class="billing-address-area">
						<h2 class="epsilon">Billing Address</h2>
						<div class="billing-address-question">
							<input type="checkbox" name="same-as-shipping-address" id="same-as-shipping-address" />
							<label for="same-as-shipping-address">Same as shipping address</label>
						</div>
						<?php include('partials/pages/page-partials/checkout-billing-new-address.php');?>
						<div class="same-as-shipping-address">
							<span>First Last</span>
							<span>Address</span>
							<span>Apt, Suite, etc</span>
							<span>City, State, Zip</span>
							<span>Country</span>
							<span>Telephone</span>
						</div>
					</div>
					<a href="checkout-confirmation.php" class="btn large confirm-order">Confirm Order</a>
				</div>
				<div class="col-xs-12 col-md-5">
					<?php include('partials/pages/page-partials/checkout-order-summary.php');?>
				</div>
			</div>
		</div>
	</div>
</div>
