$(function () {

    $("#btnEnabled").click(function () {

        isEnabledOrDisabled(true);

    });

    $("#btnDisabled").click(function () {

        isEnabledOrDisabled(false);

    });

    $("#txtName").blur(function () {
        condition = $(this).val().replace(/^\s*/g, "").replace(/\s*$/g, "");
        if (condition == "") {
            $(this).focus();
            $(this).val("");
        }
    });

    function isEnabledOrDisabled(enabledOrDisabled) {
        var funvtionId = new Array();
        $("input[name='sub']:checked").each(function () {
            funvtionId.push($(this).val());
        });

        if (funvtionId.length == 0) {
            $(".Loading").removeClass("style01 style02").addClass("style02"); //黄色
            $("#operateTip").html("请先勾选条件再进行批量操作！").change();
            return;
        }

        $.ajax({
            url: "../../WeiXinManage/SetEnabled",
            type: "post",
            data: { "funvtionIdStr": JSON.stringify(funvtionId), "isEnabledOrDisabled": enabledOrDisabled },
            success: function (result) {
                if (result == "ok") {
                    $(".Loading").removeClass("style03 style02").addClass("style01");
                    $("#operateTip").html("操作成功！").change();
                    RedirectToUrlByTime(window.location.href, 1000);
                }
                else if (result == "on") {
                    $(".Loading").removeClass("style01 style02").addClass("style03");
                    $("#operateTip").html("操作失败！").change();
                }

                else if (result == "is") {
                    $(".Loading").removeClass("style01 style03").addClass("style02");
                    $("#operateTip").html("不能重复操作！").change();
                }
            }
        });

    }

});