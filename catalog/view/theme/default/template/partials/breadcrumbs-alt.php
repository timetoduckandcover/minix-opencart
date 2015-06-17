
<div class="breadcrumbs alt">
	<ul>
		<li>
			<a href="/">Home</a>
		</li>
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	    	<li>
	    		<a href="<?php echo $breadcrumb['href']; ?>">
	    			<?php echo $breadcrumb['text']; ?>
	    		</a>
	    	</li>
	    <?php } ?>
	</ul>
</div>