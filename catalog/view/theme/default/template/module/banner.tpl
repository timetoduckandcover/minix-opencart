
<!-- 
<div id="banner<?php echo $module; ?>" class="owl-carousel">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
</div>
 -->


<?php foreach ($banners as $banner) { ?>
  <div class="row">
      <div class="col-xs-12 full">
        <div class="home-promo-1 home-promo" style="background-image:url(<?php echo $banner['image']; ?>)">

          <!-- All captions on the home page will be able to be 
          customized and positioned (left & top values) in the CMS -->
          
          <div class="caption">
            <h2><?php echo $banner['title']; ?></h2>
            <?php if ($banner['link']) { ?>
              <a href="<?php echo $banner['link']; ?>" class="btn large">Shop Now</a>
            <?php } ?>
          </div>
        
        </div>
      </div>
  </div>
<?php } ?>


<!--<script type="text/javascript">
$('#banner<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: 3000,
	singleItem: true,
	navigation: false,
	pagination: false,
	transitionStyle: 'fade'
});
</script>-->
