<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="V5.MetaData.Order.Model" %>
<%@ Import Namespace="V5.MetaData.Delivery.Model" %>
<%@ Import Namespace="V5.Service.Order.Repositories" %>
<%@ Import Namespace="V5.MetaData.Util" %>
<% List<LogisticsCompany> logisticsCompanyList = ViewData["LogisticsCompany"] as List<LogisticsCompany>; %>
<script src="../../../Scripts/Js/allselect.js" type="text/javascript"></script>
<script src="../../Scripts/jquery.pager.js" type="text/javascript"></script>
<div class="mod-table-head">
    <div class="con style0list">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 20%;">
                <col style="width: 20%;">
                <col style="width: 20%;">
                <col style="width: 15%;">
                <col style="width: auto;">
            </colgroup>
            <tbody>
                <tr>
                    <th>
                        <label>
                            <input name="" value="" type="checkbox" id="ckall" onclick="CheckAll(event)">
                        </label>
                    </th>
                    <th>订单信息
                    </th>
                    <th>商品清单
                    </th>
                    <th>分销商
                    </th>
                    <th>买家信息
                    </th>
                    <th>物流信息
                    </th>
                    <th>留言备注
                    </th>
                    <th></th>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="mod-table-main">
    <%--<span id="Message"><h1 style=" color:Black; font-size:20px; text-align:center; ">抱歉,没有内容</h1></span>--%>
    <div class="con style0line" style="width: 100%;">
        <table>
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 20%;">
                <col style="width: 20%;">
                <col style="width: 20%;">
                <col style="width: 15%;">
                <col style="width: auto;">
            </colgroup>
            <tbody id="contentForCheck">
                <%foreach (OrderReport order in Model.DataSource)
                  {

                %>
                <%if (order.TagID == 10)
                  {%>
                <tr style="color: #666;" dir="<%=order.TagID%>">
                    <%     }%>
                    <%else
                  { %>
                <tr dir="<%=order.TagID%>" style="color: #333; font-weight: bold">
                    <%   } %>
                    <td>
                        <div class="cell">
                            <label>
                                <input name="sub" value="<%=order.OrderNumber%>" id="ckb_<%:order.ID %>" type="checkbox"
                                    onclick="CheckThis()" />
                            </label>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <a href="javascript:void(0)" linkurl="../OrderForm/OrderDetailed?ID=<%=order.ID %>"
                                onclick="GoToLinkUrl(event)">
                                <%if (order.Type == (int)AppEnum.ChannelType.Taobao)
                                  { 
                                %>
                                <i class="icon-taobao"></i>
                                <%  } %>
                                <%else if (order.Type == (int)AppEnum.ChannelType.DRP_Personal)
                                  {    %>
                                <i class="icon-fenxiao"></i>
                                <%  } %>

                                <%else if (order.Type == (int)AppEnum.ChannelType.WeiXin)
                                  {%>
                                <i class="icon-wechat"></i>
                                <%} %>
                                <%=order.OrderNumber %>
                            </a>
                        </div>
                        <div class="cell">
                            <span>
                                <%=order.rowCreatedDate.ToString("MM-dd  HH:mm") %></span>
                            <%string str = ""; %>
                            <%if (order.OrderStatusID == 9)
                              {

                                  str = "交易关闭";
                              }

                              else if (order.OrderStatusID == 8) { str = "交易成功"; }
                              else { str = ""; }
                      
                      
                            %>
                            <p class="c01-6 float-r">
                                <%=str %>
                            </p>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <span>￥
                                    <%=order.Amount.ToString("0.00")%></span>
                        </div>
                        <div class="cell">
                            <%=order.ProductCount %>种商品 共<%=order.Count %>件
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=order.Distribution %>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=order.Customer%>
                        </div>
                        <div class="cell">
                            <%=order.ReceivingName%>
                            <%=order.ReceivingMobilePhone%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=order.ReceivingAreaText%>
                            <%=order.ReceivingAddress%>
                        </div>
                        <%
                      if (order.ExpressName != "" && order.ParcelNo != "")
                      {
                        %>
                        <div class="cell">
                            <%=order.ExpressName%>：<%=order.ParcelNo%>
                        </div>
                        <%  
                      }
                        %>
                        <%
                      else if (order.ExpressName != "" && order.ParcelNo == "")
                      {
                        %>
                        <div class="cell">
                            <%=order.ExpressName%>
                        </div>
                        <%  
                                }
                        %>
                    </td>
                    <td>
                        <div class="cell">
                            留言：<%=order.ToVoidRemark%>
                        </div>
                        <div class="cell">
                            备注：<%=order.Remark%>
                        </div>
                    </td>
                    <td>
                        <div class="mod-sign">
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <a href="javascript:void(0)" onclick="getSelectView(<%=order.ID %>)" style="color: #06c;">查看</a>
                            <%-- <a href="javascript:void(0)" linkurl="../OrderForm/OrderDetailed?ID=<%=order.ID %>"
                                            onclick="GoToLinkUrl(event)" style="color: #06c;">详情</a>--%>
                        </div>
                        <%-- <div class="cell">--%>
                        <%--  <a href="#" class="c07">标记为解决</a></div>--%>
                    </td>
                    <td></td>
                </tr>
                <%  }
                %>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript">

    //页数
    var OrderPageIndex = 1;
    //显示多少显示数字条
    var CurrentPageSize = 15;
    //总数量
    var CurrentPageSizeSum = '<%=Model.TotalRecords%>';
    //总数量除以每页显示多少
    var CurrentPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
    var PagesNumber = '<%=Model.PagesNumber%>';
    // 全部总数
    $("[lang='QuanBu']").text('<%=ViewData["tempQuanBu"]%>');

    // 直销总数
    $("[lang='ZhiXiao']").text('<%=ViewData["tempZhiXiao"]%>');
    // 分销总数
    $("[lang='FenXiao']").text('<%= ViewData["FenXiao"] %>');

    // 等待发货总数
    $("#tempDFH").text('<%= ViewData["tempDFH"] %>');
    // 问题订单总数
    $("#tempWTDD").text('<%= ViewData["tempWTDD"] %>');
    // 等待付款总数
    $("#tempDDFK").text('<%= ViewData["tempDDFK"] %>');
    // 已发货总数
    $("#tempYFH").text('<%= ViewData["tempYFH"] %>');
    // 退款中总数
    $("#tempTKZ").text('<%= ViewData["tempTKZ"] %>');
    // 交易成功总数
    $("#tempJYCG").text('<%= ViewData["tempJYCG"] %>');
    // 交易关闭总数
    $("#tempJYGB").text('<%= ViewData["tempJYGB"] %>');
    // 历史订单总数
    $("#tempLSDD").text('<%= ViewData["tempLSDD"] %>');

    //今天
    $("#tempToday").text('<%= ViewData["tempToday"] %>');
    //昨天
    $("#tempYesterday").text('<%= ViewData["tempYesterday"] %>');
    //本周
    $("#tempThisWeek").text('<%= ViewData["tempThisWeek"] %>');
    //本月
    $("#tempThisMonth").text('<%= ViewData["tempThisMonth"] %>');
    //前一个月
    $("#tempAMonthAgo").text('<%= ViewData["tempAMonthAgo"] %>');
    //控制分页是否显示
    if (CurrentPageSizeSum > 0) {
        $(".mod-page").show();
        //        $("#Message").hide();
    }
    else {
        $(".mod-page").hide();
        //        $("#Message").show();
    }
    //点击事件
    var DistributorOrderView = function (OrderPageIndex) {
        if (OrderQuery.Groups[0] != "" && OrderQuery.Groups[0] != null && OrderQuery.Groups[1] == "X2" || OrderQuery.Groups[1] == "X1") { url = '../../OrderForm/OrderTableList?Groups=' + OrderQuery.Groups; }

        if (OrderQuery.Groups[0] != "" && OrderQuery.Groups[0] != null && OrderQuery.Groups[1] == "X3") { url = '../../OrderForm/DistributorList?Groups=' + OrderQuery.Groups; }
        OrderPageIndex = OrderPageIndex;
        $.ajax({
            async: false,
            type: "Post",
            url: url,
            data: { "OrderPageIndex": OrderPageIndex, "Where": OrderQuery.Query },
            dataType: "html",

            success: function (responseData) {

                $("#mod-table").html(responseData); //render table  
                // CurrentPageSizeSum = '<%=Model.TotalRecords%>';
                totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
                $(".turn-ul").pager({ pagenumber: OrderPageIndex, pagecount: CurrentPageNumber, buttonClickCallback: DistributorOrderView });


            }
        });
        //分页显示
        var flag = (OrderPageIndex * CurrentPageSize) > CurrentPageSizeSum;

        $("#pages").text(CurrentPageSize * (OrderPageIndex - 1) + 1);

        if (flag) {
            $("#number").text(CurrentPageSizeSum);
        } else {
            $("#number").text(OrderPageIndex * CurrentPageSize);
        }

        if (flag) {
            return false;
        }

        if (PagesNumber < CurrentPageSize) {
            $("#number").text(PagesNumber);
        } else {
            $("#number").text(OrderPageIndex * CurrentPageSize);
        }
    };

    $("#sum").text(CurrentPageSizeSum);
</script>
