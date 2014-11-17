<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <title>领取奖品</title>
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/base.css" />
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/common.css" />
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/roulette.css" />
</head>
<body class="record-bg">
    <header class="topbar">
        <div class="topbar-left"><a href="javascript:goBack();" class="i-back">asd</a>
        </div>
        <div class="topbar-right"></div>
    </header>
    <section class="tips-page">
    <div class="icon-prize"><img src="../../Images/PromotionActivity/prize.png" alt="prize"></div>
    <div class="tips-text">您已成功领奖!</div>
    <div class="div-btn"><a href="javascript:void(0);"onclick="javascript:myAwardRecord();" class="btn-a">查看我的奖项</a></div>
  </section>
    <footer class="footer0position">
    <span class="explain">技术支持：</span><img src='<%:ViewData["logoUrl"] %>' class="logo-cop" alt="v5shop"  >
     <input type="hidden" value='<%:ViewData["Url"] %>' id="url" />
     <input type="hidden" id="openID" value='<%:ViewData["openID"] %>' />
     <input type="hidden" id="activityType" value='<%:ViewData["activityType"] %>' />
  </footer>
</body>
</html>
<script src="../../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
    //查看我的所有优惠记录
    function myAwardRecord() {
        var openID = $("#openID").val();
        var activityType = $("#activityType").val();
        window.location.href = "/WeiXinManage/MyAwardsRecordPage?openID=" + openID + "&activityType=" + activityType + "";
    };

    function goBack() { // 返回到抽奖页面
        var Url = $("#url").val();
        if (Url.trim() == "") { // 如果用户没有抽奖机会跳到中奖记录页面的没有返回
            return false;
        }
        var openID = $("#openID").val();
        var activityType = $("#activityType").val();
        var jumpUrl = Url + "?openID=" + openID + "&key=" + activityType;
        window.location.href = jumpUrl;
    }

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
</script>
