<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<% var MessageManages = Model.DataSource; %>
<div class="mod-table">
    <div class="mod-table-head">
        <div class="con style0list">
            <table>
                <colgroup>
                    <col style="width: 5%;">
                    <col style="width: 23%;">
                    <col style="width: 10%;">
                    <col style="width: 22%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: 10%;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                    <tr>
                        <th>
                            <label>
                                <input type="checkbox" id="ckall" onclick="CheckAll(event)" /></label>
                        </th>
                        <th>
                            留言内容
                        </th>
                        <th>
                            用户昵称
                        </th>
                        <th>
                            回复内容
                        </th>
                        <th>
                            留言时间
                        </th>
                        <th>
                            回复时间
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
                    <col style="width: 23%;">
                    <col style="width: 10%;">
                    <col style="width: 22%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: 10%;">
                    <col style="width: auto;">
                </colgroup>
                <tbody id="content">
                    <%--列表开始--%>
                    <% foreach (var item in MessageManages)
                       {%>
                    <tr>
                        <td>
                            <div class="cell">
                                <label>
                                    <%--dir 属性 为留言批量回复服务--%>
                                    <input id="checkbox_<%:item.LeaveMessageID %>" dir="<%:item.UserInfoID %>" type="checkbox"
                                        name="sub" onclick="CheckThis()" />
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="cell">
                                <%:item.LeaveContent??""%>
                            </div>
                        </td>
                        <td>
                            <div class="cell">
                                <%:item.NickName??""%></div>
                        </td>
                        <td>
                            <div class="cell">
                                <%if (null != item.ReplyContent)
                                  {%>
                                <%:item.ReplyContent%>
                                <%}
                                  else
                                  {%>
                                暂无回复
                                <%} %>
                            </div>
                        </td>
                        <td>
                            <div class="cell">
                                <%:item.rowCreatedDate %>
                            </div>
                        </td>
                        <td>
                            <div class="cell">
                                <%if (null != item.ReplyDate)
                                  { %>
                                <%:item.ReplyDate%>
                                <%} %>
                            </div>
                        </td>
                        <td>
                            <div class="cell">
                                <div class="mod-operate">
                                    <div class="con style0editdel">
                                <a class="del" href="javascript:void(0);" onclick="javascript:deleteSingle(event,<%:item.LeaveMessageID %>);">删除</a>
                             <a class="view" id="view01" href="javascript:void(0);" onclick="javascript:leaveMesageDetail(<%:item.LeaveMessageID %>)">
                                    查看</a>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <th>
                        </th>
                    </tr>
                    <%} %>
                    <%--列表结束--%>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">

    // 日期分组查询条件赋值
    $("#groupDate1").text('<%:ViewData["Today"] %>');
    $("#groupDate2").text('<%:ViewData["Yesterday"] %>');
    $("#groupDate3").text('<%:ViewData["BeforeThirdDay"] %>');
    $("#groupDate4").text('<%:ViewData["ThisWeek"] %>');
    $("#groupDate5").text('<%:ViewData["Earlier"] %>');


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

    }
    function MessageManageView(pageclicknumber) {
        //点击事件
        currentPageIndex = pageclicknumber;
        $.ajax({
            async: false,
            type: "Post",
            url: '/WeiXinManage/GetMessageManageView?Groups=' + searchQuery.Groups + '',
            data: { "CurrentPageIndex": currentPageIndex, "Where": searchQuery.Query },
            dataType: "html",
            success: function (responseData) {
                $(".sourcelist").html(responseData); //render table 

                // 调用分页器
                $("#dvPage").pager({ pagenumber: pageclicknumber, pagecount: totalPageNumber, buttonClickCallback: MessageManageView });
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

    //全部
    //$("#quanbu").text(totalCount);
</script>
