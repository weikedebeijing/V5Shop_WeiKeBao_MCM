<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%=Combres.WebExtensions.CombresLink("PagerJs")%>
<!--List Start-->
<div class="mod-table-head">
    <div class="con style0list">
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 13%;">
                <col style="width: 13%;">
                <col style="width: 13%;">
                <col style="width: 11%;">
                <col style="width: 10%;">
                <col style="width: 10%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: auto;">
            </colgroup>
            <tbody>
                 <tr>
                    <th>
                        <label>
                            <input type="checkbox" value="" name="ckall" id="ckall" onclick="CheckAll(event)"></label>
                    </th>
                    <th class="x-tab">
                        <div class="iconbg-arrow up">
                            模板名称</div>
                    </th>
                    <th class="x-tab">
                        <div class="iconbg-arrow up">
                            物流</div>
                    </th>
                    <th class="x-tab">
                        <div class="iconbg-arrow up">
                            运送到</div>
                    </th>
                    <th class="x-tab">
                        <div class="iconbg-arrow up">
                            首单位</div>
                    </th>
                    <th class="x-tab">
                        <div class="iconbg-arrow up">
                            首费(元)</div>
                    </th>
                    <th class="x-tab">
                        <div class="iconbg-arrow up">
                            续单位</div>
                    </th>
                    <th class="x-tab">
                        <div class="iconbg-arrow up">
                            续费(元)</div>
                    </th>
                    <th class="x-tab">
                        <div class="iconbg-arrow up">
                            操作</div>
                    </th>
                    <th>
                    </th>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<div class="mod-table-main">
    <div style="width: 100%" class="con style0line">
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 13%;">
                <col style="width: 13%;">
                <col style="width: 13%;">
                <col style="width: 11%;">
                <col style="width: 10%;">
                <col style="width: 10%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: auto;">
            </colgroup>
            <tbody>
                <%
                 
                    foreach (V5.MetaData.Delivery.Report.DeliveryReport deliveryReport in Model.DataSource)
                    {
                            
                %>
                <tr class="tr-Current">
                    <td>
                        <div class="cell">
                            <label>
                                <input type="checkbox" value="<%=deliveryReport.ID %>" name="sub" onclick="CheckThis()"></label></div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=deliveryReport.Name %></div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=deliveryReport.ExpressName%></div>
                    </td>
                    <td>
                        <div class="cell">
                            <%= deliveryReport.Area%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%= deliveryReport.Valuation%>=<%=deliveryReport.StartStandard%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=deliveryReport.StartFee%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%= deliveryReport.Valuation%>=<%=deliveryReport.AddStandard%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=deliveryReport.AddFee%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <div class="mod-operate">
                                <div class="con style0editdel">
                                    <a class="edit"  href="javascript:void(0)"  linkUrl="UpdateTransportation?ID=<%=deliveryReport.ID %>"   onclick="GoToLinkUrl(event)">编辑</a> <a
                                        class="del" name="Delete" onclick="Delect(<%=deliveryReport.ID %>,event)" href="javascript:void(0)">
                                        删除</a>
                                </div>
                            </div>
                        </div>
</td>
<td>
</td>
</tr>
<%} %>
</tbody> </table> </div> </div>
<!--List End-->
<script type="text/javascript">
    //页数
    var transportationPageIndex = 1;
    //显示多少显示数字条
    var CurrentPageSize = 15;
    //总数量
    var CurrentPageSizeSum = '<%=Model.TotalRecords%>';
    //总数量除以每页显示多少
    var CurrentPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
    var PagesNumber = '<%=Model.PagesNumber%>';

    function Transportation(transportationPageIndex) {

        //点击事件
        this.transportationPageIndex = transportationPageIndex;
        $.ajax({
            async: false,
            type: "Post",
            url: '../../Dispatching/TransportationList',
            data: { "TransportationPageIndex": transportationPageIndex, "Where": TransportationQuery.Query },
            dataType: "html",
            success: function (responseData) {
                $(".mod-table").html(responseData); //render table 
                //                CurrentPageSizeSum = '<%=Model.TotalRecords%>';
                // $(".label-mod #types ul").html(" <li class='current' dir='q1'><a class='c16' href='#'>全部(<%=Model.TotalRecords%> )</a></li>");
                totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
                $(".turn-ul").pager({ pagenumber: transportationPageIndex, pagecount: CurrentPageNumber, buttonClickCallback: Transportation });
            }
        });
        //分页显示
        var flag = (transportationPageIndex * CurrentPageSize) > CurrentPageSizeSum;
        $("#pages").text(CurrentPageSize * (transportationPageIndex - 1) + 1);

        if (flag) {
            $("#number").text(CurrentPageSizeSum);
        } else {
            $("#number").text(transportationPageIndex * CurrentPageSize);
        }

        if (flag) {
            return false;
        }

        if (PagesNumber < CurrentPageSize) {
            $("#number").text(PagesNumber);
        } else {
            $("#number").text(transportationPageIndex * CurrentPageSize);
        }

    };
    $("#sum").text(CurrentPageSizeSum);
    $("#all").text(CurrentPageSizeSum);
</script>
