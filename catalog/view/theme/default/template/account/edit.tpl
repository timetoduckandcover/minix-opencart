<?php echo $header; ?>
<div id="page-with-sidebar">

  <div class="pws-header">
    <h1><?php echo $heading_title; ?></h1>
  </div>

  <div class="wrapper padding">
    
    <!-- Breadcrumbs -->
    <?php include('catalog/view/theme/default/template/partials/breadcrumbs.php') ;?>

    <!-- Content -->
    <div class="row">

      <div class="col-xs-12 col-md-3">
        <?php include('catalog/view/theme/default/template/partials/account-sidebar.php');?>
      </div>

      <div class="col-xs-12 col-md-9 page-wyziwig">

        <!-- Error handling -->
        <?php if ($error_warning) { ?>
          <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
        <?php } ?>

        <!-- Wyziwig content will go here -->
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
          <fieldset>
            <legend><?php echo $text_your_details; ?></legend>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-firstname"><?php echo $entry_firstname; ?> </label>
              <div class="col-sm-10">
                <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
                <?php if ($error_firstname) { ?>
                <div class="text-danger"><?php echo $error_firstname; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
              <div class="col-sm-10">
                <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
                <?php if ($error_lastname) { ?>
                <div class="text-danger"><?php echo $error_lastname; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
              <div class="col-sm-10">
                <input type="email" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                <?php if ($error_email) { ?>
                <div class="text-danger"><?php echo $error_email; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
              <div class="col-sm-10">
                <input type="tel" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
                <?php if ($error_telephone) { ?>
                <div class="text-danger"><?php echo $error_telephone; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-fax"><?php echo $entry_fax; ?></label>
              <div class="col-sm-10">
                <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-fax" class="form-control" />
              </div>
            </div>
            <?php foreach ($custom_fields as $custom_field) { ?>
            <?php if ($custom_field['location'] == 'account') { ?>
            <?php if ($custom_field['type'] == 'select') { ?>
            <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
              <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
              <div class="col-sm-10">
                <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                  <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                  <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
                <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($custom_field['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
              <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
              <div class="col-sm-10">
                <div>
                  <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                  <div class="radio">
                    <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                    <label>
                      <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                      <?php echo $custom_field_value['name']; ?></label>
                    <?php } else { ?>
                    <label>
                      <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                      <?php echo $custom_field_value['name']; ?></label>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div>
                <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($custom_field['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
              <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
              <div class="col-sm-10">
                <div>
                  <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                  <div class="checkbox">
                    <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $account_custom_field[$custom_field['custom_field_id']])) { ?>
                    <label>
                      <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                      <?php echo $custom_field_value['name']; ?></label>
                    <?php } else { ?>
                    <label>
                      <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                      <?php echo $custom_field_value['name']; ?></label>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div>
                <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($custom_field['type'] == 'text') { ?>
            <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
              <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
              <div class="col-sm-10">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($custom_field['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
              <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
              <div class="col-sm-10">
                <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
                <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($custom_field['type'] == 'file') { ?>
            <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
              <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
              <div class="col-sm-10">
                <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : ''); ?>" />
                <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($custom_field['type'] == 'date') { ?>
            <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
              <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
              <div class="col-sm-10">
                <div class="input-group date">
                  <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
                <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($custom_field['type'] == 'time') { ?>
            <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
              <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
              <div class="col-sm-10">
                <div class="input-group time">
                  <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
                <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($custom_field['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($custom_field['required'] ? ' required' : ''); ?> custom-field" data-sort="<?php echo $custom_field['sort_order']; ?>">
              <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
              <div class="col-sm-10">
                <div class="input-group datetime">
                  <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
                <?php if (isset($error_custom_field[$custom_field['custom_field_id']])) { ?>
                <div class="text-danger"><?php echo $error_custom_field[$custom_field['custom_field_id']]; ?></div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </fieldset>
          <div class="buttons clearfix">
            <div class="pull-left"><a href="<?php echo $back; ?>" class="btn btn-default"><?php echo $button_back; ?></a></div>
            <div class="pull-right">
              <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
            </div>
          </div>
        </form>

      </div>
    </div>

  </div>

  </div>
</div>
<?php echo $footer; ?>