(() => {
	function load_session(session_idx) {
		var event_id = window.location.pathname.split('/event/')[1];
		if (session_idx === 0) {
			return;
		}
		$.ajax({ 
		    type: 'GET', 
		    url: '/load_session', 
		    data: {
		    	event_id: event_id,
		    	session_idx: session_idx,
		    },
		    context: this,
		    success: function(data) {
		    	if (data.status === 'unsuccess') {
		    		return;
		    	}
	    		$('#event_session').html(data.html);
	    		$('#session_idx').text('session ' + session_idx);		    	
		    	if (data.status === 'loaded') {
		    		if ($('.session_detail').children().eq(0).attr('class').split('-')[1] === 'True') {
		    			$('#attend_button').html(`
		    				<button type="button" class="btn btn-outline-warning" data-toggle="modal" data-target="#confirm_modal">Deregister</button>
		    			`)
		    			$('#confirm_modal-Label').text('Cancel Confirmation');
		    			$('.confirm_modal_body').text('Are you sure you want to cancel this reservation for this session?');
		    			$('#confirm').attr({'action': '/deregister'});
		    		} else {
		    			$('#attend_button').html(`<button type="button" class="btn btn-outline-info" 
		    				data-toggle="modal" data-target="#confirm_modal">Reserve</button>`);
		    			$('#confirm_modal-Label').text('Reserve Confirmation');
		    			$('.confirm_modal_body').text('Are you sure you want to reserve this session? (Free of charge)');
		    			$('#confirm').attr({'action': '/attend_session'});

		    			if (data.user_type === 'guest') {
		    				$('.confirm_modal_body').text('Are you sure you want to reserve this session? You will be changed $100 as a registration fee.');

		    				if (data.early_bird) {
		    					$('.confirm_modal_body').text('Are you sure you want to reserve this session? You will be changed $50 (50% Early Bird Discount) as a registration fee.');
		    				}
		    			} else if (data.user_type === 'convenor') {
			    			$('#attend_button').html(`
							<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#login_modal">Convenor</button>
			    			`);			    				
		    			}

		    		}
	    		}

	    		if (data.status === 'full') {
	    			$('#attend_button').html(`
    				<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#login_modal">FULL</button>
	    			`);		    			
	    		}

	    		if (data.status === 'unauth') {
	    			$('#attend_button').html(`
    				<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#login_modal">Login to reserve</button>
	    			`);
	    		}
	    		if (data.status === 'past_deregister_timeframe') {
	    			$('#attend_button').html(`
    				<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#login_modal">Unable to Deregister</button>
	    			`);
	    		}
	    		if (data.status === 'event_ended') {
	    			$('#attend_button').html(`
    				<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#login_modal">Event ended</button>
	    			`);	    			
	    		}
	    		if (data.status === 'event_closed') {
	    			$('#attend_button').html(`
    				<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#login_modal">Event closed</button>
	    			`);	    			
	    		}
	    		if (data.status === 'event_cancelled') {
	    			$('#attend_button').html(`
    				<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#login_modal">Event cancelled</button>
	    			`);	    			
	    		}
		    }
		});	
	}


	$(document).ready(function() {
		$('#prev-session').click(function() {
			var session_idx = $('#session_idx').text().split('session ')[1];
			load_session(parseInt(session_idx) - 1);
		});

		$('#next-session').click(function() {
			var session_idx = $('#session_idx').text().split('session ')[1];
			load_session(parseInt(session_idx) + 1);
		});

		$('.event-photo').each(function(idx, e) {
			$(e).click(function() {
				$('.navbar').css('z-index', -1);
			    $('#photo-modal').css("display","block");
			    $('#img').attr("src", $(this).attr('src'));
				$('#caption').html($(this).attr('alt'));
			});
		});

		var closeButton = $(".close-button").eq(0);
		closeButton.on('click', function() {
			$('#photo-modal').css('display', 'none');
			$('.navbar').css('z-index', 2000);
		});

		const text = $('.event-description').html().replace(/\n/g, '<br>')
		$('.event-description').html(text)
	});

	$('#event_session').ready(function() {	
		var session_idx = $('#session_idx').text().split('session ')[1];
		load_session(parseInt(session_idx));
	});

	$(document).on('click', '#confirm', function(){
		const str = $('.session_detail').children().eq(0).attr('class');
		const event_id = window.location.pathname.split('/event/')[1]; 
		const regex = /row ([0-9]+)-[a-zA-Z]*/g;
		const session_id = regex.exec(str)[1];
		const elem = this;

		$('.confirm_modal_body').html(
		`
		<div class="row">
			<div class="col text-center">
				<i class="fa fa-spinner fa-spin" style="font-size:48px"></i>
				<h4>Loading</h4>
			</div>
		</div>
		`)

		$.ajax({ 
	    type: $(elem).attr('method'), 
	    url: elem.action,
	    data: {
	    	session_id: session_id,
	    	event_id: event_id,
	    },
	    context: this,
	    success: function(data) {
	    	setTimeout(function() {
		    	if (data.status === 'success') {
		    		if (elem.action.indexOf('attend_session') !== -1) {
	    				$('.confirm_modal_body').html(
							`
							<h6 style="text-align: center;">Your reservation is complete, a confirmation email will be sent to your email address<h6>
							`);
		    		} else {
	    				$('.confirm_modal_body').html(
							`
							<h6 style="text-align: center;">You have cancelled your attendance for this event.<h6>
							`);
		    		}
    				$('.confirm_modal_footer').html(
    					`<button onclick="location.reload();" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
    					`
    				);
		    	} 
	    	}, 700)
	    }
	    });
	    return false;
	});
})()