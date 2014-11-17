<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <title>立即领奖</title>
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/base.css" />
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/common.css" />
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/order.css" />
</head>
<body>
    <div style="display: none;">
        <input type="hidden" id="customerID" value="<%:ViewData["customerID"] %>" />
        <input type="hidden" id="addressID" value="<%:ViewData["addressid"] %>" />
        <input type="hidden" id="AwardRecordId" value="<%:ViewData["AwardRecordId"]%>" />
    </div>
    <header class="topbar">
        <div class="topbar-left"><a href="javascript:window.history.back(-1);" class="i-back">asd</a>
        </div>
        <div class="topbar-right"></div>
    </header>
    <section class="adressadd-list">
       <%if (ViewData["addressid"] != null)
         { %>
         <%var modifyAddress = (V5.MetaData.Customer.Model.Address)ViewData["modifyAddress"]; %>
          <ul class="adressadd-list-ul">
              <li class="adressadd-list-li">
                <div class="label"><label>收货人</label></div>
                <div class="value"><input type="text" id="Name" value="<%:modifyAddress.Name %>"/></div>
              </li>
              <li class="adressadd-list-li">
                <div class="label"><label>手机号码</label></div>
                <div class="value"><input type="text" id="Moblie" value="<%:modifyAddress.Moblie %>"/></div>
              </li>
              <li class="adressadd-list-li">
                <div class="label"><label>选择省份</label></div>
                <div class="value">
                  <select id="seleAreaNext">               
                    <option value="-1">请选择</option>
                  </select>
                </div>
              </li>
              <li class="adressadd-list-li">
                <div class="label"><label>选择城市</label></div>
                <input type="hidden" id="AreaCode" value="<%:modifyAddress.AreaCode %>" />
                <input type="hidden" id="SeletctAreaId" value="" />
                <div class="value">
                  <select id="seleAreaThird"> <option value="-1">请选择</option></select>
                </div>
              </li>
              <li class="adressadd-list-li">
                <div class="label"><label>选择区/县</label></div>
                <div class="value">
                  <select id="seleAreaFouth">
                    <option value="-1">请选择</option>
                  </select>
                </div>
              </li>
              <li class="adressadd-list-li">
                <div class="label"><label>详细地址</label></div>
                <div class="value">
                  <textarea name="address" class="remark" placeholder="请填写详细地址" onblur="infoOnblur(this)" onclick="infoClick(this)" id="AddressInfo"><%:modifyAddress.AddressInfo%></textarea>
                </div>
              </li>
       </ul>
       <%}
         else
         { %>
       <ul class="adressadd-list-ul">
          <li class="adressadd-list-li">
            <div class="label"><label>收货人</label></div>
            <div class="value"><input type="text" id="Name"/></div>
            <div><span class="prompt"></span></div>
          </li>
          <li class="adressadd-list-li">
            <div class="label"><label>手机号码</label></div>
            <div class="value"><input type="text" id="Moblie"/></div>
             <div><span class="prompt"></span></div>
          </li>
          <li class="adressadd-list-li">
            <div class="label"><label>选择省份</label></div>
            <div class="value">
              <select id="seleAreaNext">               
                <option value="-1">请选择</option>
              </select>
            </div>
          </li>
          <li class="adressadd-list-li">
            <div class="label"><label>选择城市</label></div>
            <div class="value">
              <select id="seleAreaThird"> <option value="-1">请选择</option></select>
            </div>
          </li>
          <li class="adressadd-list-li">
            <div class="label"><label>选择区/县</label></div>
            <div class="value">
              <select id="seleAreaFouth">
                <option value="-1">请选择</option>
              </select>
               <div><span class="prompt"></span></div>
            </div>
          </li>
          <li class="adressadd-list-li">
            <div class="label"><label>详细地址</label></div>
            <div class="value">
              <textarea name="address" class="remark" placeholder="请填写详细地址" onblur="infoOnblur(this)" onclick="infoClick(this)" id="AddressInfo"></textarea>
            </div>
             <div><span class="prompt"></span></div>
          </li>
        </ul>
       <%} %>
    </section>
    <section class="s-btn">
        <button class="settle-account" onclick="javascript:saveAddress();">领取奖品</button>
    </section>
    <footer>
      <span class="explain">技术支持：</span><img src='<%:ViewData["logoUrl"]  %>' class="logo-cop" alt="v5shop"  >
      <div style=" display:none;">
      <input type="hidden" id="openID" value='<%:ViewData["openID"] %>' />
      <input type="hidden" id="activityType" value='<%:ViewData["activityType"] %>' />
      <input type="hidden" id="type" value='<%:ViewData["type"] %>' />
      <input type="hidden" id="recordID" value='<%:ViewData["recordID"] %>' />
      </div>
    </footer>
</body>
</html>
<script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
<script src="../../Scripts/Js/address.select.area.js" type="text/javascript"></script>
<script src="../../Scripts/Js/address.js" type="text/javascript"></script>
<script type="text/javascript">
    // 返回
    function goBack() {
        window.history.go(-1);
    };
</script>
