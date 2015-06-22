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
          sidebar needed?
        </div>

        <div class="col-xs-12 col-md-9 page-wyziwig">
            <?php echo $text_message; ?>
            <div class="pull-left"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
        </div>
      </div>
   </div>
</div>
<?php echo $footer; ?>