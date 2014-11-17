function infoClick(obj) {
    if ($(obj).attr("placeholder") == "请填写详细地址") {
        $(obj).attr("placeholder", "");
    }
}
function infoOnblur(obj) {
    if ($(obj).val().trim() == "") {
        $(obj).val("");
        $(obj).attr("placeholder", "请填写详细地址");
    };
}

function saveAddress() {
    if (!Check_Consignee()) {
        return false;
    }
    var url = "";
    var addressID = $("#addressID").val();
    var addressinfo = $("#seleAreaNext").find("option:selected").text() + $("#seleAreaThird").find("option:selected").text() + $("#seleAreaFouth").find("option:selected").text() + $("#AddressInfo").val();
    var AreaCode = "1," + $("#seleAreaNext").val() + "," + $("#seleAreaThird").val() + "," + $("#seleAreaFouth").val();
    if (addressID == "-1") {
        url = "action=saveAddress&name=" + $("#Name").val() + "&addressinfo=" + addressinfo + "&moblie=" + $("#Moblie").val() + "&AreaCode=" + AreaCode + "&Remark=" + $("#AddressInfo").val() + "&customerID=" + $("#customerID").val() + "&AwardRecordId=" + $("#AwardRecordId").val() + "&data=" + type + "&recordID=" + recordID;
    } else {
        url = "action=saveAddress&name=" + $("#Name").val() + "&addressinfo=" + addressinfo + "&moblie=" + $("#Moblie").val() + "&AreaCode=" + AreaCode + "&Remark=" + $("#AddressInfo").val() + "&addressid=" + addressID + "&customerID=" + $("#customerID").val() + "&AwardRecordId=" + $("#AwardRecordId").val() + "&data=" + type + "&recordID=" + recordID;
    }

    var openID = $("#openID").val();
    var activityType = $("#activityType").val();
    $.ajax({
        type: "POST",
        dataType: "text",
        url: "/WeiXinManage/SaveCustomerAddress",
        data: url,
        success: function (returnData) {
            if (returnData == "ok") {
                window.location.href = "/WeiXinManage/GetAwardPage?openID=" + openID + "&activityType=" + activityType + "";
            } else {
                window.location.href = "/WeiXinManage/ServerErrorPage";
            }
        }
    });
}

function Check_Consignee() {
    if ($("#Name").val() == "") {
        $("#Name").focus();
        $(".prompt", $("#Name").parent().text("收货人姓名不能为空"));
        return false;
    } else if ($("#Moblie").val() == "") {
        alert("手机号码不能为空"); 
        $("#Moblie").focus();
        return false;
    } else if (!Check_Moblie($("#Moblie").val())) {
        alert("请输入正确的手机号码");
        $("#Moblie").focus();
        return false;
    } else if ($("#seleAreaFouth").val() < 0 || $("#seleAreaFouth").val() == "") {
        alert("请选择区/县");
        $("#seleAreaFouth").focus();
        return false;
    } else if ($("#AddressInfo").val() == "") {
        alert("详细地址不能为空");
        $("#AddressInfo").focus();
        return false;
    } else {
        return true;
    }
}
function Check_Moblie(txt) {
    return /^1\d{10}$/.test(txt);
}