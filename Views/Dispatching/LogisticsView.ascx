<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%--<%=Combres.WebExtensions.CombresLink("PagerJs")%>--%>
<%--<div class="mod-table-head">
    <div class="con style0list">--%>
<table id="content" class="table table-striped table-main">
    <colgroup>
        <col style="width: 5%;">
        <col style="width: 20%">
        <col style="width: 20%">
        <col style="width: 20%">
        <col style="width: 20%">
        <col style="width: 15%;">
        <col style="width: auto;">
    </colgroup>
    <tbody>
        <tr>
            <th>
                <label>
                    <input value="" name="" id="ckall" type="checkbox" onclick="CheckAll(event)"></label>
            </th>
            <th class="x-tab">
                <div class="iconbg-arrow up">
                    物流公司
                </div>
            </th>
            <th class="x-tab">
                <div class="iconbg-arrow up">
                    编号
                </div>
            </th>
            <th class="x-tab">
                <div class="iconbg-arrow up">
                    状态
                </div>
            </th>
            <th class="x-tab">
                <div class="iconbg-arrow up">
                    联系电话
                </div>
            </th>
            <th class="x-tab">
                <div class="iconbg-arrow up">
                    操作
                </div>
            </th>
            <th></th>
        </tr>
        <%-- </tbody>
        </table>
    </div>
</div>
<div class="mod-table-main">
    <div class="con style0line" style="width: 100%">
        <table border="0" cellpadding="5" cellspacing="0" width="100%">
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 20%">
                <col style="width: 20%">
                <col style="width: 20%">
                <col style="width: 20%">
                <col style="width: 15%;">
                <col style="width: auto;">
            </colgroup>
            <tbody>--%>
        <%
                 
            foreach (V5.MetaData.Delivery.Model.LogisticsCompany logisticsCompany in Model.DataSource)
            {
                            
        %>
        <tr class="tr-Current">
            <td>
                <div class="cell">
                    <label>
                        <input value="<%=logisticsCompany.ID %>" name="sub" type="checkbox" onclick="CheckThis()"></label><!--<span class="flag-gray"></span>-->
                </div>
            </td>
            <td>
                <div class="cell">
                    <%=logisticsCompany.Name%>
                </div>
            </td>
            <td>
                <div class="cell">
                    <%=logisticsCompany.JaneSpell%>
                </div>
            </td>
            <td>
                <%if (logisticsCompany.Status == "0")
                  {
                %>
                <span class="c06">启用</span>
                <%
                          } %>
                <% else if (logisticsCompany.Status == "1")
                  {%>
                <span class="c03">禁用</span>
                <%} %>
                        
            </td>
            <td>
                <div class="cell">
                    <%=logisticsCompany.Tel%>
                </div>
            </td>
            <td>
                <div class="cell">
                    <div class="bs-docs-example tooltip-demo">
                        <a data-toggle="tooltip" data-placement="bottom" data-original-title="编辑" href="javascript:void(0)" onclick="modifyLogisticsCompany(<%=logisticsCompany.ID %>)">
                            <i class="icon-pen-blue"></i></a>
                        <a data-toggle="tooltip" data-placement="bottom" data-original-title="删除" href="javascript:void(0)" dir="<%=logisticsCompany.ID %>" onclick="logisticsDelete(event,<%=logisticsCompany.ID %>)">
                            <i class="icon-del-blue"></i></a>
                    </div>
                </div>
            </td>

            <td></td>
        </tr>
        <% } %>
    </tbody>
</table>
<%-- </div>
</div>--%>
<script type="text/javascript">

    //页数
    var logisticsCompanyPageIndex = 1;
    //显示多少显示数字条
    var CurrentPageSize = 15;
    //总数量
    var CurrentPageSizeSum = '<%=Model.TotalRecords%>';
    //总数量除以每页显示多少
    var CurrentPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
    var PagesNumber = '<%=Model.PagesNumber%>';

    $("#all").text('<%= ViewData["all"]%>');
    function LogisticsView(logisticsCompanyPageIndex, CurrentPageSize) {
        if (CurrentPageSize == "" || CurrentPageSize == undefined) {

            CurrentPageSize = $("#ddlPageSize").text();
        }
        CurrentPageSize = CurrentPageSize;
        //点击事件
        this.logisticsCompanyPageIndex = logisticsCompanyPageIndex;
        CurrentPageSize = CurrentPageSize;
        $.ajax({
            async: false,
            type: "Post",
            url: '../../Dispatching/LogisticsList?groups=' + logisticsQuery.Groups,
            data: { "LogisticsCompanyPageIndex": logisticsCompanyPageIndex,"CurrentPageSize":CurrentPageSize, "Where": logisticsQuery.Query,"PageSize":CurrentPageSize },
            dataType: "html",
            success: function (responseData) {
                $(".mod-table").html(responseData); //render table 
                //                CurrentPageSizeSum = '<%=Model.TotalRecords%>';
                // $(".label-mod #types ul").html(" <li class='current' dir='q1'><a class='c16' href='#'>全部(<%=Model.TotalRecords%> )</a></li>");
                totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
                $("#turn-ul").pager({ pagenumber: logisticsCompanyPageIndex, pagecount: totalPageNumber, buttonClickCallback: LogisticsView });
                //if (CurrentPageSizeSum > 0) {
                //    $(".mod-page").show();
                //}
                //else {
                //    $(".mod-page").hide();
                //}
            }
        });

        //分页显示
        var flag = (logisticsCompanyPageIndex * CurrentPageSize) > CurrentPageSizeSum;
        $("#pages").text(CurrentPageSize * (logisticsCompanyPageIndex - 1) + 1);

        if (flag) {
            $("#number").text(CurrentPageSizeSum);
        } else {
            $("#number").text(logisticsCompanyPageIndex * CurrentPageSize);
        }

        if (flag) {
            return false;
        }

        if (PagesNumber < CurrentPageSize) {
            $("#number").text(PagesNumber);
        } else {
            $("#number").text(logisticsCompanyPageIndex * CurrentPageSize);
        }

    };
    $("#sum").text(CurrentPageSizeSum);





</script>
<script type="text/javascript">




</script>
