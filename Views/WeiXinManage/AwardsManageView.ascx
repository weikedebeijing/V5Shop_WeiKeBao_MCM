<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<% var awardsManages = Model.DataSource; %>
<div class="mod-table-head">
    <div class="con style0list">
        <table>
            <colgroup>
                <col style="width: 5%;">
                <col style="width: 7%;">
                <col style="width: 11%;">
                <col style="width: 7%;">
                <col style="width: 8%;">
                <col style="width: 8%;">
                <col style="width: 9%;">
                <col style="width: 10%;">
                <col style="width: 11%;">
                <col style="width: 11%;">
                <col style="width: 5%;">
                <col style="width: 8%;">
                <col style="width: auto;">
            </colgroup>
            <tbody>
                <tr>
                    <th>
                        <label>
                            <input type="checkbox" onclick="CheckAll(event)" id="ckall" /></label>
                    </th>
                    <th>
                        活动名称
                    </th>
                    <th>
                        活动时间
                    </th>
                    <th>
                        获奖等级
                    </th>
                    <th>
                        奖品名称
                    </th>
                    <th>
                        获奖者姓名
                    </th>
                    <th>
                        手机
                    </th>
                    <th>
                        收货地址
                    </th>
                    <th>
                       获奖时间
                    </th>
                    <th>
                        发奖时间
                    </th>
                    <th>
                        状态
                    </th>
                    <th>
                        备注
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
                <col style="width: 7%;">
                <col style="width: 11%;">
                <col style="width: 7%;">
                <col style="width: 8%;">
                <col style="width: 8%;">
                <col style="width: 9%;">
                <col style="width: 10%;">
                <col style="width: 11%;">
                <col style="width: 11%;">
                <col style="width: 5%;">
                <col style="width: 8%;">
                <col style="width: auto;">
            </colgroup>
            <tbody id="content">
                <%foreach (var awardsManage in awardsManages)
                  {%>
                <tr>
                    <td>
                        <div class="cell">
                            <label>
                                <input type="checkbox" onclick="CheckThis()" dir="<%:awardsManage.ID %>" name="sub"
                                    value="" />
                            </label>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%:awardsManage.ActivityName%></div>
                    </td>
                    <td>
                        <div class="cell" title="<%:awardsManage.ActivityStartDate%>~<%:awardsManage.ActivityEndDate%>">
                            <%:awardsManage.ActivityStartDate%>~<%:awardsManage.ActivityEndDate%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%:awardsManage.AwardGrade%></div>
                    </td>
                    <td>
                        <div class="cell">
                            <%:awardsManage.AwardName%></div>
                    </td>
                    <td>
                        <div class="cell">
                            <%:awardsManage.NickName != null ? awardsManage.NickName : ""%>
                        </div>
                    </td>
                     <td>
                        <div class="cell">
                            <%:awardsManage.MobilePhone != null ? awardsManage.MobilePhone : ""%></div>
                    </td>
                     <td>
                        <div class="cell" title="<%:awardsManage.AddressInfo != null ? awardsManage.AddressInfo : ""%>">
                            <%:awardsManage.AddressInfo != null ? awardsManage.AddressInfo : ""%>
                        </div>
                    </td>
                     <td>
                        <div class="cell">
                            <%:awardsManage.rowCreatedDate%></div>
                    </td>
                    <td>
                        <div class="cell">
                            <%if (awardsManage.GiveOutAwardDate != null)
                              { %>
                            <%:awardsManage.GiveOutAwardDate%>
                            <%} %>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%if (awardsManage.AwardState == 1)
                              { %>
                            <span class="c06">已发放</span>
                            <%}
                              else if (awardsManage.AwardState == 0)
                              {%>
                            <span class="c01-5">未发放</span>
                            <%}
                              else if (awardsManage.AwardState == 2)
                              { %>
                            <span class="c03">问题奖品</span>
                            <%}
                              else if (awardsManage.AwardState == 3)
                              {%>
                            <span class="c03">无效奖品</span>
                            <%} %></div>
                    </td>
                    <td>
                        <div class="cell" title="<%:awardsManage.Remark%>">
                            <%:awardsManage.Remark%></div>
                    </td>
                    <td>
                    </td>
                </tr>
                <%} %>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript">
    $("#totalCount").text(<%=Model.TotalRecords%>);

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
    function GetAwardsManageView(pageclicknumber) {
        //点击事件
        currentPageIndex = pageclicknumber;
        $.ajax({
            async: false,
            type: "Post",
            url: '/WeiXinManage/GetAwardsManageView?Groups=' + searchQuery.Groups + '',
            data: { "CurrentPageIndex": currentPageIndex, "Where": searchQuery.Query },
            dataType: "html",
            success: function (responseData) {
                $("#sourcelist").html(responseData); //render table 

                // 调用分页器
                $("#dvPage").pager({ pagenumber: pageclicknumber, pagecount: totalPageNumber, buttonClickCallback: GetAwardsManageView });
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
