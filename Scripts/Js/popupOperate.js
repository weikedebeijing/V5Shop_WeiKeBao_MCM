//页面弹层

//--------启用了新的弹层，这个方法已经不使用
var tag;
function createPopup(dvPopup) {
    var w = $(document).width();
    var h = $(document).height();
    var $body = $(document.body);
    $(".mask").css({ "width": w + "px", "height": h + "px", "display": "block" });
    $("#" + dvPopup + "").show();

    var tipsWidth = $("#" + dvPopup + "").css("width").replace("px", "");
    var windowWidth = $(window).width();

    var tipsHeight = $("#" + dvPopup + "").css("height").replace("px", "");
    var windowHeight = $(window).height();

    $("#" + dvPopup + "").css({ "position": "fixed", "left": (windowWidth - tipsWidth) / 2 + "px", "top": (windowHeight - tipsHeight) / 2 + "px", "margin": "auto" });

    $body.append($(".mask"));
    $body.append($("#" + dvPopup + ""));
    $("#" + dvPopup + " .icon-close").click(function () {
        $(".mask,.gray-bg").hide();
    });
}

//关闭弹层方法
function closePopup() {
    $(".mask,.gray-bg").hide();
}
