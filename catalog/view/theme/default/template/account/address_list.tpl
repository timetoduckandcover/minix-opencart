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
        <?php include('catalog/view/theme/default/template/partials/informationsidebar.tpl');?>
      </div>

      <div class="col-xs-12 col-md-9 page-wyziwig">
        <div id="content">
          <?php echo $content_top; ?>
          <h2><?php echo $text_address_book; ?></h2>
          <?php if ($addresses) { ?>
          <table class="table table-bordered table-hover">
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
          <div class="buttons clearfix">
            <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
            <div class="pull-right"><a href="<?php echo $add; ?>" class="btn btn-primary"><?php echo $button_new_address; ?></a></div>
          </div>
          <?php echo $content_bottom; ?></div>
          <?php echo $column_right; ?></div>
      </div>
  </div>
</div>
<?php echo $footer; ?>