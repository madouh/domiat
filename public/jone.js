$(document).ready(function(){
	$(".change_color").keyup(function(){
$("#colordiv").css("background-color","rgb("+$("#inputone").val()+","+$("#inputtwo").val()+","+$("#inputthree").val()+"");
});
$("#add_div").click(function(){

$('<div class="added">new div</div>').appendTo("#master");

});
// $("#bounce_it").click(function(){
// 	$("#imgone").css("opacity",".5");

// });


// // var cursorX;
// // var cursorY;
// // document.onmousemove = function(e){
// //     cursorX = e.pageX;
// //     cursorY = e.pageY;
// //     $("#X").text(cursorX);
// //     $("#y").text(cursorY);
    

// //     	$("#imgone").css("position","absolute");
// //     $("#imgone").css("top",cursorY);
// //     $("#imgone").css("left",cursorX);

									
    
// // }



// x=3;
// y=5;
// z=x+y;
// $("#chang").click(function(){
// 	alert($("#imgone").prop("src"));
// $("#imgone").attr("src","img/brain.jpg");
// });
// $("#add_border").click(function(){
// $("#imgone").addClass("bordering");
// });
// $("#remove_border").click(function(){
// $("#imgone").removeClass("bordering");
// });
// for(i=0;i<=3;i++){
// 	// alert(i);
// // $("ol>li:eq("+i+")").text("العنصر رقم "+i+" في القائمة");
// // $("ol>li:eq("+i+")").html("<a href='https//:www.google.com'>google</a>");
// }
// // // $("*").css("background-color", "red");
// // $('h1').hide();
// // // setInterval(function(){$('h1').fadeToggle(2300)},2500)
// // x=$("#numberone").val()* $("#numbertwo").val();
// //  // x=$("#numberone").val() /$("#numbertwo").val();
// // $("#calc1").click(function(){
// // 	var x=$("#numberone").val()* $("#numbertwo").val();
// // 	alert(x);
// // 	y=10;
// // });

// // $("#calc2").click(function(){

// // 	var x=$("#numberone").val() /$("#numbertwo").val();
// // 	alert(x);


// // });









// // // $("div").hide();
// // $("button1").click(function(){
// // 	$("#divone").fadeIn();
// // 	$("#divtwo").fadeIn("slow");
// // 	$("#divthree").fadeIn(3000);
// // });

// // $("#first").click(function(){
// // alert("hello from first");
// // $("#imgone").css("width","300px");
// // });


// // $("#second").click(function(){
// // // alert("hello from second");
// // $("#first").css("background-color", "pink");
// // $(".pees").css("background-color", "orange");
// // $(".pees").css("display", "inline");
// // $("#first").hide();
// // });

// // $("li#o").empty();
// // // $('ol').children().css("background-color", "red");
// // $(".pees").click(function(){
// // // alert("hello from every p");
// // $(".pees").css("background-color", "red");
// // // alert("hello from every p");

// // $(".pees").css("display", "inline");
// // $("#first").show();

// // });

// // $("#imgone").click(function(){
// // 	$("#first").remove();
// // });
});

