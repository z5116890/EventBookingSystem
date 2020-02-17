$(document).on('submit', '#login_form', function(){
	$('.modal-body').html(
		`
		<div class="row">
			<div class="col text-center">
				<i class="fa fa-spinner fa-spin" style="font-size:48px"></i>
				<h4>Loading</h4>
			</div>
		</div>
		`)
	$.ajax({ 
        type: $(this).attr('method'), 
        url: this.action, 
        data: $(this).serialize(),
        context: this,
        success: function(data, status) {
        	setTimeout(function() {
    	    	if (data.status === 'success') {
    	    		location.reload();
    	    	} else {
    	        	$('#login_modal').html(data);
                    bind_checkbox_event();
    	    	}
        	}, 700);
        }
    });
    return false;
});

$(document).on('submit', '#logout', function(){
	$.ajax({ 
        type: $(this).attr('method'), 
        url: this.action, 
        data: $(this).serialize(),
        context: this,
        success: function(data, status) {
        	if (data.status === 'success') {
        		$('#logout_modal').modal('show');
        		setTimeout(function() {
        			location.reload();
        		}, 1000);
        	}
        }
    });
    return false;
});


function bind_checkbox_event() {
    $('#guest_login_checkbox').change(function() {
        if ($(this).is(':checked')) {
            let label = $('label[for=input_zid]');
            let input = label.next().children();         
            label.text('Email');
            label.attr('for', 'input_email');

            input.attr('placeholder', 'Please enter your email address');
            input.attr('name', 'email');
            input.attr('id', 'input_email');
        } else {
            let label = $('label[for=input_email]');
            let input = label.next().children();              
            label.text('ZID');
            label.attr('for', 'input_zid');

            input.attr('placeholder', 'Please enter your ZID');
            input.attr('name', 'zid');
            input.attr('id', 'input_zid');            
        }
    });
}

$(document).ready(function(){
    $(window).scroll(function() {
		if ($(window).scrollTop()) {
			$('.navbar').addClass('bg-dark');
		} else {
			$('.navbar').removeClass('bg-dark');
		}
	});
    bind_checkbox_event();
});