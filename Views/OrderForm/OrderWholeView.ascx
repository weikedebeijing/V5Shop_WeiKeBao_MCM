<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="V5.MetaData.Order.Model" %>
<%@ Import Namespace="V5.MetaData.Delivery.Model" %>
<%@ Import Namespace="V5.Service.Order.Repositories" %>
<%@ Import Namespace="V5.MetaData.Util" %>
<% List<LogisticsCompany> logisticsCompanyList = ViewData["LogisticsCompany"] as List<LogisticsCompany>; %>
<%=Combres.WebExtensions.CombresLink("PagerJs")%>
<div class="mod-table-head">
    <div class="con style0list">
        <table>
            <colgroup>
                <col style="width: 3%;">
                <col style="width: 17%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 25%;">
                <col style="width: 12%;">
                <col style="width: 8%;">
                <col style="width: 10%;">
                <col style="width: auto;">
            </colgroup>
            <tbody>
                <tr>
                    <th>
                        <label>
                            <input name="" value="" type="checkbox" id="ckall" onclick="CheckAll(event)"></label>
                    </th>
                    <th>订单信息
                    </th>
                    <th>商品清单
                    </th>
                    <th>买家信息
                    </th>
                    <th>物流信息
                    </th>
                    <th>订单来源
                    </th>
                    <th>留言备注
                    </th>
                    <th>操作
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
                <col style="width: 3%;">
                <col style="width: 17%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 25%;">
                <col style="width: 12%;">
                <col style="width: 8%;">
                <col style="width: 10%;">
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
                <tr dir="<%=order.TagID%>">
                    <%   } %>
                    <td>
                        <div class="cell">
                            <label>
                                <input name="sub" payment="<%=order.Payment %>" value="<%=order.OrderNumber%>" id="ckb_<%:order.ID %>" type="checkbox"
                                    onclick="CheckThis()" paymentstatus="<%=order.PaymentStatusID %>" orderprice="<%=order.Amount.ToString("0.00") %>" />
                            </label>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%--<a href="javascript:void(0)" linkurl="../OrderForm/OrderDetailed?ID=<%=order.ID %>"
                                    onclick="GoToLinkUrl(event)">--%>
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
                            <span class="float-l r15">
                                <%=order.rowCreatedDate.ToString("MM-dd  HH:mm") %>
                            </span>
                            <%string str = ""; %>
                            <%if (order.OrderStatusID == 9)
                              {
                                  str = "交易关闭";
                              }

                              else if (order.OrderStatusID == 8)
                              {
                                  str = "交易成功";
                              }
                              else
                              {
                                  str = "";
                              }
                            %>
                            <p class="c01-6 float-l">
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
                        <% if (order.Source == "C001")
                           { %>
                        <div class="cell">
                            <%=order.NickName%>
                        </div>
                        <%} %>
                        <%else
                           {    %>
                        <div class="cell">
                            <%=order.Customer%>
                        </div>
                        <%  } %>
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
                            <%=order.SourceName%>
                        </div>
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
                        <div class="cell">
                            <div class="mod-operate">
                                <div class="con style0editdel">
                                    <a href="javascript:void(0)" onclick="getSelectView(<%=order.ID %>)" id="view01"
                                        class="view">查看</a>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="mod-sign">
                            <%--<div class="con style02 hidden">
                                <a class="a-btn" href="#"><span class="red">标记</span><i></i></a>
                                <ul class="w130" style="top: 20px;">
                                    <li>
                                        <input name="sign" id="sign01" type="radio">
                                        <label for="sign01">
                                            <span class="red"></span>
                                            <p>
                                                红色订单</p>
                                        </label>
                                    </li>
                                    <li>
                                        <input name="sign" id="sign02" type="radio">
                                        <label for="sign02">
                                            <span class="blue"></span>
                                            <p>
                                                蓝色订单</p>
                                        </label>
                                    </li>
                                    <li>
                                        <input name="sign" id="sign03" type="radio">
                                        <label for="sign03">
                                            <span class="green"></span>
                                            <p>
                                                绿色订单</p>
                                        </label>
                                    </li>
                                    <li><a href="#">取消标签</a></li>
                                    <li class="line-none"><a href="#">新建标签并标记</a></li>
                                    <li class="line-none"><a href="#">管理标签</a></li>
                                </ul>
                            </div>--%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%--<a href="javascript:void(0)" linkurl="../OrderForm/OrderDetailed?ID=<%=order.ID %>"
                                            onclick="GoToLinkUrl(event)" style="color: #06c;">查看</a>--%>
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
<%--        <%if (Model.TotalRecords > 0)
          { %>
        <%if (Model.TotalRecords >= 1)
          {%>
        <div class="mod-page">
            <div class="style01">
                <div class="mod-footer-page">
                    <div>
                        每页最多显示：15条</div>
                    <div class="footer-p-div2 tac">
                    </div>
                </div>
            </div>
        </div>
        <%  }%>
        <%    } %>--%>
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
    $("#tempDFH").parent().attr('title', '等待发货（' + $("#tempDFH").text() + '）');
    // 问题订单总数
    $("#tempWTDD").text('<%= ViewData["tempWTDD"] %>');
    $("#tempWTDD").parent().attr('title', '问题订单（' + $("#tempWTDD").text() + '）');
    // 等待付款总数
    $("#tempDDFK").text('<%= ViewData["tempDDFK"] %>');
    $("#tempDDFK").parent().attr('title', '等待付款(' + $("#tempDDFK").text() + ')');
    // 已发货总数
    $("#tempYFH").text('<%= ViewData["tempYFH"] %>');
    $("#tempYFH").parent().attr('title', '已发货(' + $("#tempYFH").text() + ')');
    // 退款中总数
    $("#tempTKZ").text('<%= ViewData["tempTKZ"] %>');
    $("#tempTKZ").parent().attr('title', '退款中(' + $("#tempTKZ").text() + ')');
    // 交易成功总数
    $("#tempJYCG").text('<%= ViewData["tempJYCG"] %>');
    $("#tempJYCG").parent().attr('title', '交易成功(' + $("#tempJYCG").text() + ')');
    // 交易关闭总数
    $("#tempJYGB").text('<%= ViewData["tempJYGB"] %>');
    $("#tempJYGB").parent().attr('title', '交易关闭(' + $("#tempJYGB").text() + ')');
    // 历史订单总数
    $("#tempLSDD").text('<%= ViewData["tempLSDD"] %>');
    $("#tempLSDD").parent().attr('title', '历史订单(' + $("#tempLSDD").text() + ')');

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
    var OrderView = function (OrderPageIndex) {

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
                totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
                $(".turn-ul").pager({ pagenumber: OrderPageIndex, pagecount: CurrentPageNumber, buttonClickCallback: OrderView });
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
