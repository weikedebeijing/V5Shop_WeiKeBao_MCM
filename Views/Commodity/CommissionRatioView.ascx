<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="V5.MetaData.Util" %>

<table class="table table-striped table-main">

    <colgroup>
        <col style="width: 2%;">
        <col style="width: 22%;">
        <col style="width: 15%;">
        <col style="width: 15%;">
        <col style="width: 25%;">
        <col style="width: auto;">
    </colgroup>

    <tbody>
        <tr class="table-title">
            <th class="first">
                <label>
                    <input value="" name="" id="ckall" type="checkbox" onclick="CheckAll(event)"></label>
            </th>
            <th>商品分类
                       
            </th>
            <th>一级佣金比率
                      
            </th>
            <th>二级佣金比率
                      
            </th>
            <th>创建时间
                  
            </th>
            <th>更新时间
                       
            </th>

            <th class="last">操作
            </th>
        </tr>

        <%foreach (V5.MetaData.Product.Model.ProductCategory productCategory in Model.DataSource)
          {%>


        <tr>
            <td>

                <label>
                    <input value="<%=productCategory.ID %>" name="sub" type="checkbox" onclick="CheckThis()">
                    <input type="hidden" value="1354" name="name">
                </label>

            </td>
            <td>
                <div class="cell"><%=productCategory.Name %></div>
            </td>
            <td>
                <div class="cell">
                    <%=productCategory.CommissionRate.ToString("0.00") %>%
                </div>
            </td>
               <td>
                <div class="cell">
                    <%=productCategory.NextCommissionRate.ToString("0.00") %>%
                </div>
            </td>
            <td>
                <div class="cell"><span class="c01-1"><%:productCategory.rowCreatedDate %></span></div>
            </td>
            <td>
                <div class="cell"><%:productCategory.rowModifiedDate %></div>
            </td>

            <td>
                <div class="cell">
                    <div class="bs-docs-example tooltip-demo">
                        <a data-original-title="编辑" data-placement="bottom" dir="<%=productCategory.ID %>" onclick="Update(event,'single', '<%=productCategory.CommissionRate.ToString("0.00") %>#<%=productCategory.NextCommissionRate.ToString("0.00") %>')" data-toggle="tooltip" href="javascript:void(0)"><i class="icon-pen-blue"></i></a>

                    </div>
                </div>
            </td>
        </tr>




        <% } %>
    </tbody>
</table>



<script type="text/javascript">
    //页数
    var CurrentPageIndex = 1;
    //显示多少显示数字条
    var PageSize = 15;
    //总数量
    var CurrentPageSizeSum = '<%=Model.TotalRecords%>';
    //总数量除以每页显示多少
    var CurrentPageNumber = Math.ceil(CurrentPageSizeSum / PageSize);
    var PagesNumber = '<%=Model.PagesNumber%>';
    function GetCommissionRatoView(CurrentPageIndex, PageSize) {
  
        if (PageSize == undefined || PageSize == "") {
            PageSize = $("#btnPageSize").text();
        }
        //点击事件
        CurrentPageIndex = CurrentPageIndex;
        PageSize = PageSize;
        $.ajax({
            async: false,
            type: "Post",
            url: '../../Commodity/GetCommissionRatioList',
            data: { "CurrentPageIndex": CurrentPageIndex, "PageSize": PageSize, "Where": CommissionRatioQuery.Query },
            dataType: "html",
            success: function (responseData) {

                $("#mod-table").html(responseData); //render table 
                $("a[data-toggle=tooltip]").mouseover(function () { $(this).tooltip('show'); });
                //CurrentPageSizeSum = '<%=Model.TotalRecords%>';
                // $(".label-mod #types ul").html(" <li class='current' dir='q1'><a class='c16' href='#'>全部(<%=Model.TotalRecords%> )</a></li>");
                var totalPageNumber = Math.ceil(CurrentPageSizeSum / PageSize);
                $("#turn-ul").pager({ pagenumber: CurrentPageIndex, pagecount: totalPageNumber, buttonClickCallback: GetCommissionRatoView });
                if (CurrentPageSizeSum > 0) {
                    $(".mod-page").show();
                }
                else {
                    $(".mod-page").hide();
                }

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
    $("#all").text(CurrentPageSizeSum);







</script>

