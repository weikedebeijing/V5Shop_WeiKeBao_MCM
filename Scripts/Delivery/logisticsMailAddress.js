$(function () {
    LogisticsAddress(1);


    $("#addHid").click(function () {
        $("#addSubmit").submit();
    });


    $("#LogisticsName").blur(function () {
        condition = $(this).val().replace(/^\s*/g, "").replace(/\s*$/g, "");
        if (condition == "") {
            $(this).focus();
            $(this).val("");
        }
    });

    $("#btnSelect").click(function () {
        logisticsAddressQuery.Query = $("#LogisticsName").val();
        LogisticsAddress(1);
    });



    $("#type ul li").click(function () {
        logisticsAddressQuery.Query = "";
        $("#types ul li").removeClass("current");
        logisticsAddressQuery.Groups[0] = "q1";
        LogisticsAddress(1);
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

    $("#addLogisticsMailAddress").click(function () {
        popupOperate("gray-add-prize", "添加收货地址", "add_LogisticsMailAddress");
    });


});
function allDelete(event) {
    var mailAddressID = new Array();
    $("input[name='sub']:checked").each(function () {
        mailAddressID.push($(this).val());
    });

    if (mailAddressID.length == 0) {
        $(".Loading").removeClass("style01 style02").addClass("style02"); //黄色
        $("#operateTip").html("请先勾选文本框再进行批量操作！").change();
        return;

    }
    if (confirmThis(event, "您确定要删除？")) {

        $.ajax({
            type: "post",
            url: "../../Dispatching/AllDeleteMailAddress",
            data: { "srt": JSON.stringify(mailAddressID) },
            dataType: "json",
            success: function (jsonRes) {

                if (jsonRes == "1") {
                    $(".Loading").removeClass("style03 style02").addClass("style01");
                    $("#operateTip").html("删除成功！").change();
                    LogisticsAddress(1);

                }
                else if (jsonRes == "-1") {
                    $(".Loading").removeClass("style03 style01").addClass("style02");
                    $("#operateTip").html("不能删除默认发货地址、退货地址！").change();
                    return;

                }
                else {
                    $(".Loading").removeClass("style01 style02").addClass("style03");
                    $("#operateTip").html(JSON.stringify(jsonRes)).change();
                }
            }
        });
    }
};


function closeAddress() {

    popupClose('add_LogisticsMailAddress');
};


function afterOnSuccess() {

    if ($("#HidUpdateTargetId").html() == "ok") {
        $(".spMessage").text("");
        $(".Loading").removeClass("style03 style02").addClass("style01");
        $("#operateTip").html("添加成功！").change();
        popupClose('add_LogisticsMailAddress');
        LogisticsAddress(1);
        //        $("input").val('');

    }
}
function afterOnFailure() {
    $(".Loading").removeClass("style01 style02").addClass("style03"); //红色
    $("#operateTip").html("添加失败！").change();


};

//选择省份弹出市区
function GetProvince() {
    var id = $("#selProvince").find("option:selected").val();
    $("#hideselProvince").val($("#selProvince").find("option:selected").text());
    var selCity = $("#selCity")[0];
    for (var i = selCity.length - 1; i >= 0; i--) {
        selCity.options[i] = null;
    }
    var opt = new Option("请选择市", "-1");
    selCity.options.add(opt);
    $.ajax({
        type: "post",
        url: "../../Dispatching/GetProvinceOrCity",
        dataType: "json",
        data: { "ID": id },
        success: function (data) {
            if (data != null && data.list.length > 0) {
                for (var i = 0; i < data.list.length; i++) {
                    var opt = new Option(data.list[i].text, data.list[i].value);
                    selCity.options.add(opt);

                }

            }
        }
    });
};
//选择市区弹出区域

function getSelCity() {
    var ID = $("#selCity").find("option:selected").val();
    $("#hideselCity").val($("#selCity").find("option:selected").text());

    var selArea = $("#selArea")[0];
    for (var i = selArea.length - 1; i >= 0; i--) {
        selArea.options[i] = null;
    }
    var opt = new Option("请选择市", "-1");
    selArea.options.add(opt);
    $.ajax({
        type: "post",
        url: "../../Dispatching/GetCityArea",
        dataType: "json",
        data: { "ID": ID },
        success: function (data) {
            if (data != null && data.list.length > 0) {
                for (var i = 0; i < data.list.length; i++) {
                    var opt = new Option(data.list[i].text, data.list[i].value);
                    selArea.options.add(opt);

                }

            }
        }
    });

}


function getSelArea() {
    $("#hideselArea").val($(this).find("option:selected").text());
};

function AjaxForm() {
    var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
    var tel = /^[0-9]{6}$/;
    if ($.trim($("#txtContacts").val()) == "") {

        $(".prompt").text("");
        $(".prompt", $("#txtContacts").parent().parent()).text("请输入联系人");

        $("#txtContacts").focus();
        return false;
    }

    else if ($("#selProvince").val() == "-1") {
        $(".prompt").text("");

        $(".prompt", $("#selProvince").parent().parent()).text("请选择省份");
        $("#selProvince").focus();
        return false;
    }
    else if ($("#selCity").val() == "-1") {

        $(".prompt").text("");
        $(".prompt", $("#selCity").parent().parent()).text("请选择省市");

        $("#selCity").focus();
        return false;
    }
    else if ($("#selArea").val() == "-1") {
        $(".prompt").text("");

        $(".prompt", $("#selArea").parent().parent()).text("请选择城区");
        $("#selArea").focus();
        return false;
    }
    else if ($("#LogisticsPhone").val() == "") {
        $(".prompt").text("");

        $(".prompt", $("#LogisticsPhone").parent().parent()).text("请输入详细地址");
        $("#LogisticsPhone").focus();
        return false;
    }


    else if (!tel.test($("#txtZipCode").val())) {
        $(".prompt").text("");

        $(".prompt", $("#txtZipCode").parent().parent()).text("请输入正确的邮编");
        $("#txtZipCode").focus();
        return false;
    }

    else if (isNaN($("#txtZone").val())) {

        $(".prompt").text("");

        $(".prompt", $("#txtZone").parent().parent()).text("请输入正确的电话号码");
        $("#txtZone").focus();
        return false;
    }

    else if ($("#txtZone").val() != "" && $("#txtTelephone").val() == "") {
        $(".prompt").text("");


        $(".prompt", $("#txtTelephone").parent().parent()).text("请输入正确的电话号码");
        $("#txtTelephone").focus();
        return false;

    }
    else if (isNaN($("#txtTelephone").val())) {
        $(".prompt").text("");

        $(".prompt", $("#txtTelephone").parent().parent()).text("请输入正确的电话号码");
        $("#txtTelephone").focus();
        return false;
    }
    else if (!mobile.test($("#txtCellphone").val())) {
        $(".prompt").text("");

        $(".prompt", $("#txtCellphone").parent().parent()).text("请输入正确的手机号码");
        $("#txtCellphone").focus();
        return false;

    }

    else if ($("#txtCompsany").val() == "") {

        $(".prompt").text("");

        $(".prompt", $("#txtCompsany").parent().parent()).text("请输入公司名称");
        $("#txtCompsany").focus();
        return false;
    }


    else { $(".prompt").text(""); }



}
//---------------------------------------------修改内容-------------------------------------------------------

function ModifyLogisticsMailAddRess(mailAddRessId) {

    $.getJSON("../../Dispatching/GetMailAddRess", { "mailAddRessId": mailAddRessId }, function (jsonData) {

        if (jsonData != "") {
            $("#ModifytxtContacts").val(jsonData.Contacts);
            $("#ModifyLogisticsPhone").val(jsonData.Address);
            $("#ModifytxtZipCode").val(jsonData.Zip);
            if (jsonData.Tel != "") {
                var tel = jsonData.Tel.split('-');
                $("#ModifytxtZone").val(tel[0]);
                $("#ModifytxtTelephone").val(tel[1]);
            }
            $("#ModifytxtCellphone").val(jsonData.Mobile);
            $("#ModifytxtCompsany").val(jsonData.CompanyName);


            Province(jsonData.ProvinceID);
            City(jsonData.CityID);
            Area(jsonData.DistrictID);
        }

    });

    $("#hidAddressID").val(mailAddRessId);
    popupOperate("gray-modify-prize", "修改用户", 'modify_LogisticsMailAddress');


}

function modifyCloseAddress() {

    popupClose('modify_LogisticsMailAddress');
}



function Province(provinceID) {
    var province = $("#ModifyselProvince")[0];
    for (var i = Province.length - 1; i >= 0; i--) {
        province.options[i] = null;
    }
    var opt = new Option("请选择市", "-1");
    province.options.add(opt);
    $.ajax({
        type: "post",
        url: "../../Dispatching/Province",
        dataType: "json",
        success: function (data) {
            if (data != null && data.list.length > 0) {
                for (var i = 0; i < data.list.length; i++) {
                    var opt = new Option(data.list[i].text, data.list[i].value);
                    province.options.add(opt);
                    if (provinceID == data.list[i].value) {
                        opt.selected = true;
                    }
                }
            }
        }
    });
}

function City(cityID) {
    var selCity = $("#ModifyselCity")[0];
    for (var i = selCity.length - 1; i >= 0; i--) {
        selCity.options[i] = null;
    }
    var opt = new Option("请选择市", "-1");
    selCity.options.add(opt);
    $.ajax({
        type: "post",
        url: "../../Dispatching/GetCity",
        dataType: "json",
        data: { "ID": cityID },
        success: function (data) {
            if (data != null && data.list.length > 0) {
                for (var i = 0; i < data.list.length; i++) {
                    var opt = new Option(data.list[i].text, data.list[i].value);
                    selCity.options.add(opt);
                    if (cityID == data.list[i].value) {
                        opt.selected = true;
                    }
                }
            }
        }
    });
}

function Area(districtID) {

    var selArea = $("#ModifyselArea")[0];
    for (var i = selArea.length - 1; i >= 0; i--) {
        selArea.options[i] = null;
    }
    var opt = new Option("请选择市", "-1");
    selArea.options.add(opt);
    $.ajax({
        type: "post",
        url: "../../Dispatching/Area",
        dataType: "json",
        data: { "ID": districtID },
        success: function (data) {
            if (data != null && data.list.length > 0) {
                for (var i = 0; i < data.list.length; i++) {

                    var opt = new Option(data.list[i].text, data.list[i].value);
                    selArea.options.add(opt);
                    if (districtID == data.list[i].value) {
                        opt.selected = true;
                    }
                }
            }
        }
    });


}
//选择省份弹出市区
function selProvince() {
    var ID = $("#ModifyselProvince").val();
    $("#ModifyhideselProvince").val($("#ModifyselProvince").find("option:selected").text());
    var selCity = $("#ModifyselCity")[0];
    for (var i = selCity.length - 1; i >= 0; i--) {
        selCity.options[i] = null;
    }
    var opt = new Option("请选择市", "-1");
    selCity.options.add(opt);
    $.ajax({
        type: "post",
        url: "../../Dispatching/GetProvinceOrCity",
        dataType: "json",
        data: { "ID": ID },
        success: function (data) {
            if (data != null && data.list.length > 0) {
                for (var i = 0; i < data.list.length; i++) {
                    var opt = new Option(data.list[i].text, data.list[i].value);
                    selCity.options.add(opt);

                }

            }
        }
    });
};
//选择市区弹出区域
function selCity() {

    var ID = $("#ModifyselCity").val();
    $("#ModifyhideselCity").val($("#ModifyselCity").find("option:selected").text());

    var selArea = $("#ModifyselArea")[0];
    for (var i = selArea.length - 1; i >= 0; i--) {
        selArea.options[i] = null;
    }
    var opt = new Option("请选择市", "-1");
    selArea.options.add(opt);
    $.ajax({
        type: "post",
        url: "../../Dispatching/GetCityArea",
        dataType: "json",
        data: { "ID": ID },
        success: function (data) {
            if (data != null && data.list.length > 0) {
                for (var i = 0; i < data.list.length; i++) {
                    var opt = new Option(data.list[i].text, data.list[i].value);
                    selArea.options.add(opt);

                }

            }
        }
    });

};

function selArea() {
    $("#ModifyhideselArea").val($(this).find("option:selected").text());
}
function ModifyafterOnSuccess() {

    if ($("#ModifyHidUpdateTargetId").val() == "ok") {
        $(".Loading").removeClass("style03 style02").addClass("style01");
        $("#operateTip").html("修改成功！").change();
        popupClose('modify_LogisticsMailAddress');
        LogisticsAddress(1);
        $("input").val('');

    }
}
function ModifyafterOnFailure() {


    $(".Loading").removeClass("style01 style02").addClass("style03"); //红色
    $("#operateTip").html("修改失败！").change();


};

function ModifyAjaxForm() {
    var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
    var tel = /^[0-9]{6}$/;
    if ($.trim($("#ModifytxtContacts").val()) == "") {

        $(".prompt").text("");
        $(".prompt", $("#ModifytxtContacts").parent().parent()).text("请输入联系人");

        $("#txtContacts").focus();
        return false;
    }

    else if ($("#ModifyselProvince").val() == "-1") {
        $(".prompt").text("");

        $(".prompt", $("#ModifyselProvince").parent().parent()).text("请选择省份");
        $("#ModifyselProvince").focus();
        return false;
    }
    else if ($("#ModifyselCity").val() == "-1") {

        $(".prompt").text("");
        $(".prompt", $("#ModifyselCity").parent().parent()).text("请选择省市");

        $("#ModifyselCity").focus();
        return false;
    }
    else if ($("#ModifyselArea").val() == "-1") {
        $(".prompt").text("");

        $(".prompt", $("#ModifyselArea").parent().parent()).text("请选择城区");
        $("#ModifyselArea").focus();
        return false;
    }
    else if ($("#ModifyLogisticsPhone").val() == "") {
        $(".prompt").text("");

        $(".prompt", $("#ModifyLogisticsPhone").parent().parent()).text("请输入详细地址");
        $("#ModifyLogisticsPhone").focus();
        return false;
    }


    else if (!tel.test($("#ModifytxtZipCode").val())) {
        $(".prompt").text("");

        $(".prompt", $("#ModifytxtZipCode").parent().parent()).text("请输入正确的邮编");
        $("#ModifytxtZipCode").focus();
        return false;
    }

    else if (isNaN($("#ModifytxtZone").val())) {

        $(".prompt").text("");

        $(".prompt", $("#ModifytxtZone").parent().parent()).text("请输入正确的电话号码");
        $("#ModifytxtZone").focus();
        return false;
    }

    else if ($("#ModifytxtZone").val() != "" && $("#ModifytxtTelephone").val() == "") {
        $(".prompt").text("");


        $(".prompt", $("#ModifytxtTelephone").parent().parent()).text("请输入正确的电话号码");
        $("#ModifytxtTelephone").focus();
        return false;

    }
    else if (isNaN($("#ModifytxtTelephone").val())) {
        $(".prompt").text("");

        $(".prompt", $("#ModifytxtTelephone").parent().parent()).text("请输入正确的电话号码");
        $("#ModifytxtTelephone").focus();
        return false;
    }
    else if (!mobile.test($("#ModifytxtCellphone").val())) {
        $(".prompt").text("");

        $(".prompt", $("#ModifytxtCellphone").parent().parent()).text("请输入正确的手机号码");
        $("#ModifytxtCellphone").focus();
        return false;

    }

    else if ($("#ModifytxtCompsany").val() == "") {

        $(".prompt").text("");

        $(".prompt", $("#ModifytxtCompsany").parent().parent()).text("请输入公司名称");
        $("#ModifytxtCompsany").focus();
        return false;
    }


    else { $(".prompt").text(""); }



}
$(function () {

    $("#ModifySubmit").click(function () {
        $("#Modifybtn").submit();
    });
});




//---------------------------------------------修改内容-------------------------------------------------------