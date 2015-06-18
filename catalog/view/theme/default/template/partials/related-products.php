

<?php if ($products) { ?>

  <div class="row product-suggestions">

    <div class="col-xs-12">
      <h3>You may also like</h3>
    </div>
    
    <?php foreach ($products as $product) { ?>
    
      <div class="col-xs-6 col-md-3 mb">
        <div class="collection-item">

          <a href="<?php echo $product['href']; ?>">
            
            <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-full" />

            <div class="caption">

              <h2 class="epsilon"><?php echo $product['manufacturer']; ?></h2>
              <span class="short-description"><?php echo $product['name']; ?></span>

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
              <?php } ?>
            </div>

          </a>
        </div>
      </div>
    <?php } ?>

  </div>
  <?php } ?>