$(function () {

    $("#addEmailConfig").click(function () {
        popupOperate("gray-add-EmailConfig", "邮件服务设置", "gray-add-EmailConfig");
    });

});


function emailConfigClose() {

    popupClose('gray-add-EmailConfig');
};


function btnsubmit() {
    $("#submit").submit();
}


$(function () {
    // 默认把操作结果隐藏
    //            $("#operateTip").css("display", "none");
    $("#checkbox").click(function () {
        if ($(this).attr("checked") == true) {
            $("#IsUsed").val("1");
        } else {
            $("#IsUsed").val("0");
        }
    })
});

// ajax.BeginForm 的提交前验证

function AjaxFormValidata() {
    $(".prompt").text("");

    if ($("#LoginID").val() == "") {
        $("#LoginID").focus();
        $(".prompt", $("#LoginID").parent().parent()).text("请填写发件人邮箱");

        return false;
    }
    if ($("#Name").val() == "") {
        $("#Name").focus();
        $(".prompt", $("#Name").parent().parent()).text("请填写发件人");

        return false;
    }
    if ($("#Smtp").val() == "") {
        $("#Smtp").focus();
        $(".prompt", $("#Smtp").parent().parent()).text("请填写SMTP服务器");
        return false;
    }
    if ($("#Port").val() == "") {
        $("#Port").focus();
        $(".prompt", $("#Port").parent().parent()).text("请填写SMTP端口号");
        return false;
    }
    if ($("#LoginPass").val() == "") {
        $("#LoginPass").focus();
        $(".prompt", $("#LoginPass").parent().parent()).text("请填写SMTP密码");
        return false;
    }
}
function afterOnSuccess() {
    if ($("#UpdateTargetHiddenID").html() == "ok") {
        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
        $("#operateTip").html("添加成功！").change();
        emailConfigClose();
        window.location.reload();

        //                  // 把添加成功放到<span>中
        //                  $("#ResultTip").css("display", "block").text("添加支付方式成功");

        //                  }else{
        //                   $("#ResultTip").css("display", "block").text($("#UpdateTargetHiddenID").text());
    } else {

        $(".Loading").removeClass("style0green style0yellow").addClass("style0red"); //红色
        $("#operateTip").html("" + $("#UpdateTargetHiddenID").html() + "").change();


    }

}
// 添加会员等级失败
function afterOnFailure() {
    // 把添加失败放到<span>中
    $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
    $("#operateTip").html("添加邮件服务失败").change();
};


function btnSendTest() {

    var Smtp = $("#Smtp").val();
    var Port = $("#Port").val();
    var Name = $("#Name").val();
    var LoginID = $("#LoginID").val();
    var LoginPass = $("#LoginPass").val();
    var RevertEmail = $("#RevertEmail").val();
    var txtEmail = $("#txtEmail").val();
    $.ajax({
        url: "TestMessage",
        data: { "Smtp": Smtp, "Port": Port, "Name": Name, "LoginID": LoginID, "LoginPass": LoginPass, "RevertEmail": RevertEmail, "txtEmail": txtEmail },
        async: false,
        cache: false,
        success: function (data) {
            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
            $("#operateTip").html(""+data+"").change();
        }
    })
}


//-----------------------------------------------------修改-----------------------------------------------------------------
function editEmailConfig(emailConfigId) {

    $.getJSON("../../DRPSetting/EditEmailConfig", { "emailConfigId": emailConfigId }, function (jsonData) {


        if (jsonData != "") {
            $("#id").val(jsonData.ID);
            $("#EditLoginID").val(jsonData.LoginID);
            $("#EditName").val(jsonData.Name);
            $("#EditSmtp").val(jsonData.Smtp);

            $("#EditPort").val(jsonData.Port);
            $("#EditLoginPass").val(jsonData.LoginPass);
            // $("#EdittxtEmail").val(jsonData.LoginID);

        }



    });
    popupOperate("gray-Edit-EmailConfig", "邮件服务设置", "gray-Edit-EmailConfig");
}

function editEmailConfigClose() {

    popupClose('gray-Edit-EmailConfig');
};

function Editsubmit() {

    $("#Editsubmits").submit();

}


$(function () {
    // 默认把操作结果隐藏

    if ($("#IsUsed").val() == '1') {
        $("#checkbox").attr("checked", "checked");
    } else {
        $("#checkbox").attr("checked", "");
    }

    $("#checkbox").click(function () {
        if ($(this).attr("checked") == true) {
            $("#IsUsed").val("1");
        } else {
            $("#IsUsed").val("0");
        }
    })

});

// ajax.BeginForm 的提交前验证


function EditAjaxFormValidata() {

    $(".prompt").text("");

    if ($("#EditLoginID").val() == "") {
        $("#EditLoginID").focus();
        $(".prompt", $("#EditLoginID").parent().parent()).text("请填写发件人邮箱");

        return false;
    }
    if ($("#EditName").val() == "") {
        $("#EditName").focus();
        $(".prompt", $("#EditName").parent().parent()).text("请填写发件人");

        return false;
    }
    if ($("#EditSmtp").val() == "") {
        $("#EditSmtp").focus();

        $(".prompt", $("#EditSmtp").parent().parent()).text("请填写SMTP服务器");
        return false;
    }
    if ($("#EditPort").val() == "") {
        $("#EditPort").focus();

        $(".prompt", $("#EditPort").parent().parent()).text("请填写SMTP端口号");
        return false;
    }
    if ($("#EditLoginPass").val() == "") {
        $("#EditLoginPass").focus();

        $(".prompt", $("#EditLoginPass").parent().parent()).text("请填写SMTP密码");
        return false;
    }
}






function EditbtnSendTest() {

    var Smtp = $("#EditSmtp").val();
    var Port = $("#EditPort").val();
    var Name = $("#EditName").val();
    var LoginID = $("#EditLoginID").val();
    var LoginPass = $("#EditLoginPass").val();
    var RevertEmail = $("#RevertEmail").val();
    var txtEmail = $("#txtEmail").val();
    $.ajax({
        url: "TestMessage",
        data: { "Smtp": Smtp, "Port": Port, "Name": Name, "LoginID": LoginID, "LoginPass": LoginPass, "RevertEmail": RevertEmail, "txtEmail": txtEmail },
        async: false,
        cache: false,
        success: function (data) {
            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
            $("#operateTip").html(data).change();
        }
    })
}


function EditafterOnSuccess() {
    if ($("#EditUpdateTargetHiddenID").val() == "ok") {
        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
    
        $("#operateTip").html("编辑成功！").change();
        editEmailConfigClose();
        window.location.reload();
        //                  // 把添加成功放到<span>中
        //                  $("#ResultTip").css("display", "block").text("添加支付方式成功");

        //                  }else{
        //                   $("#ResultTip").css("display", "block").text($("#UpdateTargetHiddenID").html());
    } else {
        $(".Loading").removeClass("style0green style0yellow").addClass("style0red"); //红色
        $("#operateTip").html("" + $("#UpdateTargetHiddenID").html() + "").change();
    }

}

// 添加会员等级失败
function EditafterOnFailure() {
    // 把添加失败放到<span>中
    $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
    $("#operateTip").html("编辑邮件服务失败").change();
};

     