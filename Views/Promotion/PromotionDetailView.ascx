<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="V5.MetaData.Util" %>
<% var grade = Model.Grade; %>
<% var Opened = Model.Opened; %>
<% var promotion = Model.Promotion; %>
<% var PromotionItemReports = Model.PromotionItemList; %>
<%--详情 Start--%>
<%
    var openedTitle = "";
    if (null != Opened)
    {
        openedTitle = Opened.Title;
    }

    var gradeName = "";
    if (null != grade)
    {
        gradeName = grade.Name;
    }
            
%>
<%if (null != promotion)
  {%>
<div class="mod-table-main">
    <div class="con style03">
        <table style="width: 100%;">
            <colgroup>
                <col style="width: 15%;">
                <col style="width: 35%;">
                <col style="width: 15%;">
                <col style="width: 35%;">
            </colgroup>
            <tbody id="userInfoDetailFlag">
                <tr>
                    <%string str = string.Empty; %>
                    <%string title = string.Empty; %>
                    <%string Name = string.Empty; %>
                    <% if (promotion.SaleType == (int)AppEnum.ChannelType.WeiXin)
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
                    <td class="td_bg">
                        活动对象
                    </td>
                    <td>
                        <%=str%><%=title %><%=Name%>
                    </td>
                    <td class="td_bg">
                        活动名称
                    </td>
                    <td>
                        <%:promotion.Name %>
                    </td>
                </tr>
                <tr>
                    <td class="td_bg">
                        活动时间
                    </td>
                    <td>
                        <%:promotion.DateStart %>到<%:promotion.DateEnd %>
                    </td>
                    <td class="td_bg">
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
                </tr>
                <tr>
                    <td class="td_bg">
                        促销方式
                    </td>
                    <td>
                        <%if (promotion.Type == "C")
                          {
                              str = "打折";
                          }%>
                        <% else
                            {
                                str = "减现金";
                            } %>
                        <%:str %>
                    </td>
                    <td class="td_bg">
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
                </tr>
            </tbody>
        </table>
    </div>
</div>
<br />
<%--详情 End--%>
<!--列表 Start-->
<%-- 此处通过部分视图返回“打折列表”--%>
<%--部分商品 并且是打折的--%>
<% if (promotion.ItemScope == "P" && promotion.Type == "C")
   {%>
<div class="mod-table">
    <div class="mod-table-head">
        <div class="con style0list-bg">
            <table>
                <colgroup>
                    <col style="width: 17%;">
                    <col style="width: 17%;">
                    <col style="width: 17%;">
                    <col style="width: 17%;">
                    <col style="width: 17%;">
                    <col style="width: auto;">
                </colgroup>
                <tr>
                    <th  >
                        商品名称
                    </th>
                    <th  >
                        原价
                    </th>
                    <th  >
                        折扣(0~100)
                    </th>
                    <th  >
                        优惠价
                    </th>
                    <th  >
                        商家编码
                    </th>
                    <th  >
                        库存
                    </th>
                </tr>
            </table>
        </div>
    </div>
    <div class="mod-table-main">
        <div class="con style0dotted">
            <%--此处通过部分视图返回打折列表--%>
            <table>
                <colgroup>
                    <col style="width: 17%;">
                    <col style="width: 17%;">
                    <col style="width: 17%;">
                    <col style="width: 17%;">
                    <col style="width: 17%;">
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
                            <%if (null != PromotionItemReport.OuterCode)
                              { %>
                            <%:PromotionItemReport.OuterCode%>
                            <%} %>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%:PromotionItemReport.Stock%></div>
                    </td>
                </tr>
                <%} %>
            </table>
        </div>
    </div>
</div>
<%} %>
<!--列表 End-->
<!--列表 Start-->
<%-- 此处通过部分视图返回“减价列表”--%>
<% if (promotion.ItemScope == "P" && promotion.Type == "D")
   {%>
<div class="mod-table">
    <div class="mod-table-head">
        <div class="con style0list-bg">
            <table>
                <colgroup>
                    <col style="width: 17%;">
                    <col style="width: 17%;">
                    <col style="width: 17%;">
                    <col style="width: 17%;">
                    <col style="width: 17%;">
                    <col style="width: auto;">
                </colgroup>
                <tr>
                    <th >
                        商品名称
                    </th>
                    <th  >
                        原价
                    </th>
                    <th  >
                        减现金
                    </th>
                    <th  >
                        优惠价
                    </th>
                    <th  >
                        商家编码
                    </th>
                    <th  >
                        库存
                    </th>
                </tr>
            </table>
        </div>
    </div>
    <div class="mod-table-main">
        <div class="con style0dotted">
            <table>
                <colgroup>
                    <col style="width: 17%;">
                    <col style="width: 17%;">
                    <col style="width: 17%;">
                    <col style="width: 17%;">
                    <col style="width: 17%;">
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
                            <%if (null != PromotionItemReport.OuterCode)
                              { %>
                            <%:PromotionItemReport.OuterCode%>
                            <%} %>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%:PromotionItemReport.Stock%></div>
                    </td>
                </tr>
                <%} %>
            </table>
        </div>
    </div>
</div>
<%} %>
<%} %>
<script type="text/javascript">
    // 只要调用这个方法 数据重新绑定到model上
    var GetPromotionDetailView = function (PromotionID) {
        $.ajax({
            url: "/Promotion/GetPromotionDetail",
            data: { "PromotionID": PromotionID },
            type: "post",
            dataType: "html",
            async: false,
            success: function (responseHtml) { // 返回的是html页面
                $("#promotionDetailFlag").html(responseHtml);
            }
        });
    }
</script>
