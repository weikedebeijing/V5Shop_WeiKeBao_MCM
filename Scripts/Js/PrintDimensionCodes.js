// 打印二维码
var printDimensionCodes = function () {
    var checkIDs = getCheckIDs();
    if (checkIDs.length <= 0) {
        $(".Loading").removeClass("style01 style03").addClass("style02");
        $("#operateTip").html("请勾选要操作的项").change();
    } else {
        checkIDs = JSON.stringify(checkIDs);
        GoToLinkUrl("", "/DimensionCode/DimensionCodesPrintPage?productIDs=" + checkIDs );


        //  window.location.href = "/DimensionCode/DimensionCodesPrintPage?productIDs=" + checkIDs + "&appCode=C001&MenuCode=C113";
    }
};


// 获取选中的商品 IDs
var getCheckIDs = function () {
    var checkIDs = new Array();
    var checkBoxs = $(".mod-table-main").find("input[type=checkbox]");
    for (var i = 0; i < checkBoxs.length; i++) {
        if ($(checkBoxs[i]).attr("checked") == "checked") {
            var productID = $(checkBoxs[i]).next("input[name=name]").val();
            checkIDs.push(productID);
        }
    }
    return checkIDs;
};


//查看详细和编辑链接的跳转
function GoToLinkUrl(event, url) {

    var linkToUrl = "";
    if (event != undefined && event != "") {
        event = event ? event : window.event;
        var eventSrc = event.srcElement ? event.srcElement : event.target;
    }
    if (url !== "" && url !== undefined) {
        linkToUrl = url;
    }
    else {
        linkToUrl = $(eventSrc).attr("linkUrl");

    }
    var linkUrl = linkToUrl;
    var linkUrlParts = linkUrl.split('?');
    if (linkUrlParts.length > 1) {//原本已经带参数
        linkUrl = linkUrlParts[0] + "?appCode=C001&" + "MenuCode=" + menuCode + "&" + linkUrlParts[1];
    } else {
        linkUrl = linkUrl + "?appCode=C001&" + "MenuCode=" + menuCode;
    }

    window.location.href = linkUrl;
}