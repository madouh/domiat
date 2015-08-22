       function map_render(name,activity,brief_of_activity,starting,ending,tel1,tel3,tel3,region,neighbour,street,address,twenty_four,lat,lang) {
      	var map, infoBubble;
        var mapCenter = new google.maps.LatLng(31.44235,31.123456);

        map = new google.maps.Map(document.getElementById("map-canvas"), {
          zoom: 15,
          center: mapCenter,
          mapTypeId: google.maps.MapTypeId.HYBRID
        });
        var marker = new google.maps.Marker({
          map: map,
          position: new google.maps.LatLng(lat ,lang),
          draggable: false,
          title:name + "   "+ activity
        });
		// google.maps.event.addDomListener(map, 'click', function(e){
	 // alert("I am clicked");
  //     	console.log(e)});

        infoBubble = new InfoBubble({
          maxWidth: 600
        });

        infoBubble.open(map, marker);

        var div1 = document.createElement('DIV');
        var div2 = document.createElement('DIV');
        var div3 = document.createElement('DIV');
        var div4 = document.createElement('DIV');
         
        div1.innerHTML = '<br><h5>'+'<b>'+'النشاط : '+ activity +'</b></h5>'+'<p><b>'+'مختصر عن النشاط : '+brief_of_activity +'</p>';
        div2.innerHTML = '<br><p>'+'<b>'+'ت '+tel1 +'</p>'+'<p><b>'+'ت '+tel2 +'</p>'+'<p><b>'+'ت '+ tel3 +'</p>';
        div3.innerHTML ='<br><p>'+'<b>الحي أو المنطقة</b>: '+ region  +'</p>' + '<p><b>المجاورة أو الناحية</b>:'+neighbour+'</p>'+'<p>'+'<b>الشارع</b>: '+street+'</p>'+'<p>'+'<b>العنوان</b>: '+ address +'</p>' ;
        div4.innerHTML ='<br><p>'+'<b>بداية العمل </b>'+ starting +'</p>' + '<p><b>نهاية العمل </b>'+ ending +'</p>'+'<p><b>'+ twenty_four +'' ;
        
        infoBubble.addTab('<b style="font-size:14px; color:red;">'+ name +'</b>', div1);
        infoBubble.addTab('<b style="font-size:14px; color:blue;">'+'تليفونات '+'</b>', div2);
        infoBubble.addTab('<b style="font-size:14px; color:green;">'+'العنوان'+'</b>', div3);
        infoBubble.addTab('<b style="font-size:14px; color:black;">'+'مواقيت العمل'+'</b>', div4);

        google.maps.event.addListener(marker, 'click', function() {
          if (!infoBubble.isOpen()) {
            infoBubble.open(map, marker);
          }
        });
      }
      // end of init function