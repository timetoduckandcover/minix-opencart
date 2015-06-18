<!-- <h3><?php echo $heading_title; ?></h3> -->

<div class="row">

  <?php foreach ($products as $product) { ?>
    <div class="col-xs-6 col-md-3 mb">

      <div class="collection-item">

        <a href="<?php echo $product['href']; ?>">

          <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-full" />
          <h2 class="epsilon"><?php echo $product['manufacturer']; ?></h2>
          <span class="short-description"><?php echo $product['name']; ?></span>

          <!-- Product price -->
          <?php if ($product['price']) { ?>
            <div class="price">
              <?php if (!$product['special']) { ?>
                <span class="price-left"><?php echo $product['price']; ?></span>
              <?php } else { ?>
                <span class="price-left"><span class="sale"><?php echo $product['price']; ?></span><?php echo $product['special']; ?></span>
              <?php } ?>
              <span class="price-right">VIP: $26</span>
            </div>
          <?php } ?>

        </a>
        
      </div>

    </div>
  <?php } ?>
</div>
