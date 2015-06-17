<?php echo $header; ?>
<div class="header-push product">
    <div id="product">

      <!-- Breadcrumbs -->
      <?php include('catalog/view/theme/default/template/partials/breadcrumbs-alt.php');?>

      <div class="wrapper padding">

        <div class="row">

          <!-- Thumbnails -->
          <div class="col-xs-12 col-md-1 product-thumbnails hide-small">
            <?php if ($thumb || $images) { ?>
            <ul class="thumbnails">
              <?php if ($thumb) { ?>
                <li class="test">
                  <a class="product-thumbnail" href="javascript:;" title="<?php echo $heading_title; ?>" data-index="0">
                    <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="img-full" />
                  </a>
                </li>
              <?php } ?>
              <?php if ($images) { ?>
                <?php $thumb_index = 1; ?>
                <?php foreach ($images as $image) { ?>
                  <li class="image-additional">
                    <a class="product-thumbnail" href="javascript:;" title="<?php echo $heading_title; ?>" data-index="<?php echo $thumb_index; ?>">
                      <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="img-full" />
                    </a>
                  </li>
                <?php $thumb_index++; }  ?>
              <?php } ?>
            </ul>
            <?php } ?>
          </div>

          <!-- Main image slider -->
          <div class="col-xs-12 col-md-6 product-main-image">
            <div class="flexslider pd">
              <ul class="slides">
                  <?php if ($images) { ?>
                    <li>
                      <img src="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="img-full" />
                    </li>
                    <?php foreach ($images as $image) { ?>
                      <li>
                        <img src="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" class="img-full" />
                      </li>
                    <?php } ?>
                  <?php } ?>
              </ul>
            </div>
          </div>

          <!-- Product details -->
          <div class="col-xs-12 col-md-4 product-details">

            <!-- Product details header -->
            <div class="product-details-header">
              
              <?php if ($manufacturer) { ?>
                <!--<?php echo $text_manufacturer; ?> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a> -->
                <h2 class="brand"><?php echo $manufacturer; ?></h2>
              <?php } ?>
              <h1><?php echo $heading_title; ?></h1>

              <?php if ($price) { ?>
                <div class="price">
                  <span class="price-left">
                    <?php if ($special) { ?>
                      <?php echo $price; ?> Store
                      <?php echo $special; ?> Sale
                    <?php } else { ?>
                      <?php echo $price; ?> Store
                    <?php } ?>
                  </span>
                  <span class="price-right">$24 VIP</span>
                </div>
              <?php } ?>
            </div>

      <!--       <p>price</p>
            <?php if ($price) { ?>
              <ul class="list-unstyled">

                <?php if ($tax) { ?>
                <li><?php echo $text_tax; ?> <?php echo $tax; ?></li>
                <?php } ?>
                <?php if ($points) { ?>
                <li><?php echo $text_points; ?> <?php echo $points; ?></li>
                <?php } ?>
                <?php if ($discounts) { ?>
                <li>
                  <hr>
                </li>
                <?php foreach ($discounts as $discount) { ?>
                <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
                <?php } ?>
                <?php } ?>
              </ul>
              <?php } ?>
 -->

            <!-- Product Variants -->
            <?php include('catalog/view/theme/default/template/partials/product-options.php');?>

            <!-- Add to cart -->
            <div class="add-to-cart">
              <a href="javascript:;" type="submit" class="btn block" id="button-cart">Add to bag</a>
            </div>
          
          </div>


  
          




          <!-- <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            
            <div class="row">
              <?php if ($column_left && $column_right) { ?>
              <?php $class = 'col-sm-6'; ?>
              <?php } elseif ($column_left || $column_right) { ?>
              <?php $class = 'col-sm-6'; ?>
              <?php } else { ?>
              <?php $class = 'col-sm-8'; ?>
              <?php } ?>
              <div class="<?php echo $class; ?>">
                
                <ul class="nav nav-tabs">
                  <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
                  <?php if ($attribute_groups) { ?>
                  <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
                  <?php } ?>
                  <?php if ($review_status) { ?>
                  <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
                  <?php } ?>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
                  <?php if ($attribute_groups) { ?>
                  <div class="tab-pane" id="tab-specification">
                    <table class="table table-bordered">
                      <?php foreach ($attribute_groups as $attribute_group) { ?>
                      <thead>
                        <tr>
                          <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                        </tr>
                      </thead>
                      <tbody>
                        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                        <tr>
                          <td><?php echo $attribute['name']; ?></td>
                          <td><?php echo $attribute['text']; ?></td>
                        </tr>
                        <?php } ?>
                      </tbody>
                      <?php } ?>
                    </table>
                  </div>
                  <?php } ?>
                  <?php if ($review_status) { ?>
                  <div class="tab-pane" id="tab-review">
                    <form class="form-horizontal" id="form-review">
                      <div id="review"></div>
                      <h2><?php echo $text_write; ?></h2>
                      <?php if ($review_guest) { ?>
                      <div class="form-group required">
                        <div class="col-sm-12">
                          <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                          <input type="text" name="name" value="" id="input-name" class="form-control" />
                        </div>
                      </div>
                      <div class="form-group required">
                        <div class="col-sm-12">
                          <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                          <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                          <div class="help-block"><?php echo $text_note; ?></div>
                        </div>
                      </div>
                      <div class="form-group required">
                        <div class="col-sm-12">
                          <label class="control-label"><?php echo $entry_rating; ?></label>
                          &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                          <input type="radio" name="rating" value="1" />
                          &nbsp;
                          <input type="radio" name="rating" value="2" />
                          &nbsp;
                          <input type="radio" name="rating" value="3" />
                          &nbsp;
                          <input type="radio" name="rating" value="4" />
                          &nbsp;
                          <input type="radio" name="rating" value="5" />
                          &nbsp;<?php echo $entry_good; ?></div>
                      </div>
                      <?php if ($site_key) { ?>
                        <div class="form-group">
                          <div class="col-sm-12">
                            <div class="g-recaptcha" data-sitekey="<?php echo $site_key; ?>"></div>
                          </div>
                        </div>
                      <?php } ?>
                      <div class="buttons clearfix">
                        <div class="pull-right">
                          <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                        </div>
                      </div>
                      <?php } else { ?>
                      <?php echo $text_login; ?>
                      <?php } ?>
                    </form>
                  </div>
                  <?php } ?>
                </div>
              </div>
              <?php if ($column_left && $column_right) { ?>
              <?php $class = 'col-sm-6'; ?>
              <?php } elseif ($column_left || $column_right) { ?>
              <?php $class = 'col-sm-6'; ?>
              <?php } else { ?>
              <?php $class = 'col-sm-4'; ?>
              <?php } ?>

              <div class="<?php echo $class; ?>">
                <div class="btn-group">
                  <button type="button" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i></button>
                  <button type="button" data-toggle="tooltip" class="btn btn-default" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i></button>
                </div>
                
                <ul class="list-unstyled">
                  
                  <li><?php echo $text_model; ?> <?php echo $model; ?></li>
                  <?php if ($reward) { ?>
                  <li><?php echo $text_reward; ?> <?php echo $reward; ?></li>
                  <?php } ?>
                  <li><?php echo $text_stock; ?> <?php echo $stock; ?></li>
                </ul>
                
                <div id="product">

                  <?php if ($recurrings) { ?>
                  <hr>
                  <h3><?php echo $text_payment_recurring ?></h3>
                  <div class="form-group required">
                    <select name="recurring_id" class="form-control">
                      <option value=""><?php echo $text_select; ?></option>
                      <?php foreach ($recurrings as $recurring) { ?>
                      <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                      <?php } ?>
                    </select>
                    <div class="help-block" id="recurring-description"></div>
                  </div>
                  <?php } ?>
                  <div class="form-group">
                    <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
                    <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
                    <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                    <br />
                    <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block"><?php echo $button_cart; ?></button>
                  </div>
                  <?php if ($minimum > 1) { ?>
                  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
                  <?php } ?>
                </div>
                <?php if ($review_status) { ?>
                <div class="rating">
                  <p>
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                    <?php if ($rating < $i) { ?>
                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                    <?php } else { ?>
                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                    <?php } ?>
                    <?php } ?>
                    <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> / <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a></p>
                
                 
                </div>
                <?php } ?>
              </div>
            </div>

            <?php if ($products) { ?>
            <h3><?php echo $text_related; ?></h3>
            <div class="row">
              <?php $i = 0; ?>
              <?php foreach ($products as $product) { ?>
              <?php if ($column_left && $column_right) { ?>
              <?php $class = 'col-lg-6 col-md-6 col-sm-12 col-xs-12'; ?>
              <?php } elseif ($column_left || $column_right) { ?>
              <?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
              <?php } else { ?>
              <?php $class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12'; ?>
              <?php } ?>
              <div class="<?php echo $class; ?>">
                <div class="product-thumb transition">
                  <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
                  <div class="caption">
                    <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                    <p><?php echo $product['description']; ?></p>
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
                    <?php } ?>
                    <?php if ($product['price']) { ?>
                    <p class="price">
                      <?php if (!$product['special']) { ?>
                      <?php echo $product['price']; ?>
                      <?php } else { ?>
                      <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                      <?php } ?>
                      <?php if ($product['tax']) { ?>
                      <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                      <?php } ?>
                    </p>
                    <?php } ?>
                  </div>
                  <div class="button-group">
                    <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span> <i class="fa fa-shopping-cart"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
                  </div>
                </div>
              </div>
              <?php if (($column_left && $column_right) && ($i % 2 == 0)) { ?>
              <div class="clearfix visible-md visible-sm"></div>
              <?php } elseif (($column_left || $column_right) && ($i % 3 == 0)) { ?>
              <div class="clearfix visible-md"></div>
              <?php } elseif ($i % 4 == 0) { ?>
              <div class="clearfix visible-md"></div>
              <?php } ?>
              <?php $i++; ?>
              <?php } ?>
            </div>
            <?php } ?>
            <?php if ($tags) { ?>
            <p><?php echo $text_tags; ?>
              <?php for ($i = 0; $i < count($tags); $i++) { ?>
              <?php if ($i < (count($tags) - 1)) { ?>
              <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
              <?php } else { ?>
              <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
              <?php } ?>
              <?php } ?>
            </p>
            <?php } ?>
            <?php echo $content_bottom; ?></div>
          <?php echo $column_right; ?></div>
      </div> -->
      </div> <!-- row end -->

      <!-- Related products -->
      <?php include('catalog/view/theme/default/template/partials/related-products.php');?>

      </div> <!-- wrapper end -->
  </div>
</div>

<!-- Hidden fields for add to cart -->
<div>
  <input type="hidden" value="<?php echo $product_id ;?>" id="product-id" />
  <input type="hidden" value="<?php echo $option['product_option_id']; ?>" id="product-option-id" />
  <input type="hidden" value="" id="product-option-value" />
</div>

<?php echo $footer; ?>