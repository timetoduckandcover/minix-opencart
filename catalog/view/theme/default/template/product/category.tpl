<?php echo $header; ?>

<!-- if collection has featured image -->
<div class="page-header-image-collection">
  <?php if ($thumb) { ?>
    <img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-full" />
    <div class="caption"> <!-- NOTE: checkboxes need adding to CMS here to click left, right or center which will add one of those classes for text-alignment -->
      <h1 class="beta"><?php echo $heading_title; ?></h1>
      <!-- below caption is optional (if exists) -->
      <p>Optional subheader. Visible only if copy is added in CMS.</p>
    </div>
  <?php } ?>
</div>
<!-- endif -->

<div class="header-push less">
  <div id="collection">
    <div class="wrapper padding">

      <!-- Breadcrumbs -->
      <?php include('catalog/view/theme/default/template/partials/breadcrumbs.php') ;?>

      <div class="row">

        <!-- Mobile header -->
        <div class="col-xs-12 mb">
          <h2 class="gamma"><?php echo $heading_title; ?></h2>
        </div>

        <!-- Collection sidebar -->
        <div class="col-xs-12 col-md-3 hide-small">
          <!-- <h3 class="epsilon">Categories</h3> -->
          <ul>
            <?php foreach ($categories as $category) { ?>
              <!-- link below needs class of 'col-active' if it's the selected category -->
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
                        <h2 class="epsilon"><?php echo $product['manufacturer']; ?></h2>
                        <span class="short-description"><?php echo $product['name']; ?></span>
                        <div class="price">
                          <span class="price-left">
                            <?php if ($product['price']) { ?>
                                <?php if ($product['special']) { ?>
                                  <span class="sale"><?php echo $product['special']; ?></span>
                                  <?php echo $product['price']; ?>
                                <?php } else { ?>
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
