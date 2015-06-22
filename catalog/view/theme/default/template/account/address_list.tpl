<?php echo $header; ?>
<div id="page-with-sidebar">

  <div class="pws-header">
    <h1><?php echo $heading_title; ?></h1>
  </div>

  <div class="wrapper padding">

    <!-- Breadcrumbs -->
    <?php include('catalog/view/theme/default/template/partials/breadcrumbs.php') ;?>

    <!-- Error handling -->
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
    <?php } ?>
    <?php if ($error_warning) { ?>
    <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
    <?php } ?>


    <div class="row">

      <div class="col-xs-12 col-md-3">
        <?php include('catalog/view/theme/default/template/partials/account-sidebar.php');?>
      </div>

      <div class="col-xs-12 col-md-9 page-wyziwig">


          <?php if ($addresses) { ?>
            <table class="table table-bordered table-hover pws-table">
              <?php foreach ($addresses as $result) { ?>
                <tr>
                  <td class="text-left"><?php echo $result['address']; ?></td>
                  <td class="text-right"><a href="<?php echo $result['update']; ?>" class="btn btn-info"><?php echo $button_edit; ?></a> &nbsp; <a href="<?php echo $result['delete']; ?>" class="btn btn-danger"><?php echo $button_delete; ?></a></td>
                </tr>
              <?php } ?>
            </table>
          <?php } else { ?>
            <p><?php echo $text_empty; ?></p>
          <?php } ?>

          <div class="row">
            <div class="col-xs-12">
              <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
              <div class="pull-right"><a href="<?php echo $add; ?>" class="btn btn-primary"><?php echo $button_new_address; ?></a></div>
            </div>
          </div>

      </div>
  </div>
</div>
<?php echo $footer; ?>