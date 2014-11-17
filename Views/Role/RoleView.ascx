<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<% var Roles = Model.DataSource; %>
<div class="mod-table">
    <div class="mod-table-head">
        <div class="con style0list">
            <table>
                <colgroup>
                    <col style="width: 5%;">
                    <col style="width: 80%;">
                    <col style="width: 15%;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                    <tr>
                        <th>
                            <label>
                                <input name="" id="ckall" type="checkbox" value="" onclick="CheckAll(event)" /></label>
                        </th>
                        <th>
                            角色
                        </th>
                        <th>
                            操作
                        </th>
                        <th>
                        </th>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="mod-table-main">
        <div class="con style0line">
            <table>
                <colgroup>
                    <col style="width: 5%;">
                    <col style="width: 80%;">
                    <col style="width: 15%;">
                    <col style="width: auto;">
                </colgroup>
                <tbody id="content">
                    <%foreach (var role in Roles)
                      { %>
                    <%var roleID = role.ID; %>
                    <tr class="tr-Current">
                        <td>
                            <div class="cell">
                                <label>
                                    <input name="sub" type="checkbox" id="checkbox_<%:role.ID %>" value="" onclick="CheckThis()" /></label>
                            </div>
                        </td>
                        <td>
                            <div class="cell">
                                <%:role.RoleName%></div>
                        </td>
                        <td>
                            <div class="cell">
                                <%if(role.RoleName!="系统管理员"){ %>
                                <div class="mod-operate">
                                     <div class="con style0editdel">
                                <a class="edit" href="javascript:void(0);" onclick="EditRole(<%:roleID %>)" >编辑</a> 
                                <a class="del" href="javascript:void(0);"
                                    onclick="javascript:deleteRole(event,<%:roleID %>);">删除</a>
                                    </div>
                                </div>
                                <%} %>
                            </div>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="../../Scripts/jquery.pager.js" type="text/javascript"></script>
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
    function GetRoleView(pageclicknumber) {

        //点击事件
        currentPageIndex = pageclicknumber;
        $.ajax({
            async: false,
            type: "Post",
            url: '/Role/GetRoleView',
            data: { "CurrentPageIndex": currentPageIndex, "Where": searchQuery.Query, "Groups": searchQuery.Groups },
            dataType: "html",
            success: function (responseData) {
                $(".sourcelist").html(responseData); //render table 

                // 调用分页器
                $("#dvPage").pager({ pagenumber: pageclicknumber, pagecount: totalPageNumber, buttonClickCallback: GetRoleView });
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
