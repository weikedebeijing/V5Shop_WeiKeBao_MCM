<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%--<div class="mod-table-head">
    <div class="con  style0list">--%>
        <table id="content" class="table table-striped table-main">
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: 20%;">
                <col style="width: 20%;">
                <col style="width: auto;">
            </colgroup>
            <tbody>
                <tr>
                    <th>
                        <label>
                            <input type="checkbox" onclick="CheckAll(event)" id="ckall" name="" value=""></label>
                    </th>
                    <th>
                        功能名称
                    </th>
                    <th>
                        使用状态
                    </th>
                    <th>
                        触发关键词
                    </th>
                    <th>
                        触发次数
                    </th>
                    <th>
                        创建时间
                    </th>
                    <th>
                        修改时间
                    </th>
                    <th>
                    </th>
                </tr>
            <%--</tbody>
        </table>
    </div>
</div>
<div class="mod-table-main">
    <div class="con style0line">
        <table>
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: 20%;">
                <col style="width: 20%;">
                <col style="width: auto;">
            </colgroup>
            <tbody>--%>
                <%
              
                    foreach (V5.MetaData.WeiXin.Model.Function item in Model.DataSource)
                    {%>
                <tr>
                    <td>
                        <div class="cell">
                            <label>
                                <input type="checkbox" onclick="CheckThis()" name="sub" value="<%=item.ID %>">
                                <input type="hidden" value="<%=item.ID %>" name="name">
                            </label>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=item.Name%></div>
                    </td>
                    <td>
                        <%--<div class="cell">
                           <%=item.State==true?"启用":"禁用"%></div>--%>
                        <%if (item.State == true)
                          {
                        %>
                        <span class="c06">启用</span>
                        <%
                            } %>
                        <% else if (item.State == false)
                            {%>
                        <span class="c03">禁用</span>
                        <%} %>
                    </td>
                    <td>
                        <div class="cell">
                            <%=item.Key%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=item.ClickTimes%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=item.rowCreatedDate%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=item.rowModifiedDate%>
                        </div>
                    </td>
                    <td>
                    </td>
                </tr>
                <%  }
                %>
            </tbody>
        </table>
    <%--</div>
</div>--%>
<script type="text/javascript">

    //页数
    var functionIdex = 1;
    //显示多少显示数字条
    var CurrentPageSize = 15;
    //总数量
    var CurrentPageSizeSum = '<%=Model.TotalRecords%>';
    //总数量除以每页显示多少
    var CurrentPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
    var PagesNumber = '<%=Model.PagesNumber%>';
    // 全部总数
    $("#all").text('<%= ViewData["all"]%>');



    function GetFunction(functionIdex, CurrentPageSize) {
        if (CurrentPageSize == "" || CurrentPageSize == undefined) {

            CurrentPageSize = $("#ddlPageSize").text();
        }
        CurrentPageSize = CurrentPageSize;
        //点击事件
        this.functionIdex = functionIdex;
        $.ajax({
            async: false,
            url: '../../WeiXinManage/WeiXinFunctionTable?groups=' + functionQuery.Groups,
            data: { "functionIdex": functionIdex,"CurrentPageSize":CurrentPageSize, "Where": functionQuery.Query },
            dataType: "html",
            success: function (responseData) {
                $("#sourceList").html(responseData); //render table 
                //                CurrentPageSizeSum = '<%=Model.TotalRecords%>';
                // $("#type ul").html(" <li class='current' dir='q1'><a class='c16' href='#'>全部(<%=Model.TotalRecords%> )</a></li>");
                var totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
                $("#turn-ul").pager({ pagenumber: functionIdex, pagecount: totalPageNumber, buttonClickCallback: GetFunction });
            }
        });

        //分页显示
        var flag = (functionIdex * CurrentPageSize) > CurrentPageSizeSum;
        $("#pages").text(CurrentPageSize * (functionIdex - 1) + 1);

        if (flag) {
            $("#number").text(CurrentPageSizeSum);
        } else {
            $("#number").text(functionIdex * CurrentPageSize);
        }

        if (flag) {
            return false;
        }

        if (PagesNumber < CurrentPageSize) {
            $("#number").text(PagesNumber);
        } else {
            $("#number").text(functionIdex * CurrentPageSize);
        }

    };
    $("#sum").text(CurrentPageSizeSum);
    //显示隐藏多图文
</script>
