<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <title>幸运抽奖</title>
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/base.css" />
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/common.css" />
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/card.css" />
    <%--<script src="../../Scripts/jquery-1.8.0.min.js" type="text/javascript"></script>--%>
    <script src="../../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <%--<link href="../../Content/guaguale/layout.css" rel="stylesheet" type="text/css" />--%>
    <script src="../../Scripts/guaguale/wScratchPad.js" type="text/javascript"></script>
    <style type="text/css">
        .header .lable
        {
            float: left;
            height: 35px;
            line-height: 35px;
            width: 22%;
            background: url("../../Scripts/guaguale/images/scratch-area.png") no-repeat 0 center;
            -webkit-background-size: 80% auto;
            -moz-background-size: 80% auto;
            -o-background-size: 80% auto;
            background-size: 80% auto;
        }
    </style>
</head>
<%var activityAward = (V5.MetaData.WeiXin.Model.ActivityAwards)ViewData["activityAward"];  %>
<%var awardRecords = (List<V5.MetaData.WeiXin.Model.AwardsManageView>)ViewData["awardRecords"]; %>
<%var awardSets = (List<V5.MetaData.WeiXin.Model.Award>)ViewData["awardSets"]; %>
<body class="card-bg">
    <section class="card">
    <div class="adv-lay">
         <div class="adv-bg"><img src="../../Scripts/guaguale/images/card-bg.png" alt="刮刮乐">
         </div>
         <div class="wrapper">
                <div class="header" style="position: absolute;left: 16%;width: 65%;top:60%;" >
                    <label class="lable"></label>
                    <div id="wScratchPad" class="myCanvas">
                    </div>
                </div>
         </div> 
    </div>
    <%--------------------------%> 
    <%--<div class="adv-lay">
      <div class="adv-bg"><img src="../../Scripts/guaguale/images/card-bg.png" alt="刮刮乐"></div>
      <div class="adv-scratch">
          <label></label>
          <canvas id=""></canvas>
      </div>
    </div>--%>
    <%--------------------------%> 
    <%--部分视图Start--%>
    <%var openID = ViewData["weiXinUserOpenID"]; %>
    <%Html.RenderPartial("ActivityDetail", new { activityAward, awardRecords, awardSets, activityType = "BigWheel" }); %>
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
    <div class="popup" id="popup" style="display: none">
    </div>
  </footer>
</body>
</html>
<script type="text/javascript">
            
            // 刮刮卡对象
            var sp;
            var rollTimeRule = $("#drawTimes").val(); // 限制抽奖的次数

            var spacialPrizeProbability = $("#spacialPrizeProbability").val();
            var firstPrizeProbability = $("#firstPrizeProbability").val();
            var secondPrizeProbability = $("#secondPrizeProbability").val();
            var thirdPrizeProbability = $("#thirdPrizeProbability").val();
            var finishDate = $("#finishDate").val();

            var openID =  $("#weiXinUserOpenID").val();
            var activityID = $("#activityID").val();

            var winPrizeUrl = ""; // 中奖url
            var winPrizeFlag = false; // 是否中奖的标志
            var winAward = ""; // 奖品等级

            var hasAlert = false; // 已经弹框的标识

            $(function(){
                // 初始化刮刮卡
                innitCanvas();
            });
            
            // 初始化刮刮卡
            function innitCanvas(){
                var url = probabilityDeal();  

                var drawTime= reduceDrawTimes();
                
                if (drawTime > rollTimeRule){
                   showBox('您没有抽奖机会啦，下次再来吧');
                   return false;
                }
               
                if (url !="../../images/guaguale/Catch2.jpg"){
                  winPrizeFlag = true;
                  winPrizeUrl = url;
                }
                 
                sp=  $("#wScratchPad").wScratchPad({
                    cursor: '',
                    image: url,
                    width: 180,
                    height: 33,
                    color: 'darkgray',
                    scratchMove: function(e, percent) {
                        if (percent <= 10){
                           return false;
                        }
                        this.clear();
                        if (winPrizeFlag && !hasAlert){ // 用户中奖 并且没有弹层
                           hasAlert = true;
                          var timer = setTimeout(_WinPrizeBefore(winPrizeUrl),200);
                        }else if (!winPrizeFlag && !hasAlert){ // 用户没有中奖 并且没有弹层
                           hasAlert = true;
                           var timer = setTimeout(function(){
                             showBox('亲，就差一点点就中奖啦，继续努力吧！');
                             reset(); // 重置
                           },200);
                        }
                    },
                    scratchDown: function(e, percent) {
                        
                    },
                });
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

            // 中间方法
            function _WinPrizeBefore(_winPrizeUrl) {
                return function () {
                    WinPrizeBefore(_winPrizeUrl);
                }
            }

             // 赢得了奖品
            function WinPrizeBefore(url){
                   var gradeType = "";
                   if (url == "../../Images/guaguale/spacial.gif"){
                     gradeType = "specialAward";
                   }else if (url == "../../Images/guaguale/firstPrize2.jpg"){
                     gradeType = "firstAward";
                   }else if (url == "../../Images/guaguale/SecondPrize2.gif"){
                     gradeType = "secondAward";
                   }else if (url == "../../Images/guaguale/thirdPrize2.gif"){
                     gradeType = "thirdAward";
                   }
                    winAward = gradeType;
                  // 领取奖品
                  WinPrizeAfter(winAward);
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
                            reset();
                            setTimeout(function(){
                            window.location.href = "/WeiXinManage/DeliveryAddressPortal?openID=" + openID + "&activityType=ScratchFunny";
                            },600);
                            
                        } else if ("noRepertory" == returnData) {
                            showBox('十分抱歉，你获得的奖品没库存啦');
                            ReDealWidthProbability(winAward); // 重置概率
                        } else if ("error"== returnData) {
                            showBox('十分抱歉，服务器出现了异常');
                        } else { // 中的是优惠券
                            reset();
                            showBox(returnData);
                            setTimeout(function(){
                              window.location.reload();// 刷新
                            },600);
                            
                        }
                    }
                });
                winAward = ""; // 清空奖品
            };

            // 概率的处理
            function probabilityDeal(){
                var url = "";
                var url11 ="../../Images/guaguale/spacial.gif";
                var url1 = "../../Images/guaguale/firstPrize2.jpg";
                var url2 = "../../Images/guaguale/SecondPrize2.gif";
                var url3 = "../../Images/guaguale/thirdPrize2.gif";
                var url0 = "../../images/guaguale/Catch2.jpg";

                if (spacialPrizeProbability == 1){ // 百分之百中奖
                   url = url11;
                }else if (firstPrizeProbability == 1){ // 百分之百中奖
                   url = url1;
                }else if (secondPrizeProbability == 1){// 百分之百中奖
                   url = url2;
                }else if (thirdPrizeProbability == 1){// 百分之百中奖
                   url = url3;
                }else{
                   var data = [11,1, 2, 3, 0]; //返回的数组
                    // var data = [3]; //返回的数组
		            rndNum = data[Math.floor(Math.random() * data.length)];
                
                    if (rndNum == 11){// 特等奖
                        url =  spacialPrize(spacialPrizeProbability);
                    }else if (rndNum == 1){ // 一等奖
                        url =  firstPrizeDeal(firstPrizeProbability);
                    }else if (rndNum == 2){ // 二等奖
                        url = secondPrizeDeal(secondPrizeProbability);
                    }else if (rndNum == 3){ // 三等奖
                        url = thirdPrizeDeal(thirdPrizeProbability);
                    }else{ // 未中奖
                        url = url0;
                    }
                    return url;      
                 }
                 return url;  
            };

            // 特等奖处理
            function spacialPrize(spacialPrizeProbability){
                        var url11 ="../../Images/guaguale/spacial.gif";
                        var url0 = "../../images/guaguale/Catch2.jpg";
                        if (spacialPrizeProbability == 1){ // 百分之百中奖
                            return url11;
                        }else if (spacialPrizeProbability == 0){ // 百分之百不会中奖
                           return url0;
                        }else{ // 看运气
                                var probability = Math.floor(Math.random() * (spacialPrizeProbability/4));
                                if (probability == 0){
                                   return url11;
                                }else{
                                   return url0;
                                };
                        };
            };

            // 中一等奖的处理
            function firstPrizeDeal(firstPrizeProbability){
                var url1 = "../../Images/guaguale/firstPrize2.jpg";
                var url0 = "../../images/guaguale/Catch2.jpg";
                if (firstPrizeProbability == 1){ // 百分之百中奖
                   return url1;
                }else if (firstPrizeProbability == 0){ // 百分之百不会中奖
                    return url0;
                }else{ // 看运气
                     var probability = Math.floor(Math.random() * (firstPrizeProbability/4));
                     if (probability == 0){
                        return url1;
                     }else{
                        return url0;
                     };
                };
      };

            // 中二等奖的处理
            function secondPrizeDeal(secondPrizeProbability){
                var url2 = "../../Images/guaguale/SecondPrize2.gif";
                var url0 = "../../images/guaguale/Catch2.jpg";
                if (secondPrizeProbability == 1){ // 百分之百中奖
                   return url2;
                }else if (secondPrizeProbability == 0){ // 百分之百不会中奖
                    return url0;
                }else{ // 看运气
                     var probability = Math.floor(Math.random() * (secondPrizeProbability/4));
                     if (probability == 0){
                        return url2;
                     }else{
                        return url0;
                     };
                }
               
      };

            // 中三等奖的处理
            function thirdPrizeDeal(thirdPrizeProbability){
                var url3 = "../../Images/guaguale/thirdPrize2.gif";
                var url0 = "../../images/guaguale/Catch2.jpg";
                if (thirdPrizeProbability == 1){ // 百分之百中奖
                   return url3;
                }else if (thirdPrizeProbability == 0){ // 百分之百不会中奖
                    return url0;
                }else{ // 看运气
                     var probability = Math.floor(Math.random() *(thirdPrizeProbability/4) );//
                     if (probability == 0){
                        return url3;
                     }else{
                        return url0;
                     };
                }
               
      };

            // canvas 画板重置
            function reset() { 
                  winAward = "";
                 
                var drawTime= reduceDrawTimes();
                //showBox(drawTime);
                if (drawTime > rollTimeRule){
                   showBox('您没有抽奖机会啦，下次再来吧');
                   return false;
                }
                sp.wScratchPad("reset");  // 此方法只是清除画布 不能重置画布内容

                var url = probabilityDeal();
                
                hasAlert = false; // 重置
                winPrizeFlag = false;

                if (url !="../../images/guaguale/Catch2.jpg"){
                  winPrizeFlag = true;
                  winPrizeUrl = url;
                }
               
                $("#wScratchPad").children("div").css("background-image","url("+url+")");
            };

            // 减少刮卡的次数
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
                
            // canvas 画板清除
            function clear() { 
                sp.wScratchPad('clear');
            };

        //查看我的所有优惠记录
        function myAwardRecord(){
           window.location.href="/WeiXinManage/MyAwardsRecordPage?openID="+openID+"&activityType=ScratchFunny";
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
</html> 