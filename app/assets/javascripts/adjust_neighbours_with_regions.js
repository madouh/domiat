
// =========================================================================
// controlling the attachments between the region and neighbours user inputs
var regions=["الحي اﻷول","الحي الثاني","الحي الثالث","الحي الرابع","الحي الخامس","الحي المتميز","المنطة المركزية"]
var neighbours=["المجاورة اﻷولى","المجاورة الثانية","المجاورة الثالثة","المجاورة الرابعة","المجاورة الخامسة","المجاورة السادسة"]
var beach=["الشاطئ","الشابيهات","العمارات اﻷهلية"]
var matar=["قرب الكمين","بعد الكوبري","قرب الطريق الدولي"]
var port=["قرب الكمين","قرب المدينة"]
var factory=["المنطقة اﻷولى","المنطقة الثانية","المنطقة الثالثة","المنطقة الرابعة"]
var centeral=["بجوار المركز اﻹسلامي","بجوار قصر الثقافة","ستي مول","بجوار الكنيسة","بجوار مركز العيون","بجوار بنك فيصل","بجوار بنك القاهرة"]

$(document).on('change','#agent_region',function(){
	

	if (jQuery.inArray( $('#agent_region').val(), regions) != (-1) ){

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

if ($('#agent_region').val() == "المنطقة المركزية"){
		 	 // first, remove all options before filling it with the correct options
		 	 $('#agent_neighbour').find('option').each(function() {
   			 $(this).remove();	});

		 	 // second, fill it with the correct options related to the selected region
		 	var optionsAsString = "";
			for(var i = 0; i < centeral.length; i++) {
    		optionsAsString += "<option value='" + centeral[i] + "'>" + centeral[i] + "</option>";
				} // of for
		 	$('#agent_neighbour').append( optionsAsString );
	} // of if



	// });
});