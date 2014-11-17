// JavaScript Document

$(document).ready(function(){
	$("#rapid-check").click(function(){	
		if($(this).attr("checked")=="checked")
	    {
	    	$("#rapid-form").show();
			$("button#btn").html("&nbsp;&nbsp;保存并发布&nbsp;&nbsp;");
	    }
	    else
		{
			$("#rapid-form").hide();
			$("button#btn").html("&nbsp;&nbsp;保存&nbsp;&nbsp;");
		}
	})
})