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
            <div class="table-responsive">
              <table class="table table-bordered table-hover">
                <thead>
                  <tr>
                    <td class="text-left"><?php echo $column_date_added; ?></td>
                    <td class="text-left"><?php echo $column_description; ?></td>
                    <td class="text-right"><?php echo $column_amount; ?></td>
                  </tr>
                </thead>
                <tbody>
                  <?php if ($transactions) { ?>
                  <?php foreach ($transactions  as $transaction) { ?>
                  <tr>
                    <td class="text-left"><?php echo $transaction['date_added']; ?></td>
                    <td class="text-left"><?php echo $transaction['description']; ?></td>
                    <td class="text-right"><?php echo $transaction['amount']; ?></td>
                  </tr>
                  <?php } ?>
                  <?php } else { ?>
                  <tr>
                    <td colspan="5"><?php echo $text_empty; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
        </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>