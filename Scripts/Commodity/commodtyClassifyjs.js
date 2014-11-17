


$(function () {

    ClassifyView(1);



    $("#btn").click(function () {
        $("#submit").submit();
    });

    $("#editbtn").click(function () {

        $("#editsubmit").submit();
    })


    //点击筛选
    $("[name='Shop']").click(function () {
        $("#status ul li").removeClass("current");
        $(this).addClass("current");
        ClassifyQuery.Groups[0] = $(this).attr("dir");


        ClassifyView(1);
    });



    $("#Add").click(function () {

        popupOperate("gray-add-prize", "添加分类", "gray-add-prize");

    });



})
//关闭
function closeCommodtyClassify() {
    popupClose('gray-add-prize');
}


function allDelectClassify(event, isMoreOrSingle) {

    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;
    var ClassifyID = new Array();

    if (isMoreOrSingle == "more") {
        $("input[name='sub']:checked").each(function () {
            ClassifyID.push($(this).val());
        });
    }
    else if (isMoreOrSingle == "single") {
        ClassifyID.push($(eventSrc).attr("dir"));

    }



    if (ClassifyID.length == 0) {
        $(".Loading").removeClass("style01 style02").addClass("style02"); //黄色
        $("#operateTip").html("请先勾选本框再进行批量操作！").change();
        return;

    }
    if (confirmThis(event, "您确定要删除？")) {

        $.ajax({
            type: "post",
            url: "../../Commodity/AllDeleteClassigy",
            data: { "srt": JSON.stringify(ClassifyID) },

            success: function (jsonRes) {

                if (jsonRes == "acquiescein") {
                    $(".Loading").removeClass("style01 style02").addClass("style02"); //黄色
                    $("#operateTip").html("对不起,默认分类不能删除！").change();
                    ClassifyView(1);

                }

                else if (jsonRes == "OK") {
                    $(".Loading").removeClass("style03 style02").addClass("style01");
                    $("#operateTip").html("删除成功").change();
                    ClassifyView(1);
                }

                else if (jsonRes == "quote") {
                    $(".Loading").removeClass("style01 style02").addClass("style02"); //黄色
                    $("#operateTip").html("对不起,部分商品已引用此分类，不能进行删除操作！").change();
                    ClassifyView(1);
                }
                else {
                    $(".Loading").removeClass("style01 style02").addClass("style03"); //红色
                    $("#operateTip").html(JSON.stringify(jsonRes)).change();


                }
            }
        });
    }
};

//-----------------------------------------------------------添加---------------------------------------------------------------

// 点击取消的时候
function btnCancel() {
    window.location.href = "../../Commodity/CommodityClassify";
};

//获取店铺类目
$(function () {

    var selClassify = $("#selClassify")[0];
    for (var i = selClassify.length - 1; i >= 0; i--)
        selClassify.options[i] = null;
    var opt = new Option("没有分类", "0");
    selClassify.options.add(opt);
    $.ajax({
        type: "post",
        url: "../../Commodity/GetCommodity",
        dataType: "json",
        data: "oper=getType",
        success: function (data) {
            if (data != null && data.list.length > 0) {

                for (var i = 0; i < data.list.length; i++) {

                    if ($("#IrrigationDitch").val() == data.list[i].Code) {
                        var opt = new Option(data.list[i].text, data.list[i].value);
                        selClassify.options.add(opt);
                    }
                }
            }
        }
    });
    function changeselClassify() {
        var Logistics = $("#selClassify").find("option:selected").text();
        $("#hidClassify").val(Logistics);
    };


    //显示渠道
    //                        var selIrrigationDitch = $("#IrrigationDitch")[0];
    //                        for (var i = selClassify.length - 1; i >= 0; i--)
    //                            selIrrigationDitch.options[i] = null;
    //                        var opt = new Option("请选择渠道", "-1");
    //                        selIrrigationDitch.options.add(opt);
    //                        $.ajax({
    //                            type: "post",
    //                            url: "../../Commodity/GetOpened",
    //                            dataType: "json",
    //                            success: function (data) {
    //                                if (data != null && data.list.length > 0) {

    //                                    for (var i = 0; i < data.list.length; i++) {
    //                                        var opt = new Option(data.list[i].text, data.list[i].value);
    //                                        selIrrigationDitch.options.add(opt);

    //                                    }
    //                                }
    //                            }
    //                        });
    //            $("#IrrigationDitch").change(function () {
    //                var IrrigationDitch = $("#IrrigationDitch").find("option:selected").val();
    //                $("#hidIrrigationDitch").val(IrrigationDitch);

    //            });





});

$(function () {

    if (appCode == "PLATFORM") {
        var IrrigationDitch = $("#IrrigationDitch")[0];
        for (var i = IrrigationDitch.length - 1; i >= 0; i--)
            IrrigationDitch.options[i] = null;
        var opt = new Option("微商城", "C001");
        IrrigationDitch.options.add(opt);
    }

    else if (appCode == "C002") {

        var IrrigationDitch = $("#IrrigationDitch")[0];
        for (var i = IrrigationDitch.length - 1; i >= 0; i--)
            IrrigationDitch.options[i] = null;
        var opt = new Option("分销商城", "C002");
        IrrigationDitch.options.add(opt);
    }

})
function afterOnSuccess() {
    if ($("#HidUpdateTargetId").html() == "ok") {
        $(".spMessage").text("");
        $(".Loading").removeClass("style03 style02").addClass("style01");
        $("#operateTip").html("添加成功！").change();
        $("input").val('');

        window.location.reload();
    }


    if ($("#HidUpdateTargetId").html() == "repeat") {
        $("#texName").focus();
        $(".spMessage").text("");
        $(".prompt", $("#texName").parent().parent()).text("分类名称不能有重复的");

        $("input").val('');
    }
}
function afterOnFailure() {
    if ($("#HidUpdateTargetId").html() == "no") {
        $(".Loading").removeClass("style01 style02").addClass("style03");
        $("#operateTip").html("添加失败！").change();

    }


};


function AjaxFrom() {

    if ($("#texName").val() == "") {

        $("#texName").focus();
        $(".spMessage").text("");
        $(".prompt", $("#texName").parent().parent()).text("请输入分类名称");

        return false;

    }

}




//查看详细和编辑链接的跳转
function GoToLinkUrl(event) {

    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;

    var linkUrl = $(eventSrc).attr("linkUrl");
    var linkUrlParts = linkUrl.split('?');
    if (linkUrlParts.length > 1) {//原本已经带参数
        linkUrl = linkUrlParts[0] + "?appCode=" + appCode + "&" + "MenuCode=" + menuCode + "&" + linkUrlParts[1];
    } else {
        linkUrl = linkUrl + "?appCode=" + appCode + "&" + "MenuCode=" + menuCode;
    }

    window.location.href = linkUrl;
}

function GoToLink(event) {

    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;


    var linkUrl = $(eventSrc).attr("linkUrl");
    var linkUrlParts = linkUrl.split('?');
    if (linkUrlParts.length > 1) {//原本已经带参数
        linkUrl = linkUrlParts[0] + "?appCode=" + appCode + "&" + "MenuCode=" + "C115&" + linkUrlParts[1];
    } else {
        linkUrl = linkUrl + "?appCode=" + appCode + "&" + "MenuCode= C115";
    }

    window.location.href = linkUrl;

}

//-----------------------------------------------------------修改---------------------------------------------------------------

function selClassify() {
    var Logistics = $("#editselClassify").find("option:selected").text();
    $("#edithidClassify").val(Logistics);


};

function editafterOnSuccess() {
    if ($("#editHidUpdateTargetId").html() == "ok") {
        $(".spMessage").text("");
        $(".Loading").removeClass("style03 style02").addClass("style01");
        $("#operateTip").html("修改成功！").change();

        $("input").val('');
        window.location.reload();
    }

    else if ($("#editHidUpdateTargetId").html() == "repeat") {
        $("#edittexName").focus();
        $(".spMessage").text("");
        $(".prompt", $("#edittexName").parent().parent()).text("分类名称不能有重复数据！");
        return false;

    }
}
function editafterOnFailure() {
    $(".Loading").removeClass("style01 style02").addClass("style03");

    $("#operateTip").html("修改失败！").change();
};

function editAjaxFrom() {

    if ($("#edittexName").val() == "") {

        $("#edittexName").focus();
        $(".spMessage").text("");
        $(".prompt", $("#edittexName").parent().parent()).text("请输入分类名称");

        return false;

    }

}

//查看详细和编辑链接的跳转
function GoToLinkUrl(event) {

    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;

    var linkUrl = $(eventSrc).attr("linkUrl");
    var linkUrlParts = linkUrl.split('?');
    if (linkUrlParts.length > 1) {//原本已经带参数
        linkUrl = linkUrlParts[0] + "?appCode=" + appCode + "&" + "MenuCode=" + menuCode + "&" + linkUrlParts[1];
    } else {
        linkUrl = linkUrl + "?appCode=" + appCode + "&" + "MenuCode=" + menuCode;
    }

    window.location.href = linkUrl;
}

//关闭
function closeeditCommodtyClassify() {
    popupClose('gray-edit-prize');
}