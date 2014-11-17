document.writeln('<script src="../../Scripts/dialog/artDialog.source.js?skin=default" type="text/javascript"></script>');
document.writeln('<script src="../../Scripts/dialog/iframeTools.source.js" type="text/javascript"></script>');


var radiosChecked = "";

$(function () {
    //初始化
    InitRadios();

    if (radiosChecked == "1") {
        materialQuery.Groups[0] = "d1";
        GetmaterialManage(1);
    } else if (radiosChecked == "2") {
        materialQuery.Groups[0] = "d2";
        GetmaterialManage(1);
    }

    $("input[name=ImageText]").click(function () {
        radiosChecked = $(this).val();

        if (radiosChecked == "1") {
            materialQuery.Groups[0] = "d1";
            GetmaterialManage(1);

        } else if (radiosChecked == "2") {
            materialQuery.Groups[0] = "d2";
            GetmaterialManage(1);
        } else if (radiosChecked == "3") {
            materialQuery.Groups[0] = "d3";
            GetmaterialManage(1);

        }
    });




    $("#SelectSave").click(function () {

        var istrue = false;
        if (radiosChecked == "1") {

            $("table input[type='radio']").each(function () {
                if ($(this).attr("checked") == "checked") {
                    istrue = true;
                    return false;
                }
                else {
                    istrue = false;
                }

            });
        }
        else if (radiosChecked == "2") {

            $("table input[type='radio']").each(function () {
                if ($(this).attr("checked") == "checked") {
                    istrue = true;
                    return false;
                }
                else {
                    istrue = false;
                }

            });

        }
        else if (radiosChecked == "3") {
            $("table input[type='radio']").each(function () {
                if ($(this).attr("checked") == "checked") {
                    istrue = true;
                    return false;
                }
                else {
                    istrue = false;
                }

            });

        }

        if (!istrue) {
            $(".Loading").removeClass("style01 style02").addClass("style02"); //黄色
            $("#operateTip").html("请选择一条素材！").change();
            return false;
        }


        $.ajax({
            type: "get",
            url: "../../WeiXinManage/GetMaterialManageId",
            data: { "MaterialId": $("#hidSelectSave").val() },
            cache: false,
            success: function (jsonRes) {
                if (jsonRes != "") {

                    var win = art.dialog.open.origin; //来源页面
                    var origin = artDialog.open.origin;
                    //传值给父页面
                    var aValue = $.parseJSON(jsonRes);
                    var input = origin.document.getElementById('hidTagId');
                    input.value = aValue;
                    input.select();
                    $(input).change();
                    // 关闭
                    var win = art.dialog.open.origin;
                    art.dialog.close();
                }
            }
        });

    });

    $("#coles-select").click(function () {

        art.dialog.close();

    });

});


//初始化
function InitRadios() {

    //初始化赋值
    var radios = document.getElementsByName("ImageText");
    for (var i = 0; i < radios.length; i++) {
        if (radios[i].checked) {
            radiosChecked = radios[i].value;
        }
    }
}
//获取tr行
function SelectedEvents(event) {

    $(getEventTarget(event, 2)).find("input").attr("checked", "checked");
    $("#hidSelectSave").val($(getEventTarget(event, 2)).find("input").val());

}

function getEventTarget(event, targetType) {
    event = event || window.event;
    if (targetType == 1) {// 获得触发的对象
        return event.target || event.srcElement;
    } else if (targetType == 2) {// 获得处理事件的对象
        return event.currentTarget;
    }
}


//显示隐藏多图文
function GetSuperset(event) {
    event = event ? event : window.event;
    var eventSrc = event.srcElement ? event.srcElement : event.target;
    var id = $(eventSrc).attr("dir");

    if ($(eventSrc).attr("class") == "icon-hide t5 l10") {
        $(eventSrc).attr("class", "icon-show t5 l10");
        $("[name = 'trPart" + id + "']").show();
    }
    else {
        $(eventSrc).attr("class", "icon-hide t5 l10");
        $("[name = 'trPart" + id + "']").hide();
    }
    //alert($(eventSrc).parent().attr("href"));
}
