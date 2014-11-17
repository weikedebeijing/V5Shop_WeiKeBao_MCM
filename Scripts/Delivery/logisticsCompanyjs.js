
$(function () {

    LogisticsView(1);

    $("#LogisticsName").blur(function () {
        condition = $(this).val().replace(/^\s*/g, "").replace(/\s*$/g, "");
        if (condition == "") {
            $(this).focus();
            $(this).val("");
        }
    });

    $("#btnSelect").click(function () {

        logisticsQuery.Query = $("#LogisticsName").val();

        LogisticsView(1);
    });


    // enter 键搜索
    document.onkeypress = function () {

        var iKeyCode = -1;
        if (arguments[0]) {
            iKeyCode = arguments[0].which;
        }
        else {
            iKeyCode = event.keyCode;
        }
        if (iKeyCode == 13) {
            // 搜索
            $("#btnSelect").click();

        }
    }


    $("#type ul li").click(function () {
        logisticsQuery.Query = "";
        $("#types ul li").removeClass("current");
        logisticsQuery.Groups[0] = "q1";
        LogisticsView(1);
    });


    $("#AddLogisticsCompany").click(function () {

        popupOperate("divCompant", "添加物流公司", "add_LogisticsCompant");
    });



});
function allDeleteLogisticsCompany(event) {

    var logisticsID = new Array();
    $("input[name='sub']:checked").each(function () {
        logisticsID.push($(this).val());
    });

    if (logisticsID.length == 0) {
        $(".Loading").removeClass("style01 style02").addClass("style02"); //黄色
        $("#operateTip").html("请先勾选文本框再进行批量操作！").change();
        return;
    }
    if (confirmThis(event, "您确定要删除？")) {

        $.ajax({
            type: "post",
            url: "../../Dispatching/AllDeleteLogistics",
            data: { "srt": JSON.stringify(logisticsID) },
            dataType: "json",
            success: function (jsonRes) {
                if (jsonRes.Code == null && jsonRes.Message == null) {
                    $(".Loading").removeClass("style03 style02").addClass("style01");
                    $("#operateTip").html("删除成功！").change();

                    LogisticsView(1);
                } else {
                    $(".Loading").removeClass("style01 style02").addClass("style03");
                    $("#operateTip").html(JSON.stringify(jsonRes)).change();


                }
            }
        });
    }
};

function logisticsDelete(event) {
    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;
    if (confirmThis(event, "您确定要删除？")) {
        var ID = $(eventSrc).attr("dir");

        $.ajax({
            type: "post",
            url: "../../Dispatching/DeleteLogistics",
            data: { "ID": ID },
            dataType: "json",
            success: function (jsonRes) {
                if (jsonRes.Code == null && jsonRes.Message == null) {
                    $("#operateTip").html("删除成功！").change();
                    LogisticsView(1);
                }
                else {
                    $.messager.alert('提示', JSON.stringify(jsonRes));

                }
            }
        });

    }

};
function addCompany() {

    $("#addCompany").submit();
}

function companyClose() {

    popupClose('add_LogisticsCompant');
};


function afterOnSuccess() {

    if ($("#HidUpdateTargetId").html() == "ok") {
        $(".spMessage").text("");
        $(".Loading").removeClass("style03 style02").addClass("style01");
        $("#operateTip").html("添加成功！").change();
        window.location.reload();


        $("input").val('');

    }
    else if ($("#HidUpdateTargetId").html() == "repeat") {
        $(".prompt").text("");
        $("#txtJaneSpell").focus();
        $(".prompt", $("#txtJaneSpell").parent().parent()).text("物流编号已有重复");
        return false;
    }

}
function afterOnFailure() {
    $(".Loading").removeClass("style01 style02").addClass("style03"); //红色
    $("#operateTip").html("添加失败！").change();


};


function AjaxForm() {


    var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
    var isPhone = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
    if ($("#txtLogistics").val() == "") {
        $("#txtLogistics").focus();
        $(".prompt").text("");
        $(".prompt", $("#txtLogistics").parent().parent()).text("请输入物流名称");

        return false;
    }


    else if ($("#txtJaneSpell").val() == "") {
        $("#txtJaneSpell").focus();
        $(".prompt").text("");

        $(".prompt", $("#txtJaneSpell").parent().parent()).text("请输入物流编号");
        return false;
    }

    else if (!mobile.test($("#LogisticsPhone").val()) && !isPhone.test($("#LogisticsPhone").val())) {
        $("#LogisticsPhone").focus();
        $(".prompt").text("");
        $(".prompt", $("#LogisticsPhone").parent().parent()).text("请正确填写电话号码");
        return false;
    }
}




//------------------------------------------------修改-------------------------------------------------------------



//修改物流公司弹层
function modifyLogisticsCompany(companyID) {

    $.getJSON("../../Dispatching/GetLogisticsCompany", { "companyId": companyID }, function (jsonData) {

        if (jsonData != "") {
            $("#ModifytxtLogistics").val(jsonData.Name);
            $("#ModifytxtJaneSpell").val(jsonData.JaneSpell);
            if (jsonData.Status == "0") {
                $("#ModifyrdStatus0").attr("checked", "checked");
            }
            else if (jsonData.Status == "1") {
                $("#ModifyrdStatus1").attr("checked", "checked");
            }

            $("#ModifyLogisticsPhone").val(jsonData.Tel);
        }

    });

    $("#ModifyHidLogisticsCompanyID").val(companyID);
    popupOperate("divModifyCompant", "修改物流公司", "Modify_LogisticsCompant");
}

function ModifyafterOnSuccess() {
    if ($("#ModifyHidUpdateTargetId").val() == "ok") {

        $(".spMessage").text("");
        $(".Loading").removeClass("style03 style02").addClass("style01");
        $("#operateTip").html("修改成功！").change();
        window.location.reload(); ;


    }

    else if ($("#ModifyHidUpdateTargetId").val() == "JaneSpell repeat") {
        $("#txtJaneSpell").focus();
        $(".spMessage").text("");
        $("#ModifytxtJaneSpell").siblings(".spMessage").text("物流编号不能重复！");
    }

}
function ModifyafterOnFailure() {
    $(".Loading").removeClass("style01 style02").addClass("style03"); //红色
    $("#operateTip").html("修改失败！").change();

};


function ModifyAjaxForm() {

    var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
    var isPhone = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
    if ($("#ModifytxtLogistics").val() == "") {
        $("#ModifytxtLogistics").focus();
        $(".prompt").text("");
        $(".prompt", $("#ModifytxtLogistics").parent().parent()).text("请输入物流名称");

        return false;
    }


    else if ($("#ModifytxtJaneSpell").val() == "") {
        $("#ModifytxtJaneSpell").focus();
        $(".prompt").text("");

        $(".prompt", $("#ModifytxtJaneSpell").parent().parent()).text("请输入物流编号");
        return false;
    }

    else if (!mobile.test($("#ModifyLogisticsPhone").val()) && !isPhone.test($("#ModifyLogisticsPhone").val())) {
        $("#ModifyLogisticsPhone").focus();
        $(".prompt").text("");

        $(".prompt", $("#ModifyLogisticsPhone").parent().parent()).text("请正确填写电话号码");
        return false;
    }



}

function ModifycompanyClose() {

    popupClose('Modify_LogisticsCompant');
}

function updateCompany() {

    $("#updateCompany").submit();

}

