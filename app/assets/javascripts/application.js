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
// var map = new google.maps.Map(document.getElementById('map'), {
//     center: new google.maps.LatLng(40.718217,-73.998284),
//     zoom: 13,
//     mapTypeId: google.maps.MapTypeId.ROADMAP
// });
$(document).ready(function() {
      L.mapbox.accessToken = 'pk.eyJ1IjoibWFkb3VoIiwiYSI6ImE0MDU0OWFhZjZmYjY1NDMwYmY4NTE3NzkyNDE1ZDFmIn0.-ECw3qHWXfcdWp4yCu1oLQ';
      var map = L.mapbox.map('map', 'mapbox.streets-satellite')
      .setView([31.442585, 31.677682], 15);
      });

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

 // fading the alert div in detail view and then fade it In 
 // and doing this again on clicking on advanced search link

 $(document).on('click',"#bs-example-navbar-collapse-1 > ul:nth-child(1) > li.active > a",function(){
// alert("from advanced");
		 $("div.alert>code:eq(0)").trigger("change");

 });

$(document).on('change',"div.alert>code:eq(0)",function(){
	// alert("from change");
$("div.alert").fadeOut(500);
$("div.alert").fadeIn(1500);
});



// $("#back_key").click(function(){
// 	//alert("the button clicked.");
//      window.history.back(-1);
//  });
// });

											    // });

// $(function(){
// $('#agent_day_off').chosen();
//  			});

$(document).on('click','.ui-autocomplete .ui-menu-item',function(event,ui){

//alert($(this).text());
    $.ajax({
	 beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},

											        type: 'GET', 
											        url: '/find/corrupt' , 
											        dataType: 'script',
											        data: { search: $(this).text() }

											    });
});

// $(function(){
// 			$('#activity_select').click(function(){

$(document).on('click','#activity_select',function(event,ui){
		if ($('#activity_select').val() != "") {
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
