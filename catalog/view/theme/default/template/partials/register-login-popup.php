
<div class="rlp-wrapper black-popup">
	<div class="rlp">
		<a href="javascript:;" class="black-popup-close">X</a>
		<div class="rlp-register-section">
			<h2>Join Mini X</h2>
			<span class="block">Shop the coolest kids fashion in the world with up to 40% off retail prices.</span>
			<form action="index.php?route=account/register" method="post" enctype="multipart/form-data">
				<!-- <input type="text" placeholder="Your email address" /> -->
				<input type="email" name="email" value="" placeholder="Your email address" id="input-email" class="form-control" />
				<!-- <input type="password" placeholder="Enter password" /> -->
				<input type="password" name="password" value="" placeholder="Enter password" id="input-password" class="form-control" />
				<input type="password" name="confirm" value="" placeholder="Enter password again" id="input-confirm" class="form-control" />
				<div class="social-login">
					<a href="javascript:;" class="fb">Register with Facebook</a>
					<a href="javascript:;" class="google">Register with Google</a>
				</div>
				<!-- <input type="submit" class="btn large" value="Join now"> -->
				<label for="">
	            	<input type="checkbox" name="agree" value="1" />
	            	I have read and agreed to the privacy policy
	            </label><br/>
				<input type="submit" value="Join Now" class="btn large" />
			</form>
			<a href="javascript:;" class="underline rlp-switch-to-login">Already a member? Sign in here</a>
		</div>
		<div class="rlp-login-section">
			<h2>Welcome Back</h2>
			<form action="index.php?route=account/login" method="post" enctype="multipart/form-data">
				<!-- <input type="text" placeholder="Your email address" /> -->
				<input type="text" name="email" value="" placeholder="Your email address" id="input-email" class="form-control" />
				<!-- <input type="password" placeholder="Enter password" /> -->
				<input type="password" name="password" value="" placeholder="Enter password" id="input-password" class="form-control" />
				<!-- <input type="submit" class="btn large" value="Sign In"> -->
				<input type="submit" value="Sign In" class="btn large" />
				<span class="or block">Or</span>
				<div class="social-login">
					<a href="javascript:;" class="fb">Sign in with Facebook</a>
					<a href="javascript:;" class="google">Sign in with Google</a>
				</div>
			</form>
			<a href="javascript:;" class="underline rlp-switch-to-register">Not a member? Register now</a>
		</div>
	</div>
</div>
