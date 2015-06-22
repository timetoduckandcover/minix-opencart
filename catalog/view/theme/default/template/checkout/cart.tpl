<?php echo $header; ?>

<div class="header-push less">
  <div id="cart-page">
    <div class="wrapper padding">

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
              <a href="<?php echo $checkout; ?>" class="btn"><?php echo $button_checkout; ?></a>
            </div>
          </div>
        </div>
        <!-- End cart header -->

        <!-- Error handling -->
        <?php if ($attention) { ?>
          <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
            <!-- <button type="button" class="close" data-dismiss="alert">&times;</button> -->
          </div>
        <?php } ?>
        <?php if ($success) { ?>
          <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
            <!-- <button type="button" class="close" data-dismiss="alert">&times;</button> -->
          </div>
        <?php } ?>
        <?php if ($error_warning) { ?>
          <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <!-- <button type="button" class="close" data-dismiss="alert">&times;</button> -->
          </div>
        <?php } ?>
        <!-- end error handling -->

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

                      <span class="title block">
                        <?php echo $product['name']; ?>
                        <?php if (!$product['stock']) { ?>
                          <span class="text-danger">***</span>
                        <?php } ?>
                      </span>

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
                  
                  <tbody>

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
           

    </div>
  </div>
</div>


<?php echo $footer; ?>