function SaveImg() {


    if ($("#MoreImagetxtName").val() == "") {

        $("#MoreImagetxtName").focus();
        $(".spMessage").text("");
        $("#MoreImagetxtName").parent().next().children("span").text("请输入标题");
        return false;
    }
    else if ($("#hidMoreImage_img").val() == "") {

        $("#hidMoreImage_img").focus();
        $(".spMessage").text("");
        $("#divMoreImagefile").parent().next().children("span").text("请上传图片");
        return false;
    }
    var trDir = tag;
    $("#hidMoreImagetxtName" + tag + "").val($("#MoreImagetxtName").val());
    $("#hidMoreImage" + tag + "").val($("#MoreImage").val());
    $("#hidMoreImage_file_upload_img" + tag + "").val($("#MoreImage_file_upload_img").attr("src"));
    $("#hidtxtDescribe_MoreImage" + tag + "").val(MoreImage_editor.html());
    $("#appmsgItem" + tag + " td:eq(0)").html($("#MoreImagetxtName").val());
    $("#appmsgItem" + tag + " td:eq(1) img").attr("src", $("#MoreImage_file_upload_img").attr("src"));


    closePopup();

}

var radiosChecked = "";
$(function () {
    //初始化赋值
    var selType2 = $("#selFunction2")[0];
    for (var i = selType2.length - 1; i >= 0; i--)
        selType2.options[i] = null;
    var opt = new Option("请选择", "-1");
    selType2.options.add(opt);
    for (var i = 0; i < hidFuncitonType.length; i++) {

        var opt = new Option(hidFuncitonType[i].Name, hidFuncitonType[i].Key);
        selType2.options.add(opt);

    }


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
    ChangeImageText();
    //选择时
    $("#selImageText").change(function () {

        ChangeImageText();
    })
    //显示单图文弹层
    //    $("#simple-add").click(function () {

    //        $("#simpleText").css("display", "block");
    //        $("#moreText").css("display", "none");
    //        createPopup("gray-active-cover-add");
    //        $(".ke-container").remove(); //每次加载都要加载富文本编辑器，先删除前面生成的，不然会重复（这里是一个问题，如果不动态创建，append弹层后富文本失效）
    //        editor = KindEditor.create("#txtDescribe", {
    //            resizeType: 1,
    //            allowPreviewEmoticons: false,
    //            allowImageUpload: true,
    //            items: [
    //                        'fontname', 'fontsize', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
    //                        'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
    //                        'insertunorderedlist', '|', 'emoticons', 'image', 'link'
    //                    ]
    //        });

    //        document.getElementById('txtName').onkeyup = function () {

    //            $("#coverTitle  a").text($("#txtName").val());

    //        };

    //        document.getElementById('txtAbstract').onkeyup = function () {

    //            $("#coverAuthor a").text($("#txtAbstract").text());

    //        };





    //    });
    //显示多图文弹层
    $("#more-add").click(function () {
        $("#simpleText").css("display", "none");
        $("#moreText").css("display", "block");
        createPopup("gray-active-cover-add");
    });
    //关闭弹层
    $("#btnclose").click(function () {
        closePopup();
    });
    //删除单图文
    $("#simpleDelete").click(function () {
        $("#divImageText").css("display", "none");
    });

    //保存
    $("#btnInset").click(function () {

        var description = editor.html();
        //单图文
        if (radiosChecked == "2") {
            if ($("#txtAbstract").text() == "" && description != "") {
                var text = description.length / 18;
                var txtAbstract = editor.html().substring(0, text < 1 ? 1 : text);
            }
            //是否显示封面
            var txtshowmain;

            if ($("#txtshowmain").attr("checked") == 'checked') {

                var txtshowmain = true;
            }
            else { txtshowmain = false; }

            $("#hidTitle").val($("#txtName").val());
            $("#hidAuthor").val($("#txtAuthor").val());
            $("#hidCoverUrl").val($("#hidCoverUrl").val());
            $("#hidAbstract").val($("#txtAbstract").val() == "" ? txtAbstract : $("#txtAbstract").val());
            $("#hidText").val(editor.html());
            $("#hidTheOriginalLink").val($("#txtTheOriginalLink").val());
            $("#hidIsImg").val(txtshowmain);
            closePopup();
            $("#divImageText").css("display", "block");
            $(".simpletext-emulation-title-a").text($("#txtName").val());
            $(".simpletext-emulation-img img").attr("src", "../../" + $("#hidCoverUrl").val() + "");
        }
        //多图文
        else if (radiosChecked == "3") {


        }


    });
    //查询图文消息
    $("#simple-select").click(function () {

        createPopup("gray-simple-select");


    });
    //    $("#simpleUpdate").click(function () {
    //     
    //        $("#txtName").val($("#hidTitle").val());
    //        $("#txtAuthor").val($("#hidAuthor").val());
    //        //$("#spanImg img").attr("src", "../../" + $("#hidCoverUrl").val());

    //        //清除原有的
    //        $("#spanImg").text("");
    //        var img = $("<img  class='nopic' style='line-height: 150px;'>").attr("src", "../../" + $("#hidCoverUrl").val()).attr("id", "file_upload_img");
    //        $("#spanImg").append(img);
    //        $("#txtAbstract").text($("#hidAbstract").val());
    //        $("#txtDescribe").val($("#hidText").val());

    //        $("#txtTheOriginalLink").val($("#hidTheOriginalLink").val());

    //        if ($("#hidIsImg").val() == "true") {

    //            $("#txtshowmain").attr("checked", "checked");
    //        }
    //        createPopup("gray-active-cover-add");
    //        $(".ke-container").remove(); //每次加载都要加载富文本编辑器，先删除前面生成的，不然会重复（这里是一个问题，如果不动态创建，append弹层后富文本失效）
    //        //富文本编辑器的生成代码
    //        editor = KindEditor.create("#txtDescribe", {
    //            resizeType: 1,
    //            allowPreviewEmoticons: false,
    //            allowImageUpload: true,
    //            items: [
    //                        'fontname', 'fontsize', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
    //                        'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
    //                        'insertunorderedlist', '|', 'emoticons', 'image', 'link'
    //                    ]
    //        });

    //        $("#divImageText").css("display", "block");
    //        $(".simpletext-emulation-title-a").text($("#txtName").val());




    //        //显示封面图片
    //        $("#coverImg").text("");
    //        var coverimg = $("<img>").attr("src", "../../" + $("#hidCoverUrl").val()).attr("id", "coverimgs");
    //        $("#coverImg").append(coverimg);



    //    });

    $("#coles-select").click(function () {

        closePopup();

    });


    var rdcover = document.getElementsByName("MoreImage");

    for (var i = 0; i < rdcover.length; i++) {
        if (rdcover[i].checked) {

            if (rdcover[i].value == "MoreImageUrl") {
                $("#divMoreImageUrl").show();
                $("#divMoreImagefile").hide();
            } else if (rdcover[i].value == "MoreImagefile") {
                $("#divMoreImagefile").show();
                $("#divMoreImageUrl").hide();
            }
        }

    }
    $("input[name=MoreImage]").change(function () {

        if ($(this).val() == "MoreImageUrl") {
            $("#divMoreImageUrl").show();
            $("#divMoreImagefile").hide();
        } else if ($(this).val() == "MoreImagefile") {
            $("#divMoreImagefile").show();
            $("#divMoreImageUrl").hide();
        }

    });


});
function ChangeImageText() {


    if ($("#selImageText").val() == "1") {
        $("#Text").css("display", "block");
        $("#OneImageText").css("display", "none");
        $("#MoreImageText").css("display", "none");
        radiosChecked = "1";
    }
    else if ($("#selImageText").val() == "2") {
        $("#OneImageText").css("display", "block");
        $("#MoreImageText").css("display", "none");
        $("#Text").css("display", "none");
        radiosChecked = "2";
    }
    else if ($("#selImageText").val() == "3") {
        $("#OneImageText").css("display", "none");
        $("#MoreImageText").css("display", "block");
        $("#Text").css("display", "none");
        radiosChecked = "3";
    }

}

// 点击取消的时候
function btnCancel() {
    GoToLinkUrl("", "../../WeiXinManage/AutoReply");
   
};






$(function () {
    var bl = true;
    var selConditions = $("#selConditions")[0];
    for (var i = selConditions.length - 1; i >= 0; i--) {
        selConditions.options[i] = null;
    }
    //    var opt = new Option("请选择条件", "-1");
    //    selConditions.options.add(opt);
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
                        if (jsonRes.list[i].value == 1) {
                            bl = Conditions1;
                        }
                        if (jsonRes.list[i].value == 3) {
                            bl = Conditions3;
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
    if (type == "") {
        type = 2;
    }
    $("#selConditions").val(type);
    $("#selConditions").change();
    $("#hidConditions").val(type);
});

//克隆实体类
function clone(myObj) {
    if (typeof (myObj) != 'object') return myObj;
    if (myObj == null) return myObj;
    var myNewObj = new Object();
    for (var i in myObj) myNewObj[i] = clone(myObj[i]);
    return myNewObj;
}
//判断长度
//        function getLength(str) {
//            var len = str.length;
//            var reLen = 0;
//            for (var i = 0; i < len; i++) {
//                if (str.charCodeAt(i) < 27 || str.charCodeAt(i) > 126) {
//                    // 全角    
//                    reLen += 2;
//                } else {
//                    reLen++;
//                }
//            }
//            return reLen;
//        }


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
    if ($("#hidTagId").val() == "") {
        $("#simple-select").parent().parent().next().children(".prompt").text("请添加或选择素材");
        return false;
    } else {
        $("#simple-select").parent().parent().next().children(".prompt").text("");
    }
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
    var res = $("#hidTagId").val();
    var jsonRes = JSON.parse(res);
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
                    //MaterialPlus = $("#selFunction2").val();
                } else if (tag == "view") {
                    if ($("#txtMenuUrl2").val().trim() == "请输入url") {
                        $(".c03").text(" ");
                        $(this).focus();
                        $(".c03", $("#txtMenuUrl2").parent()).text("请输入url");
                        return false;
                    }
                    else {
                        $(".c03", $("#txtMenuUrl2").parent()).text(" ");
                    }
                    //MaterialPlus = $("#txtMenuUrl2").val().trim();
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
        url: "../../WeiXinManage/ADDAutoReply",
        data: { "autoresponderSettings": JSON.stringify(autoresponderSettings), "MaterialPlus": MaterialPlus },
        success: function (jsonRes) {
          
            if (jsonRes == "ok") {
                $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                $("#operateTip").html("添加成功！").change();
                if (type == "" || type == 2) {

                    GoToLinkUrl("", "../../WeiXinManage/AutoReply")
                }
            }
            else if (jsonRes == "repeat") {
                $(".Loading").removeClass("style03 greenBackGround").addClass("yellowBackGround");
                $("#operateTip").html("不能添加重复的关键字！").change();
                return;
            }
            else {
                $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                $("#operateTip").html("添加失败！").change();
            }
        }
    });

};


$(function () {
    $("#selConditions").change(function () {

        if ($(this).find("option:selected").val() == "1") {
            $("#Divhidden").hide();
            $("#Text").attr('disabled', false);
            $("#MoreImageText").attr('disabled', false);

        } else if ($(this).find("option:selected").val() == "2") {
            $("#Divhidden").show();

            $("#Text").attr('disabled', false);
            $("#MoreImageText").attr('disabled', false);
        } else if ($(this).find("option:selected").val() == "3") {

            $("#Divhidden").hide();
            $("#Text").attr('disabled', false);
            $("#MoreImageText").attr('disabled', false);
        }
        else if ($(this).find("option:selected").val() == "4") {
            $("#Divhidden").hide();
            $("#Text").attr('disabled', 'disabled');
            $("#MoreImageText").attr('disabled', 'disabled');
            $("#OneImageText").attr("checked", "checked");
            $("#divOneImageText").show();
            $("#divText").hide();
            $("#divMoreImageText").hide();


        }
        $("#hidConditions").val($(this).find("option:selected").val());
    });

});



function FileUpload() {

    //图片上传
    $.ajaxFileUpload({
        url: '../../WeiXinManage/UploadImage', //用于文件上传的服务器端请求地址
        secureuri: false, //一般设置为false
        fileElementId: "file_upload", //文件上传空间的id属性  <input type="file" id="file" name="file" />
        dataType: 'text', //返回值类型 一般设置为json
        success: function (res) //服务器成功响应处理函数
        {

            var reg = /\.[a-z]{3,4}/g;
            if (reg.test(res)) {
                $("#img").hide();
                //清除原有的
                $("#spanImg").text("");
                var img = $("<img class='nopic' style='line-height: 150px;'>").attr("src", "../../UploadFile/WeiXin/" + res + "").attr("id", "file_upload_img");
                $("#spanImg").append(img);


                $("#hidCoverUrl").val($("#file_upload_img").attr("src").replace("../../", ""));
                //显示封面图片
                $("#coverImg").text("");
                var coverimg = $("<img>").attr("src", "../../UploadFile/WeiXin/" + res + "").attr("id", "coverimgs");
                $("#coverImg").append(coverimg);

                //  $("#hidCoverUrl").val($("#file_upload_img").attr("src"));

                //var dd = $(eventSrc).parent().parent().attr("class")
            } else {
//                alert(res);
            }
        },
        error: function () //服务器响应失败处理函数
        {
            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
            $("#operateTip").html("提交过程中出现未知错误").change();
        }
    });

}


function MoreImageFileUpload() {

    //图片上传
    $.ajaxFileUpload({
        url: '../../WeiXinManage/UploadImage', //用于文件上传的服务器端请求地址
        secureuri: false, //一般设置为false
        fileElementId: "MoreImage_file_upload", //文件上传空间的id属性  <input type="file" id="file" name="file" />
        dataType: 'text', //返回值类型 一般设置为json
        success: function (res) //服务器成功响应处理函数
        {

            var reg = /\.[a-z]{3,4}/g;
            if (reg.test(res)) {
                $("#MoreImage_none").hide();
                $("#MoreImage_file_upload_img").attr("src", "../../UploadFile/WeiXin/" + res);
                $("#hidMoreImage_img").val($("#MoreImage_file_upload_img").attr("src", "../../UploadFile/WeiXin/" + res));
                $("#MoreImage_file_upload_img").css("display", "block");
                //var dd = $(eventSrc).parent().parent().attr("class")
            } else {
                //alert(res);
            }
        },
        error: function () //服务器响应失败处理函数
        {

            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
            $("#operateTip").html("提交过程中出现未知错误").change();
        }
    });

}
function InsertRow() {
    var tableRow = document.getElementById("myPressPaperTable");
    var rowIndex = tableRow.rows.length;
    if (rowIndex <= 8) {
        var trRow = tableRow.insertRow(rowIndex);
        trRow.id = "appmsgItem" + rowIndex;
        trRow.lang = rowIndex;
        var cel1 = trRow.insertCell(0);
        cel1.innerHTML = "标题";
        var cel2 = trRow.insertCell(1);
        cel2.innerHTML = '<img src="../../Images/Default.png" width="50px" height="50px" />';
        var cel3 = trRow.insertCell(2);
        cel3.innerHTML = '<a onclick="Editing(event)" href="javascript:void(0)" class="c07">编辑</a>   <a href="javascript:void(0)" data-id=' + rowIndex + ' class="r10 c07"onclick=\"dlRow(event)\" >删除</a>';
        var cel4 = trRow.insertCell(3);
        cel4.innerHTML = ' <input type="hidden" id="hidMoreImagetxtName' + rowIndex + '" /><input type="hidden" id="hidMoreImage' + rowIndex + '" /><input type="hidden" id="hidMoreImage_file_upload_img' + rowIndex + '" /><input type="hidden" id="hidtxtDescribe_MoreImage' + rowIndex + '" />';
    }
    else { alert("最多只能有八条图文"); }
}

//删除行
function dlRow(event) {

    var tables = document.getElementById("myPressPaperTable");

    if (tables.rows.length <= 2) {

        $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
        $("#operateTip").html("无法删除，多条图文至少需要2条消息").change();
        return;
    }


    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;

    var rowId = $(eventSrc).parent("td").parent("tr").attr("id");

    var deleteRow = document.getElementById(rowId).rowIndex;



    document.getElementById("myPressPaperTable").deleteRow(deleteRow);

    //重新设置ID
    var index = 0;
    $("#myPressPaperTable tr:gt(0)").each(function () {

        index++;

        $(this).attr("id", "appmsgItem" + index);
        $(this).attr("lang", index);

        $("td input[type='hidden']:eq(0)", $(this)).attr("id", "hidMoreImagetxtName" + index);
        $("td input[type='hidden']:eq(1)", $(this)).attr("id", "hidMoreImage" + index);
        $("td input[type='hidden']:eq(2)", $(this)).attr("id", "hidMoreImage_file_upload_img" + index);
        $("td input[type='hidden']:eq(3)", $(this)).attr("id", "hidtxtDescribe_MoreImage" + index);


    });
}


$(function () {
    $("#hidContains").val($("input[name='Contains']").val());
    $("input[name='Contains']").change(function () {
        $("#hidContains").val($(this).val());

    });

});


//记录点击是那一行
var tag = "";
var MoreImage_editor = "";
//点击编辑时
//function Editing(event) {
//    createPopup("gray-bg");
//    event = event ? event : window.event;
//    var eventSrc = event.srcElement ? event.srcElement : event.target;
//    tag = $(eventSrc).parent("td").parent("tr").attr("lang");

//    $(".ke-container").remove(); //每次加载都要加载富文本编辑器，先删除前面生成的，不然会重复（这里是一个问题，如果不动态创建，append弹层后富文本失效）
//    //富文本编辑器的生成代码
//    MoreImage_editor = KindEditor.create("#txtDescribe_MoreImage", {
//        resizeType: 1,
//        allowPreviewEmoticons: false,
//        allowImageUpload: true,
//        items: [
//                        'fontname', 'fontsize', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
//                        'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
//                        'insertunorderedlist', '|', 'emoticons', 'image', 'link'
//                    ]
//    });

//    $("#MoreImagetxtName").val($("#hidMoreImagetxtName" + tag + "").val());

//    $("#MoreImage").val($("#hidMoreImage" + tag + "").val());
//    $("#MoreImage_file_upload_img").attr("src", $("#hidMoreImage_file_upload_img" + tag + "").val());
//    MoreImage_editor.html($("#hidtxtDescribe_MoreImage" + tag + "").val());



//}

$(function () {
    //一些交互样式
    if ($("#txtKeyWord").val() == "请输入关键词") {
        $("#txtKeyWord").css({ "color": "gray" });
    } else {
        $("#txtKeyWord").css({ "color": "#333" });
    }
    $("#txtKeyWord").focus(function () {
        if ($(this).val() == "请输入关键词") {
            $(this).val("");
        }
    });
    $("#txtKeyWord").blur(function () {
        if ($(this).val() == "") {
            $(this).val("请输入关键词");
        } else {
            $(this).css({ "color": "#333" });
        }
    });

    if ($("#ReplyText").val() == "请输入内容") {
        $("#ReplyText").css({ "color": "gray" });
    } else {
        $("#ReplyText").css({ "color": "#333" });
    }
    $("#ReplyText").focus(function () {
        if ($(this).val() == "请输入内容") {
            $(this).val("");
        }
    })
    $("#ReplyText").blur(function () {
        if ($(this).val() == "") {
            $(this).val("请输入内容");
        } else {
            $(this).css({ "color": "#333" });
        }
    });

    if ($("#txtName").val() == "请输入标题") {
        $("#txtName").css({ "color": "gray" });
    } else {
        $("#txtName").css({ "color": "#333" });
    }

    $("#txtName").focus(function () {
        if ($(this).val() == "请输入标题") {
            $(this).val("");
        }
    });
    $("#txtName").blur(function () {
        if ($(this).val() == "") {
            $(this).val("请输入标题");
        } else {
            $(this).css({ "color": "#333" });
        }
    });


    if ($("#txtAbstract").text() == "请输入摘要") {
        $("#txtAbstract").css({ "color": "gray" });
    } else {
        $("#txtAbstract").css({ "color": "#333" });
    }

    $("#txtAbstract").focus(function () {
        if ($(this).text() == "请输入摘要") {
            $(this).text("");
        }
    });
    $("#txtAbstract").blur(function () {
        if ($(this).text() == "") {
            $(this).text("请输入摘要");
        } else {
            $(this).text({ "color": "#333" });
        }
    });

    if ($("#MoreImagetxtName").val() == "请输入标题") {
        $("#MoreImagetxtName").css({ "color": "gray" });
    } else {
        $("#MoreImagetxtName").css({ "color": "#333" });
    }

    $("#MoreImagetxtName").focus(function () {
        if ($(this).val() == "请输入标题") {
            $(this).val("");
        }
    });
    $("#MoreImagetxtName").blur(function () {


        if ($(this).val() == "") {
            $(this).val("请输入标题");

        } else {
            $(this).css({ "color": "#333" });

        }
    });


});

//获取tr行
function SelectedEvents(event) {

    $(getEventTarget(event, 2)).find("input").attr("checked", "checked");
    $("#hidSelectSave").val($(getEventTarget(event, 2)).find("input").val());
}

function getEventTarget(event, targetType) {
    event = event || window.event;
    if (targetType == 1) {// 获得触发的对象
        return event.target || event.srcElement;
    } else if (targetType == 2) {// 获得处理事件的对象
        return event.currentTarget;
    }
}

$(function () {

    $("#SelectSave").click(function () {
        $.ajax({
            type: "get",
            url: "../../WeiXinManage/GetMaterialManageId",
            data: { "MaterialId": $("#hidSelectSave").val() },
            cache: false,
            success: function (res) {
                if (res != "") {
                    var jsonRes = JSON.parse(res);
                    $("#hidTitle").val(jsonRes.Title);
                    $("#hidAuthor").val(jsonRes.Author);
                    $("#hidCoverUrl").val(jsonRes.CoverUrl);
                    $("#hidAbstract").val(jsonRes.Abstract);
                    $("#hidText").val(jsonRes.Text);
                    $("#hidTheOriginalLink").val(jsonRes.TheOriginalLink);
                    $("#hidIsImg").val(jsonRes.IsImg);
                    closePopup();
                    $("#divImageText").css("display", "block");
                    $(".simpletext-emulation-title-a").text(jsonRes.Title);
                    $(".simpletext-emulation-img img").attr("src", "../../" + jsonRes.CoverUrl + "");
                }
            }
        });
        closePopup();
    });

});
///////////////////////////////////////////////////////////////////////////////////////////////////////
function ischange(obj) {
    var divlist = $("#selectul").find("div");
    if ($(obj).attr('checked') == 'checked') {
        divlist.eq(1).hide();
        divlist.eq(2).hide();
        $("#MenuSingle").show();
    } else {
        divlist.eq(1).show();
        divlist.eq(2).show();
        $("#MenuSingle").hide();
    }
}


function imgtextShow() {
    $("#simple-select").parent().parent().next().children(".prompt").text("请添加或选择素材").hide();
    $("#divlist").html('');
    var res = $("#hidTagId").val();
    var jsonRes = JSON.parse(res);
    var list = jsonRes;
    for (var i = 0; i < list.length; i++) {
        //文本
        if (list[i].MessageType == "1") {
            $("#MenuText").html(list[i].Text.replace(new RegExp("\n", "gm"), "</br>"));
            $("#MenuText").show();
            $("#MenuSingle").show();
            $("#divImageText").hide();
            $("#divlist").hide();
            //单图文
        } else if (list[i].MessageType == "2") {
            $("#title").html(list[i].Title);
            $("#imgurl").attr("src", "../" + list[i].CoverUrl);
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
function plusHtml(i) {
    var temphtml = '<div id="plus' + i + '" class="form-touch t10">';
    temphtml += '<div class="t2">';
    temphtml += '<input type="radio" name="radplus' + i + '" value="none" checked="checked">';
    temphtml += '<label class="l5 r5" for="radplus' + i + '">图文详情(默认)</label>';
    temphtml += '</div>';
    temphtml += '<div class="t2">';
    temphtml += '<input  type="radio" name="radplus' + i + '" value="click">';
    temphtml += '<label class="l5 r5" for="radplus' + i + '">触发功能</label><select id="selplus' + i + '">';
      for (var j = 0; j < hidFuncitonType.length; j++) {
        temphtml += '<option value="' + hidFuncitonType[j].Key + '">' + hidFuncitonType[j].Name + '</option>';
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

