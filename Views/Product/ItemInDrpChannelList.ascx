<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="V5.MetaData.Product.Model" %>
<div class="mod-table">
    <div class="mod-table-head">
        <div class="con style01">
            <table cellspacing="0" cellpadding="0" border="0" style="min-width: 740px;">
                <colgroup>
                    <col style="width: 20%;">
                    <col style="width: 20%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                    <tr>
                        <th class="x-tab">
                            分销店铺
                        </th>
                        <th class="x-tab">
                            采购规格(种)
                        </th>
                        <th class="x-tab">
                            采购均价
                        </th>
                        <th class="x-tab">
                            采购总额
                        </th>
                        <th class="x-tab">
                            库存数量
                        </th>
                        <th class="x-tab">
                            当前销售价格
                        </th>
                        <th>
                        </th>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="mod-table-main">
        <div class="con style0line" id="Div1">
            <table cellspacing="0" cellpadding="0" border="0" style="min-width: 740px;">
                <colgroup>
                    <col style="width: 20%;">
                    <col style="width: 20%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                    <%
                        if (Model.DataSource != null)
                        {
                            foreach (var itemInDrpChannel in Model.DataSource)
                            { %>
                    <tr>
                        <td>
                            <a style="color: #0066cc;" href="http://shop<%=itemInDrpChannel.ShopID %>.taobao.com"
                                target="_blank">
                                <%=itemInDrpChannel.ShopName%></a>
                        </td>
                        <td>
                            <a style="color: #0066cc;" href="ProductInDrpChannel?productid=<%=itemInDrpChannel.ProductID %>&shopName=<%=itemInDrpChannel.ShopName%>&Customerid=<%=itemInDrpChannel.CustomerID %>&shopID=<%=itemInDrpChannel.ShopID %>&NumIid=<%=itemInDrpChannel.OuterNo %>">
                                <%=itemInDrpChannel.SkuCount%></a>
                        </td>
                        <td>
                            <%if (itemInDrpChannel.Count == 0)
                              { %>
                            0.00
                            <%}
                              else
                              { %>
                            <%=(itemInDrpChannel.Amount / itemInDrpChannel.Count).ToString("0.00")%>
                            <%} %>
                        </td>
                        <td>
                            <%=itemInDrpChannel.Amount.ToString("0.00")%>
                        </td>
                        <td>
                            <%=itemInDrpChannel.Stock%>
                        </td>
                        <td>
                        <%= itemInDrpChannel.CurrentPrice %>
                           <%-- <a href="javascript:void(0)" onclick="GetPrice(this,'<%Response.Write(itemInDrpChannel.OuterNo); %>','<%Response.Write(itemInDrpChannel.SessionKey); %>')" style="color: #0066cc;">查询</a>--%>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <%}
                        }%>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="../../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
<script src="../../Scripts/jquery.pager.js" type="text/javascript"></script>
<script src="../../Scripts/jscommon.js" type="text/javascript"></script>
<script type="text/javascript">

    //页数
    var CurrentPageIndex = 1;
    //显示多少显示数字条
    var CurrentPageSize = 15;
    //总数量
    var CurrentPageSizeSum = '<%=Model.TotalRecords%>';
    //总数量除以每页显示多少，即共有多少页
    var CurrentPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);

    //获取要执行的URL
    var url = '';
    //点击事件

    if (parseInt(CurrentPageSizeSum) > 0) {
        $(".mod-page").css("display", "block");
    } else {
        $(".mod-page").css("display", "none");
    }
    var SelectByGroupClick = function (pageclicknumber) {
        CurrentPageIndex = pageclicknumber;
        var Where = request("productid");
        $.ajax({
            async: false,
            type: "Post",
            url: "../../Product/GetItemInDrpChannelList",
            data: { "CurrentPageIndex": CurrentPageIndex, "Where": Where }, //"Groups": productQuery.Groups,
            dataType: "html",
            success: function (responseData) {

                $("#flexigridDiv").html(responseData); //render table  
                CurrentPageSizeSum = '<%=Model.TotalRecords%>';

                totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
                $(".footer-p-div2").pager({ pagenumber: pageclicknumber, pagecount: CurrentPageNumber, buttonClickCallback: SelectByGroupClick });

            }
        });
    };

   
</script>
