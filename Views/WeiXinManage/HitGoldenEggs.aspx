<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <title>砸金蛋</title>
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/base.css" />
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/common.css" />
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/egg.css" />
</head>
<body class="egg-bg">
    <%var activityAward = (V5.MetaData.WeiXin.Model.ActivityAwards)ViewData["activityAward"];  %>
    <%var awardRecords = (List<V5.MetaData.WeiXin.Model.AwardsManageView>)ViewData["awardRecords"]; %>
    <%var awardSets = (List<V5.MetaData.WeiXin.Model.Award>)ViewData["awardSets"]; %>
    <section class="egg"> 
    <div class="egg-operate">
      <div class="egg-operate-bg"><img src="../../Images/HitGoldenEggs/egg-bg02.png" class="egg-operate-bg-img"></div>
      <div class="egg-open" style="display:none;">
        <div class="egg-open01"></div>
        <div class="egg-open02"></div>
        <div class="egg-open03"></div>
        <div class="hammer"></div>
      </div>
      <div class="egg-position" style="display:;">
        <div dir='moveEggs' class="egg01"></div>
        <div dir='moveEggs' class="egg02"></div>
        <div dir='moveEggs' class="egg03"></div>
        <div class="hammer"></div>
      </div>
    </div>
    <%--部分视图Start--%>
    <%Html.RenderPartial("ActivityDetail", new { activityAward, awardRecords, awardSets }); %>
    <%--部分视图End--%>
  </section>
    <footer>
     <span class="explain">技术支持：</span><img src='<%:ViewData["logoUrl"] %>' class="logo-cop" alt="v5shop"  >
     <div style="display: none;">
        <input type="text" id="drawTimes" value="<%:ViewData["drawTimes"] %>" />
        <input type="text" id="spacialPrizeProbability" value="<%:ViewData["spacialPrizeProbability"] %>" />
        <input type="text" id="firstPrizeProbability" value="<%:ViewData["firstPrizeProbability"] %>" />
        <input type="text" id="secondPrizeProbability" value="<%:ViewData["secondPrizeProbability"] %>" />
        <input type="text" id="thirdPrizeProbability" value="<%:ViewData["thirdPrizeProbability"] %>" />
        <input type="text" id="finishDate" value="<%:ViewData["finishDate"] %>" />
        <input type="text" id="weiXinUserOpenID" value="<%:ViewData["weiXinUserOpenID"] %>" />
        <input type="text" id="activityID" value="<%:ViewData["activityID"] %>" />
    </div>
    <div class="popup" id="popup" style="display: none">
    </div>
  </footer>
</body>
</html>
<script src="../../Scripts/jquery-1.8.0.min.js" type="text/javascript"></script>
<script type="text/javascript">
    var rollTimeRule = $("#drawTimes").val(); // 限制抽奖的次数

    var spacialPrizeProbability = $("#spacialPrizeProbability").val();
    var firstPrizeProbability = $("#firstPrizeProbability").val();
    var secondPrizeProbability = $("#secondPrizeProbability").val();
    var thirdPrizeProbability = $("#thirdPrizeProbability").val();
    var finishDate = $("#finishDate").val();

    var openID = $("#weiXinUserOpenID").val();
    var activityID = $("#activityID").val();

    var winAward = ""; // 获得的奖品

    // 砸金蛋
    $(function () {
        $("div[dir=moveEggs]").click(function () {
            // 检查
            var drawTime = reduceDrawTimes(); // 已经抽奖的次数
            if (drawTime > rollTimeRule) {
                showBox('您没有抽奖机会啦，下次再来吧');
                return false;
            }

            $("div[class=egg-open]").css("display", "block");
            $("div[class=egg-position]").css("display", "none");

            var gradeType = ""; // 奖品等级

            if (spacialPrizeProbability == 1) { // 百分之百中奖
                gradeType = spacialPrize(spacialPrizeProbability);
            } else if (firstPrizeProbability == 1) { // 百分之百中奖
                gradeType = firstPrizeDeal(firstPrizeProbability);
            } else if (secondPrizeProbability == 1) {// 百分之百中奖
                gradeType = secondPrizeDeal(secondPrizeProbability);
            } else if (thirdPrizeProbability == 1) {// 百分之百中奖
                gradeType = thirdPrizeDeal(thirdPrizeProbability);
            } else {
                var data = [11, 1, 2, 3]; //返回的数组 
                var rndNum = data[Math.floor(Math.random() * data.length)];
                if (rndNum == 11) {// 特等奖
                    gradeType = spacialPrize(spacialPrizeProbability);
                } else if (rndNum == 1) { // 一等奖
                    gradeType = firstPrizeDeal(firstPrizeProbability);
                } else if (rndNum == 2) { // 二等奖
                    gradeType = secondPrizeDeal(secondPrizeProbability);
                } else if (rndNum == 3) { // 三等奖
                    gradeType = thirdPrizeDeal(thirdPrizeProbability);
                }
            }
            if (gradeType == "noAward") {
                setTimeout(function(){
                  showBox('亲，就差一点点就中奖啦，继续努力吧！');
                  ResetEggs();
                },500);
            } else {
                setTimeout(function(){
                 WinPrizeBefore(gradeType);
                },500);
            }

        });

    });

        // 减少砸金蛋的次数
        function reduceDrawTimes(){
            var drawTime=0;
            $.ajax({
                url:"/WeiXinManage/DrawTimesDeal",
                type:"post",
                data:{"openID":openID,"finishDate":finishDate,"activityID":activityID},
                async:false,
                success:function(returnData){
                    drawTime = parseInt(returnData);
                },
                });
            return drawTime;
        };

    // 赢得了奖品
    function WinPrizeBefore(awards) {
        WinPrizeAfter(awards);
    };

    function ResetEggs(){
         $("div[class=egg-open]").css("display", "none");
         $("div[class=egg-position]").css("display", "block");
         winAward = "";
    };

    // 弹出中奖提示
    function WinPrizeAlert(awards) {
        if (awards == "spacialAward") {
            showBox('恭喜您获得了特等奖');
        } else if (awards == "firstAward") {
            showBox('恭喜您获得了一等奖');
        } else if (awards == "secondAward") {
            showBox('恭喜您获得了二等奖');
        } else if (awards == "thirdAward") {
            showBox('恭喜您获得了三等奖');
        }
    }

    //查看我的所有优惠记录
    function myAwardRecord(){
        window.location.href="/WeiXinManage/MyAwardsRecordPage?openID="+openID+"&activityType=HitGoldenEgg";
    };

    // 领取奖品
    function WinPrizeAfter(awards) {
        winAward = "";
        winAward = awards;
        $.ajax({
            url: "/WeiXinManage/WinPrizeDeal",
            type: "post",
            async: false,
            data: { "awards": awards, "openID": openID, "activityID": activityID },
            success: function (returnData) {
                if ("product" == returnData) { // 如果是商品 跳转到指定的页面 填写收货地址、发货等操作
                    WinPrizeAlert(awards);
                    // 重置
                    ResetEggs();
                    setTimeout(window.location.href = "/WeiXinManage/DeliveryAddressPortal?openID=" + openID + "&activityType=HitGoldenEgg", 600);
                } else if ("noRepertory" == returnData) {
                    showBox('十分抱歉，你获得的奖品没库存啦');
                    ReDealWidthProbability(winAward); // 重置概率
                } else if ("error"== returnData) {
                    showBox('十分抱歉，服务器出现了异常');
                    window.location.reload();
                } else { // 中的是优惠券
                    showBox(returnData);
                    ResetEggs();
                }
            }
        });
        winAward = ""; // 清空奖品
    };

    // 特等奖处理
    function spacialPrize(spacialPrizeProbability) {
        var returnResult = "";
        if (spacialPrizeProbability == 1) { // 百分之百中奖
            returnResult = "spacialAward";
        } else if (spacialPrizeProbability == 0) { // 百分之百不会中奖
            returnResult = "noAward";
        } else { // 看运气
            var probability = Math.floor(Math.random() * (spacialPrizeProbability / 4));
            if (probability == 0) {
                returnResult = "spacialAward";
            } else {
                returnResult = "noAward";
            };
        };
        return returnResult;
    };

    // 中一等奖的处理
    function firstPrizeDeal(firstPrizeProbability) {
        var returnResult = "";
        if (firstPrizeProbability == 1) { // 百分之百中奖
            returnResult = "firstAward";
        } else if (firstPrizeProbability == 0) { // 百分之百不会中奖
            returnResult = "noAward";
        } else { // 看运气
            var probability = Math.floor(Math.random() * (firstPrizeProbability / 4));
            if (probability == 0) {
                returnResult = "firstAward";
            } else {
                returnResult = "noAward";
            };
        };
        return returnResult;
    };

    // 中二等奖的处理
    function secondPrizeDeal(secondPrizeProbability) {
        var returnResult = "";
        if (secondPrizeProbability == 1) { // 百分之百中奖
            returnResult = "secondAward";
        } else if (secondPrizeProbability == 0) { // 百分之百不会中奖
            returnResult = "noAward";
        } else { // 看运气
            var probability = Math.floor(Math.random() * (secondPrizeProbability / 4));
            if (probability == 0) {
                returnResult = "secondAward";
            } else {
                returnResult = "noAward";
            };
        }
        return returnResult;

    };

    // 中三等奖的处理
    function thirdPrizeDeal(thirdPrizeProbability) {
        var returnResult = "";
        if (thirdPrizeProbability == 1) { // 百分之百中奖
            returnResult = "thirdAward";
        } else if (thirdPrizeProbability == 0) { // 百分之百不会中奖
            returnResult = "noAward";
        } else { // 看运气
            var probability = Math.floor(Math.random() * (thirdPrizeProbability / 4)); //
            if (probability == 0) {
                returnResult = "thirdAward";
            } else {
                returnResult = "noAward";
            };
        }
        return returnResult;
    };

    // 重新处理概率 【没有库存时 概率重算】
    function ReDealWidthProbability(awards) {
        if (awards == "spacialAward") {
            spacialPrizeProbability = 0;
        } else if (awards == "firstAward") {
            firstPrizeProbability = 0;
        } else if (awards == "secondAward") {
            secondPrizeProbability = 0;
        } else if (awards == "thirdAward") {
            thirdPrizeProbability = 0;
        }
    };

        // 隐藏弹层
        function hideBox() {
            $("#popup").hide();
        };

        // 弹层
        function showBox(text) {
            $("#popup").html("<p>" + text + "</p>");
            $("#popup").attr('style', 'margin-top:' + (document.body.scrollTop-$("#popup").height()/2) + "px");
            $("#popup").show();
            setTimeout("hideBox()", 2000); //2秒
        };
</script>
