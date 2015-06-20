<?php echo $header; ?>

<div id="page-with-sidebar">

  <div class="pws-header">
    <h1><?php echo $heading_title; ?></h1>
  </div>

  <div class="header-push less">
    <div class="wrapper padding">
      
      <!-- Breadcrumbs -->
      <?php include('catalog/view/theme/default/template/partials/breadcrumbs.php') ;?>
  
      <!-- Logged in? -->
      <?php if ($success) { ?>
        <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
      <?php } ?>

      <!-- Content -->
      <div class="row">

        <div class="col-xs-12 col-md-3">
          <?php include('catalog/view/theme/default/template/partials/informationsidebar.tpl');?>
        </div>

        <div class="col-xs-12 col-md-9 page-wyziwig">
          <h2 class="epsilon"><?php echo $text_my_account; ?></h2>
          <ul>
            <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
            <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
            <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
            <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          </ul>
          <h2 class="epsilon"><?php echo $text_my_orders; ?></h2>
          <ul>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
            <?php if ($reward) { ?>
            <li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
            <?php } ?>
            <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li><a href="<?php echo $recurring; ?>"><?php echo $text_recurring; ?></a></li>
          </ul>
          <h2 class="epsilon"><?php echo $text_my_newsletter; ?></h2>
          <ul>
            <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
          </ul>

          <div>
            <?php echo $content_bottom; ?></div>
            <?php echo $column_right; ?></div>
          </div>

        </div>

      </div>

  </div>
</div>

<?php echo $footer; ?>