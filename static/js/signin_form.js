$(document).on('submit', '#signin_form', function(){
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
                    $('#signin_modal').html(data);
                    guest_speaker_checkbox();
                    $('#signin_confirm_password').change(function() {
                        passwordValidation()
                    });
                }
            }, 700);
        }
    });

    return false;
});

function guest_speaker_checkbox() {
    $('#guest_speaker_checkbox').change(function() {
        if ($(this).is(':checked')) {
            var description = $(`
                <div id="guest_speaker_description">
                    <hr>
                    <div class="form-group row">
                      <label class="col-sm-5 col-form-label" for="input_password">Guest Description</label>
                      <div class="col-sm-7">
                        <textarea type="text" name="description" class="form-control" id="guest_speaker_description_textarea" placeholder="Please enter your description"></textarea>
                      </div>
                    </div>
                </div>
            `)
            $('#guest_speaker_checkbox').parent().parent().append(description);
        } else {
            $('#guest_speaker_description').remove();
        }
    });
}

function passwordValidation() {
    let signin_confirm_password = $('#signin_confirm_password');
    if ($('#signin_password').val() !== $('#signin_confirm_password').val()) {
        signin_confirm_password[0].setCustomValidity("Passwords Don't Match");
        return false;
    } else {
        signin_confirm_password[0].setCustomValidity('');
    }
    return true;
}


$(document).ready(function(){
    $('#signin_confirm_password').change(function() {
        passwordValidation()
    });

    guest_speaker_checkbox();
});