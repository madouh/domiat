
$(document).ready(function(){
$("div.alert").hide();
$("div.alert").fadeIn(900);
$(document).on('click',"#bs-example-navbar-collapse-1 > ul:nth-child(1) > li.active > a",function(){

$("div.alert").hide();
$("div.alert").fadeIn(900);});
});
