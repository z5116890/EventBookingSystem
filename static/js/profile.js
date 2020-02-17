$(document).ready(function() {
	const text = $('.profile-description').html().replace(/\n/g, '<br>');
	$('.profile-description').html(text);
});