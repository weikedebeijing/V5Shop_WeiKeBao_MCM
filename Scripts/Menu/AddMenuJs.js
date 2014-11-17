var rdUrl = "";
$(function () {


    //初始化赋值
    var radios = $("[name='rdUrl']");
    for (var i = 0; i < radios.length; i++) {
        if (radios[i].checked) {
            rdUrl = radios[i].value;

            if (rdUrl == "1") {
                $("#divSimpleJump").show();
                $(".simpletext-form ul li:eq(4)").hide();

            } else if (rdUrl == "0") {
                $("#divSimpleJump").hide();
                $(".simpletext-form ul li:eq(4)").show();
            }
        }
    }


    $("[name='rdUrl']").change(function () {

        rdUrl = $(this).val();
        if ($(this).val() == "1") {
            $("#divSimpleJump").show();
            $(".simpletext-form ul li:eq(4)").hide();

        }
        else {
            $("#divSimpleJump").hide();
            $(".simpletext-form ul li:eq(4)").show();
        }
    });

    //菜单名称项获得焦点时,判断一级菜单是否已满(3个)
    $("#txtMenuName").focus(function () {
        if ($(this).val() == "请输入菜单名称") {
            $("#txtMenuName").val("").css("color", "#333333");
        }
    });

    //菜单名称项失去焦点时事件
    $("#txtMenuName").blur(function () {
        if ($(this).val() == "") {
            $("#txtMenuName").val("请输入菜单名称").css("color", "gray");
        }
    });
    $.ajax({
        url: "/WeiXinManage/GetParentMenu",
        type: "get",
        async: false,
        dataType: "text",
        cache: false,
        success: function (res) {
            if (res != "") {
                $("#slParentMenu option:not(:first)").remove(); //清除已加载的数据
                var jsonRes = JSON.parse(res);
                for (var i = 0; i < jsonRes.length; i++) {
                    var $option = $("<option value=" + jsonRes[i].ID + ">" + jsonRes[i].Name + "</option>");
                    $("#slParentMenu").append($option);
                    $("#slOrder option[value='" + jsonRes[i].SortOrder + "']").remove();
                }
            }
        }
    });

    //切换一级菜单事件
    $("#slParentMenu").change(function () {
        //检查该一级菜单下的二级菜单数量是否已满(5个)
        var $selectValue = $(this).val();
        if ($selectValue != "0") {
            $.ajax({
                url: "/WeiXinManage/IsChildMenuFull",
                type: "get",
                data: { "selectValue": $selectValue },
                dataType: "text",
                cache: false,
                success: function (res) {
                    if (res === "1") {
                        $(".prompt", $("#slParentMenu").parent().parent()).text("该一级菜单的子菜单已满不能添加");
                        $("#slParentMenu").focus();
                        $("#btnSave").removeClass("submit01").addClass("disabled").attr("disabled", "disabled");
                        return;
                    } else {
                        $("#txtMenuName").val("请输入菜单名称").css("color", "gray");
                        $(".prompt", $("#slParentMenu").parent().parent()).text("");
                        $(".prompt", $("#txtMenuName").parent().parent()).text("");
                        $("#btnSave").removeClass("disabled").addClass("submit01").attr("disabled", false);
                    }
                }
            });
        } else {
            CheckIsParentMenuFull();
        }

        //获取排序数字
        GetSortOrderNum($selectValue);
    });
    GetFunction();

    ChackedSelect();


    $("[name='after']").change(function () {
        if ($(this).val() == "returnClick") {
            $("#MenuSimple").show();
        } else {
            $("#MenuSimple").hide();
        }
        ChackedSelect();
    })

    //    $("[name='after']").change(function () {
    //        MenuImaTextValue = $("#MenuImaText").val();
    //        chackedTag = $(this).val();


    //    });
    //    var MenuImaTextValue;
    //    if (chackedTag == "returnClick") {
    //        if ($("#MenuImaText").val() == "1") {
    //            $("#MenuText").css("display", "block");
    //            $("#MenuSingle").css("display", "none");
    //            $("#MenuMore").css("display", "none");
    //            MenuImaTextValue = $("#MenuImaText").val();
    //        }
    //        else if ($("#MenuImaText").val() == "2") {
    //            $("#MenuSingle").css("display", "block");
    //            $("#MenuText").css("display", "none");
    //            $("#MenuMore").css("display", "none");
    //            MenuImaTextValue = $("#MenuImaText").val();
    //        }
    //        else if ($("#MenuImaText").val() == "3") {
    //            $("#MenuMore").css("display", "block");
    //            $("#MenuText").css("display", "none");
    //            $("#MenuSingle").css("display", "none");
    //            MenuImaTextValue = $("#MenuImaText").val();
    //        }

    //    }

    //    $("#MenuImaText").change(function () {

    //        MenuImaTextValue = $(this).val();
    //        if (chackedTag == "returnClick") {
    //            PublicMenuImaTextChange(MenuImaTextValue);
    //        }
    //    });

});


function PublicMenuImaTextChange(value) {

    if (value == "1") {
        $("#MenuText").css("display", "block");
        $("#MenuSingle").css("display", "none");
        $("#MenuMore").css("display", "none");
    }
    else if (value == "2") {
        $("#MenuSingle").css("display", "block");
        $("#MenuText").css("display", "none");
        $("#MenuMore").css("display", "none");
    }
    else if (value == "3") {
        $("#MenuMore").css("display", "block");
        $("#MenuText").css("display", "none");
        $("#MenuSingle").css("display", "none");
    }
}


function GetFunction() {

    var selType = $("#selFunction")[0];

    for (var i = selType.length - 1; i >= 0; i--)
        selType.options[i] = null;
    var opt = new Option("请选择", "-1");
    selType.options.add(opt);
    $.ajax({
        url: "../../WeiXinManage/GetFunction",
        type: "post",
        dataType: "json",
        success: function (data) {
            if (data != null && data.list.length > 0) {
                for (var i = 0; i < data.list.length; i++) {
                    var opt = new Option(data.list[i].text, data.list[i].value);
                    selType.options.add(opt);
                }
            }

        }
    });


    var selType2 = $("#selFunction2")[0];
    for (var i = selType2.length - 1; i >= 0; i--)
        selType2.options[i] = null;
    var opt = new Option("请选择", "-1");
    selType2.options.add(opt);

    for (var i = 0; i < hidFuncitonType.length; i++) {

        var opt = new Option(hidFuncitonType[i].Name, hidFuncitonType[i].Key);
        selType2.options.add(opt);

    }


}

var chackedTag = "";
function ChackedSelect() {

    if ($("#after01").attr("checked") == "checked") {
        chackedTag = "click";

    }
    else if ($("#after02").attr("checked") == "checked") {
        chackedTag = "view";
    }
    else if ($("#after03").attr("checked") == "checked") {
        chackedTag = "returnClick";
    }

}

//检查一级菜单是否已满
function CheckIsParentMenuFull() {
    if ($("#slParentMenu").val() == "0" && $("#slParentMenu option").length == 4) {
        $("#txtMenuName").val("一级菜单数量已满,不能添加").css("color", "gray");
        $("#btnSave").removeClass("submit01").addClass("disabled").attr("disabled", "disabled");
    } else {
        if ($("#txtMenuName").val() == "请输入菜单名称") {
            $("#txtMenuName").val("").css("color", "#333333");
            $("#btnSave").removeClass("disabled").addClass("submit01").attr("disabled", false);
        }
    }
}


//获取菜单排序的数字
function GetSortOrderNum($selectValue) {
    //一级菜单有三个排序, 二级菜单有5个排序,并且已存在的排序数字不重复出现
    //如果添加一级菜单
    if ($selectValue == "0") {
        $.ajax({
            url: "/WeiXinManage/GetParentMenuOrder",
            type: "get",
            dataType: "text",
            cache: false,
            success: function (res) {
                $("#slOrder").text("");
                var existsOrder = res.split(',');
                var order = [1, 2, 3];
                for (var i = 0; i < order.length; i++) {
                    var flag = false;
                    for (var j = 0; j < existsOrder.length; j++) {
                        if (existsOrder[j] == order[i]) {
                            flag = true;
                        }
                    }
                    if (flag == false) {
                        var option = $("<option value=" + (i + 1) + ">" + (i + 1) + "</option>");
                        $("#slOrder").append(option);
                    }
                }
            }
        })
    } else {
        //添加二级菜单
        $.ajax({
            url: "/WeiXinManage/GetChildMenuByID",
            type: "get",
            dataType: "text",
            data: { "menuID": $selectValue },
            cache: false,
            success: function (res) {
                $("#slOrder").text("");
                var existsOrder = res.split(',');
                var order = [1, 2, 3, 4, 5];
                for (var i = 0; i < order.length; i++) {
                    var flag = false;
                    for (var j = 0; j < existsOrder.length; j++) {
                        if (existsOrder[j] == order[i]) {
                            flag = true;
                        }
                    }
                    if (flag == false) {
                        var option = $("<option value=" + (i + 1) + ">" + (i + 1) + "</option>");
                        $("#slOrder").append(option);
                    }
                }
            }
        });
    }
}



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
                    $("#hidJumpUrl").val(jsonRes.JumpUrl);
                    $("#hidJump").val(jsonRes.Jump);
                    closePopup();
                    $("#divImageText").css("display", "block");
                    $(".simpletext-emulation-title-a").text(jsonRes.Title);
                    $(".simpletext-emulation-img img").attr("src", "../../" + jsonRes.CoverUrl + "");
                }
            }
        });
        closePopup();
    });





    $("#coles-select").click(function () {

        closePopup();

    });


    //添加数据的保存
    $("#btnSave").click(function () {
        var MaterialPlus = "";
        var valedateRes = valedateInput();
        if (valedateRes) {
            if ($("#slParentMenu").val() == "0" && $("#slParentMenu option").length >= 4) {
                $(".prompt", $("#txtMenuName").parent().parent()).text("一级菜单数量已满,不能添加");
                $("#txtMenuName").focus();
                return;
            }
            var template = JSON.parse(weiXinMenuModelStr);
            var newWeiXinMenuModel = clone(template);
            newWeiXinMenuModel.materialManage = new Array();


            newWeiXinMenuModel.menu.ParentID = $("#slParentMenu").val();
            if (newWeiXinMenuModel.menu.ParentID == "0") {
                newWeiXinMenuModel.menu.sub_button = "button";
            } else {
                newWeiXinMenuModel.menu.sub_button = "sub_button";
            }
            newWeiXinMenuModel.menu.Name = $("#txtMenuName").val();


            if (chackedTag == "view") {
                newWeiXinMenuModel.menu.Url = $("#txtMenuUrl").val();
                newWeiXinMenuModel.menu.type = "view";
            }
            else if (chackedTag == "click") {
                newWeiXinMenuModel.menu.Key = $("#selFunction").val();
                newWeiXinMenuModel.menu.type = "click";
            }
            else {
                var res = $("#hidTagId").val();
                var jsonRes = JSON.parse(res);

                if (jsonRes[0].MessageType == 2) {
                    var tag = $("input[name='after1']:checked").val()
                    if (tag == "click") {
                        MaterialPlus = $("#selFunction2").val();
                    } else if (tag == "view") {
                        MaterialPlus = $("#txtMenuUrl2").val().trim();
                    } else {
                        //默认不插入数据
                    }
                } else if (jsonRes[0].MessageType == 3) {
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

                }
                var newMaterialManage = clone(template.materialManage[0]);
                newWeiXinMenuModel.materialManage = jsonRes;
                for (var i = 0; i < jsonRes.length; i++) {
                    if (jsonRes[i].SonId == undefined || jsonRes[i].SonId == 0) {
                        newWeiXinMenuModel.menu.MaterialManageID = jsonRes[i].Id;
                    }
                }

                //                if ($("#MenuImaText").val() == "1") {
                //                    newWeiXinMenuModel.materialManage.push(list);
                //                }

                //                if ($("#MenuImaText").val() == "2") {
                //                    newWeiXinMenuModel.materialManage.push(list);
                //                }else{
                //                     newWeiXinMenuModel.materialManage.push(list);
                //                }
                newWeiXinMenuModel.menu.Key = "";
                newWeiXinMenuModel.menu.type = "returnClick";

            }
            newWeiXinMenuModel.menu.DateCreated = new Date().Format("yyyy-MM-dd HH:mm:ss");
            newWeiXinMenuModel.menu.DateModified = new Date().Format("yyyy-MM-dd HH:mm:ss");
            newWeiXinMenuModel.menu.ClickTime = 0;
            newWeiXinMenuModel.menu.SortOrder = $("#slOrder").val();

            var weiXinMenuModelString = JSON.stringify(newWeiXinMenuModel);
            $.ajax({
                url: "/WeiXinManage/AddMenus",
                type: "post",
                data: { "weiXinMenuModelString": weiXinMenuModelString, "MaterialPlus": MaterialPlus },
                cache: false,
                success: function (res) {
                    if (res == "0") {
                    
                        GoToLinkUrl("", "../../WeiXinManage/WeiXinMenuList")
                    } else {
                        $(".Loading").removeClass("style01 style02").addClass("style03");
                        $("#operateTip").html(res).change();
                    }
                }
            });
        }
    });


    $("#txtMenuUrl").focus(function () {
        if ($(this).val() == "请输入url") {
            $(this).val("").css("color", "#333333");
        } else {
            $(this).css("color", "#333333");
        }
    });

    $("#txtMenuUrl").blur(function () {
        if ($(this).val() == "") {
            $(this).val("请输入url").css("color", "gray");
        }
    });

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



    var editor;
    var moreText;
    //添加图文
    //    $("#simple-add").click(function () {
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


    //        document.getElementById('txtName').onkeyup = function () {

    //            $("#coverTitle  a").text($("#txtName").val());

    //        };

    //        document.getElementById('txtAbstract').onkeyup = function () {

    //            $("#coverAuthor a").text($("#txtAbstract").val());

    //        };



    //    });

    $("#simpleUpdate").click(function () {
        $("#txtName").val($("#hidTitle").val());
        $("#txtAuthor").val($("#hidAuthor").val());
        $("#spanImg img").attr("src", "../../" + $("#hidCoverUrl").val());
        $("#txtAbstract").text($("#hidAbstract").val());
        $("#txtDescribe").val($("#hidText").val());
        $("#txtTheOriginalLink").val($("#hidTheOriginalLink").val());

        if ($("#hidIsImg").val() == "true") {

            $("#txtshowmain").attr("checked", "checked");
        }







        $(".ke-container").remove(); //每次加载都要加载富文本编辑器，先删除前面生成的，不然会重复（这里是一个问题，如果不动态创建，append弹层后富文本失效）
        //富文本编辑器的生成代码
        editor = KindEditor.create("#txtDescribe", {
            resizeType: 1,
            allowPreviewEmoticons: false,
            allowImageUpload: true,
            items: [
                        'fontname', 'fontsize', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                        'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                        'insertunorderedlist', '|', 'emoticons', 'image', 'link'
                    ]
        });

        $("#divImageText").css("display", "block");
        $(".simpletext-emulation-title-a").text($("#txtName").val());
        $(".simpletext-emulation-img img").attr("src", "../../" + $("#hidCoverUrl").val() + "");



    });


    $("#btnclose").click(function () {
        closePopup();
    });

    $("#simpleDelete").click(function () {
        $("#divImageText").css("display", "none");
    });




    //    //保存
    //    $("#btnInset").click(function () {

    //        var description = editor.html();

    //        //是否显示封面
    //        var txtshowmain;

    //        if ($("#txtshowmain").attr("checked") == 'checked') {

    //            var txtshowmain = true;
    //        }
    //        else { txtshowmain = false; }

    //        $("#hidTitle").val($("#txtName").val());
    //        $("#hidAuthor").val($("#txtAuthor").val());
    //        $("#hidCoverUrl").val($("#hidCoverUrl").val());
    //        $("#hidAbstract").val($("#txtAbstract").val());
    //        $("#hidText").val(editor.html());
    //        $("#hidTheOriginalLink").val($("#txtTheOriginalLink").val());
    //        $("#hidIsImg").val(txtshowmain);
    //        if (rdUrl == "1") {

    //            $("#hidJumpUrl").val($("#SimpleJump").val());
    //            $("#hidJump").val(rdUrl);
    //        }
    //        else { $("#hidJump").val(rdUrl); }



    //        closePopup();
    //        $("#divImageText").css("display", "block");
    //        $(".simpletext-emulation-title-a").text($("#txtName").val());
    //        $(".simpletext-emulation-img img").attr("src", "../../" + $("#hidCoverUrl").val() + "");





    //    });




});

//function FileUpload() {

//    //图片上传
//    $.ajaxFileUpload({
//        url: '../../WeiXinManage/UploadImage', //用于文件上传的服务器端请求地址
//        secureuri: false, //一般设置为false
//        fileElementId: "file_upload", //文件上传空间的id属性  <input type="file" id="file" name="file" />
//        dataType: 'text', //返回值类型 一般设置为json
//        success: function (res) //服务器成功响应处理函数
//        {

//            var reg = /\.[a-z]{3,4}/g;
//            if (reg.test(res)) {
//                $("#img").hide();
//                //清除原有的
//                $("#spanImg").text("");
//                var img = $("<img>").attr("src", "../../UploadFile/WeiXin/" + res + "").attr("id", "file_upload_img");
//                $("#spanImg").append(img);


//                $("#hidCoverUrl").val($("#file_upload_img").attr("src").replace("../../", ""));
//                //显示封面图片
//                $("#coverImg").text("");
//                var coverimg = $("<img>").attr("src", "../../UploadFile/WeiXin/" + res + "").attr("id", "coverimgs");
//                $("#coverImg").append(coverimg);

//                //  $("#hidCoverUrl").val($("#file_upload_img").attr("src"));

//                //var dd = $(eventSrc).parent().parent().attr("class")
//            } else {
//                alert(res);
//            }
//        },
//        error: function () //服务器响应失败处理函数
//        {
//            alert("提交过程中出现未知错误");
//        }
//    });

//}


//脚本验证
function valedateInput() {
    
    if (!IsEmpty("#txtMenuName") || $("#txtMenuName").val().trim() == "请输入菜单名称") {
        $(".prompt", $("#txtMenuName").parent().parent()).text("请输入菜单名称");
        $("#txtMenuName").focus();
        return false;
    } else {
        $(".prompt", $("#txtMenuName").parent().parent()).text("");
    }

    if ($("#txtMenuName").val().trim().length > 7) {
        $(".prompt", $("#txtMenuName").parent().parent()).text("菜单名称不能超过7个字");
        $("#txtMenuName").focus();
        return false;
    }
    if ($("#after03").attr('checked') == 'checked') {

        if (chackedTag == "returnClick") {
            if ($("#hidTagId").val() == "") {
                $(".c03").text("");
                //$("#operateTip").html("请添加或选择素材!").change();
                $("#sc").text("请添加或选择素材");

                return false;
            }
            else {
                var tag = $("input[name='after1']:checked").val()
                if (tag == "click") {
                    if ($("#selFunction2").val() == "-1") {
                        $(".c03").text("");
                        $(this).focus();
                        $(".c03", $("#selFunction2").parent()).text("请选择触发功能");
                        return false;
                    }
                } else if (tag == "view") {
                    if ($("#txtMenuUrl2").val().trim() == "请输入url") {
                        $(".c03").text(" ");
                        $(this).focus();
                        $(".c03", $("#txtMenuUrl2").parent()).text("请输入url");
                        return false;
                    }
                }

            }
        }

    } else {
        if (chackedTag == "click") {

            if ($("#selFunction").val() == "-1") {
                $(".c03").text(" ");
                $(this).focus();
                //$("#operateTip").html("请选择触发功能!").change();
                $(".c03", $("#selFunction").parent()).text("请选择触发功能");
                return false;
            }

        }
        if (chackedTag == "view") {

            if ($("#txtMenuUrl").val().trim() == "请输入url") {
                $(".c03").text(" ");
                $(this).focus();
                $(".c03", $("#txtMenuUrl").parent()).text("请输入url");
                //$("#operateTip").html("请输入url!").change();
                return false;
            }

        }
    }
    return true;
}


//克隆实体类
function clone(myObj) {
    if (typeof (myObj) != 'object') return myObj;
    if (myObj == null) return myObj;
    var myNewObj = new Object();
    for (var i in myObj) myNewObj[i] = clone(myObj[i]);
    return myNewObj;
}


//$("#selFunction").live('change', function () {
//    $("#after01").attr("checked", true);
//   $("[name='after']").change();
//});
//$("#MenuImaText").live('change', function () {
//    $("#after03").attr("checked", true);
//    $("[name='after']").change();
//});
//$("#txtMenuUrl").live('focus', function () {
//    $("#after02").attr("checked", true);
//    //$("[name='after']").change();
//});


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
    //    GetDateFun();
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

//function GetDateFun() {
//    for (var i = 0; i < selectArr.list.length; i++) {
//      var bl=  GetFunctionType(selectArr.list[i].text)
//      if (bl) {
//          selectArr.list[i].remove();
//      
//      }
//    }

//}
//function GetFunctionType(Name) {
//    for (var i = 0; i < hidFuncitonType.length; i++) {
//        if (Name == hidFuncitonType[i].Name) {
//            return true;
//        }
//    }
//    return false;
//}
