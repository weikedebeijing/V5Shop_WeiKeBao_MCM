<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <title>大转盘</title>
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/base.css" />
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/common.css" />
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/roulette.css" />
</head>
<%var activityAward = (V5.MetaData.WeiXin.Model.ActivityAwards)ViewData["activityAward"];  %>
<%var awardRecords = (List<V5.MetaData.WeiXin.Model.AwardsManageView>)ViewData["awardRecords"]; %>
<%var awardSets = (List<V5.MetaData.WeiXin.Model.Award>)ViewData["awardSets"]; %>
<body class="roulette-home-bg">
    <section class="roulette">
    <div class="plate-lay">
      <div class="plate-bg">
        <img id="lotteryBtn" src="../../Scripts/rotate/roulette-bg.png" alt="大转盘">
      </div>
      <div class="plate-pointer" id="centerRoll"></div>
      <div class="plate-shadow"><img src="../../Scripts/rotate/plate-shadow.png" width="100%"></div>
    </div>
    <div class="popup" id="popup" style="display: none"></div>
    <%--部分视图Start--%>
    <%var openID = ViewData["weiXinUserOpenID"]; %>
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
        <input type="text" id="finishDate" value="<%:activityAward.FinishDate %>" />
        <input type="text" id="weiXinUserOpenID" value="<%:ViewData["weiXinUserOpenID"] %>" />
        <input type="text" id="activityID" value="<%:ViewData["activityID"] %>" />
    </div>
  </footer>
</body>
</html>
<script src="../../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="../../Scripts/rotate/jquery.easing.min.js" type="text/javascript"></script>
<script src="../../Scripts/rotate/jQueryRotate.2.2.js" type="text/javascript"></script>
<script type="text/javascript">
        
        var rollTimeRule = $("#drawTimes").val(); // 限制抽奖的次数

        var spacialPrizeProbability = $("#spacialPrizeProbability").val();
        var firstPrizeProbability = $("#firstPrizeProbability").val();
        var secondPrizeProbability = $("#secondPrizeProbability").val();
        var thirdPrizeProbability = $("#thirdPrizeProbability").val();
        var finishDate = $("#finishDate").val();
        
        var openID =  $("#weiXinUserOpenID").val();
        var activityID = $("#activityID").val();
       
        var defaultAngle = [18, 90, 126, 162,134,270,306]; // 未中奖的数组

        var winAward = ""; // 获得的奖品

        var isDrawing = false; // 大转盘是否正在转动

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
                          window.location.href = "/WeiXinManage/DeliveryAddressPortal?openID=" + openID + "&activityType=BigWheel";
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

        //查看我的所有优惠记录
        function myAwardRecord(){
           window.location.href="/WeiXinManage/MyAwardsRecordPage?openID="+openID+"&activityType=BigWheel";
        };

        $(function(){
             $("#centerRoll").rotate({
                bind:
		        {
		         click: function () {
                     if (isDrawing){ // 防止正在转动时用户点击
                        return false;
                     }
                     isDrawing = true;
                     winAward = ""; // 把奖品置为空
                    
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
                
                     var time = Math.floor(Math.random() * 100000);// 1千次网络连接超时
		             if (time == 0) {
		                 timeOut(); //网络超时的概率是 1/1000
		             }else {
                         if (spacialPrizeProbability == 1){ // 百分之百中奖
                           spacialPrize(spacialPrizeProbability);
                         }else if (firstPrizeProbability == 1){ // 百分之百中奖
                           firstPrizeDeal(firstPrizeProbability);
                         }else if (secondPrizeProbability == 1){// 百分之百中奖
                           secondPrizeDeal(secondPrizeProbability);
                         }else if (thirdPrizeProbability == 1){// 百分之百中奖
                           thirdPrizeDeal(thirdPrizeProbability);
                         }else{
                             var data = [11,1, 2, 3, 0]; //返回的数组
                             // var data = [3]; //返回的数组
		                     data = data[Math.floor(Math.random() * data.length)];
                             //var data = Math.floor(Math.random() * 10);
		                     if (data == 11) {// spacialPrizeProbability
                                 spacialPrize(spacialPrizeProbability);
                             }else if (data == 1) { // firstPrizeProbability
                                 firstPrizeDeal(firstPrizeProbability);
		                     }else if (data == 2) { // secondPrizeProbability
                                 secondPrizeDeal(secondPrizeProbability);
		                     }else if (data == 3) { // thirdPrizeProbability
                                 thirdPrizeDeal(thirdPrizeProbability);
		                     }else{
		                         angle = defaultAngle[Math.floor(Math.random() * defaultAngle.length)];
		                         rotateFunc("noAward", angle, '亲，就差一点点就中奖啦，继续努力吧！');
		                     }
                         }

		             }
		         }
		     }

            });
        });

    // 特等奖处理
    function spacialPrize(spacialPrizeProbability){
                if (spacialPrizeProbability == 1){ // 百分之百中奖
                   rotateFunc("spacialAward", 180, '恭喜您获得了特等奖');
                }else if (spacialPrizeProbability == 0){ // 百分之百不会中奖
                    angle = defaultAngle[Math.floor(Math.random() * defaultAngle.length)];
		            rotateFunc("noAward", angle, '亲，就差一点点就中奖啦，继续努力吧！');
                }else{ // 看运气
                     var probability = Math.floor(Math.random() * (spacialPrizeProbability/4));
                     if (probability == 0){
                        rotateFunc("spacialAward", 180, '恭喜您获得了特等奖');
                     }else{
                        angle = defaultAngle[Math.floor(Math.random() * defaultAngle.length)];
		                rotateFunc("noAward", angle, '亲，就差一点点就中奖啦，继续努力吧！');
                     };
                };
    };


      // 中一等奖的处理
      function firstPrizeDeal(firstPrizeProbability){
                if (firstPrizeProbability == 1){ // 百分之百中奖
                   rotateFunc("firstAward", 342, '恭喜您获得了一等奖');
                }else if (firstPrizeProbability == 0){ // 百分之百不会中奖
                    angle = defaultAngle[Math.floor(Math.random() * defaultAngle.length)];
		            rotateFunc("noAward", angle, '亲，就差一点点就中奖啦，继续努力吧！');
                }else{ // 看运气
                     var probability = Math.floor(Math.random() * (firstPrizeProbability/4));
                     if (probability == 0){
                        rotateFunc("firstAward", 342, '恭喜您获得了一等奖');
                     }else{
                        angle = defaultAngle[Math.floor(Math.random() * defaultAngle.length)];
		                rotateFunc("noAward", angle, '亲，就差一点点就中奖啦，继续努力吧！');
                     };
                };
      };

      // 中二等奖的处理
      function secondPrizeDeal(secondPrizeProbability){
                if (secondPrizeProbability == 1){ // 百分之百中奖
                   rotateFunc("secondAward", 198, '恭喜您获得了二等奖');
                }else if (secondPrizeProbability == 0){ // 百分之百不会中奖
                    angle = defaultAngle[Math.floor(Math.random() * defaultAngle.length)];
		            rotateFunc("noAward", angle, '亲，就差一点点就中奖啦，继续努力吧！');
                }else{ // 看运气
                     var probability = Math.floor(Math.random() * (secondPrizeProbability/4));
                     if (probability == 0){
                        rotateFunc("secondAward", 198, '恭喜您获得了二等奖');
                     }else{
                        angle = defaultAngle[Math.floor(Math.random() * defaultAngle.length)];
		                rotateFunc("noAward", angle, '亲，就差一点点就中奖啦，继续努力吧！');
                     };
                }
               
      };

      // 中三等奖的处理
      function thirdPrizeDeal(thirdPrizeProbability){
                if (thirdPrizeProbability == 1){ // 百分之百中奖
                   rotateFunc("thirdAward", 54, '恭喜您获得了三等奖');
                }else if (thirdPrizeProbability == 0){ // 百分之百不会中奖
                    angle = defaultAngle[Math.floor(Math.random() * defaultAngle.length)];
		            rotateFunc("noAward", angle, '亲，就差一点点就中奖啦，继续努力吧！');
                }else{ // 看运气
                     var probability = Math.floor(Math.random() *(thirdPrizeProbability/4) );//
                     if (probability == 0){
                        rotateFunc("thirdAward", 54, '恭喜您获得了三等奖');
                     }else{
                        angle = defaultAngle[Math.floor(Math.random() * defaultAngle.length)];
		                rotateFunc("noAward", angle, '亲，就差一点点就中奖啦，继续努力吧！');
                     };
                }
               
      };

       var timeOut = function () {  //超时函数 回到起始位置
                $("#lotteryBtn").rotate({
                    defaultAngle: 0,
                    duration: 10000,
                    animateTo: 3600, //转动角度，10圈+  + rollNum 
                    callback: function () {
                        showBox('网络链接超时');
                        isDrawing = false;
                    },
                });
            };

        var rotateFunc = function (awards, angle, text) {  //awards:奖项，defaultAngle:奖项对应的角度
            var rollNum = Math.floor((Math.random() * 33) + 3); //生成随机数 [3~42]
            var totaldefaultAngle = angle + 720 + rollNum;
            $("#lotteryBtn").stopRotate();
            $("#lotteryBtn").rotate({
                angle: 0,  // 起始角度
                duration: 8000, // 转动的时间
                animateTo: totaldefaultAngle, //转动的角度
                callback: function () {
                    if (awards == "noAward"){
                        showBox(text);
                    }else{ 
                        WinPrizeBefore(awards);
                    }
                    isDrawing = false;
                }
            });
        };

        // 重新处理概率 【没有库存时 概率重算】
        function ReDealWidthProbability(awards){
           if (awards == "spacialAward"){
             spacialPrizeProbability = 0;
           }else if (awards == "firstAward"){
             firstPrizeProbability = 0;
           }else if (awards == "secondAward"){
             secondPrizeProbability = 0;
           }else if (awards == "thirdAward"){
             thirdPrizeProbability = 0;
           }
        } ;

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
