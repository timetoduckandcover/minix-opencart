<div class="row breadcrumbs">
	<div class="col-xs-12">
		<ul>
			<li>
				<a href="/">Home</a>
			</li>
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
			<?php } ?>
		</ul>
	</div>
</div>