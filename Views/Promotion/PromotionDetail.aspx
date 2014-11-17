<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <body>
        <%
            var promotion = (V5.MetaData.Customer.Model.Promotion)ViewData["promotion"];

            var openedTitle = string.Empty;
            if (ViewData["opened"] != null)
            {
                var opened = (V5.MetaData.Market.Model.Opened)ViewData["opened"];
                openedTitle = opened.Title;
            }
            var gradeName = string.Empty;
            if (ViewData["grade"] != null)
            {
                var grade = (V5.MetaData.Customer.Model.Grade)ViewData["grade"];
                gradeName = grade.Name;
            }

            var PromotionItemReports = (List<V5.MetaData.Customer.Report.PromotionItemReport>)ViewData["promotionItemReports"];
            
        %>
        <div class="mod-form">
            <div class="mod-title">
                <!--title begin-->
                <div class="con style0h1">
                    <a href="/Promotion/PromotionList?MenuCode=C310" title="返回" class="a-btn float-l"><i
                        class="icon-back t6"></i></a>
                    <h1 class="spanTitle">
                        查看详情</h1>
                </div>
                <!--title end-->
            </div>
            <%--详情 Start--%>
            <div class="mod-box">
                <div class="con style02">
                    <table class="c01-1">
                        <col class="w78" />
                        <col class="w310" />
                        <col class="w78" />
                        <col class="w310" />
                        <col style="width: auto;" />
                        <tr>
                            <%string str = string.Empty; %>
                            <%string title = string.Empty; %>
                            <%string Name = string.Empty; %>
                            <% if (promotion.SaleType == "A")
                               {
                                   str = "零售";
                               }
                            %>
                            <% else if (promotion.SaleType == "B")
                                {
                                    str = "分销";
                                }%>
                            <%else
                                {
                                    str = "所有";

                                } %>
                            <%if (!string.IsNullOrEmpty(openedTitle))
                              {
                                  title = openedTitle;

                              }%>
                            <%if (!string.IsNullOrEmpty(gradeName))
                              {

                                  Name = gradeName;
                              } %>
                            <td class="fb">
                                活动对象
                            </td>
                            <td>
                                <%=str%><%=title %><%=Name%>
                            </td>
                            <td class="fb">
                                活动名称
                            </td>
                            <td>
                                <%:promotion.Name %>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="fb">
                                活动时间
                            </td>
                            <td>
                                <%:promotion.DateStart %>到<%:promotion.DateEnd %>
                            </td>
                            <td class="fb">
                                活动商品
                            </td>
                            <td>
                                <%if (promotion.ItemScope == "A")
                                  {
                                      str = "所有商品";
                                  }%>
                                <%  else
                                    {
                                        str = "部分商品";
                                    }%>
                                <%=str%>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="fb">
                                促销方式
                            </td>
                            <td>
                                <%if (promotion.Type == "D")
                                  {
                                      str = "打折";
                                  }%>
                                <% else
                                    {
                                        str = "减现金";
                                    } %>
                                <%:str %>
                            </td>
                            <td class="fb">
                                每件商品
                            </td>
                            <td>
                                <%if (promotion.Discount > 0)
                                  {
                                      str = "每件商品" + promotion.Discount + " 折(0~100)";
                                  }%>
                                <%else if (promotion.Reduction > 0)
                                    {
                                        str = "每件商品减 " + promotion.Reduction;
                                    }%>
                                <%else
                                    {
                                        str = "参考下面列表";
                                    } %>
                                <%:str %>
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <%--详情 End--%>
            <!--列表 Start-->
            <div class="mod-table">
                <div id="DiscountList">
                    <%-- 此处通过部分视图返回“打折列表”--%>
                    <%--部分商品 并且是打折的--%>
                    <% if (promotion.ItemScope == "P" && promotion.Type == "D")
                       {%>
                    <div class="mod-table-head">
                        <div class="con style01" style="width: 99%">
                            <table cellspacing="0" cellpadding="0" border="0" style="min-width: 770px;">
                                <colgroup>
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: auto;">
                                </colgroup>
                                <tr>
                                    <th class="x-tab">
                                        商品名称
                                    </th>
                                    <th class="x-tab">
                                        <%--<i class="icon-resize"></i>--%>原价
                                    </th>
                                    <th class="x-tab">
                                        <%--<i class="icon-resize"></i>--%>折扣(0~100)
                                    </th>
                                    <th class="x-tab">
                                        <%--<i class="icon-resize"></i>--%>优惠价
                                    </th>
                                    <th class="x-tab">
                                        <%--<i class="icon-resize"></i>--%>商家编码
                                    </th>
                                    <th class="x-tab">
                                        <%--<i class="icon-resize"></i>--%>库存
                                    </th>
                                    <th class="x-tab">
                                        <%--<i class="icon-resize"></i>操作--%>
                                    </th>
                                    <th>
                                    </th>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="mod-table-main">
                        <div class="con style01" style="height: auto">
                            <%--此处通过部分视图返回打折列表--%>
                            <table cellspacing="0" cellpadding="5" border="0" id="DiscountContent" style="min-width: 770px;">
                                <colgroup>
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: auto;">
                                </colgroup>
                                <% foreach (var PromotionItemReport in PromotionItemReports)
                                   {%>
                                <tr class="tr-Current">
                                    <td>
                                        <div class="cell">
                                            <% if (string.IsNullOrEmpty(PromotionItemReport.Name))
                                               { %>
                                            <span style="color: Red;">(商品已被删除)</span>
                                            <%}
                                               else
                                               {%>
                                            <%:PromotionItemReport.Name%></div>
                                        <%} %>
                                    </td>
                                    <td>
                                        <div class="cell" name="SalesPrice">
                                            <%:PromotionItemReport.OriginalPrice%></div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            <%:PromotionItemReport.Discount %>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="cell" name="CurrentPrice">
                                            <% if (PromotionItemReport.OriginalPrice > 0 && PromotionItemReport.Discount > 0)
                                               {%>
                                            <%:PromotionItemReport.OriginalPrice * (PromotionItemReport.Discount/100)%>
                                            <%} %>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            <%:PromotionItemReport.OuterCode%></div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            <%:PromotionItemReport.Stock%></div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            <%-- <span class="c07"><a href="#" onclick="DeleteRow(event);">删除</a> </span>--%>
                                        </div>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <%} %>
                            </table>
                            <input type="hidden" id="sendDiscountDatas" name="sendDiscountDatas" />
                            <input type="hidden" id="isDiscountValidate" name="isDiscountValidate" />
                            <%--<input type="button" id="Part-DiscountTest" value="test" onclick="javascript:btnDiscountConfirm();" />--%>
                        </div>
                    </div>
                    <%} %>
                </div>
            </div>
        </div>
        <!--列表 End-->
        <!--列表 Start-->
        <div class="mod-customer-cx">
            <div class="mod-table">
                <div id="ReductionList">
                    <%-- 此处通过部分视图返回“减价列表”--%>
                    <% if (promotion.ItemScope == "P" && promotion.Type == "C")
                       {%>
                    <div class="mod-table-head">
                        <div class="con style01" style="width: 99%">
                            <table cellspacing="0" cellpadding="0" border="0" style="min-width: 770px;">
                                <colgroup>
                                    <%--<col style="width: 50px;">--%>
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: auto;">
                                </colgroup>
                                <tr>
                                    <th class="x-tab">
                                        商品名称
                                    </th>
                                    <th class="x-tab">
                                        <%--<i class="icon-resize"></i>--%>原价
                                    </th>
                                    <th class="x-tab">
                                        <%--<i class="icon-resize"></i>--%>减现金
                                    </th>
                                    <th class="x-tab">
                                        <%--<i class="icon-resize"></i>--%>优惠价
                                    </th>
                                    <th class="x-tab">
                                        <%--<i class="icon-resize"></i>--%>商家编码
                                    </th>
                                    <th class="x-tab">
                                        <%--<i class="icon-resize"></i>--%>库存
                                    </th>
                                    <th class="x-tab">
                                        <%-- <i class="icon-resize"></i>操作--%>
                                    </th>
                                    <th>
                                    </th>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="mod-table-main">
                        <div class="con style01" style="height: auto">
                            <table cellspacing="0" cellpadding="5" border="0" id="ReductionContent" style="min-width: 770px;">
                                <colgroup>
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: 120px;">
                                    <col style="width: auto;">
                                </colgroup>
                                <% foreach (var PromotionItemReport in PromotionItemReports)
                                   {%>
                                <tr class="tr-Current" id="str_<%:PromotionItemReport.ID %>">
                                    <td>
                                        <div class="cell">
                                            <% if (string.IsNullOrEmpty(PromotionItemReport.Name))
                                               { %>
                                            <span style="color: Red;">商品已被删除</span>
                                            <%}
                                               else
                                               {%>
                                            <%:PromotionItemReport.Name%></div>
                                        <%} %>
                                    </td>
                                    <td>
                                        <div class="cell" name="SalesPrice">
                                            <%:PromotionItemReport.OriginalPrice%></div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            <%:PromotionItemReport.Reduction %>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="cell" name="CurrentPrice">
                                            <%if (PromotionItemReport.OriginalPrice > 0 && PromotionItemReport.Reduction > 0)
                                              { %>
                                            <%:PromotionItemReport.OriginalPrice-PromotionItemReport.Reduction%>
                                            <%} %>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            <%:PromotionItemReport.OuterCode%></div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            <%:PromotionItemReport.Stock%></div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            <%-- <span class="c07"><a href="#" onclick="DeleteRow(event);">删除</a> </span>--%>
                                        </div>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <%} %>
                            </table>
                        </div>
                    </div>
                    <%} %>
                </div>
            </div>
        </div>
    </body>
</asp:Content>
