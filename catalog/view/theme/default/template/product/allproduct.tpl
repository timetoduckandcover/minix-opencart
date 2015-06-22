<?php echo $header; ?>

<div class="header-push less">
  <div id="collection">

    <div class="wrapper padding">

      <!-- Breadcrumbs -->
      <?php include('catalog/view/theme/default/template/partials/breadcrumbs.php') ;?>

      <div class="row">
        <div id="content">

          <!-- Mobile header -->
          <div class="col-xs-12">
            <h1 class="gamma hide-large"><?php echo $heading_title; ?></h1>
          </div>

           <!-- Collection sidebar -->
           <div class="col-xs-12 col-md-3 hide-small">
              <h3 class="epsilon">Categories</h3>
              <p>need module to list collections</p>
           </div>

          <div class="col-xs-12 col-md-9">
            <div class="row">
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
                                <?php if (!$product['special']) { ?>
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
                <div class="row">
                  <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                  <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                </div>
              <?php } ?>
            </div>
          </div>

          <?php if (!$products) { ?>
            <p><?php echo $text_empty; ?></p>
            <div class="buttons">
              <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
            </div>
          <?php } ?>

        </div>

    </div>
  </div>
</div>

<?php echo $footer; ?>