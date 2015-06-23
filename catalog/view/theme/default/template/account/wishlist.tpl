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
              <?php foreach ($products as $product) { ?>
                <tr>
                  <td class="text-center"><?php if ($product['thumb']) { ?>
                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                    <?php } ?></td>
                  <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></td>
                  <td class="text-left"><?php echo $product['model']; ?></td>
                  <td class="text-right"><?php echo $product['stock']; ?></td>
                  <td class="text-right"><?php if ($product['price']) { ?>
                    <div class="price">
                      <?php if (!$product['special']) { ?>
                      <?php echo $product['price']; ?>
                      <?php } else { ?>
                      <b><?php echo $product['special']; ?></b> <s><?php echo $product['price']; ?></s>
                      <?php } ?>
                    </div>
                    <?php } ?></td>
                  <td class="text-right"><button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" data-toggle="tooltip" title="<?php echo $button_cart; ?>" class="btn btn-primary"><i class="fa fa-shopping-cart"></i></button>
                    <a href="<?php echo $product['remove']; ?>" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-times"></i></a></td>
                </tr>
              <?php } ?>
            <?php } else { ?>
              <p><?php echo $text_empty; ?></p>
            <?php } ?>
        </div>

      </div><!-- row -->
    </div>
  </div>
</div>

<?php echo $footer; ?>