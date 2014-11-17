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
    <header class="topbar">
        <div class="topbar-left"><a href="javascript:window.history.back(-1);" class="i-back">asd</a>
        </div>
        <div class="topbar-right"></div>
    </header>
    <section class="address-list">
     <a href="javascript:void(0);" class="address-add-a" onclick="javascript:addAddress();">新增收货地址</a> 
    <ul class="address-list-ul" id="list">
   <%var addresses = (List<V5.MetaData.Customer.Model.Address>)ViewData["addresses"];  %>
     <%foreach (var item in addresses)
       {%>
        <%if (item.IsDefault == false)
          { %>
           <li class="address-list-li" dir='' id="<%:item.ID %>">
            <div class="opera">
              <a href="javascript:void(0);" onclick="javascript:editAddress('<%:item.ID %>');" class="icon-edit"></a>
              <a href="javascript:void(0);" onclick="javascript:deleteAddressElement(event);" class="icon-del"></a>
            </div>
            <p class="person">
               <span class="name"><%:item.Name%></span>
               <span class="mobile"><%:item.Moblie%></span>
            </p>
            <p class="detail-address"><%:item.AddressInfo %></p>
             <i class="icon-hook"></i>
            </li>
        <%}
          else
          { %>
        <li class="address-list-li current" dir='currentFlag' id="<%:item.ID %>">
        <div class="opera">
          <a href="javascript:void(0);" onclick="javascript:editAddress('<%:item.ID %>');" class="icon-edit"></a>
          <a href="javascript:void(0);" onclick="javascript:deleteAddressElement(event);" class="icon-del"></a>
        </div>
        <p class="person">
           <span class="name"><%:item.Name%></span>
           <span class="mobile"><%:item.Moblie%></span>
        </p>
        <p class="detail-address"><%:item.AddressInfo %></p>
         <i class="icon-hook"></i>
        </li>
        <%} %>
       
     <%} %>
    </ul>  
  </section>
    <div class="clear">
    </div>
    <section class="s-btn">
        <button class="settle-account" onclick="javascript:saveState();">领取奖品</button>
        <a href="javascript:window.history.go(-1)" style="display:none" ><span id="backpage"></span></a>
    </section>
    <div class="clear">
    </div>
    <footer>
    <span class="explain">技术支持：</span><img src='<%:ViewData["logoUrl"] %>' class="logo-cop" alt="v5shop"  >
   </footer>
    <div style="display: none;">
        <input type="hidden" id="customerID" value='<%:ViewData["customerID"] %>' />
        <input type="hidden" id="openID" value='<%:ViewData["openID"] %>' />
        <input type="hidden" id="activityType" value='<%:ViewData["activityType"] %>' />
        <input type="hidden" id="type" value='<%:ViewData["type"] %>' />
        <input type="hidden" id="recordID" value='<%:ViewData["recordID"] %>' />
    
    </div>
     <div class="popup" id="popup" style="display: none">
    </div>
</body>
</html>
<script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $("#list li").click(function (event) {
        var obj = this;
        if (getEventTarget(event, 1).tagName != "A") {
            var currentElement = $("#list").find("li[dir=currentFlag]").removeClass('current');
            $("#list li").attr("dir", "");
            $(this).addClass("current");
            $(this).attr("dir", "currentFlag");
        }
    })

    // 保存状态
    function saveState() {
        var choseAddress = $("#list").find("li[dir=currentFlag]");
        var addressID = "";
        if (!choseAddress.attr("dir")) {
            showBox('请选择要发货的地址');
            return false;
        } else {
            addressID = choseAddress.attr("id");
        }

        var customerID = $("#customerID").val();
        var openID = $("#openID").val();
        var activityType = $("#activityType").val();
        var type = $("#type").val();
        var recordID = $("#recordID").val();

        $.ajax({
            url: "/WeiXinManage/ModifyAddressState",
            type: "post",
            data: { "addressID": addressID, "customerID": customerID, "type": type, "recordID": recordID },
            success: function (returnData) {
                if (returnData == "ok") {
                    window.location.href = "/WeiXinManage/GetAwardPage?openID=" + openID + "&activityType=" + activityType + "";
                } else {
                    window.location.href = "/WeiXinManage/ServerErrorPage";
                }
            }
        });
    };

    function getEventTarget(event, targetType) {
        event = event || window.event;
        if (targetType == 1) {// 获得触发的对象
            return event.target || event.srcElement;
        } else if (targetType == 2) {// 获得处理事件的对象
            return event.currentTarget;
        }
    }

    // 跳转到 添加收货地址页面
    function addAddress() {
        var openID = $("#openID").val();
        var activityType = $("#activityType").val();
        window.location.href = "/WeiXinManage/FillInAddress?customerID=" + $("#customerID").val() + "&openID=" + openID + "&activityType=" + activityType + "&type=" + $("#type").val() + "&recordID=" + $("#recordID").val();
    };


    // 编辑收货地址
    function editAddress(addressid) {
        var openID = $("#openID").val();
        var activityType = $("#activityType").val();
        window.location.href = "/WeiXinManage/FillInAddress?customerID=" + $("#customerID").val() + "&addressid=" + addressid + "&openID=" + openID + "&activityType=" + activityType + "&type=" + $("#type").val() + "&recordID=" + $("#recordID").val();
    };

    // 删除元素
    function deleteAddressElement(event) {
        event = event ? event : window.event;
        var eventSrc = event.srcElement ? event.srcElement : event.target;
        var removeLi = $(eventSrc).parents("li");
        var addressID = removeLi.attr("id");
        $.ajax({
            url: "/WeiXinManage/RemoveAddress",
            type: "post",
            data: { "addressID": addressID },
            success: function (returnData) {
                if (returnData == "ok") {
                    removeLi.remove();
                    //window.location.reload();
                } else {
                    showBox('服务器异常');
                }
            }
        });
    };

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

    // 隐藏弹层
    function hideBox() {
        $("#popup").hide();
    };

    // 弹层
    function showBox(text) {
        $("#popup").html("<p>" + text + "</p>");
        $("#popup").attr('style', 'margin-top:' + (document.body.scrollTop - $("#popup").height() / 2) + "px");
        $("#popup").show();
        setTimeout("hideBox()", 2000); //2秒
    }; 
</script>
