<?php echo $header; ?>
<div class="header-push product">
    <div id="product">

      <!-- Breadcrumbs -->
      <?php include('catalog/view/theme/default/template/partials/breadcrumbs-alt.php');?>

      <div class="wrapper padding">

        <div class="row">

          <!-- Thumbnails -->
          <div class="col-xs-12 col-md-1 product-thumbnails hide-small">
            <?php if ($thumb || $images) { ?>
            <ul class="thumbnails">
              <?php if ($thumb) { ?>
                <li class="test">
                  <a class="product-thumbnail" href="javascript:;" title="<?php echo $heading_title; ?>" data-index="0">
                    <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="img-full" />
                  </a>
                </li>
              <?php } ?>
              <?php if ($images) { ?>
                <?php $thumb_index = 1; ?>
                <?php foreach ($images as $image) { ?>
                  <li class="image-additional">
                    <a class="product-thumbnail" href="javascript:;" title="<?php echo $heading_title; ?>" data-index="<?php echo $thumb_index; ?>">
                      <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="img-full" />
                    </a>
                  </li>
                <?php $thumb_index++; }  ?>
              <?php } ?>
            </ul>
            <?php } ?>
          </div>

          <!-- Main image slider -->
          <div class="col-xs-12 col-md-6 product-main-image">
            <div class="flexslider pd">
              <ul class="slides">
                  <?php if ($images) { ?>
                    <li>
                      <img src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="img-full" />
                    </li>
                    <?php foreach ($images as $image) { ?>
                      <li>
                        <img src="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="img-full" />
                      </li>
                    <?php } ?>
                  <?php } ?>
              </ul>
            </div>
          </div>

          <!-- Product details -->
          <div class="col-xs-12 col-md-4 product-details">

            <!-- Product details header -->
            <div class="product-details-header">
              
              <?php if ($manufacturer) { ?>
                <!--<?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a> -->
                <h2 class="brand"><?php echo $manufacturer; ?></h2>
              <?php } ?>
              <h1><?php echo $heading_title; ?></h1>

              <?php if ($price) { ?>
                <div class="price">
                  <span class="price-left">
                    <?php if ($special) { ?>
                      <?php echo $price; ?> Store
                      <?php echo $special; ?> Sale
                    <?php } else { ?>
                      <?php echo $price; ?> Store
                    <?php } ?>
                  </span>
                  <span class="price-right">$24 VIP</span>
                </div>
              <?php } ?>
            </div>

      <!--       <p>price</p>
            <?php if ($price) { ?>
              <ul class="list-unstyled">

                <?php if ($tax) { ?>
                <li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
                <?php } ?>
                <?php if ($points) { ?>
                <li><?php echo $text_points; ?> <?php echo $points; ?></li>
                <?php } ?>
                <?php if ($discounts) { ?>
                <li>
                  <hr>
                </li>
                <?php foreach ($discounts as $discount) { ?>
                <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
                <?php } ?>
                <?php } ?>
              </ul>
              <?php } ?>
 -->

            <!-- Product Variants -->
            <?php include('catalog/view/theme/default/template/partials/product-options.php');?>

            <!-- Tabs -->
            <?php if ($attribute_groups) { ?>
              <?php foreach ($attribute_groups as $attribute_group) { ?>
                <div class="product-tabs">
                  <ul>
                    <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                    <li>
                      <a href="javascript:;" class="product-tab-header"><?php echo $attribute['name']; ?></a>
                      <div class="product-tab-content">
                        <p><?php echo $attribute['text']; ?></p>
                      </div>
                    </li>
                    <?php } ?>
                  </ul>
                </div>
              <?php } ?>
            <?php } ?>

            <!-- Add to cart -->
            <div class="add-to-cart">
              <a href="javascript:;" type="submit" class="btn block" id="button-cart">Add to bag</a>
            </div>
          
          </div>
      </div> <!-- row end -->

      <!-- Related products -->
      <?php include('catalog/view/theme/default/template/partials/related-products.php');?>

      </div> <!-- wrapper end -->
  </div>
</div>

<!-- Hidden fields for add to cart -->
<div>
  <input type="hidden" value="<?php echo $product_id ;?>" id="product-id" />
  <input type="hidden" value="<?php echo $option['product_option_id']; ?>" id="product-option-id" />
  <input type="hidden" value="" id="product-option-value" />
</div>

<?php echo $footer; ?>