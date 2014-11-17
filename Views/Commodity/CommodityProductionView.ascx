<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script src="../../../Scripts/Js/allselect.js" type="text/javascript"></script>
<div class="mod-table-head">
    <div class="style0list">
        <table>
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 25%;">
                <col style="width: 20%;">
                <col style="width: 20%;">
                <col style="width: 20%;">
                <col style="width: 10%;">
                <col style="width: auto;">
            </colgroup>
            <tr>
                <th>
                    <label>
                        <input type="checkbox" value="" name="" id="ckall" onclick="CheckAll(event)">
                    </label>
                </th>
                <th class="x-tab">
                    产品线名称
                </th>
                <th class="x-tab">
                    经销折扣
                </th>
                <th class="x-tab">
                    代销折扣
                </th>
                <th class="x-tab">
                    建议折扣
                </th>
                <th class="x-tab">
                    操作
                </th>
                <th>
                </th>
            </tr>
        </table>
    </div>
</div>
<div class="mod-table-main">
    <div class="con style0line">
        <table>
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 25%;">
                <col style="width: 20%;">
                <col style="width: 20%;">
                <col style="width: 20%;">
                <col style="width: 10%;">
                <col style="width: auto;">
            </colgroup>
            <%foreach (V5.MetaData.Product.Model.ProductLine productLine in Model.DataSource)
              {%>
            <tr class="tr-Current">
                <td>
                    <div class="cell">
                        <label>
                            <input type="checkbox" value="<%=productLine.ID %>" name="sub" onclick="CheckThis()" />
                        </label>
                        <!--<span class="flag-gray"></span>-->
                    </div>
                </td>
                <td>
                    <div class="cell">
                        <%=productLine.Name %></div>
                </td>
                <td>
                    <div class="cell">
                        <%=productLine.WholeSalePriceRate%>%</div>
                </td>
                <td>
                    <div class="cell">
                        <%=productLine.DistributionPriceRate%>%</div>
                    <td>
                        <div class="cell">
                            <%=productLine.SalesPriceRateMin%>%-<%=productLine.SalesPriceRateMax%>%</div>
                    </td>
                </td>
                <td>
                    <div class="cell">
                        <span class="c07"><a onclick="edit(event')" dir="<%= productLine.ID%>" 
                            class="r15">编辑</a><a href="javascript:void(0)" id="Delete" dir="<%= productLine.ID%>" onclick="Delete(event)">删除</a></span></div>
                </td>
                <td>
                </td>
            </tr>
            <%} %>
        </table>
    </div>
</div>
<script type="text/javascript">

    //页数
    var CurrentPageIndex = 1;
    //显示多少显示数字条
    var CurrentPageSize = 20;

    //总数量
    var CurrentPageSizeSum = '<%=Model.TotalRecords%>';
    //总数量除以每页显示多少
    var CurrentPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);

    if (CurrentPageSizeSum > 0) {
        $(".mod-page").show();
        //        $("#Message").hide();
    }
    else {
        $(".mod-page").hide();
        //        $("#Message").show();
    }
    //获取要执行的URL

    function ProductionView(CurrentPageIndex) {
        //点击事件

        CurrentPageIndex = CurrentPageIndex;

        $.ajax({
            async: false,
            type: "Post",
            url: '../../Commodity/GetBrand',
            data: { "CurrentPageIndex": CurrentPageIndex },
            dataType: "html",
            success: function (responseData) {
                $(".mod-table").html(responseData); //render table 
                //   CurrentPageSizeSum = '<%=Model.TotalRecords%>';
                // $(".label-mod #types ul").html(" <li class='current' dir='q1'><a class='c16' href='#'>全部(<%=Model.TotalRecords%> )</a></li>");
                totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
                $(".turn").pager({ pagenumber: CurrentPageIndex, pagecount: CurrentPageNumber, buttonClickCallback: ProductionView });
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


</script>
