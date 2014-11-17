// JavaScript Document
//标记的显示和隐藏 FZedit
$(function(){
	$(".mod-sign>div").removeClass("show").addClass("hidden");//样式加载完以后让所有的标记和下标都正常
	$(".mod-sign .a-btn").toggle(function(){
		$(".mod-sign>div").removeClass("show").addClass("hidden");//点击的时候先让所有的标记和下标都正常即排他
		$(this).parent().addClass("show").removeClass("hidden");//点击的时候下标和图片都显示
	},function(){
		$(this).parent().removeClass("show").addClass("hidden");	
	});
	
//标记的显示和隐藏 FZedit
	$(".mod-operate-detail").css("display","none");//加载的时候先让div隐藏
	$(".mod-operate .ico20").css("display","none");//加载的时候先让小三角隐藏
//点击功能开始
	$(".mod-operate li>.a-btn").click(function(){
		if($(this).siblings("i").css("display")=="block"){//判断条件：如果小三角是展开的就执行：
			$(".mod-operate-detail:eq("+$(this).attr('data')+")").css("display","none");
			$(this).siblings().css("display","none");
		}else{
			$(".mod-operate-detail").css("display","none");
			$(".mod-operate .ico20").css("display","none");
			$(".mod-operate-detail:eq("+$(this).attr('data')+")").css("display","block");
			$(this).siblings().css("display","block");
		}
	});
});