
$(function () {
    CouponView(1);
})




function AddCoupon() {

    popupOperate("addCoupon", "添加优惠劵", "add_Coupon");


}

$(function () {

    $(".mod-tab #type ul li").click(function () {

        $(".mod-tab #type ul li").removeClass("current c16");
        $(this).addClass("current c16");
        $("#freeze ul li").removeClass("current c16");
        couponQuery.Query = "";
        couponQuery.Groups[1] = "";
        couponQuery.Groups[1] = $(this).attr("dir");
        couponQuery.Groups[2] = "";
        CouponView(1);
    });


    $("#types ul li").click(function () {

        $("#types ul li").removeClass("current c16");
        $(this).addClass("current c16");
        couponQuery.Groups[2] = "";
        couponQuery.Groups[2] = $(this).attr("dir");
        CouponView(1);
    });

    $("#btnSelect").click(function () {
        couponQuery.Query = $("#TexUser").val();
        CouponView(1);
    });



    $("#TexUser").focus(function () {
        if ($(this).val() == "请输入优惠券面值...") {
            $(this).val('');
            $(this).val('').css("color", "#6b6969");
        }
    });
    $("#TexUser").blur(function () {
        if ($(this).val() == "") {
            $(this).val("请输入优惠券面值...");
        }
    });
});

$("#cancel").click(function () {
    var CpupomID = new Array();
    $("input[name='sub']:checked").each(function () {
        CpupomID.push($(this).val());
    });

    if (CpupomID.length == 0) {
        $(".Loading").removeClass("style01 style02").addClass("style02");
        $("#operateTip").html("请先勾选文本框再进行批量操作！").change();
        return;

    }
    var r = confirm("是否确认作废？");

    if (r) {

        $.ajax({
            type: "post",
            url: "../../Promotion/SetCancel",
            data: { "srt": JSON.stringify(CpupomID) },
            dataType: "json",
            success: function (jsonRes) {

                if (jsonRes == "1") {
                    $(".Loading").removeClass("style03 style02").addClass("style01");
                    $("#operateTip").html("操作成功！").change();

                    CouponView(1);
                }

                else if (jsonRes == "-9") {

                    $(".Loading").removeClass("style01 style02").addClass("style02");
                    $("#operateTip").html("不能重复操作！").change();
                    CouponView(1);
                }
                else {
                    $(".Loading").removeClass("style01 style02").addClass("style03");
                    $("#operateTip").html(JSON.stringify(jsonRes)).change();
                }
            }
        });
    }
});
//单个作废

function DivCoupon(ID, event) {
    if (confirmThis(event, "您确定要作废？")) {

        $.ajax({
            type: "post",
            url: "../../Promotion/SetSingleCancel",
            data: { "ID": ID },
            dataType: "json",
            success: function (jsonRes) {

                if (jsonRes == "1") {
                    $(".Loading").removeClass("style03 style02").addClass("style01");
                    $("#operateTip").html("已作废！").change();
                    CouponView(1);
                }
                else if (jsonRes == "-9") {

                    $(".Loading").removeClass("style01 style02").addClass("style02");
                    $("#operateTip").html("不能重复操作！").change();
                    CouponView(1);
                }
                else {
                    $(".Loading").removeClass("style01 style02").addClass("style03");
                    $("#operateTip").html(JSON.stringify(jsonRes)).change();


                }
            }
        });


    }
}





//////////////////////////////////////////////////////////////////////以下为弹层添加内容



function btnSub() {

    if ($("#member").attr("checked") == "checked") {
        var CustomerID = "";

        $("input[name='layersub']:checked").each(function () {
            CustomerID += $(this).val() + ",";
        });
        if (CustomerID != "") {

            $("#CustomerID").val(CustomerID.substring(0, CustomerID.length - 1));
            $("#realSub").submit();
        } else {
            $(".Loading").removeClass("style01 style02").addClass("style02");
            $("#operateTip").html("请先勾选文本框再进行批量操作！").change();
            return false;
        }

    }

    else if ($("#grade").attr("checked") == "checked") {

        $("#realSub").submit();

    }
}



function afterOnSuccess() {
    if ($("#HidUpdateTargetId").html() == "ok") {
        $(".Loading").removeClass("style03 style02").addClass("style01");
        $("#operateTip").html("添加成功！").change();
        $(".spMessage").text("");
        $("input").val('');
        closePopup();
        window.location.href = "../../Promotion/CouponList?appCode=PLATFORM&MenuCode=C325";
    }

    else if ($("#HidUpdateTargetId").html() == "not select") {
        $(".Loading").removeClass("style03 style01").addClass("style02");
        $("#operateTip").html("请选择创建方式！").change();
        return;
    }

    else if ($("#HidUpdateTargetId").html() == "Not StraightPin") {
        $(".Loading").removeClass("style03 style01").addClass("style02");
        $("#operateTip").html("没有相应的会员！").change();
        return;
    }

    else if ($("#HidUpdateTargetId").html() == "on IsLock") {

        $(".Loading").removeClass("style03 style01").addClass("style02");
        $("#operateTip").html("已冻结的账号不能发放优惠劵！").change();
        return;
    }
}
function Namefocus(event) {
    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;

    if ($(eventSrc).val() == "请输入会员名称...") {
        $(eventSrc).val('');
        $(eventSrc).val('').css("color", "#6b6969");
    }

};
function Nameblur(event) {
    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;
    if ($(eventSrc).val() == "") {
        $(eventSrc).val("请输入会员名称...");
    }
}




//选择类型
function ChanageType(event) {

    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;
    if ($(eventSrc).attr("checked") == "checked" && $(eventSrc).attr("id") == "grade") {
        $("#DateExpired").val("");
        $(".spMessage").text("");

        $("#divgrade").show();
        $("#divMember").hide();
    } else if ($(eventSrc).attr("checked") == "checked" && $(eventSrc).attr("id") == "member") {
        $("#DateExpired").val("");
        $(".spMessage").text("");
        $("#divgrade").hide();
        $("#divMember").show();
    }
}




function afterOnFailure() {
    if ($("#HidUpdateTargetId").html() == "on") {
        $(".Loading").removeClass("style01 style02").addClass("style03");
        $("#operateTip").html("添加失败！").change();
    }


};


function AjaxForm() {

 




};







// 从后台获取数据 动态的拼接到前台
function shopTypeChange(event) {
    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;
    // 首先要移除“店铺”下的元素
    $("#changeTypeCode").siblings().remove();
    $("#gradeTypeID").css("display", "none");
    // 获取到当前选中的值
    var shopType = $(eventSrc).attr("Value");
    // 如果点击的是"会员类型"
    if (shopType == "所有") { // 即点击全部时 应该返回所有
        // 隐藏后面的下拉框
        $("#typeCodeChange").css("display", "none");
        //$("#RoleTypeID").css("display", "none");
        $("#gradeTypeID").css("display", "none");
        //                    shopType = "All";
        return;
    }

    $.ajax({
        url: "../../Promotion/ShopTypeChangeing",
        data: "shopType=" + shopType + "",
        success: function (returnData) {
            if (returnData != null && returnData.length > 0) {
                // 将返回的结果绑定上去
                $("#changeTypeCode").after(returnData);
                $("#typeCodeChange").css("display", "inline");
            }
        },
        error: function (error) {
            $(".Loading").removeClass("style01 style02").addClass("style03");
            $("#operateTip").html("服务器端错误，联系管理员！").change();

        }
    });


}







// 店铺类型改变的时候触发的事件
function typeCodeChanging(event) {

    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;
    // 首先要移除“店铺”下的元素

    // 首先要移除“会员类型”下的元素
    $("#changeGradeID").siblings().remove();

    // 获取到当前选中的值
    var typeCode = $(eventSrc).attr("value"); // 取到渠道编号code值
    if (typeCode == "全网店铺") {
        //$("#RoleTypeID").css("display", "none");
        $("#gradeTypeID").css("display", "none");
        return;
    }

    $.ajax({
        url: "../../Promotion/TypeCodeChangeing",
        data: "typeCode=" + typeCode + "",
        type: "post",
        success: function (returnData) {
            if (returnData != null && returnData.length > 0) { // 如果返回的数据长度为零就不显示
                // 将返回的结果绑定上去
                $("#changeGradeID").after(returnData);
                $("#gradeTypeID").css("display", "inline");
            }
        },
        error: function (error) {
            $(".Loading").removeClass("style01 style02").addClass("style03");
            $("#operateTip").html("服务器端错误，联系管理员！").change();
        }
    });

};



function btnSearch() {

    if ($("#userName").val() != "" && $("#userName").val() != "请输入会员名称...") {
        var Name = $("#userName").val();
        $.ajax({
            url: "../../Promotion/GetMember",
            data: "Name=" + Name + "",
            success: function (returnData) {
                if (returnData != null && returnData.length > 0) {
                    // 将返回的结果绑定上去
                    $("#tabLayer tbody").text("");
                    $("#tabLayer tbody tr").remove();
                    $("#tabLayer tbody").append(returnData);

                }
            },
            error: function (error) {
                $(".Loading").removeClass("style01 style02").addClass("style03");
                $("#operateTip").html("服务器端错误，联系管理员！").change();

            }
        });

    }

}

