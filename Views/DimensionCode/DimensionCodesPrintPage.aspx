<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=wechat"></script>
    <script src="../../Scripts/publicPlug-in/linkUrlJs.js" type="text/javascript"></script>
    <style type="text/css" media="print">
        .extraElement
        {
            display: none;
        }
        
        .flag
        {
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <body class="print-barcode">
        <!--title begin-->
        <div class="mod-title t10">
            <div class="con style0h1-02">
                <a class="a-btn float-l" title="返回" onclick="GoToLinkUrl(event) "><i class="icon-back"
                    linkurl="../../Product/index"></i></a>
                <h1 class="spanTitle">
                    批量打印</h1>
            </div>
        </div>
        <!--title end-->
        <!--list begin-->
        <div class="barcodeprint t20">
            <%var productInfos = (List<V5.App.BMC.UI.ViewModels.WeiXin.ProductInfo>)ViewData["ProductInfos"]; %>
            <%var specResults = (List<V5.MetaData.Product.Messaging.SpecResult>)ViewData["specResults"]; %>
            <!--01 begin-->
            <%foreach (var productInfo in productInfos)
              { %>
            <div class="left-pic">
                <ul class="in-ul">
                    <li class="in-li">
                        <input name="" type="checkbox" class="flag" value="" onclick="javascript:checkRowAll(event);"
                            checked="" />
                    </li>
                    <li class="in-li w120">
                        <div class="in-box">
                            <img src='/<%:productInfo.ImgUrl %>' height="84" width="84" /></div>
                        <p class="in-name">
                            <%:productInfo.ProductName%></p>
                    </li>
                </ul>
            </div>
            <div class="right-barcode">
                <ul class="qr-ul">
                    <%
                        V5.Service.Product.Services.Interfaces.IProductDetailService productDetailService = new V5.Service.Product.Services.ProductDetailService();

                        var productDetailInfos = productDetailService.Filter(x => x.ProductID == productInfo.ProductID);
                    %>
                    <%foreach (var productDetailInfo in productDetailInfos)
                      {%>
                    <%
                        var specResultDetails = (from x in specResults
                                                 where x.ProductDetailID == productDetailInfo.ID
                                                 select x).ToList();
                    %>
                    <li class="qr-li">
                        <div class="qrselect">
                            <input class="t10" name="" type="checkbox" value="" checked=""></div>
                        <div class="qrcode">
                            <div class="qr-box">
                                <%var siteUrl = ViewData["siteUrl"]; %>
                                <img src="/DimensionCode/GetDimensionCodes?productDetailID=<%:productDetailInfo.ID %>&siteUrl=<%:siteUrl %>"
                                    width="72" height="72">
                                <img src='<%:ViewData["imgUrl"] %>' width="15px" height="15px" style="position: relative;
                                    top: -27px; left: -54px;" />
                            </div>
                            <%--<div class="qr-box">
                                <%var siteUrl = ViewData["siteUrl"]; %>
                                <img src="/DimensionCode/GetDimensionCodes?productDetailID=<%:productDetailInfo.ID %>&siteUrl=<%:siteUrl %>"
                                    width="72" height="72" />
                            </div>--%>
                            <p class="qr-name">
                                <%:productInfo.ProductName%></p>
                            <%foreach (var specResultDetail in specResultDetails)
                              { %>
                            <p class="qr-spec">
                                <%:specResultDetail.SpecName%>：<%:specResultDetail.SpecValue%></p>
                            <%} %>
                        </div>
                    </li>
                    <%} %>
                </ul>
            </div>
            <div class="barcodeprint-list">
            </div>
            <%} %>
        </div>
        <!--list end-->
        <!--btn begin-->
        <div class="t20 b20 l200">
            <button class="submit01" onclick="javascript:printDimensionCode();">
                打印</button>
        </div>
        <!--btn end-->
    </body>
    <script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/imageCommon.js" type="text/javascript"></script>
    <script type="text/javascript">
        /*
        进来全选
        */

        // 打印二维码
        var printDimensionCode = function () {
            // 没有选中的就隐藏掉
            var checkBoxs = $("input[type=checkbox]:not(.flag)");

            for (var i = 0; i < checkBoxs.length; i++) {
                if ($(checkBoxs[i]).attr("checked") != "checked") {
                    $(checkBoxs[i]).parents("li").addClass('extraElement');
                } else {
                    $(checkBoxs[i]).parents("li").removeClass('extraElement');
                }
            }
            window.print();
        };

        // 重置打印选中
        var restPrintCheck = function () {
            var checkBoxs = $("input[type=checkbox]").attr("checked", "checked").removeClass("extraElement");
            successTip("重置成功！");
        };

        // 每行全选
        var checkRowAll = function (event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var checkAllState = $(eventSrc).attr("checked");
            if (checkAllState == "checked") {
                $(eventSrc).parents("div[class=left-pic]").next("div").find("input[type=checkbox]").attr("checked", "checked");
            } else {
                $(eventSrc).parents("div[class=left-pic]").next("div").find("input[type=checkbox]").attr("checked", false);
            };
        };


        var successTip = function (msg) {
            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
            $("#operateTip").html(msg).change();
        };
    </script>
</asp:Content>
