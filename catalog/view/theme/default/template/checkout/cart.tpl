<?php echo $header; ?>

<div class="header-push less">
  <div id="cart-page">
    <div class="wrapper padding">



        <!-- Error handling -->
        <?php if ($attention) { ?>
          <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
          </div>
        <?php } ?>
        <?php if ($success) { ?>
          <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
          </div>
        <?php } ?>
        <?php if ($error_warning) { ?>
          <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
          </div>
        <?php } ?>
        <!-- end error handling -->


        <!-- Cart header -->
        <div class="row mb">
          <div class="col-xs-12 col-md-6 mb">
            <h1 class="beta">Shopping bag</h1>
            <span>
              <?php if ($weight) { ?>
                <?php echo $weight; ?>
              <?php } ?>
            </span>
          </div>
          <div class="col-xs-12 col-md-6 mb">
            <div class="cart-header-cta">
              <a href="/collection.php">Continue to shopping</a>
              <a href="/checkout-shipping.php" class="btn">Checkout</a>
            </div>
          </div>
        </div>
        <!-- End cart header -->

        <!-- Item headers -->
        <div class="cart-item-headers">
          <ul class="row">
            <li class="col-xs-12 col-md-2">
              Item:
            </li>
            <li class="col-xs-12 col-md-4">
              Description:
            </li>
            <li class="col-xs-12 col-md-1 text-right">
              Price:
            </li>
            <li class="col-xs-12 col-md-3 text-right">
              Quantity:
            </li>
            <li class="col-xs-12 col-md-2 text-right">
              Total:
            </li>
          </ul>
        </div>

        <!-- Cart items -->
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
          <div class="cart-items">
            <ul class="row">
              <?php foreach ($products as $product) { ?>
                <li class="col-xs-12">
                  <div class="cart-item">
                    <div class="col-xs-12 col-md-2">
                      <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-full" />
                    </div>
                    <div class="col-xs-12 col-md-4">

                      <span class="title block"><?php echo $product['name']; ?></span>

                      <?php if ($product['option']) { ?>
                        <?php foreach ($product['option'] as $option) { ?>
                        <span class="variant block"><?php echo $option['name']; ?>: <?php echo $option['value']; ?></span>
                        <?php } ?>
                      <?php } ?>
                      
                    </div>
                    <div class="col-xs-12 col-md-1 cart-pull-right">
                      <span><?php echo $product['price']; ?></span>
                    </div>
                    <div class="col-xs-12 col-md-3 incrementors cart-pull-right">
                      <a href="javascript:;" class="dec">-</a>
                      <input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control quantity-number" />
                      <a href="javascript:;" class="inc">+</a>
                    </div>
                    <div class="col-xs-12 col-md-2 cart-pull-right">
                      <span><?php echo $product['total']; ?></span>
                      <a href="javascript:;" class="remove-link" onclick="cart.remove('<?php echo $product['key']; ?>');">Remove</a>
                    </div>
                  </div>
                </li>
              <?php } ?>
            </ul>
          </div>

          <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-primary">Update</button>

        </form>



        <div class="row">
          <div id="content">

            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <div class="table-responsive">
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <td class="text-center"><?php echo $column_image; ?></td>
                      <td class="text-left"><?php echo $column_name; ?></td>
                      <td class="text-left"><?php echo $column_model; ?></td>
                      <td class="text-left"><?php echo $column_quantity; ?></td>
                      <td class="text-right"><?php echo $column_price; ?></td>
                      <td class="text-right"><?php echo $column_total; ?></td>
                    </tr>
                  </thead>
                  <tbody>

                    <?php foreach ($products as $product) { ?>
                    <tr>
                      <td class="text-center"><?php if ($product['thumb']) { ?>
                        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                        <?php } ?></td>
                      <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                        <?php if (!$product['stock']) { ?>
                        <span class="text-danger">***</span>
                        <?php } ?>
                        <?php if ($product['option']) { ?>
                        <?php foreach ($product['option'] as $option) { ?>
                        <br />
                        <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                        <?php } ?>
                        <?php } ?>
                        <?php if ($product['reward']) { ?>
                        <br />
                        <small><?php echo $product['reward']; ?></small>
                        <?php } ?>
                        <?php if ($product['recurring']) { ?>
                        <br />
                        <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                        <?php } ?></td>
                      <td class="text-left"><?php echo $product['model']; ?></td>
                      <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                          <input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                          <span class="input-group-btn">
                          <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-primary"><i class="fa fa-refresh"></i></button>
                          <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="cart.remove('<?php echo $product['key']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
                      <td class="text-right"><?php echo $product['price']; ?></td>
                      <td class="text-right"><?php echo $product['total']; ?></td>
                    </tr>
                    <?php } ?>



                    <?php foreach ($vouchers as $vouchers) { ?>
                    <tr>
                      <td></td>
                      <td class="text-left"><?php echo $vouchers['description']; ?></td>
                      <td class="text-left"></td>
                      <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                          <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                          <span class="input-group-btn"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="voucher.remove('<?php echo $vouchers['key']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
                      <td class="text-right"><?php echo $vouchers['amount']; ?></td>
                      <td class="text-right"><?php echo $vouchers['amount']; ?></td>
                    </tr>
                    <?php } ?>
                  </tbody>
                </table>
              </div>
            </form>






            <?php if ($coupon || $voucher || $reward || $shipping) { ?>
            <h2><?php echo $text_next; ?></h2>
            <p><?php echo $text_next_choice; ?></p>
            <div class="panel-group" id="accordion"><?php echo $coupon; ?><?php echo $voucher; ?><?php echo $reward; ?><?php echo $shipping; ?></div>
            <?php } ?>
            <br />
            <div class="row">
              <div class="col-sm-4 col-sm-offset-8">
                <table class="table table-bordered">
                  <?php foreach ($totals as $total) { ?>
                  <tr>
                    <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
                    <td class="text-right"><?php echo $total['text']; ?></td>
                  </tr>
                  <?php } ?>
                </table>
              </div>
            </div>
            <div class="buttons">
              <div class="pull-left"><a href="<?php echo $continue; ?>" class="btn btn-default"><?php echo $button_shopping; ?></a></div>
              <div class="pull-right"><a href="<?php echo $checkout; ?>" class="btn btn-primary"><?php echo $button_checkout; ?></a></div>
            </div>
            <?php echo $content_bottom; ?></div>
          <?php echo $column_right; ?></div>

    </div>
  </div>
</div>


<?php echo $footer; ?>