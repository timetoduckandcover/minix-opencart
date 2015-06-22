<!-- <div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1;">
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
<!-- Collection slider -->
<div class="row">
  <div class="col-xs-12">
    <div class="flexslider">
      <ul class="slides">
        <?php foreach ($banners as $banner) { ?>
        <li>
          <div class="home-promo home-promo-4 home-slider-inner" style="background-image:url(<?php echo $banner['image']; ?>)">
            <?php if ($banner['link']) { ?>
              <div class="caption">
                <a href="<?php echo $banner['link']; ?>" class="btn large">Shop the collection</a>
              </div>
            <?php } ?>
          </div>
        </li>
        <?php } ?>
      </ul>
    </div>
  </div>
</div>

<!-- <script type="text/javascript">
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: 3000,
	singleItem: true,
	navigation: true,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: true
});
</script> -->

