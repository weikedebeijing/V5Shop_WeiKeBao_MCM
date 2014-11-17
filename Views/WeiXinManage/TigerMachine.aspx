<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <title>九宫格</title>
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/base.css" />
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/common.css" />
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/soduku.css" />
</head>
<body class="soduku-home-bg">
    <%var activityAward = (V5.MetaData.WeiXin.Model.ActivityAwards)ViewData["activityAward"];  %>
    <%var awardRecords = (List<V5.MetaData.WeiXin.Model.AwardsManageView>)ViewData["awardRecords"]; %>
    <%var awardSets = (List<V5.MetaData.WeiXin.Model.Award>)ViewData["awardSets"]; %>
    <section class="soduku">
    <div class="soduku-style">
      <div class="soduku-style-01"><span class="span-01 current" id="img1">再接再厉</span></div>
      <div class="soduku-style-02"><span class="span-02" id="img2"><!--中奖样式class="span-02 current"-->一等奖</span></div>
      <div class="soduku-style-01"><span class="span-01" id="img3">再接再厉</span></div>
      <div class="soduku-style-02"><span class="span-02" id="img8">再接再厉</span></div>
      <div class="soduku-style-btn"><a class="soduku-style-a" id="luckyDraw" href="#">立即抽奖</a></div>
      <div class="soduku-style-02"><span class="span-02" id="img4">二等奖</span></div>
      <div class="soduku-style-01"><span class="span-01" id="img7">三等奖</span></div>
      <div class="soduku-style-02"><span class="span-02" id="img6">再接再厉</span></div>
      <div class="soduku-style-01"><span class="span-01" id="img5">再接再厉</span></div>
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
<script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
        //查看我的所有优惠记录
       var rollTimeRule = $("#drawTimes").val(); // 限制抽奖的次数

        var spacialPrizeProbability = $("#spacialPrizeProbability").val();
        var firstPrizeProbability = $("#firstPrizeProbability").val();
        var secondPrizeProbability = $("#secondPrizeProbability").val();
        var thirdPrizeProbability = $("#thirdPrizeProbability").val();
        var finishDate = $("#finishDate").val();

        var openID = $("#weiXinUserOpenID").val();
        var activityID = $("#activityID").val();
        var winAward = ""; // 获得的奖品

        var click = 1; //控制在一次抽奖结束前下次点击无效
        var index; //控制的抽奖结束后效果的还原
        var timeInterval; // 定时器

        var imagePosition; // 转动到的图片位置
        var rollCircle; // 转动的圈数
       

       $(document).ready(function () {
       
        $("#luckyDraw").click(function () {
            var drawTime=0;
            $.ajax({
            url:"/WeiXinManage/DrawTimesDeal",
            type:"post",
            data:{"openID":openID,"finishDate":finishDate,"activityID":activityID},
            async:false,
            success:function(returnData){
                drawTime = parseInt(returnData);
                //showBox(drawTime);
            },
            });

            if (drawTime > rollTimeRule){
            showBox('您没有抽奖机会啦，下次再来吧');
            return false;
            }

            //进行判断是否抽奖完毕
            if (click != 1) {
                return;
            }
            click++;
            //抽奖完后将图片还原到初始状态  
            if (index != 1) {
                $("#img1").addClass("current");
                $("#img" + index).removeClass("current");
            }

            imagePosition = 1; //图片轮播的地方
            rollCircle = 1; //控制转了多少圈才停下来的变量
            // var math = Math.floor(Math.random() * 100); //此处纯js,所以随便写的概率

            if (firstPrizeProbability == 1) { // 百分之百中奖
                firstPrizeDeal(firstPrizeProbability, imagePosition);
            } else if (secondPrizeProbability == 1) {// 百分之百中奖
                secondPrizeDeal(secondPrizeProbability, imagePosition);
            } else if (thirdPrizeProbability == 1) {// 百分之百中奖
                thirdPrizeDeal(thirdPrizeProbability, imagePosition);
            } else {
                var data = [1, 2, 3, 0]; //返回的数组
                data = data[Math.floor(Math.random() * data.length)];

                if (data == 1) { // 一等奖
                    firstPrizeDeal(firstPrizeProbability, imagePosition);
                } else if (data == 2) { // 二等奖
                    secondPrizeDeal(secondPrizeProbability, imagePosition);
                } else if (data == 3) { // 三等奖
                    thirdPrizeDeal(thirdPrizeProbability, imagePosition);
                } else {
                    StopRoll("noAward");
                }
            }

        });
    });

        // 查看我的中奖记录
        function myAwardRecord(){
           window.location.href="/WeiXinManage/MyAwardsRecordPage?openID="+openID+"&activityType=NineCell";
        };
        
        // 弹出中奖提示
        function WinPrizeAlert(awards) {
            if (awards == "spacialAward") {
                showBox('恭喜您赢得了特等奖');
            } else if (awards == "firstAward") {
                showBox('恭喜您赢得了一等奖');
            } else if (awards == "secondAward") {
                showBox('恭喜您赢得了二等奖');
            } else if (awards == "thirdAward") {
                showBox('恭喜您赢得了三等奖');
            }
        }

        function _WinPrizeBefore(_awards) {
           return function(){
            WinPrizeAfter(_awards);  
           };
        };

        // 赢得了奖品
        function WinPrizeBefore(awards) {
            WinPrizeAfter(awards);
        };

        // 领取奖品
        function WinPrizeAfter(awards) {
            $.ajax({
                url: "/WeiXinManage/WinPrizeDeal",
                type: "post",
                async: false,
                data: { "awards": awards, "openID": openID, "activityID": activityID },
                success: function (returnData) {
                    if ("product" == returnData) { // 如果是商品 跳转到指定的页面 填写收货地址、发货等操作
                        WinPrizeAlert(awards);
                        setTimeout(function(){
                          window.location.href = "/WeiXinManage/DeliveryAddressPortal?openID=" + openID + "&activityType=NineCell";
                        },600);
                    } else if ("noRepertory" == returnData) {
                        showBox('十分抱歉，你获得的奖品没库存啦');
                        ReDealWidthProbability(winAward); // 重置概率
                    } else if ("error"== returnData) {
                        showBox('十分抱歉，服务器出现了异常');
                    } else { // 中的是优惠券
                        showBox(returnData);
                        setTimeout(function(){
                        window.location.reload();// 刷新
                        },600);
                        
                    }
                }
            });
            winAward = ""; // 清空奖品
        };

        // 中间方法 为了解决 setInterval 和 setTimeout 不能传参的问题
        function _Rotate(_stopFlag, _currentAward) {
            return function () {
                Rotate(_stopFlag, _currentAward);
            }
        }

        // 转动
        function Rotate(stopFlag, currentAward) {
            imagePosition++;
            //控制图片轮播的范围（8张图片） 根据具体图片的多少而定
            if (imagePosition > 8) {
                imagePosition = 1;
                rollCircle++;
            };
            index = imagePosition;

            var nextImg = $("#img" + imagePosition);
            var currentImg = $("#img" + (imagePosition * 1 - 1));

            if (imagePosition == 1) { // 此时nextImg 是 #img1 ;currentImg是#img0
                nextImg.addClass("current");
                $("#img8").removeClass("current");
            } else {
                nextImg.addClass("current");
                currentImg.removeClass("current");
            }


            //当滚动5圈后开始出奖
            if (rollCircle > 4) {
                if (stopFlag == imagePosition) {
                    clearInterval(timeInterval);
                    click = 1;
                    if (currentAward == "noAward") {
                        setTimeout(function(){
                            showBox('亲，就差一点点就中奖啦，继续努力吧！');
                        },200); // 解决弹层比停止转动早出现120毫秒的问题
                    } else {
                        setTimeout(_WinPrizeBefore(currentAward),200);
                    }
                };
            };

        };

        // 停止转动 返回 string 是否停止转动
        function StopRoll(currentAward) {
            switch (currentAward) {
                case "noAward":
                    {
                        var data = [1, 3, 5, 6, 8]; // 未中奖的位置
                        data = data[Math.floor(Math.random() * data.length)];
                        timeInterval = setInterval(_Rotate(data, currentAward), 120);
                    } break;
                case "firstAward":
                    {
                        timeInterval = setInterval(_Rotate(2, currentAward), 120);
                    } break
                case "secondAward":
                    {
                        timeInterval = setInterval(_Rotate(4, currentAward), 120);
                    } break;
                case "thirdAward":
                    {
                        timeInterval = setInterval(_Rotate(7, currentAward), 120);
                    } break;
                default:
                    { }
            }
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
            StopRoll(returnResult); // 停止转动
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
            StopRoll(returnResult); // 停止转动
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
            StopRoll(returnResult); // 停止转动
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
<%-- <script language="javascript" type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>--%>
