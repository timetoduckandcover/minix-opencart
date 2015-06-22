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
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
            <fieldset>
              <legend class="hidden"><?php echo $text_password; ?></legend>
              <div class="form-group required row">
                <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
                <div class="col-sm-10">
                  <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
                  <?php if ($error_password) { ?>
                  <div class="text-danger"><?php echo $error_password; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required row">
                <label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
                <div class="col-sm-10">
                  <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
                  <?php if ($error_confirm) { ?>
                  <div class="text-danger"><?php echo $error_confirm; ?></div>
                  <?php } ?>
                </div>
              </div>
            </fieldset>
            <div class="row">
              <div class="col-xs-12">
                <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
                <div class="pull-right">
                  <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
                </div>
              </div>
            </div>
          </form>
        </div>

    </div>
  </div>

</div>

<?php echo $footer; ?>