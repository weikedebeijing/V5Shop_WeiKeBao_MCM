// JavaScript Document
$(document).ready(function(){
	//Full Caption Sliding (Hidden to Visible)
	$('.ShortcutsBar').hover(function(){
		$(".cover", this).stop().animate({right:'0'},{queue:false,duration:300});
	}, function() {
		$(".cover", this).stop().animate({right:'-90px'},{queue:false,duration:150});
	});
	$('.ToggleBar').hover(function(){
		$(".cover", this).stop().animate({right:'0'},{queue:false,duration:300});
	}, function() {
		$(".cover", this).stop().animate({right:'-90px'},{queue:false,duration:150});
	});
	$('.boxgrid.captionfull').hover(function(){
		$(".cover", this).stop().animate({top:'0px'},{queue:false,duration:200});
	}, function() {
		$(".cover", this).stop().animate({top:'180px'},{queue:false,duration:250});
	});
	$('.boxgrid.boxgrid95').hover(function(){
		$(".cover", this).stop().animate({top:'0px'},{queue:false,duration:200});
	}, function() {
		$(".cover", this).stop().animate({top:'95px'},{queue:false,duration:250});
	});
	$('.boxgrid.boxgrid160').hover(function(){
		$(".cover", this).stop().animate({top:'0px'},{queue:false,duration:200});
	}, function() {
		$(".cover", this).stop().animate({top:'160px'},{queue:false,duration:250});
	});
	$('.icon-sina').hover(function(){
		$(".name", this).stop().animate({top:'0px'},{queue:false,duration:200});
	}, function() {
		$(".name", this).stop().animate({top:'91px'},{queue:false,duration:250});
	});
	$('.icon-qq').hover(function(){
		$(".name", this).stop().animate({top:'0px'},{queue:false,duration:200});
	}, function() {
		$(".name", this).stop().animate({top:'91px'},{queue:false,duration:250});
	});
	$('.icon-alipay').hover(function(){
		$(".name", this).stop().animate({top:'0px'},{queue:false,duration:200});
	}, function() {
		$(".name", this).stop().animate({top:'91px'},{queue:false,duration:250});
	});
	$('.icon-jiathis').hover(function(){
		$(".name", this).stop().animate({top:'0px'},{queue:false,duration:200});
	}, function() {
		$(".name", this).stop().animate({top:'91px'},{queue:false,duration:250});
	});
	$('.icon-bshare').hover(function(){
		$(".name", this).stop().animate({top:'0px'},{queue:false,duration:200});
	}, function() {
		$(".name", this).stop().animate({top:'91px'},{queue:false,duration:250});
	});
	$('.icon-baidu').hover(function(){
		$(".name", this).stop().animate({top:'0px'},{queue:false,duration:200});
	}, function() {
		$(".name", this).stop().animate({top:'91px'},{queue:false,duration:250});
	});
});

