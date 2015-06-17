<?php echo $header; ?>

<div id="page-with-sidebar">

  <div class="pws-header">
    <h1><?php echo $heading_title; ?></h1>
  </div>

  <div class="header-push less">
    <div class="wrapper padding">

      <!-- Breadcrumbs -->
      <?php include('catalog/view/theme/default/template/partials/breadcrumbs.php') ;?>

      <!-- Content -->
      <div class="row">
        <div class="col-xs-12 col-md-3">
     <!--      <?php include('partials/pages/page-partials/page-sidebar.php');?> -->
        </div>
        <div class="col-xs-12 col-md-9 page-wyziwig">

          <!-- Wyziwig content will go here -->
          <?php echo $description; ?>

        </div>
      </div>

    </div>
  </div>

</div>

<?php echo $footer; ?>