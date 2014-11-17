
$(function () {
  
  
    //编辑菜单
    $("#btnEditMenu").click(function () {
        //必须勾选一个且仅勾选一个菜单才能进行编辑操作
        var editIDs = [];
        $(".mod-table-main tr input[type=checkbox]:checked").each(function () {
            editIDs.push($(this).siblings().val());
        })
        if (editIDs.length != 1) {
            $(".Loading").removeClass("style01 style03").addClass("style02");
            $("#operateTip").html("必须勾选一个且仅勾选一个菜单才能进行编辑操作").change();
            return;
        }

        $("#btnSave").css("display", "none");
        $("#btnSaveEdit").css("display", "block");
        $(".gray-bg .title h2").text("编辑菜单");

        //编辑的时候不可以更换一级菜单,不可以更换菜单排序
        $("#slParentMenu").attr("disabled", "disabled");
        $("#slOrder").attr("disabled", "disabled");

        //编辑的时候清空所有提示信息,输入框字体颜色恢复
        $(".mod-form li:not(:first) .prompt").text("");
        $(".mod-form input[type=text]").css("color", "#333333");

        //加载编辑菜单的初始数据(勾选菜单的数据)
        GetParentMenu();

        //弹出遮盖层
        createPopup("dvPopup");

        //获得所选菜单的ID
        var selectedMenuID = $("input[type=checkbox]:checked").siblings().val();
        $.ajax({
            url: "/WeiXinManage/GetMenuByID",
            type: "get",
            data: { "menuID": selectedMenuID },
            cache: false,
            success: function (res) {
                if (res != "") {
                    var jsonRes = JSON.parse(res);
                    //绑定数据
                    $("#hidMenuID").val(jsonRes.ID);
                    $("#slParentMenu option").each(function () {
                        if ($(this).get(0).value == jsonRes.ParentID) {
                            $(this).get(0).selected = true;
                        }
                    })
                    $("#txtMenuName").val(jsonRes.Name);
                    if (jsonRes.type == "click") {
                        $("#txtKeyOrUrl").val(jsonRes.Key);
                    } else {
                        $("#txtKeyOrUrl").val(jsonRes.Url);
                    }
                    //                    $("#slOrder option").each(function () {
                    //                        if ($(this).get(0).value == jsonRes.SortOrder) {
                    //                            $(this).get(0).selected = true;
                    //                        }
                    //                    })
                    //编辑的时候不修改排序,这里只需将其排序显示出来
                    $("#slOrder").text("");
                    $("#slOrder").append("<option value=" + jsonRes.SortOrder + ">" + jsonRes.SortOrder + "</option>")
                }
            }
        })
    })



    //更新菜单到微信
    $("#btnUpdateToWeiXin").click(function () {
        $.ajax({
            url: "/WeiXinManage/UpdateMenuToWeiXin",
            type: "get",
            cache: false,
            dataType: "text",
            success: function (res) {
                var jsonRes = JSON.parse(res);
                if (jsonRes.errcode == 0 && jsonRes.errmsg == "ok") {
                    $(".Loading").removeClass("style02 style03").addClass("style01");
                    $("#operateTip").html("更新成功").change();
                } else {
                    $(".Loading").removeClass("style01 style02").addClass("style03");
                    $("#operateTip").html("更新失败").change();
                }
            }
        })
    })

    //编辑保存
    $("#btnSaveEdit").click(function () {
        var valedateRes = valedateInput();
        if (valedateRes) {
            var template = JSON.parse(weiXinMenuModelStr);
            var weiXinMenuModel = clone(template);
            weiXinMenuModel.ID = $("#hidMenuID").val();
            weiXinMenuModel.ParentID = $("#slParentMenu").val();
            if (weiXinMenuModel.ParentID == "0") {
                weiXinMenuModel.sub_button = "button";
            } else {
                weiXinMenuModel.sub_button = "sub_button";
            }
            weiXinMenuModel.Name = $("#txtMenuName").val();
            var keyOrUrl = $("#txtKeyOrUrl").val();
            var reg = /http:/g;
            if (reg.test(keyOrUrl)) {
                weiXinMenuModel.Url = keyOrUrl;
                weiXinMenuModel.type = "view";
            } else {
                weiXinMenuModel.Key = keyOrUrl;
                weiXinMenuModel.type = "click";
            }
            weiXinMenuModel.DateModified = new Date();
            weiXinMenuModel.SortOrder = $("#slOrder").val();

            var weiXinMenuModelString = JSON.stringify(weiXinMenuModel);
            $.ajax({
                url: "/WeiXinManage/EditMenu",
                type: "post",
                data: { "weiXinMenuModelString": weiXinMenuModelString },
                cache: false,
                success: function (res) {
                    if (res == "0") {
                        closePopup();
                        RedirectToUrlByTime(window.location.href, 1000);
                    } else {
                        $(".Loading").removeClass("style01 style02").addClass("style03");
                        $("#operateTip").html(res).change();
                        RedirectToUrlByTime(window.location.href, 1000);
                    }
                }
            })
        }
    })

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
            })
        } else {
            CheckIsParentMenuFull();
        }

        //获取排序数字
        GetSortOrderNum($selectValue);
    })


  

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
            })
        }
    }

    //菜单名称项获得焦点时,判断一级菜单是否已满(3个)
    $("#txtMenuName").focus(function () {
        if ($(this).val() == "请输入菜单名称") {
            $("#txtMenuName").val("").css("color", "#333333");
        }
    })

    //菜单名称项失去焦点时事件
    $("#txtMenuName").blur(function () {
        if ($(this).val() == "") {
            $("#txtMenuName").val("请输入菜单名称").css("color", "gray");
        }
    })

    $("#txtKeyOrUrl").focus(function () {
        if ($(this).val() == "请输入触发关联词或外链Url") {
            $(this).val("").css("color", "#333333");
        } else {
            $(this).css("color", "#333333");
        }
    })

    $("#txtKeyOrUrl").blur(function () {
        if ($(this).val() == "") {
            $(this).val("请输入触发关联词或外链Url").css("color", "gray");
        }
    })

    //添加数据的保存
    $("#btnSave").click(function () {
        var valedateRes = valedateInput();
        if (valedateRes) {
            if ($("#slParentMenu").val() == "0" && $("#slParentMenu option").length >= 4) {
                $(".prompt", $("#txtMenuName").parent().parent()).text("一级菜单数量已满,不能添加");
                $("#txtMenuName").focus();
                return;
            }
            var template = JSON.parse(weiXinMenuModelStr);
            var weiXinMenuModel = clone(template);
            weiXinMenuModel.ParentID = $("#slParentMenu").val();
            if (weiXinMenuModel.ParentID == "0") {
                weiXinMenuModel.sub_button = "button";
            } else {
                weiXinMenuModel.sub_button = "sub_button";
            }
            weiXinMenuModel.Name = $("#txtMenuName").val();
            var keyOrUrl = $("#txtKeyOrUrl").val();
            var reg = /http:/g;
            if (reg.test(keyOrUrl)) {
                weiXinMenuModel.Url = keyOrUrl;
                weiXinMenuModel.type = "view";
            } else {
                weiXinMenuModel.Key = keyOrUrl;
                weiXinMenuModel.type = "click";
            }
            weiXinMenuModel.DateCreated = new Date();
            weiXinMenuModel.DateModified = new Date();
            weiXinMenuModel.ClickTime = 0;
            weiXinMenuModel.SortOrder = $("#slOrder").val();

            var weiXinMenuModelString = JSON.stringify(weiXinMenuModel);
            $.ajax({
                url: "/WeiXinManage/AddMenu",
                type: "post",
                data: { "weiXinMenuModelString": weiXinMenuModelString },
                cache: false,
                success: function (res) {
                    if (res == "0") {
                        closePopup();
                        location.reload();
                    } else {
                        $(".Loading").removeClass("style01 style02").addClass("style03");
                        $("#operateTip").html(res).change();
                    }
                }
            })
        }
    })
})
//删除菜单
function MenuDels(event) {
    var delIDs = [];
    $(".mod-table-main tr input[type=checkbox]:checked").each(function () {
        delIDs.push($(this).siblings().val());
    })
    if (delIDs.length == 0) {
        $(".Loading").removeClass("style01 style03").addClass("style02");
        $("#operateTip").html("请勾选需要删除的菜单项").change();
        return;
    }
    if (confirmThis(event, "确定要删除？")) {
        var delIDsStr = JSON.stringify(delIDs);
        $.ajax({
            url: "/WeiXinManage/DelMenu",
            type: "post",
            data: { "delIDsStr": delIDsStr },
            success: function (res) {
           
                if (res == "0") {
                    $(".Loading").removeClass("style02 style03").addClass("style01");
                    $("#operateTip").html("删除成功").change();
                    RedirectToUrlByTime(window.location.href, 1000);
                } else if (res == "2") {
                    $(".Loading").removeClass("style01 style03").addClass("style02");
                    $("#operateTip").html("有二级菜单的一级菜单不能删除").change();
                    RedirectToUrlByTime(window.location.href, 1000);
                } else {
                    $(".Loading").removeClass("style01 style02").addClass("style03");
                    $("#operateTip").html("未能删除").change();
                }
            }
        })
    }
}

function MenuDel(event, ID) {
    var delIDs = [];
    var delIDs = new Array();
    delIDs.push(ID);
    if (confirmThis(event, "确定要删除？")) {
        var delIDsStr = JSON.stringify(delIDs);
        $.ajax({
            url: "/WeiXinManage/DelMenu",
            type: "post",
            data: { "delIDsStr": delIDsStr },
            success: function (res) {
                if (res == "0") {
                    $(".Loading").removeClass("style02 style03").addClass("style01");
                    $("#operateTip").html("删除成功").change();
                    RedirectToUrlByTime(window.location.href, 1000);
                } else if (res == "2") {
                    $(".Loading").removeClass("style01 style03").addClass("style02");
                    $("#operateTip").html("有二级菜单的一级菜单不能删除").change();
                    RedirectToUrlByTime(window.location.href, 1000);
                } else {
                    $(".Loading").removeClass("style01 style02").addClass("style03");
                    $("#operateTip").html("未能删除").change();
                }
            }
        })
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

    if (!IsEmpty("#txtKeyOrUrl") || $("#txtKeyOrUrl").val().trim() == "请输入触发关联词或外链Url") {
        $(".prompt", $("#txtKeyOrUrl").parent().parent()).text("请输入触发关联词或外链Url");
        $("#txtKeyOrUrl").focus();
        return false;
    } else {
        $(".prompt", $("#txtKeyOrUrl").parent().parent()).text("");
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