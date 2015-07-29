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

window.setTimeout(function() { $('#search').keyup();}, 1000);


var regions=["الحي اﻷول","الحي الثاني","الحي الثالث","الحي الرابع","الحي الخامس","الحي المتميز"]
var neighbours=["المجاورة اﻷولى","المجاورة الثانية","المجاورة الثالثة","المجاورة الرابعة","المجاورة الخامسة","المجاورة السادسة"]
var beach=["الشاطئ","الشابيهات","العمارات اﻷهلية"]
var matar=["قرب الكمين","بعد الكوبري","قرب الطريق الدولي"]
var port=["قرب الكمين","قرب المدينة"]
var factory=["المنطقة اﻷولى","المنطقة الثانية","المنطقة الثالثة","المنطقة الرابعة"]

$(document).on('keyup','#search',function(){
		var x=($('#search').val()).trim()
		if (x.length>0){
		$('#search_key').click();
		}
	});


$(function(){
	$('#agent_region').change(function(){

	if (jQuery.inArray( $('#agent_region').val(), regions) != (-1) ){
			//alert($('#agent_region').val());

		// first, remove all options before filling it with the correct options
		 	 $('#agent_neighbour').find('option').each(function() {
   			 $(this).remove();	});

		 	 // second, fill it with the correct options related to the selected region
		 	var optionsAsString = "";
			for(var i = 0; i < neighbours.length; i++) {
    		optionsAsString += "<option value='" + neighbours[i] + "'>" + neighbours[i] + "</option>";
				} // of for
		 	$('#agent_neighbour').append( optionsAsString );
	}


	if ($('#agent_region').val() == "منطقة الشاليهات"){
		 	// alert($('#agent_region').val());
		 	 // first, remove all options before filling it with the correct options
		 	 $('#agent_neighbour').find('option').each(function() {
   			 $(this).remove();	});

		 	 // second, fill it with the correct options related to the selected region
		 	var optionsAsString = "";
			for(var i = 0; i < beach.length; i++) {
    		optionsAsString += "<option value='" + beach[i] + "'>" + beach[i] + "</option>";
				} // of for
		 	$('#agent_neighbour').append( optionsAsString );
	} // of if

	if ($('#agent_region').val() == "طريق الميناء"){
		 	 //alert($('#agent_region').val());
		 	 // first, remove all options before filling it with the correct options
		 	 $('#agent_neighbour').find('option').each(function() {
   			 $(this).remove();	});

		 	 // second, fill it with the correct options related to the selected region
		 	var optionsAsString = "";
			for(var i = 0; i < port.length; i++) {
    		optionsAsString += "<option value='" + port[i] + "'>" + port[i] + "</option>";
				} // of for
		 	$('#agent_neighbour').append( optionsAsString );
	} // of if

	if ($('#agent_region').val() == "المنطقة الصناعية"){
		 	 //alert($('#agent_region').val());
		 	 // first, remove all options before filling it with the correct options
		 	 $('#agent_neighbour').find('option').each(function() {
   			 $(this).remove();	});

		 	 // second, fill it with the correct options related to the selected region
		 	var optionsAsString = "";
			for(var i = 0; i < factory.length; i++) {
    		optionsAsString += "<option value='" + factory[i] + "'>" + factory[i] + "</option>";
				} // of for
		 	$('#agent_neighbour').append( optionsAsString );
	} // of if


	if ($('#agent_region').val() == "طريق المطار"){
		 	// alert($('#agent_region').val());
		 	 // first, remove all options before filling it with the correct options
		 	 $('#agent_neighbour').find('option').each(function() {
   			 $(this).remove();	});

		 	 // second, fill it with the correct options related to the selected region
		 	var optionsAsString = "";
			for(var i = 0; i < matar.length; i++) {
    		optionsAsString += "<option value='" + matar[i] + "'>" + matar[i] + "</option>";
				} // of for
		 	$('#agent_neighbour').append( optionsAsString );
	} // of if



	});
});

// this is the "New-Domiat" link , to reloal all page on clicking
$(function(){
			$(".navbar-brand").click(function(){
            location.reload(true); 
												});
			});


// $("#back_key").click(function(){
// 	//alert("the button clicked.");
//      window.history.back(-1);
//  });
// });


// $(function(){
// $('#agent_day_off').chosen();
//  			});

$(document).on('click','.ui-autocomplete .ui-menu-item',function(event,ui){

alert($(this).text());
    $.ajax({
	 beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},

											        type: 'GET', 
											        url: '/find/show' , 
											        dataType: 'script',
											        data: { search: $(this).text() }

											    });
});


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
