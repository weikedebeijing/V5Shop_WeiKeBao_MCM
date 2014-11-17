
//克隆实体类
function clone(myObj) {
    if (typeof (myObj) != 'object') return myObj;
    if (myObj == null) return myObj;
    var myNewObj = new Object();
    for (var i in myObj) myNewObj[i] = clone(myObj[i]);
    return myNewObj;
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


//var MenuImaTextValue;
//if (chackedTag == "returnClick") {
//    if ($("#MenuImaText").val() == "1") {
//        $("#MenuText").css("display", "block");
//        $("#MenuSingle").css("display", "none");
//        $("#MenuMore").css("display", "none");
//        MenuImaTextValue = $("#MenuImaText").val();
//    }
//    else if ($("#MenuImaText").val() == "2") {
//        $("#MenuSingle").css("display", "block");
//        $("#MenuText").css("display", "none");
//        $("#MenuMore").css("display", "none");
//        MenuImaTextValue = $("#MenuImaText").val();
//    }
//    else if ($("#MenuImaText").val() == "3") {
//        $("#MenuMore").css("display", "block");
//        $("#MenuText").css("display", "none");
//        $("#MenuSingle").css("display", "none");
//        MenuImaTextValue = $("#MenuImaText").val();
//    }

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
    if (chackedTag == "click") {
        if ($("#selFunction").val() == "-1") {
            $(this).focus();
            $("#operateTip").html("请选择触发功能!").change();
            return false;
        }

    }
    if (chackedTag == "view") {
        if ($("#txtMenuUrl").val().trim() == "请输入url") {

            $(this).focus();
            $("#operateTip").html("请输入url!").change();
            return false;
        }

    }
    return true;
}

//获取tr行
//function SelectedEvents(event) {

//    $(getEventTarget(event, 2)).find("input").attr("checked", "checked");
//    $("#hidSelectSave").val($(getEventTarget(event, 2)).find("input").val());
//}

//function getEventTarget(event, targetType) {
//    event = event || window.event;
//    if (targetType == 1) {// 获得触发的对象
//        return event.target || event.srcElement;
//    } else if (targetType == 2) {// 获得处理事件的对象
//        return event.currentTarget;
//    }
//}



var rdUrl = "";
$(function () {

    //    //查询图文消息
    //    $("#simple-select").click(function () {

    //        createPopup("gray-simple-select");


    //    });

    //    $("#coles-select").click(function () {

    //        closePopup();

    //    });


    //    $("#SelectSave").click(function () {
    //        $.ajax({
    //            type: "get",
    //            url: "../../WeiXinManage/GetMaterialManageId",
    //            data: { "MaterialId": $("#hidSelectSave").val() },
    //            cache: false,
    //            success: function (res) {
    //                if (res != "") {
    //                    var jsonRes = JSON.parse(res);
    //                    $("#hidTitle").val(jsonRes.Title);
    //                    $("#hidAuthor").val(jsonRes.Author);
    //                    $("#hidCoverUrl").val(jsonRes.CoverUrl);
    //                    $("#hidAbstract").val(jsonRes.Abstract);
    //                    $("#hidText").val(jsonRes.Text);
    //                    $("#hidTheOriginalLink").val(jsonRes.TheOriginalLink);
    //                    $("#hidIsImg").val(jsonRes.IsImg);
    //                    $("#hidJumpUrl").val(jsonRes.JumpUrl);
    //                    $("#hidJump").val(jsonRes.Jump);
    //                    closePopup();
    //                    $("#divImageText").css("display", "block");
    //                    $(".simpletext-emulation-title-a").text(jsonRes.Title);
    //                    $(".simpletext-emulation-img img").attr("src", "../../" + jsonRes.CoverUrl + "");
    //                }
    //            }
    //        });
    //        closePopup();
    //    });






    //    //初始化赋值
    //    var radios = $("[name='rdUrl']");
    //    for (var i = 0; i < radios.length; i++) {
    //        if (radios[i].checked) {

    //            rdUrl = radios[i].value;

    //            if (rdUrl == "1") {
    //                $("#divSimpleJump").show();
    //                $(".simpletext-form ul li:eq(4)").hide();

    //            } else if (rdUrl == "0") {
    //                $("#divSimpleJump").hide();
    //                $(".simpletext-form ul li:eq(4)").show();
    //            }
    //        }
    //    }


    //    $("[name='rdUrl']").change(function () {

    //        rdUrl = $(this).val();
    //        if ($(this).val() == "1") {
    //            $("#divSimpleJump").show();
    //            $(".simpletext-form ul li:eq(4)").hide();

    //        }
    //        else {
    //            $("#divSimpleJump").hide();
    //            $(".simpletext-form ul li:eq(4)").show();
    //        }
    //    });

    //    $("#txtMenuUrl2").focus(function () {
    //        if ($(this).val() == "请输入url") {
    //            $(this).val("").css("color", "#333333");
    //        } else {
    //            $(this).css("color", "#333333");
    //        }
    //    });

    //    $("#txtMenuUrl2").blur(function () {
    //        if ($(this).val() == "") {
    //            $(this).val("请输入url").css("color", "gray");
    //        }
    //    });




        //添加数据的保存
        $("#btnSave").click(function () {

            //        var valedateRes = valedateInput();
            //        if (valedateRes) {
            //            if ($("#slParentMenu").val() == "0" && $("#slParentMenu option").length >= 4) {
            //                $(".prompt", $("#txtMenuName").parent().parent()).text("一级菜单数量已满,不能添加");
            //                $("#txtMenuName").focus();
            //                return;
            //            }




            //            var template = JSON.parse(weiXinMenuModel.replace(new RegExp("\n", "gm"), "").replace(new RegExp("\t", "gm"), ""));
            //            var newWeiXinMenuModel = clone(template);
            //            newWeiXinMenuModel.materialManage = new Array();


            //            newWeiXinMenuModel.menu.ParentID = $("#slParentMenu").val();
            //            if (newWeiXinMenuModel.menu.ParentID == "0") {
            //                newWeiXinMenuModel.menu.sub_button = "button";
            //            } else {
            //                newWeiXinMenuModel.menu.sub_button = "sub_button";
            //            }
            //            newWeiXinMenuModel.menu.Name = $("#txtMenuName").val();


            //            if (chackedTag == "view") {
            //                newWeiXinMenuModel.menu.Url = $("#txtMenuUrl").val();
            //                newWeiXinMenuModel.menu.type = "view";
            //            }
            //            else if (chackedTag == "click") {
            //                newWeiXinMenuModel.menu.Key = $("#selFunction").val();
            //                newWeiXinMenuModel.menu.type = "click";
            //            }
            //            else if (chackedTag == "returnClick") {


            //                var newMaterialManage = clone(template.materialManage[0]);
            //                if ($("#MenuImaText").val() == "1") {
            //                    newMaterialManage.MessageType = 1;
            //                    newMaterialManage.Text = $("#textMenuText").val();
            //                    newWeiXinMenuModel.materialManage.push(newMaterialManage);
            //                }


            //                if ($("#MenuImaText").val() == "2") {

            //                    newMaterialManage.Title = $("#hidTitle").val();
            //                    newMaterialManage.TheOriginalLink = $("#hidTheOriginalLink").val();
            //                    newMaterialManage.CoverUrl = $("#hidCoverUrl").val();
            //                    newMaterialManage.Text = $("#hidText").val();
            //                    newMaterialManage.Abstract = $("#hidAbstract").val();
            //                    newMaterialManage.Author = $("#hidAuthor").val();
            //                    newMaterialManage.MessageType = 2;
            //                    newMaterialManage.IsImg = $("#hidIsImg").val();
            //                    newMaterialManage.JumpUrl = $("#hidJumpUrl").val();
            //                    newMaterialManage.Jump = $("#hidJump").val();


            //                    newWeiXinMenuModel.materialManage.push(newMaterialManage);
            //                }


            //                newWeiXinMenuModel.menu.Key = $("#MenuImaText").val();
            //                newWeiXinMenuModel.menu.type = "returnClick";
            //            }
            //            newWeiXinMenuModel.menu.DateCreated = new Date();
            //            newWeiXinMenuModel.menu.DateModified = new Date();
            //            newWeiXinMenuModel.menu.ClickTime = 0;
            //            newWeiXinMenuModel.menu.SortOrder = $("#slOrder").val();

            //            var weiXinMenuModelString = JSON.stringify(newWeiXinMenuModel);
            //            $.ajax({
            //                url: "/WeiXinManage/EditMenu",
            //                type: "post",
            //                data: { "weiXinMenuModelString": weiXinMenuModelString },
            //                cache: false,
            //                success: function (res) {
            //                    if (res == "0") {
            //                        window.location = "../../WeiXinManage/WeiXinMenuList";

            //                    } else {
            //                        $(".Loading").removeClass("style01 style02").addClass("style03");
            //                        $("#operateTip").html(res).change();
            //                    }
            //                }
            //            });
            //        }


            if (!IsEmpty("#txtMenuName") || $("#txtMenuName").val().trim() == "请输入菜单名称") {
                $(".prompt", $("#txtMenuName").parent().parent()).text("请输入菜单名称");
                $("#txtMenuName").focus();
                return;
            } else {
                $(".prompt", $("#txtMenuName").parent().parent()).text("");
            }

            if ($("#txtMenuName").val().trim().length > 7) {
                $(".prompt", $("#txtMenuName").parent().parent()).text("菜单名称不能超过7个字");
                $("#txtMenuName").focus();
                return;
            } else {
                $.ajax({
                    url: "/WeiXinManage/EditMenu",
                    type: "post",
                    data: { "id": MenuId, "name": $("#txtMenuName").val().trim(), "sortrder": $("#slOrder").val() },
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



    //    $("#simple-add").click(function () {

    //    })

    //    //删除就是隐藏
    //    $("#simpleDelete").click(function () {
    //        $("#divImageText").css("display", "none");
    //    });

    //    $("#btnclose").click(function () {
    //        closePopup();
    //    });

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
    //        else if (rdUrl == "0") { $("#hidJump").val(rdUrl); }

    //        closePopup();
    //        $("#divImageText").css("display", "block");
    //        $(".simpletext-emulation-title-a").text($("#txtName").val());
    //        $(".simpletext-emulation-img img").attr("src", "../../" + $("#hidCoverUrl").val() + "");

    //    });

    //    $("[name='after']").change(function () {
    //        $(this).each(function () {

    //            chackedTag = $(this).val();


    //            if ($(this).val() == "click") {
    //                $("#MenuText").css("display", "none");
    //                $("#MenuSingle").css("display", "none");
    //                $("#MenuMore").css("display", "none");

    //            }
    //            else if ($(this).val() == "view") {
    //                $("#MenuText").css("display", "none");
    //                $("#MenuSingle").css("display", "none");
    //                $("#MenuMore").css("display", "none");


    //            }
    //            else if ($(this).val() == "returnClick") {

    //                if ($("#MenuImaText").val() == "1") {
    //                    PublicMenuImaTextChange($("#MenuImaText").val());
    //                }
    //                else if ($("#MenuImaText").val() == "2") {

    //                    PublicMenuImaTextChange($("#MenuSingle").val());
    //                }
    //                else if ($("#MenuImaText").val() == "3") {

    //                    PublicMenuImaTextChange($("#MenuMore").val());
    //                }


    //            }



    //        });

    //    });



    //    $("#MenuImaText").change(function () {

    //        if (chackedTag == "returnClick") {
    //            PublicMenuImaTextChange($(this).val());
    //        }
    //    });


    //    GetFunction();
    //    //编辑的时候不可以更换一级菜单,不可以更换菜单排序
    //    $("#slParentMenu").attr("disabled", "disabled");
    ////    $("#slOrder").attr("disabled", "disabled");

    //    //编辑的时候清空所有提示信息,输入框字体颜色恢复
    //    $(".mod-form li:not(:first) .prompt").text("");
    //    $(".mod-form input[type=text]").css("color", "#333333");

    //加载编辑菜单的初始数据(勾选菜单的数据)
    GetParentMenu();



    //获得所选菜单的ID
    var selectedMenuID = MenuId;

    $.ajax({
        url: "/WeiXinManage/GetMenuByID",
        type: "get",
        data: { "menuID": selectedMenuID },
        cache: false,
        success: function (res) {
            if (res != "") {
                $("#isadd").attr("disabled", "true");
                $("#after01").attr("disabled", "true");
                $("#selFunction").attr("disabled", "true");
                $("#txtMenuUrl").attr("disabled", "true");
                $("#after02").attr("disabled", "true");
                $("#after03").attr("disabled", "true");
                var jsonRes = JSON.parse(res.replace(new RegExp("\n", "gm"), "\\n").replace(new RegExp("\t", "gm"), "\\t"));
                //绑定数据
                $("#hidMenuID").val(jsonRes.ID);
                $("#slParentMenu option").each(function () {
                    if ($(this).get(0).value == jsonRes.ParentID) {
                        $(this).get(0).selected = true;
                    }
                });
                $("#txtMenuName").val(jsonRes.Name);
                if (jsonRes.type == "returnClick" && jsonRes.MaterialManageID != null) {
                    $("#after03").attr("checked", "checked");
                    //                    $("#after01").attr("disabled", "true");
                    //                    $("#selFunction").attr("disabled", "true");
                    //                    $("#txtMenuUrl").attr("disabled", "true");
                    //                    $("#after02").attr("disabled", "true");

                    //                    $("#after03").attr("checked", "checked");

                    $("#MenuSingle").show();
                    //                    var s = document.getElementById("MenuImaText");
                    //                    var ops = s.options;
                    //                    for (var i = 0; i < ops.length; i++) {
                    //                    
                    //                        var tempValue = ops[i].value;
                    //                        if (tempValue == "2")   //这里是你要选的值
                    //                        {
                    //                            ops[i].selected = true;
                    //                            MenuAjaxMaterialManage(jsonRes.MaterialManageID);
                    //                            break;
                    //                        }
                    //                        else if (tempValue == "1") {

                    //                            ops[i].selected = true;
                    //                            MenuAjaxMaterialManage(jsonRes.MaterialManageID, 1);

                    //                            break;
                    //                        }


                    //                    }
                    GetFunction(null);
                    MenuAjaxMaterialManage(jsonRes.MaterialManageID);

                    chackedTag = "returnClick";



                } else if (jsonRes.type == "view") {
                    $("#after02").attr("checked", "checked");
                    //                    $("#after01").attr("disabled", "true");
                    //                    $("#selFunction").attr("disabled", "true");
                    //                    $("#MenuImaText").attr("disabled", "true");
                    //                    $("#after03").attr("disabled", "true");
                    $("#txtMenuUrl").val(jsonRes.Url);
                    chackedTag = "view";

                    GetFunction(null);
                    //                    $("#after01").parent().show();
                    //                    $("#after02").parent().show();

                }
                else if (jsonRes.type == "click" && jsonRes.MaterialManageID == null) {
                    $("#after01").attr("checked", "checked");
                    //                    $("#after02").attr("disabled", "true");
                    //                    //                    $("#after03").attr("disabled", "true");
                    //                    $("#txtMenuUrl").attr("disabled", "true");
                    //                    $("#MenuImaText").attr("disabled", "true");
                    chackedTag = "click";
                    GetFunction(jsonRes.Key);
                    //                    $("#after01").parent().show();
                    //                    $("#after02").parent().show();
                }


                //                    $("#slOrder option").each(function () {
                //                        if ($(this).get(0).value == jsonRes.SortOrder) {
                //                            $(this).get(0).selected = true;
                //                        }
                //                    })
                //编辑的时候不修改排序,这里只需将其排序显示出来
                var order = [1, 2, 3, 4, 5];
                if (jsonRes.sub_button != "sub_button") {
                    order = [1, 2, 3];
                }
                $("#slOrder").text("")
                for (var i = 0; i < order.length; i++) {
                    $("#slOrder").append("<option value=" + order[i] + ">" + order[i] + "</option>");
                }
                $("#slOrder").val(jsonRes.SortOrder)
            }
        }
    })
})



function MenuAjaxMaterialManage(MaterialId, type) {
    //    $("#after01").parent().hide();
    //    $("#after02").parent().hide();
    $.ajax({
        url: "/WeiXinManage/GetMaterialList",
        type: "get",
        data: { "MaterialId": MaterialId },
        cache: false,
        success: function (res) {
            if (res != "{}") {
                var jsonRes = JSON.parse(res);
                var list = jsonRes.materialManageList;
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
            }
        }

    });



}

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


function test(j) {
    var arr = materialPlus.split(',');

    $(":radio[name='radplus" + j + "']").attr("disabled", "disabled");
    $("#txtplus" + j).attr("disabled", "disabled");
    $("#selplus" + j).attr("disabled", "disabled");
    if (arr[j] != "") {

        $("#selplus" + j).val(arr[j]);
        $(":radio[name='radplus" + j + "']").eq(1).attr("checked", true);
        if ($("#selplus" + j).val() == -1) {
            $(":radio[name='radplus" + j + "']").eq(2).attr("checked", true);
            $("#txtplus" + j).val(arr[j]);
        }
    }

}
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

function GetParentMenu() {
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
                }
            }
        }
    })
}
function GetFunction(option) {


    var selType = $("#selFunction")[0];
    for (var i = selType.length - 1; i >= 0; i--)
        selType.options[i] = null;
    var opt = new Option("请选择", "-1");
    selType.options.add(opt);
    $.ajax({
        url: "../../WeiXinManage/GetFunction",
        type: "post",
        dataType: "json",
        async: false,
        success: function (data) {
            if (data != null && data.list.length > 0) {

                for (var i = 0; i < data.list.length; i++) {
                    var opt = new Option(data.list[i].text, data.list[i].value);
                    selType.options.add(opt);
                    if (option != null) {

                        if (option == data.list[i].value) {
                            opt.selected = true;
                        }
                    }


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

    if (materialPlus != "") {
        $("#selFunction2").val(materialPlus);
        $("#Radio1").attr("checked", 'click');

        if ($("#selFunction2").val() == -1) {
            $("#view").attr("checked", 'click');
            $("#txtMenuUrl2").val(materialPlus);
        }
    }
    $("input[name=after1]").attr('disabled', 'disabled');
    $("#txtMenuUrl2").attr('disabled', 'disabled');
    $("#selFunction2").attr('disabled', 'disabled');
}






