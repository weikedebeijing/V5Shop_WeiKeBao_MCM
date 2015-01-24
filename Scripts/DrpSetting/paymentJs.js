


$(function () {
    $("#AddBatch").click(function () {
        //popupOperate("gray-add-payment", "支付方式设置", "gray-add-payment");
        $("#Account").val("");
        $("#PID").val("");
        $("#Key").val("");
        Clear();
        $("#myModal").modal("show");
    });

    $("#addBtn").click(function () {
        var validata = AjaxFormValidata();
        if (validata) {
            btnsubmit();
        }
        else {
            return validata;
        }
    });

    $("#editBtn").click(function () {
        var validata = EditAjaxFormValidata();
        if (validata) {
            btn();
        }
        else {
            return validata;
        }
    });
});
function Clear() {
    $("#AlipayType").attr("disabled", false);
    $("#AlipayTypeError").removeClass("error");
    $("#AccountError").removeClass("error");
    $("#PIDError").removeClass("error");
    $("#KeyError").removeClass("error");
    $("#AliPayTypePrompt").css("display", "none");
    $("#AccountPrompt").css("display", "none");
    $("#PIDPrompt").css("display", "none");
    $("#KeyPrompt").css("display", "none");
}

function editClear() {
    $("#EditAlipayType").attr("disabled", false);
    $("#EditAlipayTypeError").removeClass("error");
    $("#EditAccountError").removeClass("error");
    $("#EditPIDError").removeClass("error");
    $("#EditKeyError").removeClass("error");
    $("#EditAliPayTypePrompt").css("display", "none");
    $("#EditAccountPrompt").css("display", "none");
    $("#EditPIDPrompt").css("display", "none");
    $("#EditKeyPrompt").css("display", "none");
}
function paymentClose() {

    popupClose('gray-add-payment');
};

// ajax.BeginForm 的提交前验证
function AjaxFormValidata() {
    if ($("#Account").val() == "") {
        validataPrompts("Account", "支付账户不能为空");
        return false;
    }
    if (!IsPositiveNum($("#PID"))) {

        validataPrompts("PID", "合作者身份(PID)格式不对");
        return false;
    }
    if ($("#Key").val() == "") {
        validataPrompts("Key", "安全校验码(Key)不能为空");
        return false;
    }
    return true;

}
var validataPrompts = function (element, msg) {
    $("#" + element + "Prompt").text(msg);
    $("#" + element + "Prompt").css("display", "block");
    $("#" + element + "Error").addClass("error");
};
function afterOnSuccess() {

    if ($("#UpdateTargetHiddenID").html() == "ok") {
        Show("添加成功", "success");
        window.location.reload();

        //                  // 把添加成功放到<span>中
        //                  $("#ResultTip").css("display", "block").text("添加支付方式成功");

        //                  }else{
        //                   $("#ResultTip").css("display", "block").text($("#UpdateTargetHiddenID").html());
    } else {

        Show("" + $("#UpdateTargetHiddenID").html() + "", "error");

    }

}

// 添加会员等级失败
function afterOnFailure() {
    // 把添加失败放到<span>中
    Show("添加支付方式失败", "error");
};

function btnsubmit() {

    $("#submit").submit();
};



//-------------------------------------修改----------------------------------------------



function editPayment(paymentId) {
    editClear();
    // 默认把操作结果隐藏
    $("#ResultTip").css("display", "none");
    $("#EditAlipayType").val($("#DllName").val());
    $("#EditAlipayType").attr("disabled", "disabled");
    $.getJSON("../../DRPSetting/EditPayment", { "paymentId": paymentId }, function (jsonData) {
        if (jsonData != "") {

            $("#id").val(jsonData.ID);
            $("#DllName").val(jsonData.DllName);
            $("#EditAccount").val(jsonData.QueryArray.split(',')[0]);
            $("#EditPID").val(jsonData.QueryArray.split(',')[1]);
            $("#EditKey").val(jsonData.QueryArray.split(',')[2]);
        }
    });

    //popupOperate("gray-edit-prize", "支付方式设置", "gray-edit-prize");
    $("#editModal").modal("show");
}



// ajax.BeginForm 的提交前验证
function EditAjaxFormValidata() {
    if ($("#EditAccount").val() == "") {
        validataPrompts("EditAccount", "支付宝账户不能为空");
        return false;
    }
    if (!IsPositiveNum($("#EditPID"))) {

        validataPrompts("EditPID", "合作者身份(PID)格式不对");
        return false;
    }
    if ($("#EditKey").val() == "") {
        validataPrompts("EditKey", "安全校验码(Key)不能为空");
        return false;
    }
    return true;


}

function EditafterOnSuccess() {
    if ($("#EditUpdateTargetHiddenID").text() == "ok") {
        // 把添加成功放到<span>中
        Show("编辑成功", "success");
        window.location.reload();


    } else {
        Show($("#EditUpdateTargetHiddenID").val(), "error");
    }

}

// 添加会员等级失败
function EditafterOnFailure() {
    // 把添加失败放到<span>中
    Show("编辑支付方式失败", "error");
}
function editpaymentClose() {

    popupClose('gray-edit-prize');
};

function btn() {

    $("#Editsubmit").submit();

};
