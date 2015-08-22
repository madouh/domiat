 
        $("#map-").css("width","100%");
        $("#map-").css("height","700px");
      function initialize() {
         var map, infoBubble;

        var mapCenter = new google.maps.LatLng(31.44235,31.68369);

        map = new google.maps.Map(document.getElementById("map-"), {
          zoom: 14,
          center: mapCenter,
          mapTypeId: google.maps.MapTypeId.HYBRID
        });

        var marker = new google.maps.Marker({
          map: map,
          position: new google.maps.LatLng(31.44235,31.68369),
          draggable: false
        });

        var contentString = '<div id="content">'+
        '<h4 style="color:red; text-align:center;">www.new-domiat.com</h4>'+
        '<p><b>مدينة دمياط الجديدة</b>, المدينة اﻷكثر جمالاً و تنظيماً في شرق الدلتا <b>تُعرف بالمدينة</b>, و هي مدينة واسعة تحتوى على الكثير من اﻷنشطة ' +
        'و الخدمات '+
        'و يبلغ طول المدينة عدة كيلو مترات و عرضها كذلك '+
        'و لذلك كانت الفكرة في جعلها في متناول يديك '+
        'على جهاز الموبايل في يديك أو جهازك الشخصي ,'+
        'قصدنا ان تكون ضغيرة فقط بين يديك '+
        'و ذلك عبر تنظيم بيانات انشطة المدينة الحكومية و الأهلية بطرق بحث جيدة و مبتكرة في هذا المكان من العالم '+
        'أردنا أن نسهل الوصول إلى الهدف و توفير الوقت , '+
        'فقط كي تكون سعيدا'+
        'و بأقل جهد.</p>'+
        '<p>هذا الموقع في خدمتك انت, في أي وقت, '+
        'و من أي مكان</p> '+
        '<p style="color:blue;">Eng.Mamdouh Abbas Farh</p>'+
        '</div>';

        infoBubble = new InfoBubble({
          maxWidth: 600
        });

        infoBubble.open(map, marker);

        var div1 = document.createElement('DIV');
        var div2 = document.createElement('DIV');
        var div3 = document.createElement('DIV');
        div1.innerHTML = '<h5><b>سوف يتم جمع بيات اﻷنشطة بطريقة من ثلاثة طرق:</b></h5>'+'<p><b>الطريقة اﻷولى:</b> و هي عن طريق صاحب النشاط بنفسة عبر تسجيل بسيط ثم إدراج اﻷنشطة بنفسة من ثم سوف تتم مراجعتها من قبل الموقع قبل أن تكون متاحة لزوار الموقع.</p>'+'<p><b>الطريقة الثانية:</b> و هي تسجيل النشاط من قبل إدارة الموقع.</p>'+'<p><b>الطريقة الثالثة:</b>و هي عبر التواصل مع ادارة الموقع لوجود نشاط في مكان ما يجب إدراجة في الموقع.</p>';
        div2.innerHTML = '<h5><b>هذا الموقع مدعّم بالخرائط كما يلي:</b></h5>'+'<p><b>أولاً الاحداثيات:</b> لكل نشاط احداثيات تصف موقعة بالتفصيل عبر وضع مؤشرات واضحة مدعومة ببعض التفاصيل.</p>'+'<p><b>كيفية الوصول:</b> سوف يتم ارشادك عبر الطرق للوصول الى هدفك بالتفاصيل و المسافات.</p>'+'<p><b>البحث بالمسافات:</b> يمكنك البحث عن أقرب نشاط اليك في تخصص معين.</p>'+'<p><b>الصور الفوتوغرافية:</b> سوف يتم دعم الموع لاحقا بصور المواقع اﻷكثر أهمية في المدينة.</p>';
        div3.innerHTML = '<br><h5><b>الموقع يقدم هذة الخدمات مجانا:</b></h5>'+'<p><b>1 - تسجيل نشاط أو أكثر</b>.</p>'+'<p><b>2 - الاستعلام عن اﻷنشطة و مواقعها</b>.</p>'+'<p><b>3 - استخدام خدمات الخرائط بجميع أنواعها</b>.</p>';

        infoBubble.addTab('<b style="font-size:14px; color:red;">عن الموقع</b>', contentString); 
        infoBubble.addTab('<b style="font-size:14px; color:blue;">جمع بيانات اﻷنشطة</b>', div1);
        infoBubble.addTab('<b style="font-size:14px; color:lightgreen;">خرائط اﻷنشطة </b>', div2);
        infoBubble.addTab('<b style="font-size:14px; color:pink;">مجانية الموقع</b>', div3);

        google.maps.event.addListener(marker, 'click', function() {
          if (!infoBubble.isOpen()) {
            infoBubble.open(map, marker);
          }
        });
      }
      // end of init function
      
     
