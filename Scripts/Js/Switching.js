// JavaScript Document

var _st = window.setTimeout;
window.setTimeout = function(fRef, mDelay) {
 if(typeof fRef == 'function'){
  var argu = Array.prototype.slice.call(arguments,2);
  var f = (function(){ fRef.apply(null, argu); });
  return _st(f, mDelay);
 }
 return _st(fRef,mDelay);
}

function GetObj(objName)
				{
				if(document.getElementById)
					{
						return eval('document.getElementById("' + objName + '")');
					}
				else if(document.layers)
					{
					return eval("document.layers['" + objName +"']");
					}
				else{
					return eval('document.all.' + objName);
					}
			}

			function SetLbl(preFix, idx,start,end,cssl,cssr)
				{
				window.setTimeout(aa,300,preFix, idx,start,end,cssl,cssr);
				
					
				
			}
			
			function aa(preFix, idx,start,end,cssl,cssr)
			{
				for(var i=start;i<end;i++)
				{
														
					if(GetObj(preFix+"_lbl_"+i)) GetObj(preFix+"_lbl_"+i).className =cssr;
					if(GetObj(preFix+"_con_"+i)) GetObj(preFix+"_con_"+i).style.display = "none";
				}
			
				
				GetObj(preFix+"_lbl_"+idx).className =cssl;
				GetObj(preFix+"_con_"+idx).style.display = "block";
			}


//平台切换（菜单）
$(document).ready(function(){
	$("#channel-select li").click(function(){
		$("#channel-current").html($(this).html());
		$("#channel-current a").addClass("a-select");
		$("#channel-current a").append("<i class='arrow'></i>");
		$("#channel-select").css('display','none');
		var id=$(this).attr("id");
		if(id=="channel")
		{
			$("#allnav").show();
			$("#allnav_distribution").hide();
			$("#allnav_direct").hide();
			$("#allnav_taobao").hide();
			changeMenuItem()
		}
		if(id=="channel_distribution")
		{
			$("#allnav").hide();
			$("#allnav_distribution").show();
			$("#allnav_direct").hide();
			$("#allnav_taobao").hide();
			changeMenuItem_distribution()
		}
		if(id=="channel_direct")
		{
			$("#allnav").hide();
			$("#allnav_distribution").hide();
			$("#allnav_direct").show();
			$("#allnav_taobao").hide();
			changeMenuItem_direct()
		}
		if(id=="channel_taobao")
		{
			$("#allnav").hide();
			$("#allnav_distribution").hide();
			$("#allnav_direct").hide();
			$("#allnav_taobao").show();
			changeMenuItem_taobao()
		}
		})
	$("#channel-current").mouseover(function(){
		$("#channel-select").css('display','');
		})
	})