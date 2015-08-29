$(document).on('change','#agent_twenty_four',function(){
	if ($(this).hasClass('not_checked')){
		$('#new_agent > div > div > div:nth-child(2) > div:nth-child(5)>*').prop('disabled', true);
		$('#new_agent > div > div > div:nth-child(2) > div:nth-child(6)>*').prop('disabled', true);
		$(this).removeClass('not_checked');

		}
	else {
		$('#new_agent > div > div > div:nth-child(2) > div:nth-child(5)>*').prop('disabled', false);
		$('#new_agent > div > div > div:nth-child(2) > div:nth-child(6)>*').prop('disabled', false);
		$(this).addClass('not_checked');

		}
	});
