//删除数据

$(function () {
    $("#delete").click(function () {

        var acticity = new Array();
        var ischange = "true";
        $("input[name='sub']:checked").each(function () {
            acticity.push($(this).val());
            if ($(this).attr("ischange") == "false") {
                ischange = "false";
            }
        });

        if (acticity.length == 0) {
            $(".Loading").removeClass("style01 style02").addClass("style02");
            $("#operateTip").html("请先勾选文本框再进行批量操作！").change();
            return;
        }

        if (ischange == "false") {
            $(".Loading").removeClass("style01 style02").addClass("style02");
            $("#operateTip").html("正在进行或已结束的活动不可以删除！").change();
            return;
        } else {


            $.ajax({
                type: "post",
                url: "../../WeiXinManage/SetDeteleActivity",
                data: { "srt": JSON.stringify(acticity) },

                success: function (data) {

                    if (data == "Not") {
                        $(".Loading").removeClass("style01 style02").addClass("style02");
                        $("#operateTip").html("进行中的或已结束的不能删除！").change();

                        return;
                    } else if (data == "on") {
                        $(".Loading").removeClass("style01 style02").addClass("style03");
                        $("#operateTip").html("删除失败！").change();

                        return;
                    } else {
                        $(".Loading").removeClass("style03 style02").addClass("style01");
                        $("#operateTip").html("删除成功！").change();
                        ActivityView(1);
                        return;
                    }

                }
            });
        }
    });

    $("#stop").click(function () {
        var acticity = new Array();
        var isaction = "true";
        $("input[name='sub']:checked").each(function () {
            acticity.push($(this).val());
            if ($(this).attr("isaction") == "false") {
                isaction = "false";
            }
        });

        if (acticity.length == 0) {
            $(".Loading").removeClass("style01 style02").addClass("style02");
            $("#operateTip").html("请先勾选文本框再进行批量操作！").change();
            return;
        }

        if (isaction == "false") {
            $(".Loading").removeClass("style01 style02").addClass("style02");
            $("#operateTip").html("未开始或已结束的活动不可以停止！").change();
            return;
        } else {
            $.ajax({
                type: "post",
                url: "../../WeiXinManage/SetStopActivity",
                data: { "srt": JSON.stringify(acticity) },
                success: function (data) {
                    if (data == "Not") {
                        $(".Loading").removeClass("style01 style02").addClass("style02");
                        $("#operateTip").html("未开始或已结束的活动不可以停止！").change();

                        return;
                    } else if (data == "on") {
                        $(".Loading").removeClass("style01 style02").addClass("style03");
                        $("#operateTip").html("活动停止失败！").change();

                        return;
                    } else {
                        $(".Loading").removeClass("style03 style02").addClass("style01");
                        $("#operateTip").html("活动停止成功！").change();
                        ActivityView(1);
                        return;
                    }

                }
            });
        }

    })



    $("#A3").click(function () {

        var acticity = new Array();
        var ischange = "false";
        $("input[name='sub']:checked").each(function () {
            acticity.push($(this).val());
            ischange = $(this).attr("ischange");
        });
        if (acticity.length == 0) {
            $(".Loading").removeClass("style01 style02").addClass("style02");
            $("#operateTip").html("请先勾选文本框再进行批量操作！").change();
            return;
        } else if (acticity.length > 1) {
            $(".Loading").removeClass("style01 style02").addClass("style02");
            $("#operateTip").html("只能选择一条数据操作！").change();
            return;
        } else {
            var id;
            for (var i = 0; i < acticity.length; i++) {
                id = acticity[i];
            }

            if (ischange == "false") {
                $(".Loading").removeClass("style01 style02").addClass("style02");
                $("#operateTip").html("进行中或已结束的活动不可以编辑！").change();
                return;
            } else {
                window.location.href = "../../WeiXinManage/UpdateActivityControl?id=" + id + "&MenuCode=" + menuCode;
            }




        }


    });
});


function update(event) {

    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;

    if ($(eventSrc).attr("ischange") == "false") {

        $(".Loading").removeClass("style01 style02").addClass("style02");
        $("#operateTip").html("进行中或已结束的活动不可以编辑！").change();
        return;
     }
    else {
        var id = $(eventSrc).attr("dir");
        window.location.href = "../../WeiXinManage/UpdateActivityControl?id=" + id + "&MenuCode=" + menuCode;
    }



}