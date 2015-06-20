
  // Sort the custom fields
  $('.form-group[data-sort]').detach().each(function() {
  	if ($(this).attr('data-sort') >= 0 && $(this).attr('data-sort') <= $('.form-group').length) {
  		$('.form-group').eq($(this).attr('data-sort')).before(this);
  	}

  	if ($(this).attr('data-sort') > $('.form-group').length) {
  		$('.form-group:last').after(this);
  	}

  	if ($(this).attr('data-sort') < -$('.form-group').length) {
  		$('.form-group:first').before(this);
  	}
  });

  $('button[id^=\'button-custom-field\']').on('click', function() {
  	var node = this;

  	$('#form-upload').remove();

  	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

  	$('#form-upload input[name=\'file\']').trigger('click');

  	if (typeof timer != 'undefined') {
      	clearInterval(timer);
  	}

  	timer = setInterval(function() {
  		if ($('#form-upload input[name=\'file\']').val() != '') {
  			clearInterval(timer);

  			$.ajax({
  				url: 'index.php?route=tool/upload',
  				type: 'post',
  				dataType: 'json',
  				data: new FormData($('#form-upload')[0]),
  				cache: false,
  				contentType: false,
  				processData: false,
  				beforeSend: function() {
  					$(node).button('loading');
  				},
  				complete: function() {
  					$(node).button('reset');
  				},
  				success: function(json) {
  					$(node).parent().find('.text-danger').remove();

  					if (json['error']) {
  						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
  					}

  					if (json['success']) {
  						alert(json['success']);

  						$(node).parent().find('input').attr('value', json['code']);
  					}
  				},
  				error: function(xhr, ajaxOptions, thrownError) {
  					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
  				}
  			});
  		}
  	}, 500);
  });

  $('.date').datetimepicker({
  	pickTime: false
  });

  $('.datetime').datetimepicker({
  	pickDate: true,
  	pickTime: true
  });

  $('.time').datetimepicker({
  	pickDate: false
  });
