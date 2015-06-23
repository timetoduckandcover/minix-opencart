<?php echo $header; ?>

<div id="page-with-sidebar">

  <div class="pws-header">
    <h1><?php echo $heading_title; ?></h1>
  </div>

  <div class="header-push less">
    <div class="wrapper padding">

       <!-- Breadcrumbs -->
      <?php include('catalog/view/theme/default/template/partials/breadcrumbs.php') ;?>

      <div class="row">

        <div class="col-xs-12 col-md-3">
          <?php include('catalog/view/theme/default/template/partials/account-sidebar.php');?>
        </div>

        <div class="col-xs-12 col-md-9 page-wyziwig">
            <?php if ($products) { ?>
              <div class="row">
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
              </div>
            <?php } else { ?>
              <p><?php echo $text_empty; ?></p>
            <?php } ?>
        </div>

      </div><!-- row -->
    </div>
  </div>
</div>

<?php echo $footer; ?>