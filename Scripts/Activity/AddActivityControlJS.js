﻿


$(function () {

    $("#txtDetermine").click(function () {

        // $("#select_id ").get(0).selectedIndex

        if ($("#txtAwardName").val() == "") {
            $("#txtAwardName").focus();
            $(".prompt").text("");
            $("#txtAwardName").parent().next().children(".prompt").text("请输入奖项名称");
            return false;
        }

        else if ($("#txtAwarDsprice").val() == "") {
            $("#txtAwarDsprice").focus();
            $(".prompt").text("");
            $("#txtAwarDsprice").parent().next().children(".prompt").text("请输入奖品价格");
            return false;
        }
        else if ($("#selCommodity").val() == "2") {

            var today = new Date();
            var date = (today.toLocaleString().replace(/年|月/g, '-')).replace(/日/g, '');
            if ($("#txtConditions").val() == "") {
                $("#txtConditions").focus();
                $(".prompt").text("");
                $("#txtConditions").parent().next().children(".prompt").text("请输入条件");
                return false;
            } else if ($("#txtPeriodStart").val() == "") {

                $(".prompt").text("");
                $("#txtPeriodStart").parent().next().children(".prompt").text("请输入开始时间");
                return false;
            } else if ($("#txtPeriodEnd").val() == "") {

                $(".prompt").text("");
                $("#txtPeriodEnd").parent().next().children(".prompt").text("请输入结束时间");
                return false;
            }
            //            else if ($("#txtPeriodStart").val() <= date ) {
            //                $(".spMessage").text("");
            //                $("#txtPeriodEnd").siblings(".spMessage").text("开始时间不能小于当前时间！");
            //                return false;

            //            }
            else if ($("#txtPeriodStart").val() > $("#txtPeriodEnd").val()) {
                $(".prompt").text("");
                $("#txtPeriodEnd").parent().next().children(".prompt").text("开始时间不能大于结束时间！");
                return false;

            }


        }

        if ($("#txtPrizeAmount").val() == "") {
            $("#txtPrizeAmount").focus();
            $(".prompt").text("");
            $("#txtPrizeAmount").parent().next().children(".prompt").text("请输入奖品数量");
            return false;

        }

        if ($("#txtProbability").val() == "") {
            $("#txtProbability").focus();
            $(".prompt").text("");
            $("#txtProbability").parent().next().children(".prompt").text("请输入中奖概率");
            return false;

        }


        //商品
        var selCommodity = $("#selCommodity").find("option:selected").text();
        var selCommodityId = $("#selCommodity").val();
        //奖品名称
        var txtAwardsName = $("#txtAwardName").val();
        //奖品价格
        var txtAwarDsprice = $("#txtAwarDsprice").val();
        //使用条件
        var txtConditions = $("#txtConditions").val();
        //有效期
        var txtPeriodStart = $("#txtPeriodStart").val();
        var txtPeriodEnd = $("#txtPeriodEnd").val();
        //奖品数量
        var txtPrizeAmount = $("#txtPrizeAmount").val();
        //中奖概率
        var txtProbability = $("#txtProbability").val();
        //奖品等级
        var txtGrade = $("#txtGrade").find("option:selected").text();



        var thePrizeList = document.getElementById("ThePrizeList");
        var rowIndex = thePrizeList.rows.length;
        var index = rowIndex + 1;
        var trRow = thePrizeList.insertRow(rowIndex);
        trRow.id = "activity" + index;
        trRow.lang = index;
        var cel1 = trRow.insertCell(0);
        cel1.innerHTML = '<input type="checkbox" value=activity' + index + '  onclick="CheckThis()" name="sub" />';
        var cel2 = trRow.insertCell(1);
        cel2.innerHTML = txtGrade;
        var cel3 = trRow.insertCell(2);
        cel3.innerHTML = txtAwardsName;
        var cel4 = trRow.insertCell(3);
        cel4.innerHTML = txtAwarDsprice;
        var cel5 = trRow.insertCell(4);
        cel5.innerHTML = txtConditions == "" ? "无" : txtConditions;
        var cel6 = trRow.insertCell(5);
        var date = txtPeriodStart + "~" + txtPeriodEnd;
        cel6.innerHTML = date == "~" ? "无" : date;
        var cel7 = trRow.insertCell(6);
        cel7.innerHTML = txtPrizeAmount;
        var cel8 = trRow.insertCell(7);
        cel8.innerHTML = txtProbability;
        var cel9 = trRow.insertCell(8);
        cel9.innerHTML = "<td><input type='hidden' value='" + selCommodityId + "' id='Prize" + index + "'><input type='hidden' value='" + selCommodity + "' id='PrizeName" + index + "'></td>";
        $(".gray-bg input").val("");

        var value = $("#txtGrade").get(0).selectedIndex;
        if (value == 0) {
            arrGradeId.splice(value, value + 1);
            arrGradeName.splice(value, value + 1);
        } else {
            arrGradeId.splice(value, value);
            arrGradeName.splice(value, value);
        }

        closePopup();


    });

});
//克隆实体类
function clone(myObj) {
    if (typeof (myObj) != 'object') return myObj;
    if (myObj == null) return myObj;
    var myNewObj = new Object();
    for (var i in myObj) myNewObj[i] = clone(myObj[i]);
    return myNewObj;
}


function btnSave() {

    var che = $("input[name='RuleConditionID']:checked").length;

    if ($("#selActivityType").val() == "-1") {
        $("#selActivityType").focus();
        $(".prompt").text("");
        $("#selActivityType").parent().next().children("span").text("请选择活动类型");
        return false;
    }
    else if ($("#txtAwardsName").val() == "") {
        $("#txtAwardsName").focus();

        $("#txtAwardsName").parent().next().children("span").text("请输入活动名称");
        return false;
    }
    else if ($("#DateStart").val() == "活动开始时间" && $("#DateEnd").val() == "活动结束时间") {
        $(".prompt").text("");
        $("#DateEnd").parent().next().children("span").text("请选择活动时间");
        return false;
    }
    else if ($("#DateStart").val() >= $("#DateEnd").val()) {
        $("#DateStart").focus();
        $("#DateEnd").focus();
        $(".prompt").text("");
        $("#DateEnd").parent().next().children("span").text("开始时间不能大于结束时间");
        return false;
    }
    else if ($("#RuleConditionID1").attr("checked") == "checked") {

        if ($("#RuleConditionMoney1").val() == "") {
            $("#RuleConditionMoney1").focus();
            $(".prompt").text("");
            $("#RuleConditionItme1").parent().next().children("span").text("请输入条件");
            return false;
        }
        else if ($("#RuleConditionItme1").val() == "") {
            $("#RuleConditionItme1").focus();
            $(".prompt").text("");
            $("#RuleConditionItme1").parent().next().children("span").text("请输入条件");
            return false;
        }

    }


    else if (che <= 0) {

        $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
        $("#operateTip").html("必须选择一项活动规则！").change();
        $(".prompt").text("");
        return false;

    }


    else if ($("#RuleConditionID2").attr("checked") == "checked") {
        if ($("#RuleConditionItme2").val() == "") {
            $("#RuleConditionItme2").focus();
            $(".prompt").text("");
            $("#RuleConditionItme2").parent().next().children("span").text("请输入条件");
            return false;
        }

    }
    else if ($("#RuleConditionID3").attr("checked") == "checked") {
        if ($("#RuleConditionItme3").val() == "") {
            $("#RuleConditionItme3").focus();
            $(".prompt").text("");
            $("#RuleConditionItme3").parent().next().children("span").text("请输入条件");
            return false;
        }

    }


    //Start初始化
    var awardReport = $.parseJSON(awardReportInfo);
    var newawardReport = clone(awardReport);
    newawardReport.awardList = new Array();
    newawardReport.activityRule = new Array();

    //End初始化
    //Start初始化实体活动奖项
    newawardReport.activityAwards.ActivityTypeID = $("#selActivityType").val();

    newawardReport.activityAwards.ActivityTypeName = $("#selActivityType").find("option:selected").text();
    newawardReport.activityAwards.AwardsName = $("#txtAwardsName").val();
    newawardReport.activityAwards.StartDate = $("#DateStart").val();
    newawardReport.activityAwards.FinishDate = $("#DateEnd").val();
    newawardReport.activityAwards.DateCreated = $("#DateStart").val();
    newawardReport.activityAwards.DateModified = $("#DateEnd").val();
    newawardReport.activityAwards.AwardContentName = $("#AwardContentName").val();
    //  newawardReport.activityAwards.PrizeID =


    //End初始化实体活动奖项
    //Start获取表格数据
    var thePrizeList = document.getElementById("ThePrizeList");
    var rowIndex = thePrizeList.rows.length;
    if (rowIndex <= 1) {
        $(".Loading").removeClass("style01 style02").addClass("style02");
        $("#operateTip").html("奖品必须要有2个或2个以上！").change();
        $(".prompt").text("");
        return false;
    } else {
        for (var i = 0; i < rowIndex; i++) {

            var newawardList = clone(awardReport.awardList[0]);
            //奖项等级
            newawardList.AwardGrade = $("#activity" + (i + 1) + " td:eq(1)").text();

            //奖品名称
            newawardList.CommodityName = $("#activity" + (i + 1) + " td:eq(2)").text();
            //奖品价格
            newawardList.CommodityPrice = $("#activity" + (i + 1) + " td:eq(3)").text();
            //使用条件

            newawardList.EmployCondition = $("#activity" + (i + 1) + " td:eq(4)").text() == "无" ? 0 : $("#activity" + (i + 1) + " td:eq(4)").text();


            //有效期
            if ($("#activity" + (i + 1) + " td:eq(5)").text() != "无" && $("#activity" + (i + 1) + " td:eq(5)").text() != "") {

                var activityAry = $("#activity" + (i + 1) + " td:eq(5)").text().split('~');
                newawardList.StartDate = activityAry[0];
                newawardList.FinishDate = activityAry[1];

            } else {
                newawardList.StartDate = $("#activity" + (i + 1) + " td:eq(5)").text();
                newawardList.FinishDate = $("#activity" + (i + 1) + " td:eq(5)").text();
            }

            //中奖概率
            newawardList.PrizeProbability = $("#activity" + (i + 1) + " td:eq(7)").text();
            newawardList.AwardNumber = $("#activity" + (i + 1) + " td:eq(6)").text();

            newawardList.LeftAwardsNumber = $("#activity" + (i + 1) + " td:eq(6)").text(); // hsw 剩余奖品数量

            newawardList.PrizeID = $("#activity" + (i + 1) + " td:eq(8) #Prize" + (i + 1) + "").val();
            newawardList.PrizeName = $("#activity" + (i + 1) + " td:eq(8) #PrizeName" + (i + 1) + "").val();

            newawardReport.awardList.push(newawardList);

        }

    }    //End获取表格数据

    //Start初始化实体活动规则
    $("input[name='RuleConditionID']:checked").each(function () {
        var newactivityRule = clone(awardReport.activityRule[0]);
        newactivityRule.RuleConditionID = $(this).attr('lang');

        newactivityRule.RuleID = $("#RuleConditionName").val();
        if ($("#RuleConditionMoney1").val().trim() != '') {
            newactivityRule.RuleAmount = $("#RuleConditionMoney1").val();
        } else {
            newactivityRule.RuleAmount = 0;
        }

        if ($(this).attr('lang') == "1") {
            newactivityRule.DrawTime = $("#RuleConditionItme1").val();
        }
        else if ($(this).attr('lang') == "2") {
            newactivityRule.DrawTime = $("#RuleConditionItme2").val();
        }
        else if ($(this).attr('lang') == "3") {
            newactivityRule.DrawTime = $("#RuleConditionItme3").val();
            newactivityRule.Member = $("#selRuleCondition3").val();
            //newactivityRule.MemberName = "nimei";
            newactivityRule.RuleConditionName = $("#selRuleCondition3").find("option:selected").text();
        }
        newawardReport.activityRule.push(newactivityRule);
    });

    //添加活动封面
    var materialManageModel = $.parseJSON(materialManage);

    var newmaterialManage = clone(materialManageModel);



    newmaterialManage.Title = $("#hidTitle").val();
    newmaterialManage.CoverUrl = $("#hidCoverUrl").val();
    newmaterialManage.Abstract = $("#hidAbstract").val();

    $.ajax({
        type: "post",
        url: "../../WeiXinManage/AddActivity",
        data: { "awardReport": JSON.stringify(newawardReport), "materialManage": JSON.stringify(newmaterialManage) },
        success: function (data) {
            if (data == "ok") {
                $(".Loading").removeClass("style03 style02").addClass("style01");
                $("#operateTip").html("添加成功！").change();
                //window.location.href = "../../WeiXinManage/ActivityControl?MenuCode=" + menuCode;
                GoToLinkUrl("", "../../WeiXinManage/ActivityControl")
                return false;
            }

            else if (data == "on") {
                $(".Loading").removeClass("style01 style02").addClass("style03");
                $("#operateTip").html("添加失败！").change();

                return false;
            }
            else if (data == "Not") {
                $(".Loading").removeClass("style01 style02").addClass("style02");
                $("#operateTip").html("不能重复添加" + $("#selActivityType").find("option:selected").text() + "活动，只有活动过期才能添加！").change();

                return false;
            }
            else if (data == "开始时间不能小于当前时间") {
                $(".Loading").removeClass("style01 style02").addClass("style02");
                $("#operateTip").html("开始时间不能小于当前时间！").change();

                return false;
            }

        }


    });



    //End初始化实体活动规则

}



var arrGradeId;
var arrGradeName;

//加载活动类型
$(function () {
    arrGradeId = $("#hidGradeId").attr("ids").split(',');
    arrGradeName = $("#hidGradeName").attr("ids").split(',');
    $("#Add").click(function () {
        $("#txtGrade").html("");
        $(".prompt").html("");
        for (var j = 0; j < arrGradeId.length; j++) {

            $("#txtGrade").append("<option value='" + arrGradeId[j] + "'>" + arrGradeName[j] + "</option>");
        }


        $(".gray-bg input").val("");
        if (arrGradeId.length == 0) {
            $(".Loading").removeClass("style01 style02").addClass("style02");
            $("#operateTip").html("没有可用选择的奖品等级了！").change();
            return;
        }

        createPopup("gray-bg");

        $("#txtDetermine").show();
        $("#txtUpdateDetermine").hide();
    });
    var tag = "";
    //编辑
    $("#update").click(function () {
      
        $(".prompt").html("");
        var activityArray = new Array();
        $("input[name='sub']:checked").each(function () {

            activityArray.push($(this).val());
        });
        if (activityArray.length == 0) {
            $(".Loading").removeClass("style01 style02").addClass("style02");
            $("#operateTip").html("请先勾选订单再进行批量操作！").change();
            return;
        }
        else if (activityArray.length >= 2) {
            $(".Loading").removeClass("style01 style02").addClass("style02");
            $("#operateTip").html("一次只能勾选一个进行操作！").change();
            return;
        }

        tag = activityArray[0];

        var activityTag = $("#" + tag + " td:eq(1)").text();
        $("#txtGrade").html("");
        $("#txtGrade").append("<option value='" + conv(activityTag) + "'>" + activityTag + "</option>");
        //        for (var j = 0; j < arrGradeName.length; j++) {

        //            $("#txtGrade").append("<option value='" + conv(arrGradeName[j]) + "'>" + arrGradeName[j] + "</option>");
        //        }


        var activity = "#" + activityArray[0];
        var $activity = $(activity + " td:eq(1)").text();
        var $txtAwardName = $(activity + " td:eq(2)").text();
        var $txtAwarDsprice = $(activity + " td:eq(3)").text();
        var $Prize = $(activity + " td:eq(8) [type='hidden']:eq(0)").val();
        var $txtPrizeAmount = $(activity + " td:eq(6)").text();
        var $txtProbability = $(activity + " td:eq(7)").text();
        if ($Prize == 2) {

            $("#hide").show();
            var $txtConditions = $(activity + " td:eq(4)").text();
            var $date = $(activity + " td:eq(5)").text();
            var date = $date.split('~');

            $("#txtConditions").val($txtConditions);
            $("#txtPeriodStart").val(date[0]);
            $("#txtPeriodEnd").val(date[1]);

        }
        $("#txtGrade option").each(function () {

            if ($(this).text() == $activity) {
                $(this).get(0).selected = true;
            }
        });
        $("#txtAwardName").val($txtAwardName);
        $("#txtAwarDsprice").val($txtAwarDsprice);
        $("#txtPrizeAmount").val($txtPrizeAmount);
        $("#txtProbability").val($txtProbability);
        createPopup("gray-bg");
        $("#txtUpdateDetermine").show();
        $("#txtDetermine").hide();

    });

    function conv(activityTag) {
        var value = 0;
        switch (activityTag) {
            case "特等奖":
                value = 0;
                break;
            case "一等奖":
                value = 1;
                break;
            case "二等奖":
                value = 2;
                break;
            case "三等奖":
                value = 3;
                break;
        }

        return value;

    }


    //删除行
    $("#cancel").click(function () {
        var acticity = new Array();
        $("input[name='sub']:checked").each(function () {
            acticity.push($(this).val());
        });
        if (acticity.length == 0) {
            $(".Loading").removeClass("style01 style02").addClass("style02");
            $("#operateTip").html("请先勾选文本框再进行批量操作！").change();
            return;
        }

        for (var i = 0; i < acticity.length; i++) {
            var deleteRow = document.getElementById(acticity[i]).rowIndex;
            var activityTag = $("#" + acticity[i] + " td:eq(1)").text();
            $("#txtGrade").html("");



            arrGradeId.push(conv(activityTag));
            arrGradeName.push(activityTag);
            for (var j = 0; j < arrGradeId.length; j++) {

                $("#txtGrade").append("<option value='" + arrGradeId[j] + "'>" + arrGradeName[j] + "</option>");
            }
            document.getElementById("ThePrizeList").deleteRow(deleteRow);
        }

        //重新设置ID
        var index = 0;
        $("#ThePrizeList tr").each(function () {

            index++;

            $(this).attr("id", "activity" + index);
            $(this).attr("lang", index);

            $("td input[type='checkbox']:eq(0)", $(this)).attr("value", "activity" + index);

            $("td:eq(8) input[type='hidden']:eq(0)", $(this)).attr("id", "Prize" + index);
            $("td:eq(8) input[type='hidden']:eq(1)", $(this)).attr("id", "PrizeName" + index);

        });
    });


    if ($("#selCommodity").val() == "1") {

        $("#hide").hide();
    } else {
        $("#hide").show();
    }

    var selActivityType = $("#selActivityType")[0];

    //        alert(selActivityType.length);
    for (var i = 0; i < selActivityType.length - 1; i--) {
        selActivityType.optionsp[i] = null;
    }
    var opt = new Option("请选择活动类型", "-1");
    selActivityType.options.add(opt);
    $.ajax({
        type: "post",
        url: "../../WeiXinManage/GetActivityType",
        dataType: "json",
        success: function (data) {

            if (data != null && data.list.length > 0) {
                for (var i = 0; i < data.list.length; i++) {
                    var opt = new Option(data.list[i].text, data.list[i].value);
                    selActivityType.options.add(opt);
                }


                if (menuCode == "C440") {
                    $("#selActivityType").val(2);
                } else if (menuCode == "C430") {
                    $("#selActivityType").val(1);
                } else if (menuCode == "C450") {
                    $("#selActivityType").val(3);
                } else if (menuCode == "C460") {
                    $("#selActivityType").val(4);
                }

            }

        }


    });



    $("#selCommodity").change(function () {
        if ($(this).val() == "1") {
            $("#hide").hide();
        } else {
            $("#hide").show();
        }

    });


    $("#txtUpdateDetermine").click(function () {

        if ($("#txtAwardName").val() == "") {
            $("#txtAwardName").focus();
            $(".spMessage").text("");
            $("#txtAwardName").siblings(".spMessage").text("请输入奖项名称");
            return false;
        }
        else if ($("#txtAwarDsprice").val() == "") {
            $("#txtAwarDsprice").focus();
            $(".spMessage").text("");
            $("#txtAwarDsprice").siblings(".spMessage").text("请输入奖品价格");
            return false;
        }
        else if ($("#selCommodity").val() == "2") {

            var today = new Date();
            var date = (today.toLocaleString().replace(/年|月/g, '-')).replace(/日/g, '');
            if ($("#txtConditions").val() == "") {
                $("#txtConditions").focus();
                $(".spMessage").text("");
                $("#txtConditions").siblings(".spMessage").text("请输入条件");
                return false;
            } else if ($("#txtPeriodStart").val() == "") {

                $(".spMessage").text("");
                $("#txtPeriodStart").siblings(".spMessage").text("请输入开始时间");
                return false;
            } else if ($("#txtPeriodEnd").val() == "") {

                $(".spMessage").text("");
                $("#txtPeriodEnd").siblings(".spMessage").text("请输入结束时间");
                return false;
            }
            //            else if ($("#txtPeriodStart").val() <= date) {
            //                $(".spMessage").text("");
            //                $("#txtPeriodEnd").siblings(".spMessage").text("开始时间不能小于当前时间！");
            //                return false;

            //            } 
            else if ($("#txtPeriodStart").val() > $("#txtPeriodEnd").val()) {
                $(".spMessage").text("");
                $("#txtPeriodEnd").siblings(".spMessage").text("开始时间不能大于结束时间！");
                return false;

            }


        }

        if ($("#txtPrizeAmount").val() == "") {
            $("#txtPrizeAmount").focus();
            $(".spMessage").text("");
            $("#txtPrizeAmount").siblings(".spMessage").text("请输入奖品数量");
            return false;

        }

        if ($("#txtProbability").val() == "") {
            $("#txtProbability").focus();
            $(".spMessage").text("");
            $("#txtProbability").siblings(".spMessage").text("请输入中奖概率");
            return false;

        }


        //商品
        var selCommodity = $("#selCommodity").find("option:selected").text();
        var selCommodityId = $("#selCommodity").val();
        //奖品名称
        var txtAwardsName = $("#txtAwardName").val();
        //奖品价格
        var txtAwarDsprice = $("#txtAwarDsprice").val();
        //使用条件
        var txtConditions = $("#txtConditions").val();
        //有效期
        var txtPeriodStart = $("#txtPeriodStart").val();
        var txtPeriodEnd = $("#txtPeriodEnd").val();
        //奖品数量
        var txtPrizeAmount = $("#txtPrizeAmount").val();
        //中奖概率
        var txtProbability = $("#txtProbability").val();
        //奖品等级
        var txtGrade = $("#txtGrade").find("option:selected").text();

        $("#" + tag + " td:eq(1)").text(txtGrade);
        $("#" + tag + " td:eq(2)").text(txtAwardsName);
        $("#" + tag + " td:eq(3)").text(txtAwarDsprice);
        $("#" + tag + " td:eq(4)").text(txtConditions == "" ? "无" : txtConditions);
        $("#" + tag + " td:eq(5)").text(txtPeriodStart == "" ? "无" : txtPeriodStart + "~" + txtPeriodEnd);
        $("#" + tag + " td:eq(6)").text(txtPrizeAmount);
        $("#" + tag + " td:eq(7)").text(txtProbability);
        $("#" + tag + " td:eq(8) input[type='hidden']:eq(0)").val(selCommodityId);
        $("#" + tag + " td:eq(8) input[type='hidden']:eq(1)").val(selCommodity);

        closePopup();
    });

});


$(function () {
    var today = new Date();
    var date = (today.toLocaleString().replace(/年|月/g, '-')).replace(/日/g, '');

    ISinputString("#RuleConditionMoney1");
    onlyNum("#RuleConditionItme1");
    onlyNum("#RuleConditionItme2");
    onlyNum("#RuleConditionItme3");
    ISinputString("#txtAwarDsprice");
    onlyNum("#txtPrizeAmount");
    ISinputString("#txtProbability");

    ISinputString("#txtConditions");

});


//验证只能输入小数点和数字
function ISinputString(input) {
    $(input).keydown(function (event) {
        var keyCode = event.which;
        if (keyCode == 46 || keyCode == 8 || keyCode == 190 || (keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105) || keyCode == 110) {
            return true;
        } else { return false }
    }).focus(function () {
        this.style.imeMode = 'disabled';
    });
}
//文本框只能输入数字，不能输入小数点和字母 by john
function onlyNum(input) {
    $(input).keydown(function (event) {
        var keyCode = event.which;
        if (keyCode == 46 || keyCode == 8 || keyCode == 37 || keyCode == 39 || (keyCode >= 48 && keyCode <= 57) || (keyCode >= 96 && keyCode <= 105))
        { return true; }
        else { return false }
    }).focus(function ()
    { this.style.imeMode = 'disabled'; });
}




//function CheckAll(event) {
//    event = event ? event : window.event;
//    var eventSrc = event.srcElement ? event.srcElement : event.target;
//    if ($(eventSrc).attr('checked') == "checked" && $(eventSrc).attr('id') == "RuleConditionID1") {
//        $(".style0page .list-ul .list-li:eq(6)").css("display", "none");
//        $(".style0page .list-ul .list-li:eq(7)").css("display", "none");

//    }

//    else if ($(eventSrc).attr('checked') == "checked" && $(eventSrc).attr('id') == "RuleConditionID2") {
//        $(".style0page .list-ul .list-li:eq(5)").css("display", "none");
//        $(".style0page .list-ul .list-li:eq(7)").css("display", "none");

//    }

//    else if ($(eventSrc).attr('checked') == "checked" && $(eventSrc).attr('id') == "RuleConditionID3") {
//        $(".style0page .list-ul .list-li:eq(5)").css("display", "none");
//        $(".style0page .list-ul .list-li:eq(6)").css("display", "none");

//    } else {
//        $(".style0page .list-ul .list-li:eq(5)").css("display", "block");
//        $(".style0page .list-ul .list-li:eq(6)").css("display", "block");
//        $(".style0page .list-ul .list-li:eq(7)").css("display", "block");
//    }
//}

// 去除前后空格
if (!String.prototype.trim) {
    String.prototype.trim = function () {
        var str = this.replace(/^\s+/, ""),
                      end = this.length - 1,
                      ws = /\s/;
        while (ws.test(this.charAt(end))) {
            end--;
        }
        return this.slice(0, end + 1);
    }
}





$(function () {
    $("#active-cover-add").click(function () {
        createPopup("gray-active-cover-add");

    });
    $("#close").click(function () {
        closePopup();
    });


    $("#TextSave").click(function () {

        if ($("#txtTitle").val() == "") {
            $(".prompt").text("");
            $("#txtTitle").parent().next().children(".prompt").text("请输入标题");
            $("#txtTitle").focus();
            return false;
        }
        else if ($("#hidCoverUrl").val() == "") {
            $(".prompt").text("");
            $("#span").parent().parent().next().children(".prompt").text("请上传图片");
            $("#span").focus();
            return false;
        }
        else if ($("#txtAbstract").val() == "") {
            $(".prompt").text("");
            $("#txtAbstract").parent().next().children(".prompt").text("请上输入摘要");
            $("#txtAbstract").focus();
            return false;
        }



        $("#hidTitle").val($("#txtTitle").val());
        $("#hidAbstract").val($("#txtAbstract").val());
        //html赋值
        $(".active-cover-title").html($("#txtTitle").val());
        $(".active-cover-img img").attr("src", $("#hidCoverUrl").val());
        $(".active-cover-text").html($("#hidAbstract").val());
        closePopup();
        $("#Activities").show();

    });


});

function FileUpload() {

    //图片上传
    $.ajaxFileUpload({
        url: '../../WeiXinManage/UploadImage', //用于文件上传的服务器端请求地址
        secureuri: false, //一般设置为false
        fileElementId: "file_upload", //文件上传空间的id属性  <input type="file" id="file" name="file" />
        dataType: 'text', //返回值类型 一般设置为json
        success: function (res) //服务器成功响应处理函数
        {

            var reg = /\.[a-z]{3,4}/g;
            if (reg.test(res)) {
                $("#img").hide();
                //清除原有的
                $("#span").text("");
                var img = $("<img>").attr("src", "../../UploadFile/WeiXin/" + res + "").attr("id", "file_upload_img");

                $("#span").append(img);

                $("#hidCoverUrl").val($("#file_upload_img").attr("src"));

                //var dd = $(eventSrc).parent().parent().attr("class")
            } else {
                //                $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                //                 $("#operateTip").html(""+res+"").change();

            }
        },
        error: function () //服务器响应失败处理函数
        {
            //alert("提交过程中出现未知错误");
            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
            $("#operateTip").html("提交过程中出现未知错误").change();
        }
    });

}
