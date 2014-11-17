<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>打印快递单模板</title>
    <%--<link rel="stylesheet" href="URL to your print.css" type="text/css" media="print" />--%>
    <style type="text/css">
        *
        {
            font-size: 14px;
            margin: 0;
            padding: 0;
        }
    </style>
    <%--下面是专门控制打印的css--%>
    <style type="text/css" media="print">
        *
        {
            font-size: 14px;
            margin: 0;
            padding: 0;
        }
        
        html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video
        {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 100%;
            font: inherit;
            vertical-align: baseline;
        }
        /* HTML5 display-role reset for older browsers */
        article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section
        {
            display: block;
        }
        body
        {
            line-height: 1.4em;
        }
        ol, ul
        {
            list-style: none;
        }
        blockquote, q
        {
            quotes: none;
        }
        blockquote:before, blockquote:after, q:before, q:after
        {
            content: '';
            content: none;
        }
        table
        {
            border-collapse: collapse;
            border-spacing: 0;
        }
        
        .extraElement
        {
            display: none;
        }
        
        #bodyContent{margin:0 0 0 0;padding:0 0 0 0;}
        
    </style>
</head>
<body id="bodyContent" style="position: relative; border: 1px solid black;">
    <%-- <div id="tips">--%>
    <div class="field" id="tip1" style="position: absolute;">
    </div>
    <div class="field" id="tip2" style="position: absolute;">
    </div>
    <div class="field" id="tip3" style="position: absolute;">
    </div>
    <div class="field" id="tip4" style="position: absolute;">
    </div>
    <div class="field" id="tip5" style="position: absolute;">
    </div>
    <div class="field" id="tip6" style="position: absolute;">
    </div>
    <div class="field" id="tip7" style="position: absolute;">
    </div>
    <div class="field" id="tip8" style="position: absolute;">
    </div>
    <div class="field" id="tip9" style="position: absolute;">
    </div>
    <div class="field" id="tip10" style="position: absolute;">
    </div>
    <div class="field" id="tip11" style="position: absolute;">
    </div>
    <div class="field" id="tip12" style="position: absolute;">
    </div>
    <div class="field" id="tip13" style="position: absolute;">
    </div>
    <div class="extraElement">
        <% var nextID = ViewData["nextID"];%>
        <%--模板图片的属性--%>
        <input type="hidden" name="nextID" id="nextID" value="<%:nextID %>" />
        <% var Data1 = ViewData["dataPart1"];%>
        <%--模板图片的属性--%>
        <input type="hidden" name="Datas" id="dataPart1" value="<%:Data1 %>" />
        <% var Data2 = ViewData["dataPart2"];%>
        <%--tips的坐标信息--%>
        <input type="hidden" name="Datas" id="dataPart2" value="<%:Data2 %>" />
        <% var Data3 = ViewData["dataPart3"];%>
        <%--tip内容信息--%>
        <input type="hidden" name="Datas" id="dataPart3" value="<%:Data3 %>" />
        <% var Invoice = ViewData["Invoice"];%>
        <%--收货人的信息--%>
        <input type="hidden" name="Datas" id="Invoice" value="<%:Invoice %>" />
        <% var LogisticsAddress = ViewData["LogisticsAddress"];%>
        <%--发货人的信息--%>
        <%if (LogisticsAddress != null)
          { %>
        <input type="hidden" name="LogisticsAddress" id="LogisticsAddress" value="<%:LogisticsAddress %>" />
        <%} %>
    </div>
</body>
<script src="../../Scripts/jquery-1.4.3.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        // 获取前台传过来的数据
        // 获取快递单信息 以及tip的坐标
        var returnData1 = $.parseJSON($("#dataPart1").val());
        var ImageUrl = returnData1.ImageUrl;
        var Length = returnData1.Length;
        var Width = returnData1.Width;
      
        //        这个设置会影响到打印的区域吗
        // 设置 body的宽高 
        $("#bodyContent").css("width", Length);
        $("#bodyContent").css("height", Width);

        var returnData2 = $.parseJSON($("#dataPart2").val());
        // tips 坐标的集合
        var templateElements = returnData2;
        // 循环把每一个tip的坐标放上去
        var elementID = 0;
        for (var i = 0; i < templateElements.length; i++) {
            // 取到 elementID
            elementID = templateElements[i].ElementID;
            // 取到tip
            var tip = "#tip" + elementID;
            $(tip).css('top', templateElements[i].OffSetY + "px");
            $(tip).css('left', templateElements[i].OffSetX + "px");

        };

        var Invoice = $.parseJSON($("#Invoice").val());
        var LogisticsAddress = $.parseJSON($("#LogisticsAddress").val());

        var returnData3 = $.parseJSON($("#dataPart3").val());
        // 存储tip Name的
        var elements = returnData3;
        for (var i = 0; i < elements.length; i++) {
            var id = elements[i].ID;
            var tipName = elements[i].ElementName;
            var tip = "#tip" + id;
            var RealName = "";
            if (id == 1) {
                RealName = Invoice.OrderCode; // 订单编号
            }
            if (id == 2) {
                if (LogisticsAddress != null) {
                    RealName = LogisticsAddress.CompanyName; // 发件人公司
                }
            }
            if (id == 3) {
                RealName = Invoice.ReceivingName; // 收件人姓名
            }
            if (id == 4) {
                RealName = Invoice.ReceivingPostCode; // 收件人邮编
            }
            if (id == 5) {
                RealName = ""; // 发件人姓名
            }
            if (id == 6) {
                if (LogisticsAddress != null) {
                    RealName = LogisticsAddress.Address; // 发件人地址
                }
            }
            if (id == 7) {
                RealName = Invoice.ReceivingMobilePhone; // 收件人电话
            }
            if (id == 8) {
                RealName = ""; // 代收金额
            }
            if (id == 9) {
                if (LogisticsAddress != null) {
                    RealName = LogisticsAddress.Tel; // 发件人电话
                }
            }
            if (id == 10) {
                if (LogisticsAddress != null) {
                    RealName = LogisticsAddress.Zip; // 发件人邮编
                }
            }
            if (id == 11) {
                RealName = Invoice.ReceivingAddress; // 收件人地址
            }
            if (id == 12) {
                RealName = Invoice.Code; // 货到付款物流编号
            }
            if (id == 13) {
                RealName = Invoice.Remark; // 备 注
            }
            $(tip).text(RealName);
        }

        // 把数据组装到页面上 打印时不打印图片
        //        $("#TemplatePic").attr("src", ImageUrl);
        //        $("#TemplatePic").css("height", Width);
        //        $("#TemplatePic").css("width", Length);

   
        // 打印
        testJsStop();
    });

   
    // 打印
    function getQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }
    var index = getQueryString("id");

    //==============================js暂停开始=========================================
    //js暂停函数
    var Pause = function (obj, iMinSecond) {
        if (window.eventList == null) window.eventList = new Array();
        var ind = -1;
        for (var i = 0; i < window.eventList.length; i++) {
            if (window.eventList[i] == null) {
                window.eventList[i] = obj;
                ind = i;
                break;
            }
        }
        if (ind == -1) {
            ind = window.eventList.length;
            window.eventList[ind] = obj;
        }
        setTimeout("GoOn(" + ind + ")", iMinSecond);
    }

    //js继续函数
    var GoOn = function (ind) {
        var obj = window.eventList[ind];
        window.eventList[ind] = null;
        if (obj.NextStep) obj.NextStep();
        else obj();
    }

    function testJsStop() {
        Pause(this, 1500);  // 刚开始就延时500
        this.NextStep = function () {
            //Pause(this, 2000);
            //console.log(1);
            //
            parent.Print(index);
        }
    }

    //======================================js暂停结束==========================
 
</script>
</html>
