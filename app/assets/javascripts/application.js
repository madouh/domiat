// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui/autocomplete
//= require jquery_ujs
//= require chosen-jquery
//= require bootstrap.min
//= require turbolinks
//= require_tree .

// =========================================================================
//when the text input #search keyup , verify that its content is none null 
// and send form by calling the click event one the search key
$(document).on('keyup','#search',function(){
		var x=($('#search').val()).trim()
		if (x.length>1){
		$('#search_key').click();
		}
	});

// =========================================================================
// delay the #search keyup() event for one second only
window.setTimeout(function() { $('#search').keyup();}, 1000);


// =========================================================================
// this is the "New-Domiat" link , to reloal all page on clicking
// $(document).on('click','#bs-example-navbar-collapse-1 > ul:nth-child(1) > li.active > a',function(){			
// window.location.href = '/';
// window.location.reload(true);
// 			});

// =========================================================================
 // fading the alert div in detail view and then fade it In 
 // and doing this again on clicking on advanced search link
 $(document).on('click',"#bs-example-navbar-collapse-1 > ul:nth-child(1) > li.active > a",function(){
		 $("div.alert>code:eq(0)").trigger("change");

 });

// =========================================================================
// fading out all divs and fade in all divs with class "now"
$(document).on('change',"div.alert>code:eq(0)",function(){
$("div.now").fadeIn(1500);
});

// =========================================================================
// on clicking on autocompele drop down 
//make ajax to find corrupt to corrupt the selected item

$(document).on('click','.ui-autocomplete .ui-menu-item',function(event,ui){
    $.ajax({
	 beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},

											        type: 'GET', 
											        url: '/find/corrupt' , 
											        dataType: 'script',
											        data: { search: $(this).text() }

											    });
});

// =========================================================================
// make ajax to action ads in find controller when clicking on activity in detail page to enable the other inputs and 
// get the first five agents to be rendered in the side bar div
$(document).on('click','#activity_select',function(event,ui){
		if ($('#activity_select').val() != "") {
			$("div.alert").hide();

			$('.active_after_activity').attr( "disabled", false );

$.ajax({
	 beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},

										        type: 'GET', 
											        url: '/find/ads' , 
											        dataType: 'script',
											        data: { activity: $('#activity_select').val() }

											    });
				}
			else {
			$('.active_after_activity').attr( "disabled", true );

			}
								});



















						// });
// $(function() {
//  $("#search").autocomplete({select: function(event,ui) { 

//  												//var subject = $('#search');
//  												//$('#name').text(ui.item.value);
// 											    $.ajax({
// 	 beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},

// 											        type: 'GET', 
// 											        url: '/find/show' , 
// 											        dataType: 'script',
// 											        data: { search: ui.item.value }

// 											    });
// 											}});
	    	

// 											    });
// $("#back_key").click(function(){
// 	//alert("the button clicked.");
//      window.history.back(-1);
//  });
// });

											    // });

// $(function(){
// $('#agent_day_off').chosen();
//  			});