<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <title>中奖记录</title>
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/base.css" />
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/common.css" />
    <link rel="stylesheet" tyle="text/css" href="http://html.v5portal.com/mobile-wechat/css/roulette.css" />
</head>
<body class="record-bg">
    <header class="topbar">
        <div class="topbar-left"><a href="javascript:void(0);" onclick="javascript:goBack();" class="i-back">asd</a>
        </div>
    </header>
    <section class="record-title">
    <h1 class="record-title-h1">共有<b><%:ViewData["awardCount"] %></b>个中奖记录</h1>
    <span class="record-title-line"></span>
  </section>
    <section class="record-list">
   <%var awardRecords = (List<V5.MetaData.WeiXin.Model.AwardRecord>)ViewData["awardRecord"]; %>
    <ul class="record-list-ul">
    <%foreach (var item in awardRecords)
      {%>

      <li class="record-list-li">
        <h2>  <%:item.AwardTypeName%></h2>
        <div>
        奖项等级：<%:item.AwardGrade%><br>
        奖品内容：<%:item.AwardName%><br>
        奖品价值:￥<%:item.AwardPrice%><br>
        奖品状态: 
        <%=V5.MetaData.Util.AppEnum.AwardStateTypeName(item.AwardState)%><br>

        <% if (item.AwardState == 1)
           {%>
           发放日期:<%=item.GiveOutAwardDate%>
          <% }%>
      </div>
      <%if (item.AwardState == 4)
        { 
        %>
        <div class="sec-gtgift"><a class="gtgift" dir="<%=item.CustomerID%>" lang="<%=item.ID %>" onclick="award(event)" href="javascript:void(0)">领取奖品</a></div>
            <%} %>
                    
      </li>
   <%} %>
    </ul>
   <%if (!awardRecords.Any())
    {%>
      <span class="explain">您暂无中奖记录</span>
   <%} %>
  </section>
    <footer>
    <span class="explain">技术支持：</span><img src='<%:ViewData["logoUrl"] %>' class="logo-cop" alt="v5shop"  >
    <input type="hidden" value='<%:ViewData["Url"] %>' id="url" />
     <input type="hidden" value='<%:ViewData["openID"] %>' id="openID" />
     <input type="hidden" value='<%:ViewData["activityType"] %>' id="activityType" />
  </footer>
</body>
<script src="../../Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
    function goBack() {
        var Url = $("#url").val();
        if (url.trim() == "") { // 如果用户没有抽奖机会跳到中奖记录页面的没有返回
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

    //领取奖品AwardState状态修改  5
    function award(event) {
        event = event ? event : window.event;
        var eventSrc = event.srcElement ? event.srcElement : event.target;

        var CustomerID = $(eventSrc).attr("dir");
        var ID = $(eventSrc).attr("lang");
        window.location.href = "/WeiXinManage/DeliveryAddressPortal?openID=" + $("#openID").val() + "&activityType=" + $("#activityType").val() + "&type=dse" + "&recordID=" + ID;
    }
</script>
</html>
