<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="V5.MetaData.Util" %>
<table class="table table-striped table-main">
    <colgroup>
        <col style="width: 2%;">
        <col style="width: 14%;">
        <col style="width: 16%;">
        <col style="width: 14%;">
        <col style="width: 16%;">
        <col style="width: 16%;">
        <col style="width: 15%;">
        <col style="width: 15%;">
        <col style="width: auto;">
    </colgroup>
    <tbody>
        <tr class="table-title">
            <th class="first"></th>
            <th>订单号</th>
            <th>交易金额（元）</th>
            <th>交易状态</th>
            <th>交易时间</th>
            <th>佣金金额</th>

            <th>收益人账号 </th>
            <th>渠道</th>
            <th class="last"></th>
        </tr>

        <%foreach (V5.MetaData.Order.View.OrderView item in Model.DataSource)
          {%>


        <tr class="" dir="<%=item.Order.OrderNumber %>">
            <td>
                <div class="cell"></div>
            </td>
            <td>
                <div class="cell"><%=item.Order.OrderNumber %></div>
            </td>
            <td>
                <div class="cell"><%=item.Order.Amount.ToString("0.00") %></div>
            </td>
            <td>
                <div class="cell"><%=AppEnum.GetOrderStatusName(item.Order.OrderStatusID, item.Order.PaymentStatusID, item.Order.DeliveryStatusID)%></div>
            </td>
            <td>
                <div class="cell"><%=item.Order.rowCreatedDate %></div>
            </td>
            <td>
                <div class="cell"><%=item.OrderProduct.Select(o => o.CommissionAmount).Sum().ToString("0.00") %></div>
            </td>

            <td>
                <div class="cell"><%=item.DrpCustomerName %></div>
            </td>
            <td>
                <div class="cell">
                    <%=item.ShopName %>
                </div>
            </td>
            <td onclick="SelectedEvents(event)">
                <div class="cell"><i class="icon-arrowdown-gray"></i></div>
            </td>
        </tr>




        <tr style="display: none;" dir="<%=item.Order.OrderNumber  %>" class="tr-detail">
            <td colspan="9">
                <table class="table subtable">
                    <thead>
                        <tr class="subtable-title">
                            <th>商品图片</th>
                            <th>商品名称</th>
                            <th>交易金额（元）</th>
                            <th>佣金比率</th>
                            <th>佣金金额</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%foreach (var orderProduct in item.OrderProduct)
                          {%>

                        <tr>
                            <td>
                                <div class="cell">
                                    <span class="pic50">
                                        <img onmouseover="GetMouseover(event)" src="<%=orderProduct.ProductURL %>"></span>
                                </div>
                            </td>
                            <td><%=orderProduct.ProductName %></td>
                            <td><%=orderProduct.Amount.ToString("0.00") %></td>
                            <td><%=orderProduct.CommissionRate.ToString("0.00") %>%</td>
                            <td><%=orderProduct.CommissionAmount.ToString("0.00") %></td>
                        </tr>


                        <%} %>
                    </tbody>
                </table>
            </td>
        </tr>

        <% } %>
    </tbody>
</table>
<script type="text/javascript">


    //页数
    var CurrentPageIndex = 1;
    //显示多少显示数字条
    var CurrentPageSize = 15;
    //总数量
    var CurrentPageSizeSum = '<%=Model.TotalRecords%>';
    //总数量除以每页显示多少
    var CurrentPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
    var PagesNumber = '<%=Model.PagesNumber%>';
    function GetTallupList(CurrentPageIndex, CurrentPageSize) {
       
        if (CurrentPageSize == "" || CurrentPageSize == undefined) {

            CurrentPageSize = $("#btnPageSize").text();
        }
        CurrentPageSize = CurrentPageSize;
        //点击事件
        CurrentPageIndex = CurrentPageIndex;
        $.ajax({
            async: false,
            type: "Post",
            url: '../../CustomerManage/GetTallupList?groups=' + TallupListQuery.Groups,
            data: { "CurrentPageIndex": CurrentPageIndex, "PageSize": CurrentPageSize, "searchName": TallupListQuery.Query },
            dataType: "html",
            success: function (responseData) {

                $("#Table").html(responseData); //render table 
                //CurrentPageSizeSum = '<%=Model.TotalRecords%>';
                // $(".label-mod #types ul").html(" <li class='current' dir='q1'><a class='c16' href='#'>全部(<%=Model.TotalRecords%> )</a></li>");
                var totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
                $("#turn-ul").pager({ pagenumber: CurrentPageIndex, pagecount: totalPageNumber, buttonClickCallback: GetTallupList });


            }
        });

        //分页显示
        var flag = (CurrentPageIndex * CurrentPageSize) > CurrentPageSizeSum;
        $("#pages").text(CurrentPageSize * (CurrentPageIndex - 1) + 1);

        if (flag) {
            $("#number").text(CurrentPageSizeSum);
        } else {
            $("#number").text(CurrentPageIndex * CurrentPageSize);
        }

        if (flag) {
            return false;
        }

        if (PagesNumber < CurrentPageSize) {
            $("#number").text(PagesNumber);
        } else {
            $("#number").text(CurrentPageIndex * CurrentPageSize);
        }

    };
    $("#sum").text(CurrentPageSizeSum);
    $("#all").text(CurrentPageSizeSum);







</script>
