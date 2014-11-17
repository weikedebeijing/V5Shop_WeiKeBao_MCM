<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<div class="mod-table">
    <div class="mod-table-head">
        <div class="con style0list">
            <table>
                <colgroup>
                    <col style="width: 5%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
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
                            用户昵称
                        </th>
                        <th>
                            用户头像
                        </th>
                        <th>
                            用户组
                        </th>
                        <th>
                            留言次数
                        </th>
                        <th>
                            登录次数
                        </th>
                        <th>
                            最后登录
                        </th>
                        <th>
                            操作
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
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: 10%;">
                     <col style="width: auto;">
                </colgroup>
                <tbody id="content">
                    <%--列表开始--%>
                    <% foreach (var item in  Model.DataSource)
                       {%>
                    <tr>
                        <td>
                            <div class="cell">
                                <label>
                                    <%--dir 属性是为了获取WeiXinOpenID 发送消息用的--%>
                                    <input id="checkbox_<%=item.ID %>" dir="<%=item.WeiXinOpenID %>" type="checkbox"
                                        name="sub" onclick="CheckThis()" />
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="cell">
                                <%Response.Write(item.NickName);%></div>
                        </td>
                        <td>
                            <div class="cell">
                                <img width="50" height="50" src="<%=item.HeadImgUrl%>">
                            </div>
                        </td>
                        <td>
                            <div class="cell">
                                <% if (null != item.GroupName)
                                   { %>
                                <%=item.GroupName%>
                                <%}
                                   else
                                   {%>
                                暂未分组
                                <%} %>
                            </div>
                        </td>
                        <td>
                            <div class="cell">
                                <%=item.LeaveMessageCount%>
                            </div>
                        </td>
                        <td>
                            <div class="cell">
                                <%=item.LoginTimes%>
                            </div>
                        </td>
                        <td>
                            <div class="cell">
                                <%if (null != item.LastLoginTime)
                                  { %>
                                <%=item.LastLoginTime%>
                                <%}
                                  else
                                  { %>
                                未登陆过
                                <%} %>
                            </div>
                        </td>
                        <td>
                            <div class="cell">
                                <div class="mod-operate">
                                    <div class="con style0editdel">
                                        <a class="view" id="view01" onclick="javascript:userInfoDetail('<%:item.WeiXinOpenID %>');"
                                            href="javascript:void(0);">查看</a>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <%} %>
                    <%--列表结束--%>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript">

    //页数
    var CurrentPageIndex = 0;
    //显示多少显示数字条
    var currentPageSize = 15;
    //总数量
    var totalCount = '<%=Model.TotalRecords%>';
    //总数量除以每页显示多少  →总页数
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
    function UserGroupView(pageclicknumber) {

        //点击事件
        CurrentPageIndex = pageclicknumber;

        $.ajax({
            async: false,
            type: "Post",
            url: '/WeiXinManage/GetUserGroupView',
            data: { "CurrentPageIndex": CurrentPageIndex, "Where": searchQuery.Query, "Groups": searchQuery.Groups },
            dataType: "html",
            success: function (responseData) {
                $(".sourcelist").html(responseData); //render table 

                // $(".label-mod #types ul").html(" <li class='current' dir='q1'><a class='c16' href='#'>全部(<%=Model.TotalRecords%> )</a></li>");
                //totalPageNumber = Math.ceil(totalCount / currentPageSize);

                // 调用分页器
                $("#dvPage").pager({ pagenumber: pageclicknumber, pagecount: totalPageNumber, buttonClickCallback: UserGroupView });
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
