<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<% var Users = Model.DataSource; %>
<%--<div class="mod-table">
    <div class="mod-table-head">
        <div class="con style0list">--%>
<table class="table table-striped table-main" id="content">
    <colgroup>
        <col style="width: 5%;">
        <col style="width: 30%;">
        <col style="width: 25%;">
        <col style="width: 25%;">
        <col style="width: 15%;">
        <col style="width: auto;">
    </colgroup>
    <tbody>
        <tr>
            <th>
                <label>
                    <input name="" id="ckall" type="checkbox" onclick="CheckAll(event)" value=""></label>
            </th>
            <th>
                <%--<i class="icon-resize"></i>--%>用户名
            </th>
            <th>
                <%--<i class="icon-resize"></i>--%>角色
            </th>
            <th>
                <%--<i class="icon-resize"></i>--%>用户状态
            </th>
            <th>
                <%--<i class="icon-resize"></i>--%>操作
            </th>
            <th></th>
        </tr>
        <%--                </tbody>
            </table>
        </div>
    </div>--%>
        <%--<div class="mod-table-main">
        <div class="con style0line">
            <table>
                <colgroup>
                    <col style="width: 5%;">
                    <col style="width: 30%;">
                    <col style="width: 25%;">
                    <col style="width: 25%;">
                    <col style="width: 15%;">
                    <col style="width: auto;">
                </colgroup>
                <tbody id="content">--%>
        <%--<%var Users = (List<V5.MetaData.Security.Report.UserReport>)ViewData["Users"]; %>--%>
        <%foreach (var user in Users)
          { %>
        <%var UserID = user.ID; %>
        <%if (user.UserCode.ToLower() == "admin")
          {%>
        <tr class="tr-Current">
            <td>
                <div class="cell">
                    <label>
                        <input name="sub" type="checkbox" id="checkbox_<%:user.ID %>" value="" onclick="CheckThis(event)" /></label>
                </div>
            </td>
            <td>
                <div class="cell">
                    <%:user.UserCode%>
                </div>
            </td>
            <td>
                <div class="cell">
                    <%:user.RoleName%>
                </div>
            </td>
            <td>
                <%if (user.Status == "N")
                  {%>
                <div class="cell">
                    <i class="icon-open-green"></i>
                </div>
                <%}
                  else
                  { %>
                <div class="cell">
                    <i class="icon-close-red"></i>
                </div>
            </td>
            <%} %>
            <td>
                <div class="cell">
                    <div class="bs-docs-example tooltip-demo">
                        <a data-original-title="编辑" data-placement="bottom" href="javascript:void(0);" onclick="javascript:editUserPopup(<%=UserID %>);">
                            <i class="icon-pen-blue"></i></a>
                        <a data-original-title="删除" data-placement="bottom" onclick="javascript:DeleteUser(event,<%:UserID %>);" href="javascript:void(0)">
                            <i class="icon-del-blue"></i>
                        </a>
                    </div>
                </div>
            </td>
            <td></td>
        </tr>
        <%}
          else
          { %>
        <tr class="tr-Current">
            <td>
                <div class="cell">
                    <label>
                        <input name="sub" type="checkbox" id="checkbox_<%:user.ID %>" value="" onclick="CheckThis()" /></label>
                </div>
            </td>
            <td>
                <div class="cell">
                    <%:user.UserCode%>
                </div>
            </td>
            <td>
                <div class="cell">
                    <%:user.RoleName%>
                </div>
            </td>
            <td>
                <%if (user.Status == "N")
                  {%>
                <div class="cell">
                    <i class="icon-open-green"></i>
                </div>
                <%}
                  else
                  { %>
                <div class="cell">
                    <i class="icon-close-red"></i>
                </div>
                <%-- </div>--%>
                <%} %>
            </td>
            <td>
                <div class="cell">
                    <div class="bs-docs-example tooltip-demo">
                        <a data-original-title="编辑" data-placement="bottom" data-toggle="tooltip" href="javascript:void(0);" onclick="javascript:editUserPopup(<%=UserID %>);"><i class="icon-pen-blue"></i></a>
                        <a data-original-title="删除" data-placement="bottom" data-toggle="tooltip" href="javascript:void(0);" onclick="javascript:DeleteUser(event,<%:UserID %>);"><i class="icon-del-blue"></i></a>
                    </div>
                </div>
            </td>
            <td></td>
        </tr>
        <%} %>
        <%} %>
    </tbody>
</table>
<%--</div>
</div> </div>--%>
<script type="text/javascript">

    //页数
    var currentPageIndex = 0;
    //显示多少显示数字条
    var currentPageSize = 15;
    //总数量
    var totalCount = '<%=Model.TotalRecords%>';
    //总数量除以每页显示多少
    var totalPageNumber = Math.ceil(totalCount / currentPageSize);

    // 当前页的大小
    var currentPageNumber = '<%=Model.PagesNumber%>';
    //控制分页是否显示
    if (totalCount > 0) {
        $(".mod-page").show();
    }
    else {
        $(".mod-page").hide();
        //$("#allUserGroupCount").text('0');
    }
    function GetUserView(pageclicknumber, CurrentPageSize) {

        if (CurrentPageSize == "" || CurrentPageSize == undefined) {

            CurrentPageSize = $("#ddlPageSize").text();
        }
        CurrentPageSize = CurrentPageSize;
        //点击事件
        currentPageIndex = pageclicknumber;
        $.ajax({
            async: false,
            type: "Post",
            url: '/User/GetUserView',
            data: { "CurrentPageIndex": currentPageIndex, "CurrentPageSize":currentPageSize, "Where": searchQuery.Query, "Groups": searchQuery.Groups },
            dataType: "html",
            success: function (responseData) {
                $(".sourcelist").html(responseData); //render table 
                var totalPageNumber = Math.ceil(totalCount / CurrentPageSize);
                $("#turn-ul").pager({ pagenumber: pageclicknumber, pagecount: totalPageNumber, buttonClickCallback: GetUserView });

            }
        });
        //分页显示
        var flag = (pageclicknumber * currentPageSize) > totalCount;

        $("#numberStart").text(currentPageSize * (pageclicknumber - 1) + 1);
        if (flag) {
            $("#numberEnd").text(totalCount);
        } else {
            $("#numberEnd").text(pageclicknumber * currentPageSize);
        }

        if (flag) {
            return false;
        }

        if (currentPageNumber < currentPageSize) {
            $("#numberEnd").text(totalCount);
        } else {
            $("#numberEnd").text(pageclicknumber * currentPageSize);
        }
    };
    $("#pageTotalCount").text(totalCount);
</script>
