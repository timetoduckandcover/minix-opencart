

<?php if ($products) { ?>

  <div class="row product-suggestions">

    <div class="col-xs-12">
      <h3>You may also like</h3>
    </div>
<!-- 
    <?php $i = 0; ?>
 -->
    <?php foreach ($products as $product) { ?>
    
    <div class="col-xs-6 col-md-3 mb">
      <div class="collection-item">

        <a href="<?php echo $product['href']; ?>">
          
          <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-full" />

          <div class="caption">

            <h2 class="epsilon">[Need php hook for related product manufacturer]</h2>
            <span class="short-description"><?php echo $product['name']; ?></span>

           <!--  <p><?php echo $product['description']; ?></p>
            <?php if ($product['rating']) { ?>
            <div class="rating">
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($product['rating'] < $i) { ?>
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } else { ?>
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } ?>
              <?php } ?>
            </div>
            <?php } ?> -->
            <?php if ($product['price']) { ?>
            <div class="price">
              <span class="price-left">
                <?php if (!$product['special']) { ?>
                    <?php echo $product['price']; ?>
                  <?php } else { ?>
                    <span class="sale"><?php echo $product['price']; ?></span>
                    <?php echo $product['special']; ?>
                <?php } ?>
              </span>
              <span class="price-right">VIP: $26</span>
            </div>
            <p class="price">
              

            <!--   <?php if ($product['tax']) { ?>
              <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
              <?php } ?> -->
            </p>
            <?php } ?>
          </div>

         <!--  <div class="button-group">
            <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>
            <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
            <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
          </div> -->

        </a>
      </div>
    </div>
<!-- 
    <?php if (($column_left && $column_right) && ($i % 2 == 0)) { ?>
    <div class="clearfix visible-md visible-sm"></div>
    <?php } elseif (($column_left || $column_right) && ($i % 3 == 0)) { ?>
    <div class="clearfix visible-md"></div>
    <?php } elseif ($i % 4 == 0) { ?>
    <div class="clearfix visible-md"></div>
    <?php } ?>
    <?php $i++; ?>
     -->
    <?php } ?>

  </div>
  <?php } ?>