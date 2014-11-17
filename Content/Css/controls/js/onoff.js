// JavaScript Document


//自定义radio样式
$(document).ready( function(){ 
  	$("li.onoff").children().filter("input[type=radio]").each(function(i){
	   $(this).change(function(){
		   var _this=this;
		   var _els=	$(this).parent().children().filter("input");
		   $(_els).each(function(n){
			   if(this==_this)
				 $(this).parent().children().filter("label").eq(n).addClass("selected");
			   else
			     $(this).parent().children().filter("label").eq(n).removeClass("selected");
			   });
		   
		   });
	  });
	  
	$(".cb-enable").click(function(){
		var parent = $(this).parents('.onoff');
		$('.cb-disable',parent).removeClass('selected');
		$(this).addClass('selected');
		$('.checkbox',parent).attr('checked', true);
	});
	$(".cb-disable").click(function(){
		var parent = $(this).parents('.onoff');
		$('.cb-enable',parent).removeClass('selected');
		$(this).addClass('selected');
		$('.checkbox',parent).attr('checked', false);
	});
});