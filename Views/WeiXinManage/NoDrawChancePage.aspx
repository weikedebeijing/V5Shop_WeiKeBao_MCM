<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <title>立即抽奖</title>
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/base.css" />
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/common.css" />
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/roulette.css" />
</head>
<body class="record-bg">
    <header class="topbar">
        <div class="topbar-left"><a href="javascript:void(0);" onclick="javascript:goBack();" class="i-back">asd</a>
        </div>
    </header>
    <section class="tips-page">
    <div class="icon-prize"><img src="../../Images/PromotionActivity/square.png" alt="prize"></div>
    <div class="tips-text" id="message"></div>
    <div class="div-btn"><a href="javascript:void(0);" class="btn-a" onclick="javascript:myAwardRecord();">查看我的奖项</a></div>
  </section>
    <footer class="footer0position">
    <span class="explain">技术支持：</span><img src='<%:ViewData["logoUrl"] %>' class="logo-cop" alt="v5shop"  >
    <input type="hidden" id="openID" value='<%:ViewData["openID"] %>' />
  </footer>
</body>
</html>
<script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $("#message").text('<%:ViewData["message"] %>');
    });

    //查看我的所有优惠记录
    function myAwardRecord() {
        var openID = $("#openID").val();
        window.location.href = "/WeiXinManage/MyAwardsRecordPage?openID=" + openID + "";
    };
</script>
