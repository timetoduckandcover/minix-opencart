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
            <?php if ($returns) { ?>
              <table class="table table-bordered table-hover">
                <thead>
                  <tr>
                    <td class="text-right"><?php echo $column_return_id; ?></td>
                    <td class="text-left"><?php echo $column_status; ?></td>
                    <td class="text-left"><?php echo $column_date_added; ?></td>
                    <td class="text-right"><?php echo $column_order_id; ?></td>
                    <td class="text-left"><?php echo $column_customer; ?></td>
                    <td></td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($returns as $return) { ?>
                  <tr>
                    <td class="text-right">#<?php echo $return['return_id']; ?></td>
                    <td class="text-left"><?php echo $return['status']; ?></td>
                    <td class="text-left"><?php echo $return['date_added']; ?></td>
                    <td class="text-right"><?php echo $return['order_id']; ?></td>
                    <td class="text-left"><?php echo $return['name']; ?></td>
                    <td><a href="<?php echo $return['href']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a></td>
                  </tr>
                  <?php } ?>
                </tbody>
              </table>
              <div class="text-right"><?php echo $pagination; ?></div>
            <?php } else { ?>
              <p><?php echo $text_empty; ?></p>
            <?php } ?>
        </div>
    </div>
  </div>
</div>

<?php echo $footer; ?>