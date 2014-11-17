<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <title>会员卡</title>
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/base.css" />
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/common.css" />
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/membershipcard.css" />
</head>
<body class="membershipcard-bg">
    <!--card begin-->
    <section class="card">
    <img class="card-img" src="../../Images/WXCustomerCardMobile/CustomerCard.png">
  </section>
    <!--card end-->
    <!--info begin-->
    <section class="infor">
  	<div class="btn"><a href="/WXCustomerCardMobile/CustomerInfoForm" class="btn-a">领取您的新会员卡</a></div>
    <div class="infor-list">
      <span class="infor-list-annotation">微时代会员卡，方便携带收藏，永不挂失…</span>
      <ul class="list-summary">
        <li class="list-summary-li">
          <p class="column">消费总额</p>
          <span class="number">0元</span>
        </li>
        <li class="list-summary-li">
          <p class="column">剩余积分</p>
          <span class="number">0元</span>
        </li>
        <li class="list-summary-li noneline-r">
          <p class="column">剩余金额</p>
          <span class="number">0元</span>
        </li>
      </ul>
      <ul class="list-info">
        <li class="list-info-li">
          <a href="detail.html" class="list-info-a"><span>会员卡说明</span></a>
        </li>
        <li class="list-info-li noneline-b">
          <a href="stores.html" class="list-info-a"><span>适用门店电话及地址</span></a>
        </li>
      </ul>
      <ul class="list-info">
        <li class="list-info-li">
          <a href="#" class="list-info-a"><span>地址:上海市宝山区长逸路15号A栋11层（复旦软件园）</span></a>
        </li>
        <li class="list-info-li noneline-b">
          <a href="tel:021-36411851" class="list-info-a"><span>电话:021-36411851</span></a>
        </li>
      </ul>
    </div>
  </section>
    <!--info end-->
    <footer>
    <span class="explain">技术支持：</span><img src='<%:ViewData["logoUrl"] %>' class="logo-cop" alt="v5shop"  >
  </footer>
</body>
</html>
