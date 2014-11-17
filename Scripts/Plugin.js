
function addContactBox(obj, no) {
	if ($(obj).parent("span").parent("div").parent("div").children("div")[0].children[0] != undefined) {
		$("input[name='qq']").val($(obj).parent("span").parent("div").parent("div").children("div")[0].children[0].innerHTML.split(':')[1]);
		$("input[name='tel']").val($(obj).parent("span").parent("div").parent("div").children("div")[0].children[1].innerHTML.split(':')[1]);
		$("input[name='email']").val($(obj).parent("span").parent("div").parent("div").children("div")[0].children[2].innerHTML.split(':')[1]);
		$("input[name='weibo']").val($(obj).parent("span").parent("div").parent("div").children("div")[0].children[3].innerHTML.split(':')[1]);
	} else {
		$("input[name='qq']").val("");
		$("input[name='tel']").val("");
		$("input[name='email']").val("");
		$("input[name='weibo']").val("");
	}
         $("div[name='error']").each(function(){
                    $(this).html("");
                })
	art.dialog({
		title: '联系方式',
        title: false,
		content: document.getElementById('div1'),
		button: [{
			name: '确定',
			callback: function() {
            var bool=false;
				var QQ = $("input[name='qq']").val();
				var Tel = $("input[name='tel']").val();
				var Email = $("input[name='email']").val();
				var Weibo = $("input[name='weibo']").val();
				var url = "ChangeInfo?ShopId=" + no;
				if (QQ != "") {
					url = url + "&QQ=" + QQ;
				}
				if (Tel != "") {
					url = url + "&Tel=" + Tel;
				}
				if (Email != "") {
					url = url + "&Email=" + Email;
				}
				if (Weibo != "") {
					url = url + "&Weibo=" + Weibo;
				}
				if (Weibo == "" && QQ == ""&& Tel == "" && Email == "") {
                $(".Loading").removeClass("style0red style0green").addClass("style0yellow");
                $("#operateTip").html("请至少填写一项").change();
					bool= false;
				} else{
                bool=true;
                }
                $("div[name='error']").each(function(){
                    if($(this).html()!=""){
                        $(this).parent('span').children('input').focus();
                        bool= false;
                    }
                })
                if(bool){
					$.ajax({
						type: "GET",
						url: url,
						async: false,
						success: function(data) {
							if (data == "true") {
								art.dialog({
                                    time: 2,
                                    content: '提交成功!'
                                });
//								var theForm = document.forms['from1'];
//                                 theForm.submit();
							} else {
								art.dialog({
                                      time: 2,
                                    content: '提交失败!'
                                });
							}
						},
						error: function() {
							art.dialog({
                                    time: 2,
                                    content: '提交失败!'
                                });
						}
					});
				}else{
                    return false;
                }
			},
			focus: true
		},
		{
			name: '取消',
		}]

	});

}
function addRemark(obj, state, ShopId) {
	var pid = '#Remark' + ShopId;
	$('#remark').val($(pid).html());
	$('input:radio').each(function() {
		if ($(this).val() == state) {
			$(this).attr("checked", "checked");
		}

	}); 
    art.dialog({
		title: '备注',
		content: document.getElementById('div2'),
          title: false,
		button: [{
			name: '确定',
			callback: function() {
				state = $('input:radio:checked').val();
				var Remark = $('#remark').val();
				var url = "ChangeInfo?Remark=" + Remark + "&State=" + state + "&ShopId=" + ShopId;
				$.ajax({
					type: "GET",
					url: url,
					async: false,
					success: function(data) {
						if (data == "true") {
							art.dialog({
                                    content: '提交成功!'
                                });
//							 var theForm = document.forms['from1'];
//                                 theForm.submit();
						} else {
							art.dialog({
                                    content: '提交失败!'
                                });
						}
					},
					error: function() {
						art.dialog({
                                    content: '提交失败!'
                                });
					}
				});
			},
			focus: true
		},
		{
			name: '取消',
		}]
	});
}

////设置table的宽带
//$(document).ready(function () {
//    var num = $(".MCM-N-L").height();
//   // alert(num)
//    num = num - 145;
//    num = num - $(".v5-page").height();
//    $("#hiDiv").height(num);
//})