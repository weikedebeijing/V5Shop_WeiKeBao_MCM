$(function () {
    $("#selConditions").change(function () {

        if ($(this).find("option:selected").val() == "1") {
            $("#Divhidden").hide();
            //            $("#Text").attr('disabled', false);
            //            $("#MoreImageText").attr('disabled', false);

        } else if ($(this).find("option:selected").val() == "2") {
            $("#Divhidden").show();

            //            $("#Text").attr('disabled', false);
            //            $("#MoreImageText").attr('disabled', false);
        } else if ($(this).find("option:selected").val() == "3") {

            $("#Divhidden").hide();
            //            $("#Text").attr('disabled', false);
            //            $("#MoreImageText").attr('disabled', false);
        }
        else if ($(this).find("option:selected").val() == "4") {
            $("#Divhidden").hide();
            //            $("#Text").attr('disabled', 'disabled');
            //            $("#MoreImageText").attr('disabled', 'disabled');
            $("#OneImageText").attr("checked", "checked");
            $("#divOneImageText").show();
            $("#divText").hide();
            $("#divMoreImageText").hide();


        }
        $("#hidConditions").val($(this).find("option:selected").val());
    });

});
$(function () {
    var bl = true;
    var selConditions = $("#selConditions")[0];
    for (var i = selConditions.length - 1; i >= 0; i--) {
        selConditions.options[i] = null;
    }
    var opt = new Option("请选择条件", "-1");
    selConditions.options.add(opt);
    $.ajax({
        type: "post",
        url: "../../WeiXinManage/GetConditions",
        dataType: "json",
        async: false,
        success: function (jsonRes) {
            if (jsonRes != null) {
                if (jsonRes != null && jsonRes.list.length > 0) {
                    for (var i = 0; i < jsonRes.list.length; i++) {
                        bl = true;
                        if ($("#hidConditions").val() != 2) {
                            if (jsonRes.list[i].value == 1 && jsonRes.list[i].value !== $("#hidConditions").val()) {
                                bl = Conditions1;
                            }
                            if (jsonRes.list[i].value == 3 && jsonRes.list[i].value !== $("#hidConditions").val()) {
                                bl = Conditions3;
                            }
                        }
                        if (bl) {
                            var opt = new Option(jsonRes.list[i].text, jsonRes.list[i].value);
                            selConditions.options.add(opt);
                        }
                    }

                }

            }

        }


    });
    GetFunction();

    $("#txtMenuUrl2").focus(function () {
        if ($(this).val() == "请输入url") {
            $(this).val("").css("color", "#333333");
        } else {
            $(this).css("color", "#333333");
        }
    });

    $("#txtMenuUrl2").blur(function () {
        if ($(this).val() == "") {
            $(this).val("请输入url").css("color", "gray");
        }
    });
    $("#selConditions").val($("#hidConditions").val())
    $("#selConditions").change();

    var jsonRes = imageTextSettingsViewJson;
    var list = jsonRes.imageTexts;
    for (var i = 0; i < list.length; i++) {
        if (list[i].MessageType == 2) {
            $("#title").html(list[i].Title);
            $("#imgurl").attr("src", "../" + list[i].CoverUrl);
            $("#plus").show();
            $("#divImageText").show();
            $("#divlist").hide();
            $("#MenuText").hide();
            $("#MenuSingle").show();
        }
        else if (list[i].MessageType == 1) {
            $("#MenuText").html(list[i].Text.replace(new RegExp("\n", "gm"), "</br>"));
            $("#MenuText").show();
            $("#MenuSingle").show();
            $("#divImageText").hide();
            $("#divlist").hide(); ;

        } else {
            if (i == 0) {
                var temphtml = '<li id="div' + i + '" class="first">';
                temphtml += '<div class="pictext-showbig">';
                temphtml += '<div class="pictext-showbig-img">';
                temphtml += '<img width="326" height="172" src="../' + list[i].CoverUrl + '">'
                temphtml += '<span class="pictext-showbig-img-text" style="display: none;">封面图片</span>';
                temphtml += '<span class="pictext-showbig-title-text">' + list[i].Title + '</span>';
                temphtml += '<a class="pictext-showbig-title-a" href=""></a>';
                temphtml += '</div>';
                temphtml += '</div>';
            } else {
                var temphtml = '<li id="div' + i + '" class="moretext-show-li">';
                temphtml += '<div class="pictext-showsmall">';
                temphtml += '<div class="pictext-showsmall-box">';
                temphtml += '<div class="pictext-showsmall-img">'; ;
                temphtml += '<img width="78" height="78" src="../' + list[i].CoverUrl + '">';
                temphtml += '</div>';
                temphtml += '<div class="pictext-showsmall-text">' + list[i].Title + '</div>';
                temphtml += '</div>';
                temphtml += '</div>';

            }
            temphtml += plusHtml(i);
            temphtml += '</li>';
            $("#divlist").append(temphtml);
            $("#divlist").show();
            $("#divImageText").hide();
            $("#MenuText").hide();
            $("#MenuSingle").show();
            test(i);
        }
    }
});
function plusHtml(i) {
    var temphtml = '<div id="plus' + i + '" class="form-touch t10">';
    temphtml += '<div class="t2">';
    temphtml += '<input type="radio" name="radplus' + i + '" value="none" checked="checked">';
    temphtml += '<label class="l5 r5" for="radplus' + i + '">图文详情(默认)</label>';
    temphtml += '</div>';
    temphtml += '<div class="t2">';
    temphtml += '<input  type="radio" name="radplus' + i + '" value="click">';
    temphtml += '<label class="l5 r5" for="radplus' + i + '">触发功能</label>';
    temphtml += '<select id="selplus' + i + '">';
    temphtml += '<option value="-1">请选择</option>';
    for (var j = 0; j < selectArr.list.length; j++) {
        temphtml += '<option value="' + selectArr.list[j].value + '">' + selectArr.list[j].text + '</option>';
    }
    temphtml += '</select>';
    temphtml += '</div>';
    temphtml += '<div class="t2">';
    temphtml += '<input  type="radio" name="radplus' + i + '" value="view">';
    temphtml += '<label class="l5 r5" for="radplus' + i + '">进入链接</label>';
    temphtml += '<input id="txtplus' + i + '" class="w210" type="text" value="请输入url" onfocus="txtfocus(this)" onblur="txtblur(this)">';
    temphtml += '</div>';
    temphtml += '</div>';
    return temphtml;
}


function test(j) {
    var arr = materialPlus.split(',');

    //    $(":radio[name='radplus" + j + "']").attr("disabled", "disabled");
    //    $("#txtplus" + j).attr("disabled", "disabled");
    //    $("#selplus" + j).attr("disabled", "disabled");
    if (arr[j] != "") {

        $("#selplus" + j).val(arr[j]);
        $(":radio[name='radplus" + j + "']").eq(1).attr("checked", true);
        if ($("#selplus" + j).val() == -1) {
            $(":radio[name='radplus" + j + "']").eq(2).attr("checked", true);
            $("#txtplus" + j).val(arr[j]);
        }
    }

}


var selectArr = "";
function GetFunction(option) {
    $.ajax({
        url: "../../WeiXinManage/GetFunction",
        type: "post",
        dataType: "json",
        async: false,
        success: function (data) {
            selectArr = data;
        }
    });
    var selType2 = $("#selFunction2")[0];
    for (var i = selType2.length - 1; i >= 0; i--)
        selType2.options[i] = null;
    var opt = new Option("请选择", "-1");
    selType2.options.add(opt);

    //    $.ajax({
    //        url: "../../WeiXinManage/GetFunction",
    //        type: "post",
    //        dataType: "json",
    //        async: false,
    //        success: function (data) {
    for (var i = 0; i < selectArr.list.length; i++) {
        var opt = new Option(selectArr.list[i].text, selectArr.list[i].value);
        selType2.options.add(opt);

    }
    //        }
    //    })
    if (materialPlus != "") {
        $("#selFunction2").val(materialPlus);
        $("#Radio1").attr("checked", 'click');

        if ($("#selFunction2").val() == -1) {
            $("#Radio2").attr("checked", 'click');
            $("#txtMenuUrl2").val(materialPlus);
        }
    }
    //    $("input[name=after1]").attr('disabled', 'disabled');
    //    $("#txtMenuUrl2").attr('disabled', 'disabled');
    //    $("#selFunction2").attr('disabled', 'disabled');
}

//// 保存
//function btnSave() {

//    var MaterialPlus = "";
//    if ($("#selConditions").val() == "-1") {
//        $("#selConditions").focus();
//        $(".spMessage").text("");
//        $(".prompt", $("#selConditions").parent().parent()).text("请输选择自动回复条件");
//        return false;
//    }

//    if ($("#selConditions").val() == "2") {
//        if ($("#txtKeyWord").val() == "") {
//            $("#txtKeyWord").focus();
//            $(".spMessage").text("");
//            $("#txtKeyWord").siblings(".spMessage").text("请输入关键字");
//            return false;

//        }

//    }
//    var autoresponderSettings = imageTextSettingsViewJson.autoresponderSettings;
//    if ($("#hidConditions").val() == "2") {
//        //用户消息包含
//        autoresponderSettings.KeyWord = $("#txtKeyWord").val();
//        autoresponderSettings.Matchedaegerr = $("#hidContains").val();
//    }
//    else {
//        autoresponderSettings.KeyWord = "";
//        autoresponderSettings.Matchedaegerr = "";
//    }
//    autoresponderSettings.Conditions = $("#hidConditions").val();
//    // 只要保存当前选中的项及内容即可
////    var res = $("#hidTagId").val();
////    var jsonRes = JSON.parse(res);
////    switch (jsonRes[0].MessageType + "") {
////        case "1":
////            {
////                autoresponderSettings.MaterialManageID = jsonRes[0].Id;
////                autoresponderSettings.Type = "1";
////                break;
////            }
////        case "2":
////            {
////                autoresponderSettings.Type = "2";
////                autoresponderSettings.MaterialManageID = jsonRes[0].Id;
////                var tag = $("input[name='after1']:checked").val()
////                if (tag == "click") {
////                    MaterialPlus = $("#selFunction2").val();
////                } else if (tag == "view") {
////                    MaterialPlus = $("#txtMenuUrl").val().trim();
////                } else {
////                    //默认不插入数据
////                }
////                break;
////            }
////        case "3":
////            {
////                autoresponderSettings.Type = "3";
////                autoresponderSettings.MaterialManageID = jsonRes[0].Id;
////                MaterialPlus = "";
////                for (var j = 0; j < jsonRes.length; j++) {
////                    var tag = $("input[name='radplus" + j + "']:checked").val()
////                    if (tag == "click") {
////                        MaterialPlus += $("#selplus" + j).val();
////                    } else if (tag == "view") {
////                        MaterialPlus += $("#txtplus" + j).val().trim();
////                    } else {
////                        //默认不插入数据
////                    }
////                    MaterialPlus += ",";
////                }
////                MaterialPlus = MaterialPlus.substring(0, MaterialPlus.length - 1);
////                break;
////            }
////    }
//    $.ajax({
//        type: "post",
//        url: "../../WeiXinManage/UpdateAutoReply",
//        data: { "autoresponderSettings": JSON.stringify(autoresponderSettings)},
//        success: function (jsonRes) {
//            if (jsonRes == "ok") {
//                $(".Loading").removeClass("style03 style02").addClass("style01");
//                $("#operateTip").html("编辑成功！").change();
//                window.location.href = "../../WeiXinManage/AutoReply?appCode=C001&MenuCode=C475";
//            }
//            else if (jsonRes == "repeat") {
//                $(".Loading").removeClass("style03 greenBackGround").addClass("yellowBackGround");
//                $("#operateTip").html("不能添加重复的关键字！").change();
//                return;
//            }
//            else { alert("编辑失败"); }
//        }
//    });

//};



// 保存
function btnSave() {

    var MaterialPlus = "";
    if ($("#selConditions").val() == "-1") {
        $("#selConditions").focus();
        $(".spMessage").text("");
        $(".prompt", $("#selConditions").parent().parent()).text("请输选择自动回复条件");
        return false;
    }

    if ($("#selConditions").val() == "2") {
        if ($("#txtKeyWord").val() == "" || $("#txtKeyWord").val() == "请输入关键词") {
            $("#txtKeyWord").focus();
            $(".spMessage").text("");
            $("#txtKeyWord").parent().next().children(".prompt").text("请输入关键词");
            return false;
        } else {
            $("#txtKeyWord").parent().next().children(".prompt").text("");
        }

    }
    //    if ($("#hidTagId").val() == "") {
    //        $("#simple-select").parent().parent().next().children(".prompt").text("请添加或选择素材");
    //        return false;
    //    } else {
    //        $("#simple-select").parent().parent().next().children(".prompt").text("");
    //    }
    //    if (radiosChecked == "1") {
    //        var ReplyText = document.getElementById("ReplyText").value.replace(/(^[\s\t\xa0\u3000]+)|([\u3000\xa0\s\t]+$)/g, "");
    //        if (ReplyText == "") {
    //            $("#ReplyText").focus();
    //            $(".spMessage").text("");
    //            $("#ReplyText").siblings(".spMessage").text("请输入回复内容");
    //            return false;
    //        }

    //    }
    //    if (radiosChecked == "2") {

    //        if ($("#divImageText").css("display") == "none") {
    //            $(".Loading").removeClass("style03 greenBackGround").addClass("yellowBackGround");
    //            $("#operateTip").html("请添加单图文！").change();
    //            return;

    //        }

    //    }

    //    if (radiosChecked == "3") {

    //        var tableRow = document.getElementById("myPressPaperTable");
    //        var row_index = tableRow.rows.length;

    //        for (var i = 0; i < row_index; i++) {
    //            if ($("#hidMoreImagetxtName" + i + "").val() == "") {
    //                $(".spMessage").text("");
    //                $("#divInsertManege").find(".spMessage").text("多图文最少要有2条信息");
    //                return false;
    //            }
    //            //                    else if ($("#hidMoreImage" + i + "").val() == "") {
    //            //                        $(".spMessage").text("");
    //            //                        $("#divInsertManege").find(".spMessage").text("请输入完整的图文信息");
    //            //                        return false;
    //            //                    }
    //            else if ($("#hidMoreImage_file_upload_img" + i + "").val() == "") {
    //                $(".spMessage").text("");
    //                $("#divInsertManege").find(".spMessage").text("请输入完整的图文信息");
    //                return false;
    //            }
    //            else if ($("#hidtxtDescribe_MoreImage" + i + "").val() == "") {
    //                $(".spMessage").text("");
    //                $("#divInsertManege").find(".spMessage").text("请输入完整的图文信息");
    //                return false;
    //            }
    //        }


    //    }



    if ($("#hidConditions").val() == "2") {
        //用户消息包含
        autoresponderSettings.KeyWord = $("#txtKeyWord").val();
        autoresponderSettings.Matchedaegerr = $("#hidContains").val();
    }
    else {
        autoresponderSettings.KeyWord = "";
        autoresponderSettings.Matchedaegerr = "";
    }
    autoresponderSettings.Conditions = $("#hidConditions").val();
    // 只要保存当前选中的项及内容即可
    var res = "";
    if ($("#hidTagId").val() == "") {
        var jsonRes = imageTextSettingsViewJson;
        res = jsonRes.imageTexts;
    } else {
        res = JSON.parse($("#hidTagId").val());
    }
    var jsonRes = res;
    switch (jsonRes[0].MessageType + "") {
        case "1":
            {
                autoresponderSettings.MaterialManageID = jsonRes[0].Id;
                autoresponderSettings.Type = "1";
                break;
            }
        case "2":
            {
                autoresponderSettings.Type = "2";
                autoresponderSettings.MaterialManageID = jsonRes[0].Id;
                var tag = $("input[name='after1']:checked").val()
                if (tag == "click") {
                    if ($("#selFunction2").val() == "-1") {
                        $(".c03").text("");
                        $(this).focus();
                        $(".c03", $("#selFunction2").parent()).text("请选择触发功能");
                        return false;
                    }
                    else {
                        $(".c03", $("#selFunction2").parent()).text(" ");
                    }
                    //  MaterialPlus = $("#selFunction2").val();
                } else if (tag == "view") {
                    if ($("#txtMenuUrl2").val().trim() == "请输入url") {
                        $(".c03").text(" ");
                        $(this).focus();
                        $(".c03", $("#txtMenuUrl2").parent()).text("请输入url");
                        return false;
                    }
                    else {
                        MaterialPlus = $("#txtMenuUrl2").val().trim();
                    }

                } else {
                    //默认不插入数据
                }
                break;
            }
        case "3":
            {
                autoresponderSettings.Type = "3";
                autoresponderSettings.MaterialManageID = jsonRes[0].Id;
                MaterialPlus = "";
                for (var j = 0; j < jsonRes.length; j++) {
                    var tag = $("input[name='radplus" + j + "']:checked").val()
                    if (tag == "click") {
                        MaterialPlus += $("#selplus" + j).val();
                    } else if (tag == "view") {
                        MaterialPlus += $("#txtplus" + j).val().trim();
                    } else {
                        //默认不插入数据
                    }
                    MaterialPlus += ",";
                }
                MaterialPlus = MaterialPlus.substring(0, MaterialPlus.length - 1);
                break;
            }
    }
    $.ajax({
        type: "post",
        url: "../../WeiXinManage/UpdateAutoReply",
        data: { "autoresponderSettings": JSON.stringify(autoresponderSettings), "MaterialPlus": MaterialPlus, "ID": GetUrlID() },
        success: function (jsonRes) {
            if (jsonRes == "ok") {
                $(".Loading").removeClass("style03 style02").addClass("style01");
                $("#operateTip").html("修改成功！").change();
                if (type == "" | type == 2) {

                    GoToLinkUrl("", "../../WeiXinManage/AutoReply")
                }
            }
            else if (jsonRes == "repeat") {
                $(".Loading").removeClass("style03 greenBackGround").addClass("yellowBackGround");
                $("#operateTip").html("不能添加重复的关键字！").change();
                return;
            }
            else {
                $(".Loading").removeClass("style0green style0yellow").addClass("style0red"); //失败
                $("#operateTip").html("添加失败").change();

            }
        }
    });

};


function GetUrlID() {
    var url = window.location.href;
    var parameter = url.substring(url.indexOf('?') + 1);
    parameter = parameter.split('&');
    var reg = /ID=/g;
    var menuCode = "";
    for (var i = 0; i < parameter.length; i++) {
        reg.lastIndex = 0;
        if (reg.test(parameter[i])) {
            menuCode = parameter[i].replace("ID=", "").split('#')[0];
            break;
        }
    }
    return menuCode;
}


function imgtextShow() {
    materialPlus = "";
    $("#divlist").html('');
    var res = $("#hidTagId").val();

    var jsonRes = JSON.parse(res);
    //    var jsonRes = JSON.parse(res);
    var list = jsonRes;
    for (var i = 0; i < list.length; i++) {
        //文本
        if (list[i].MessageType == "1") {
            $("#MenuText").html(list[i].Text.replace(new RegExp("\n", "gm"), "</br>").replace(new RegExp("//", "gm"), "///"));
            $("#MenuText").show();
            $("#MenuSingle").show();
            $("#divImageText").hide();
            $("#divlist").hide();
            //单图文
        } else if (list[i].MessageType == "2") {
            $("#title").html(list[i].Title);
            $("#imgurl").attr("src", "../" + list[i].CoverUrl);
            $("#Radio3").attr("checked", 'click');
            $("#selFunction2").val(-1);
            $("#txtMenuUrl2").val('请输入url');

            //            selFunction2
            $("#plus").show();
            $("#divImageText").show();
            $("#divlist").hide();
            $("#MenuText").hide();
            $("#MenuSingle").show();
        } else {
            if (i == 0) {
                var temphtml = '<li id="div' + i + '" class="first">';
                temphtml += '<div class="pictext-showbig">';
                temphtml += '<div class="pictext-showbig-img">';
                temphtml += '<img width="326" height="172" src="../' + list[i].CoverUrl + '">'
                temphtml += '<span class="pictext-showbig-img-text" style="display: none;">封面图片</span>';
                temphtml += '<span class="pictext-showbig-title-text">' + list[i].Title + '</span>';
                temphtml += '<a class="pictext-showbig-title-a" href=""></a>';
                temphtml += '</div>';
                temphtml += '</div>';
            } else {
                var temphtml = '<li id="div' + i + '" class="moretext-show-li">';
                temphtml += '<div class="pictext-showsmall">';
                temphtml += '<div class="pictext-showsmall-box">';
                temphtml += '<div class="pictext-showsmall-img">'; ;
                temphtml += '<img width="78" height="78" src="../' + list[i].CoverUrl + '">';
                temphtml += '</div>';
                temphtml += '<div class="pictext-showsmall-text">' + list[i].Title + '</div>';
                temphtml += '</div>';
                temphtml += '</div>';

            }
            temphtml += plusHtml(i);
            temphtml += '</li>';
            $("#divlist").append(temphtml);
            $("#divlist").show();
            $("#divImageText").hide();
            $("#MenuText").hide();
            $("#MenuSingle").show();
        }
    }

}
function txtblur(obj) {
    if ($(obj).val() == "") {
        $(obj).val("请输入url").css("color", "gray");
    }
}
function txtfocus(obj) {
    if ($(obj).val() == "请输入url") {
        $(obj).val("").css("color", "#333333");
    } else {
        $(obj).css("color", "#333333");
    }
}