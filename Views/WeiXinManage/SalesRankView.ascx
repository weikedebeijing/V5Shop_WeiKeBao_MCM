<%@ Control Language="C#"  Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>


    <table class="table table-hover" id="tableSalesRank">
        
              <thead>
                <tr>
                  <th>商品名称</th>
                  <th>商家编码</th>
                  <th><a href="javascript:void(0);"  class="sequence">销售价<i class="icon-arrowUp-back"></i></a></th>
                  <th><a href="javascript:void(0);"  class="sequence">销量<i class="icon-arrowUp-back"></i></a></th>
                  <th><a href="javascript:void(0);"  class="sequence">销售额<i class="icon-arrowUp-back"></i></a></th>
                  <th><a href="javascript:void(0);"  class="sequence">上架时间<i class="icon-arrowUp-back"></i></a></th>
                </tr>                               
              </thead>
              <tbody>
                <% 
                    List<V5.MetaData.Order.Model.OrderReportProduct> dt = null;
                    dt = Model.DataSource;
                    foreach (V5.MetaData.Order.Model.OrderReportProduct items in dt)
                    { 
                        var Salecount=items.Count;
                        var SalePrice = items.SalesPrice;
                        %>
                <tr>
                  <td><div class="cell"><%=items.Name %></div></td>
                  <td><div class="cell"><%=items.OuterCode.ToString()=="0"?"":items.OuterCode.ToString() %></div></td>
                  <td><div class="cell"><%=items.SalesPrice %></div></td>
                  <td><div class="cell"><%=items.Count %></div></td>
                  <td><div class="cell"><%=items.SalesAmount.ToString("0.00") %></div></td>
                  <td><div class="cell"><%=items.ListTime.ToString("yyyy-MM-dd")=="1900-01-01"?"":items.ListTime.ToString("yyyy-MM-dd") %></div></td>
                </tr>
                <%} %>
              </tbody>
            </table>
  <!--list end-->
    <!--table end-->
    <!--page begin-->
    
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
    function GetSalesRankView(CurrentPageIndex, PageSize) {
        if (PageSize == undefined || PageSize == "") {
            PageSize = $("#ddlPageCount").text();
        }
        //点击事件
        CurrentPageIndex = CurrentPageIndex;
        PageSize = PageSize;
        $.ajax({
            url: "../../WeiXinManage/GetOrderReportList",
            data: { "PageIndex": CurrentPageIndex, "PageCount": PageSize, "query": query.Where, "SortColumn": query.SortColumn, "Direction": query.Direction },
            dataType: "html",
            type: "post",
            async:false,
            success: function (responseData) {
                $(".salesRanktable").html(responseData);
                var totalPageNumber = Math.ceil(CurrentPageSizeSum / PageSize);
                $("#turn-ul").pager({ pagenumber: CurrentPageIndex, pagecount: totalPageNumber, buttonClickCallback: GetSalesRankView });
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