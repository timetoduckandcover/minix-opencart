<?php echo $header; ?>

<div class="header-push less">
  <div id="collection">
    <div class="wrapper padding">

      <!-- Breadcrumbs -->
      <?php include('catalog/view/theme/default/template/partials/breadcrumbs.php') ;?>

      <div class="row">


        <!-- Mobile header -->
        <div class="col-xs-12">
          <h1 class="gamma hide-large"><?php echo $heading_title; ?></h1>
        </div>

        <!-- Collection sidebar -->
        <div class="col-xs-12 col-md-3 hide-small">
          <h3 class="epsilon">Categories</h3>
          <ul>
            <?php foreach ($categories as $category) { ?>
              <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>

        <!-- Collection listing -->
        <div class="col-xs-12 col-md-9">
          <div class="row"> 
            <?php if ($products) { ?>
              <?php foreach ($products as $product) { ?>
                <div class="col-xs-6 col-md-3 mb">
                  <div class="collection-item">
                    <a href="<?php echo $product['href']; ?>">
                      <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-full" />
                      <h2 class="epsilon">[PHP hook for manufacturer]<?php echo $manufacturer ;?></h2>
                      <span class="short-description"><?php echo $product['name']; ?></span>
                      <div class="price">
                        <span class="price-left">
                          <?php if ($product['price']) { ?>
                              <?php if (!$product['special']) { ?>
                                <span class="sale"><?php echo $product['special']; ?></span>
                                <?php echo $product['price']; ?>
                              <?php } ?>
                          <?php } ?>
                        </span>
                        <span class="price-right">VIP: $26</span>
                      </div>
                    </a>
                  </div>
                </div>
              <?php } ?>
              <?php } else { ?>
                <p>No products in this category!</p>
              <?php } ?>
        </div>
    </div>
</div>

<?php echo $footer; ?>
