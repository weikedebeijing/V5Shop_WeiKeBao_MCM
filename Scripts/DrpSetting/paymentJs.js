


$(function () {
    $("#AddBatch").click(function () {
        popupOperate("gray-add-payment", "支付方式设置", "gray-add-payment");

    });

});
function paymentClose() {

    popupClose('gray-add-payment');
};

// ajax.BeginForm 的提交前验证
function AjaxFormValidata() {

    $(".prompt").text("");


    if ($("#Account").val() == "") {
        $(".prompt", $("#Account").parent().parent()).text("支付账户不能为空");
        $("#Account").focus();
        return false;
    }
    if (!IsPositiveNum($("#PID"))) {

        $(".prompt", $("#PID").parent().parent()).text("合作者身份(PID)格式不对");
        $("#PID").focus();
        return false;
    }
    if ($("#Key").val() == "") {
        $(".prompt", $("#Key").parent().parent()).text("安全校验码(Key)不能为空");
        $("#Key").focus();
        return false;
    }


}

function afterOnSuccess() {

    if ($("#UpdateTargetHiddenID").html() == "ok") {
        $(".Loading").removeClass("style03 style02").addClass("style01");
        $("#operateTip").html("添加成功！").change();
        window.location.reload();
       
        //                  // 把添加成功放到<span>中
        //                  $("#ResultTip").css("display", "block").text("添加支付方式成功");

        //                  }else{
        //                   $("#ResultTip").css("display", "block").text($("#UpdateTargetHiddenID").html());
    } else {

        $(".Loading").removeClass("style01 style02").addClass("style03"); //红色
        $("#operateTip").html("" + $("#UpdateTargetHiddenID").html() + "").change();

    }

}

// 添加会员等级失败
function afterOnFailure() {
    // 把添加失败放到<span>中
    $(".Loading").removeClass("style01 style02").addClass("style03"); //红色

    $("#operateTip").html("添加支付方式失败").change();
};

function btnsubmit() {

    $("#submit").submit();
};



//-------------------------------------修改----------------------------------------------



function editPayment(paymentId) {
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
    popupOperate("gray-edit-prize", "支付方式设置", "gray-edit-prize");
}



// ajax.BeginForm 的提交前验证
function EditAjaxFormValidata() {

    $(".prompt").text("");


    if ($("#EditAccount").val() == "") {
        $(".prompt", $("#EditAccount").parent().parent()).text("支付宝账户不能为空");
        $("#EditAccount").focus();
        return false;
    }
    if (!IsPositiveNum($("#EditPID"))) {

        $(".prompt", $("#EditPID").parent().parent()).text("合作者身份(PID)格式不对");
        $("#EditPID").focus();
        return false;
    }
    if ($("#EditKey").val() == "") {
        $(".prompt", $("#EditKey").parent().parent()).text("安全校验码(Key)不能为空");
        $("#EditKey").focus();

        return false;
    }


}

function EditafterOnSuccess() {
    if ($("#EditUpdateTargetHiddenID").text() == "ok") {
        // 把添加成功放到<span>中
        $(".Loading").removeClass("style03 style02").addClass("style01");
        $("#operateTip").html("编辑成功！").change();
        window.location.reload();
     

    } else {
        $(".Loading").removeClass("style01 style02").addClass("style03"); //红色
        $("#operateTip").html($("#EditUpdateTargetHiddenID").val()).change();
    }

}

// 添加会员等级失败
function EditafterOnFailure() {
    // 把添加失败放到<span>中
    $(".Loading").removeClass("style01 style02").addClass("style03"); //红色
    $("#operateTip").html("编辑支付方式失败").change();
}
function editpaymentClose() {

    popupClose('gray-edit-prize');
};

function btn() {

    $("#Editsubmit").submit();

};
