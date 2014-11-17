$(function () {

    ProductionView(1);



    $("#Add").click(function () {
        popupOperate("gray-add-prize", "添加产品线", "gray-add-prize");

    });



})


//关闭
function closeCommodtyProduction() {
    popupClose('gray-add-prize');
}


function DeleteAll(event) {
    var istr = confirmThis(event, "您确定要删除？");
    if (istr) {
        var Production = new Array();

        $("input[name='sub']:checked").each(function () {

            Production.push($(this).val());
        });
        if (Production.length == 0) {
            $(".Loading").removeClass("style01 style03").addClass("style02"); //黄色
            $("#operateTip").html("请先勾选本框再进行批量操作！").change();
            return;
        }
        $.ajax({
            type: "post",
            url: "../../Commodity/DeleteProduction",
            data: { "srt": JSON.stringify(Production) },
            dataType: "json",
            success: function (jsonRes) {
                if (jsonRes == "" || jsonRes == null) {

                    $(".Loading").removeClass("style03 style02").addClass("style01");
                    $("#operateTip").html("操作成功！").change();
                    closeCommodtyProduction();
                    ProductionView(1);
                }

                else if (jsonRes == "-1") {
                    $(".Loading").removeClass("style01 style03").addClass("style02"); //黄色
                    $("#operateTip").html("对不起,不能删除默认产品线！").change();

                    ProductionView(1);

                }
                else if (jsonRes == "-2") {
                    $(".Loading").removeClass("style01 style03").addClass("style02"); //黄色
                    $("#operateTip").html("产品线跟商品已有关联无法删除！").change();

                    ProductionView(1);
                }
                else {
                    $(".Loading").removeClass("style01 style03").addClass("style03"); //红色

                    $("#operateTip").html(JSON.stringify(jsonRes)).change();
                }
            }
        });
    }
};



function Delete(event) {
    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;
    var istr = confirmThis(event, "您确定要删除？");
    if (istr) {
        var str = $(eventSrc).attr("dir");
        var strList = new Array();
        strList.push(str);
        $.ajax({
            type: "post",
            url: "../../Commodity/DeleteProduction",
            data: { "srt": JSON.stringify(strList) },
            dataType: "json",
            success: function (jsonRes) {
                if (jsonRes == "" || jsonRes == null) {

                    $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                    $("#operateTip").html("操作成功！").change();

                    ProductionView(1);
                }

                else if (jsonRes == "-1") {
                    $(".Loading").removeClass("style0green style0red").addClass("style0yellow"); //黄色
                    $("#operateTip").html("对不起,不能删除默认产品线！").change();

                    ProductionView(1);

                }
                else if (jsonRes == "-2") {
                    $(".Loading").removeClass("style0green style0red").addClass("style0yellow"); //黄色
                    $("#operateTip").html("产品线跟商品已有关联无法删除！").change();

                    ProductionView(1);
                }
                else {
                    $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                    $("#operateTip").html("" + JSON.stringify(jsonRes) + "").change();
                }
            }
        });
    }

}






//----------------------------------------------------------添加-----------------------------------------------------------------
function afterOnSuccess() {
    if ($("#HidUpdateTargetId").html() == "ok") {
        $(".spMessage").text("");
        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
        $("#operateTip").html("添加成功！").change();
        closeCommodtyProduction();
        ProductionView(1);
        $("input").val('')

    }
}
function afterOnFailure() {
    $(".Loading").removeClass("style0green style0yellow").addClass("style0red"); //红色
    $("#operateTip").html("添加失败！").change();

};

function AjaxForm() {

    if ($("#txtProduct").val() == "") {
        $("#txtProduct").focus();
        $(".prompt").text("");
        $(".prompt", $("#txtProduct").parent().parent()).text("请输入产品线名称");

        return false;
    }


    else if ($("#txtWholeSalePriceRate").val() == "") {
        $("#txtWholeSalePriceRate").focus();
        $(".prompt").text("");

        $(".prompt", $("#txtWholeSalePriceRate").parent().parent()).text("请输入经销商折扣");
        return false;
    }
    else if ($("#txtDistributionPriceRate").val() == "") {
        $("#txtDistributionPriceRate").focus();
        $(".prompt").text("");

        $(".prompt", $("#txtDistributionPriceRate").parent().parent()).text("请输入代销商折扣");
        return false;
    }
    else if ($("#txtSalesPriceRate").val() == "" || $("#txtSalesPriceRate1").val() == "") {

        $(".prompt").text("");

        $(".prompt", $("#txtSalesPriceRate").parent().parent()).text("请输入建议零售折扣");
        return false;
    }


    else if (isNaN($("#txtWholeSalePriceRate").val())) {
        $("#txtWholeSalePriceRate").focus();
        $(".prompt").text("");

        $(".prompt", $("#txtWholeSalePriceRate").parent().parent()).text("请输入数字类型");
        return false;
    }

    else if (isNaN($("#txtDistributionPriceRate").val())) {
        $("#txtDistributionPriceRate").focus();
        $(".prompt").text("");

        $(".prompt", $("#txtDistributionPriceRate").parent().parent()).text("请输入数字类型");
        return false;
    }
    else if (isNaN($("#txtSalesPriceRate").val()) || isNaN($("#txtSalesPriceRate").val())) {

        $(".prompt").text("");

        $(".prompt", $("#txtSalesPriceRate").parent().parent()).text("请输入数字类型");
        return false;
    }

}


//-----------------------------------------------------------------修改----------------------------------------------------------

function closeeditCommodtyProduction() {
    popupClose('gray-edit-prize');

}


function edit(event) {


    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;
    var ID = $(eventSrc).attr("dir");
    popupOperate("gray-edit-prize", "修改产品线", "gray-edit-prize");
    $.ajax({
        type: "post",
        url: "../../Commodity/UpdateCommodityProduction",
        data: { "ID": ID },
        success: function (jsonRes) {
            if (jsonRes != "") {
                $("#edithidUpdateId").val(jsonRes.ID);
                $("#edittxtProduct").val(jsonRes.Name);
                $("#edittxtWholeSalePriceRate").val(jsonRes.WholeSalePriceRate);
                $("#edittxtDistributionPriceRate").val(jsonRes.DistributionPriceRate);
                $("#edittxtSalesPriceRate").val(jsonRes.SalesPriceRateMin);
                $("#edittxtSalesPriceRate1").val(jsonRes.SalesPriceRateMax);

            }
        }
    });




}


function editafterOnSuccess() {
    if ($("#editHidUpdateTargetId").html() == "ok") {
        $(".spMessage").text("");
        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
        $("#operateTip").html("修改成功！").change();
        closeeditCommodtyProduction();
        ProductionView(1);
        $("input").val('')

    }
}
function editafterOnFailure() {
    $(".Loading").removeClass("style0green style0yellow").addClass("style0red"); //红色
    $("#operateTip").html("添加失败！").change();

};





function editAjaxForm() {

    if ($("#edittxtProduct").val() == "") {
        $("#edittxtProduct").focus();
        $(".prompt").text("");
        $(".prompt", $("#edittxtProduct").parent().parent()).text("请输入产品线名称");

        return false;
    }


    else if ($("#edittxtWholeSalePriceRate").val() == "") {
        $("#edittxtWholeSalePriceRate").focus();
        $(".prompt").text("");

        $(".prompt", $("#edittxtWholeSalePriceRate").parent().parent()).text("请输入经销商折扣");
        return false;
    }
    else if ($("#edittxtDistributionPriceRate").val() == "") {
        $("#edittxtDistributionPriceRate").focus();
        $(".prompt").text("");

        $(".prompt", $("#edittxtDistributionPriceRate").parent().parent()).text("请输入代销商折扣");
        return false;
    }
    else if ($("#edittxtSalesPriceRate").val() == "" || $("#edittxtSalesPriceRate1").val() == "") {

        $(".prompt").text("");

        $(".prompt", $("#edittxtSalesPriceRate").parent().parent()).text("请输入建议零售折扣");
        return false;
    }


    else if (isNaN($("#edittxtWholeSalePriceRate").val())) {
        $("#edittxtWholeSalePriceRate").focus();
        $(".prompt").text("");

        $(".prompt", $("#edittxtWholeSalePriceRate").parent().parent()).text("请输入数字类型");
        return false;
    }

    else if (isNaN($("#edittxtDistributionPriceRate").val())) {
        $("#edittxtDistributionPriceRate").focus();
        $(".prompt").text("");

        $(".prompt", $("#edittxtDistributionPriceRate").parent().parent()).text("请输入数字类型");
        return false;
    }
    else if (isNaN($("#edittxtSalesPriceRate").val()) || isNaN($("#txtSalesPriceRate").val())) {

        $(".prompt").text("");

        $(".prompt", $("#edittxtSalesPriceRate").parent().parent()).text("请输入数字类型");
        return false;
    }

}