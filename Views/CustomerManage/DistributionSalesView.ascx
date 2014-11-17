<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<!--list begin-->

    <table class="table table-hover" id="tableDistrbution">
        <thead>
            <tr>
                <th>分销商店铺名称</th>
                <th>分销商账号</th>
                <th><a href="javascript:void(0);" class="sequence">销售额<i class="icon-arrowUp-back"></i></a></th>
                <th><a href="javascript:void(0);" class="sequence">销量<i class="icon-arrowUp-back"></i></a></th>
                <th><a href="javascript:void(0);" class="sequence">订单数<i class="icon-arrowUp-back"></i></a></th>
                <th><a href="javascript:void(0);" class="sequence">客单价<i class="icon-arrowUp-back"></i></a></th>
                <th><a href="javascript:void(0);" class="sequence">成交用户数<i class="icon-arrowUp-back"></i></a></th>
            </tr>
        </thead>
        <tbody>
            <% 
                //List<V5.MetaData.Customer.Model.DistributionSalesReport> DistriReList = Model.DataSource as List<V5.MetaData.Customer.Model.DistributionSalesReport>;
                foreach (var item in Model.DataSource)
                {
            %>
            <tr>
                <td><%=item.Title %></td>
                <td><%=item.LoginName %></td>
                <td>￥<%=item.Amount.ToString("0.00") %></td>
                <td><%=item.Count %></td>
                <td><%=item.OrderSum %></td>
                <td>￥<%=item.UserPrice.ToString("0.00") %></td>
                <td><%=item.UserCount %></td>
            </tr>
            <%} %>
        </tbody>
    </table>
<!--list end-->


<script>
    //页数
    var CurrentPageIndex = 1;
    //显示多少显示数字条
    var PageSize = 15;
    //总数量
    var CurrentPageSizeSum = '<%=Model.TotalRecords%>';
    //总数量除以每页显示多少
    var CurrentPageNumber = Math.ceil(CurrentPageSizeSum / PageSize);
    var PagesNumber = '<%=Model.PagesNumber%>';
    function GetSalesTendencyView(CurrentPageIndex, PageSize) {
        if (PageSize == undefined || PageSize == "") {
            PageSize = $("#ddlPageCount").text();
        }
        //点击事件
        CurrentPageIndex = CurrentPageIndex;
        PageSize = PageSize;
        $.ajax({
            url: "../../CustomerManage/ShowDistriSaleList",
            data: { "PageIndex": CurrentPageIndex, "PageCount": PageSize, "Search": query.Where, "SortName": query.SortColumn, "Direction": query.Direction },
            dataType: "html",
            type: "post",
            async:false,
            success: function (responseData) {
                $(".salesRanktable").html(responseData);
                var totalPageNumber = Math.ceil(CurrentPageSizeSum / PageSize);
                $("#turn-ul").pager({ pagenumber: CurrentPageIndex, pagecount: totalPageNumber, buttonClickCallback: GetSalesTendencyView });
                ChangeSeqenceClass(query.SortColumn, query.Direction);
            }
        });

        //分页显示
        var flag = (CurrentPageIndex * PageSize) > CurrentPageSizeSum;
        $("#pages").text(PageSize * (CurrentPageIndex - 1) + 1);

        if (flag) {
            $("#number").text(CurrentPageSizeSum);
        } else {
            $("#number").text(CurrentPageIndex * PageSize);
        }

        if (flag) {
            return false;
        }

        if (PagesNumber < PageSize) {
            $("#number").text(PagesNumber);
        } else {
            $("#number").text(CurrentPageIndex * PageSize);
        }
    };
    $("#sum").text(CurrentPageSizeSum);




</script>
