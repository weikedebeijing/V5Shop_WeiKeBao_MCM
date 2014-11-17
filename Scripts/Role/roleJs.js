
function roleClose() {

    popupClose('gray-add-role');
};

function btn() {
    sendDatas();
    $("#addSubmit").submit();

}

$(function () {






    // 返回平台的菜单
    $.post("/Role/ReturnPlatFormMenusForAdd", "", function (returnData) {
        if (returnData != null) {
            // 把返回的数据加载到指定的地方
            $("#platFormContent").prepend(returnData);
        }
    });

    // 返回其他平台的菜单
    $.post("/Role/ReturnAppMenusForAdd", "", function (returnData) {
        if (returnData != null) {
            // 把返回的数据加载到指定的地方
            $("#contentPaltForm").after(returnData); // 放到平台菜单之后
        }
    });


    $("#addrole").click(function () {

        popupOperate("gray-add-role", "角色设置", "gray-add-role");
    })
});

// 提交过程中的操作
function ajaxFormValidata() {
    var roleName = $("#RoleName").val().trim();

    $(".prompt").text('');

    if (roleName.length <= 0) {
        //warningTip("请输入角色名称");
        validataPrompt($("#RoleName"), '请输入角色名称');
        $("#RoleName").focus();
        return false;
    }


    successTip("努力提交中......");
};

// 点击提交时将选中的数据提交到后台
function sendDatas() {
    // 方案
    // ①：要确定是哪个 title
    // ②：取到当前 son 的id
    // ③:往后台传递的数据为 title+ids
    // 截取后是0_8 就是平台  是9_77 就是其他

    var SendDatas = "";
    var checks = $("input[type=checkbox]");
    // 遍历所有的checkbox
    for (var i = 0; i < checks.length; i++) {
        // 首先必须是选中的
        if ($(checks[i]).attr("checked") == "checked") {
            // 里面的字符必须包含 ‘|’的
            var strCheckID = $(checks[i]).attr("id");
            var length = strCheckID.indexOf('|');
            if (length > 0) {
                var ids = strCheckID.substring(length + 1, strCheckID.length);
                SendDatas += ids + ",";
            }
        }
    };
    if (SendDatas.length > 0) {
        SendDatas = SendDatas.substring(0, SendDatas.length - 1);
        // 并放到隐藏域中
        $("#sendCheckDatas").val(SendDatas);
    }

};

// 注册"所有"复选框点击的时候
function AllCheckBoxClick(event) {

    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;

    // 当选中的是title
    if ($(eventSrc).attr("dir") == "title") {
        // 控制旗下的所有复选框
        // 选中旗下所有的checkBox
        if ($(eventSrc).attr("checked") == "checked") {

            $("input[type=checkbox]", $(eventSrc).parent("li")).not($(eventSrc)).attr("checked", "checked");
        } else {
            $("input[type=checkbox]", $(eventSrc).parent("li")).not($(eventSrc)).attr("checked", false);
        }

    }

    // 当选中的是parent
    if ($(eventSrc).attr("dir") == "parent") {

        // 选中旗下所有的checkBox
        if ($(eventSrc).attr("checked") == "checked") {
            $("input[type=checkbox]", $(eventSrc).parents("tr")[0]).not($(eventSrc)).attr("checked", "checked");
        } else {
            $("input[type=checkbox]", $(eventSrc).parents("tr")[0]).not($(eventSrc)).attr("checked", false);
        }
    }

    // 当选中的是son
    if ($(eventSrc).attr("dir") == "son") {
        //alert('shit3');
        // 检查 所在的所有son是否全部 全部选中 就把 parent选中
    }
};


// 添加会员等级之后
function afterOnSuccess() {
    var result = $("#UpdateTargetHiddenID").html();
    $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
    $("#operateTip").html("添加成功").change();
    if (result == "ok") {
        setTimeout(function () {
            window.location.reload();
        }, 600);

    } else if (result == "No Role") {
        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
        $("#operateTip").html("角色名称不能为空").change();
        $("#RoleName").focus();
    } else if (result == "no menus") {
        $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
        $("#operateTip").html("请勾选权限").change();
    } else if (result == "repeat") {
        $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
        $("#operateTip").html("角色名称重复").change();
        $("#RoleName").val("").focus();
    } else {
        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
        $("#operateTip").html("未知异常，联系管理员").change();
    }
};

// 添加会员等级失败
function afterOnFailure() {
    $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
    $("#operateTip").html("添加角色失败").change();
};

// 去空格
if (!String.prototype.trim) {
    String.prototype.trim = function () {
        var str = this.replace(/^\s+/, ""),
                      end = this.length - 1,
                      ws = /\s/;
        while (ws.test(this.charAt(end))) {
            end--;
        }
        return this.slice(0, end + 1);
    }
}

// 验证提示
var validataPrompt = function ($element, msg) {
    $element.parent().next().find(".prompt").text(msg);
};

var successTip = function (msg) {
    $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
    $("#operateTip").html(msg).change();
};

var warningTip = function (msg) {
    $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
    $("#operateTip").html(msg).change();
};

var errorTip = function (msg) {
    $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
    $("#operateTip").html(msg).change();
};

//-------------------------------------------------------------------修改----------------------------------------------------------




function EditRole(roleId) {

    $.getJSON("../../Role/EditRole", { "roleId": roleId }, function (jsonData) {


        if (jsonData != "") {
            $("#currentRoleID").val(jsonData.ID);
            $("#EditRoleName").val(jsonData.RoleName);
            EditreturnMeuns();

        }
    });
    // 注册返回menus 的事件

    popupOperate("gray-edit-role", "角色设置", "gray-edit-role");

}

// 提交过程中的操作

function EditajaxFormValidata() {
    var roleName = $("#EditRoleName").val().trim();

    $(".prompt").text('');

    if (roleName.length <= 0) {
        //warningTip("请输入角色名称");
        validataPrompt($("#EditRoleName"), '请输入角色名称');
        $("#EditRoleName").focus();
        return false;
    }

    successTip("努力提交中......");
};

// 注册返回menus 的事
function EditreturnMeuns() {
    var roleID = $("#currentRoleID").val();
    // 返回平台的菜单
    $.post("/Role/ReturnPlatFormMenusForEdit", "role_ID=" + roleID + "", function (returnData) {
        if (returnData != null) {
            $("#EditplatFormContent tr").remove();
            // 把返回的数据加载到指定的地方
            $("#EditplatFormContent").prepend(returnData);
        }
    });

    // 返回其他平台的菜单
    $.post("/Role/ReturnAppMenusForEdit", "role_ID=" + roleID + "", function (returnData) {
        if (returnData != null) {
            // 把返回的数据加载到指定的地方

            $("#EditcontentPaltForm").after(returnData); // 放到平台菜单之后
        }
    });
};

// 点击提交时将选中的数据提交到后台
function EditsendDatas() {
  
    // 方案
    // ①：要确定是哪个 title
    // ②：取到当前 son 的id
    // ③:往后台传递的数据为 title+ids
    // 截取后是0_8 就是平台  是9_77 就是其他

    var SendDatas = "";
    var checks = $("input[type=checkbox]");
    // 遍历所有的checkbox
    for (var i = 0; i < checks.length; i++) {
        // 首先必须是选中的
        if ($(checks[i]).attr("checked") == "checked") {
            // 里面的字符必须包含 ‘|’的
            var strCheckID = $(checks[i]).attr("id");
            var length = strCheckID.indexOf('|');
            if (length > 0) {
                var ids = strCheckID.substring(length + 1, strCheckID.length);
                SendDatas += ids + ",";
            }
        }
    };
    if (SendDatas.length > 0) {
        SendDatas = SendDatas.substring(0, SendDatas.length - 1);
        // 并放到隐藏域中
        $("#EditsendCheckDatas").val(SendDatas);
    }
};

// 添加会员等级之后
function EditafterOnSuccess() {
    var result = $("#EditUpdateTargetHiddenID").val();
    if (result == "ok") {
        successTip("修改角色成功");
        if (result == "ok") {
            setTimeout(function () {
                window.location.reload();
            }, 600);
        }
    } else if (result == "no menus") {
        warningTip("请勾选权限");
    } else if (result == "No Role") {
        warningTip("角色名称不能为空");
    } else {
        errorTip("未知异常,联系管理员");
    }
};

// 添加会员等级失败
function EditafterOnFailure() {
    errorTip('修改角色失败');
};

// 点击取消的时候
function btnCancel() {
    popupClose('gray-edit-role');
};


// 注册"所有"复选框点击的时候
function EditAllCheckBoxClick(event) {
    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;

    // 当选中的是title
    if ($(eventSrc).attr("dir") == "top") {
        // 控制旗下的所有复选框

        // 选中旗下所有的checkBox
        if ($(eventSrc).attr("checked") == "checked") {
            $("input[type=checkbox]", $(eventSrc).parent("li")).not($(eventSrc)).attr("checked", "checked");
        } else {
            $("input[type=checkbox]", $(eventSrc).parent("li")).not($(eventSrc)).attr("checked", false);
        }

    }

    // 当选中的是parent
    if ($(eventSrc).attr("dir") == "parent") {
        // 选中旗下所有的checkBox
        if ($(eventSrc).attr("checked") == "checked") {
            $("input[type=checkbox]", $(eventSrc).parents("tr")[0]).not($(eventSrc)).attr("checked", "checked");
        } else {
            $("input[type=checkbox]", $(eventSrc).parents("tr")[0]).not($(eventSrc)).attr("checked", false);
        }
    }

    // 当选中的是son
    if ($(eventSrc).attr("dir") == "son") {
        //alert('son');
    }
};

// 去空格
if (!String.prototype.trim) {
    String.prototype.trim = function () {
        var str = this.replace(/^\s+/, ""),
                      end = this.length - 1,
                      ws = /\s/;
        while (ws.test(this.charAt(end))) {
            end--;
        }
        return this.slice(0, end + 1);
    }
}

// 验证提示
var validataPrompt = function ($element, msg) {
    $element.parent().next().find(".prompt").text(msg);
};

var successTip = function (msg) {
    $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
    $("#operateTip").html(msg).change();
};

var warningTip = function (msg) {
    $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
    $("#operateTip").html(msg).change();
};

var errorTip = function (msg) {
    $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
    $("#operateTip").html(msg).change();
};

function Editbtn() {
    EditsendDatas();
    $("#EditSubmit").submit();
  

}