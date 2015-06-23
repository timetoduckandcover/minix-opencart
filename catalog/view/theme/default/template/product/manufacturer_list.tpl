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
          <?php echo $column_left;?>
        </div>

        <div class="col-xs-12 col-md-9 page-wyziwig">
            <?php if ($categories) { ?>
              <p><strong><?php echo $text_index; ?></strong>
                <?php foreach ($categories as $category) { ?>
                &nbsp;&nbsp;&nbsp;<a href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><?php echo $category['name']; ?></a>
                <?php } ?>
              </p>
              <?php foreach ($categories as $category) { ?>
              <h2 id="<?php echo $category['name']; ?>"><?php echo $category['name']; ?></h2>
              <?php if ($category['manufacturer']) { ?>
              <?php foreach (array_chunk($category['manufacturer'], 4) as $manufacturers) { ?>
              <div class="row">
                <?php foreach ($manufacturers as $manufacturer) { ?>
                <div class="col-sm-3"><a href="<?php echo $manufacturer['href']; ?>"><?php echo $manufacturer['name']; ?></a></div>
                <?php } ?>
              </div>
              <?php } ?>
              <?php } ?>
              <?php } ?>
              <?php } else { ?>
              <p><?php echo $text_empty; ?></p>
              <div class="buttons clearfix">
                <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
              </div>
            <?php } ?>
        </div>
    </div>
  </div>
</div>

<?php echo $footer; ?>