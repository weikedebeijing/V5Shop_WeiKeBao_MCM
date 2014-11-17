<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%var articleGroups = Model.DataSource; %>
<div class="mod-table">
    <div class="mod-table-head">
        <div class="con style0list">
            <table>
                <colgroup>
                    <col style="width: 5%;">
                    <col style="width: 30%;">
                    <col style="width: 30%;">
                    <col style="width: 20%;">
                    <col style="width: 15%;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                    <tr>
                        <th>
                            <label>
                                <input type="checkbox" value="" name="" id="ckall" onclick="javascript:CheckAll(event);" /></label>
                        </th>
                        <th>
                            名称
                        </th>
                        <th>
                            所属主题分类
                        </th>
                        <th>
                            显示序号
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
                    <col style="width: 30%;">
                    <col style="width: 30%;">
                    <col style="width: 20%;">
                    <col style="width: 15%;">
                    <col style="width: auto;">
                </colgroup>
                <tbody id="content">
                    <%foreach (var articleGroup in articleGroups)
                      {%>
                    <tr class="tr-Current">
                        <td>
                            <div style="cursor: pointer;">
                                <label>
                                    <input type="checkbox" id="checkbox_<%:articleGroup.ArticleID %>" onclick="CheckThis()"
                                        value="" name="sub" /></label></div>
                        </td>
                        <td>
                            <div class="cell">
                                <%:articleGroup.Title%></div>
                        </td>
                        <td>
                            <div class="cell">
                                <%:articleGroup.Name%></div>
                        </td>
                        <td>
                            <div class="cell">
                                <%:articleGroup.SortOrder%></div>
                        </td>
                        <td>
                            <div class="cell">
                                <a class="c07 r15" href="#" onclick="javascript:editHelpCenter(<%:articleGroup.ArticleID %>)">
                                    编辑</a> <a class="c07 r15" href="#" onclick="javascript:deleteSingle(event,<%:articleGroup.ArticleID %>);">
                                        删除</a>
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
<script type="text/javascript">

    //页数
    var currentPageIndex = 0;
    //显示多少显示数字条
    var currentPageSize = 15;
    //总数量
    var totalCount = '<%=Model.TotalRecords%>';
    //总数量除以每页显示多少 →总页数
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
    function helperCenterView(pageclicknumber) {
        //点击事件
        currentPageIndex = pageclicknumber;
        $.ajax({
            async: false,
            type: "Post",
            url: '/HelpCenter/GetHelperCenterView?Groups=' + searchQuery.Groups + '',
            data: { "CurrentPageIndex": currentPageIndex, "Where": searchQuery.Query },
            dataType: "html",
            success: function (responseData) {
                $(".sourcelist").html(responseData); //render table 

                // 调用分页器
                $("#dvPage").pager({ pagenumber: pageclicknumber, pagecount: totalPageNumber, buttonClickCallback: helperCenterView });
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
