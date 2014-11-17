<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<script type="text/javascript" src="../../Scripts/Js/allselect.js"></script>
<script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
<div class="mod-table-head">
    <div class="con style0list">
        <table cellspacing="0" cellpadding="0" border="0" width="100%">
            <colgroup>
               <col style="width: 5%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 20%;">
                <col style="width: 20%;">
                <col style="width: 10%;">
                <col style="width: auto;">
            </colgroup>
            <tbody>
                <tr>
                    <th>
                        <label>
                            <input type="checkbox" value="" name="" id="ckall" onclick="CheckAll(event)"></label>
                    </th>
                    <th class="x-tab">
                        <div class="iconbg-arrow down">
                            活动名称</div>
                    </th>
                    <th class="x-tab">
                        <div class="iconbg-arrow down">
                            活动类型</div>
                    </th>
                    <th class="x-tab">
                        <div class="iconbg-arrow down">
                            活动状态</div>
                    </th>
                    <th class="x-tab">
                        <div class="iconbg-arrow down">
                            开始时间</div>
                    </th>
                    <th class="x-tab">
                        <div class="iconbg-arrow down">
                            结束时间</div>
                    </th>
                     <th class="x-tab">
                        <div class="iconbg-arrow down">
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
    <div class="con style0line" style="width: 100%;">
        <table cellspacing="0" cellpadding="5" border="0" width="100%">
            <colgroup>
               <col style="width: 5%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 20%;">
                <col style="width: 20%;">
                <col style="width: 10%;">
                <col style="width: auto;">
            </colgroup>
            <tbody>
                <%
                    foreach (V5.MetaData.WeiXin.Model.ActivityAwards activityAwards in Model.DataSource)
                    {
                            
                %>
                <%--   <%string shopType = string.Empty;
                  string shopTypeCode = string.Empty;
                  string gradeTypeID = string.Empty;
                  string customerName = string.Empty;
                %>--%>
                <tr>
                    <td>
                        <div class="cell">
                            <label>
                                <%
                                    string srt = "";
                                    string ischange = "false";
                                    string isaction = "fasle";
                                    if (DateTime.Now > activityAwards.FinishDate)
                                    {
                                        srt = "已结束";

                                    }

                                    else if (activityAwards.FinishDate > DateTime.Now && activityAwards.StartDate < DateTime.Now)
                                    {
                                        srt = "进行中";
                                        isaction = "true";
                                    }

                                    else if (activityAwards.StartDate > DateTime.Now)
                                    {
                                        srt = "未开始";
                                        ischange = "true";
                                    }
                                %>
                                <input type="checkbox" value="<%=activityAwards.ID %>" name="sub" onclick="CheckThis()"
                                    ischange="<%=ischange %>" isaction="<%=isaction %>"></label><!--<span class="flag-gray"></span>--></div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=activityAwards.AwardsName%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=activityAwards.ActivityTypeName%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%if (srt == "已结束")
                              { 
                            %>
                            <span class="c03">已结束</span>
                            <%}%>
                            <%else if (srt == "进行中")
                                { 
                            %>
                            <span class="c06">进行中</span>
                            <%}%>
                            <%else if (srt == "未开始")
                                { 
                            %>
                            <span class="c01-1">未开始</span>
                            <%}%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=activityAwards.StartDate%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=activityAwards.FinishDate%>
                        </div>
                    </td>
                    <td>
                    <div class="cell">
                         <div class="mod-operate">
                            <div class="con style0editdel">
                                <a class="edit" name="update"  ischange="<%=ischange %>" onclick="update(event)"  dir="<%=activityAwards.ID %>" href="javascript:void" >
                                     编辑</a>
                                        </div>
                                    </div>
                                </div>
                            </td>
                    <td>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>
<!--列表 End-->
<script type="text/javascript">
    //页数
    var CurrentPageIndex = 1;
    //显示多少显示数字条
    var CurrentPageSize = 15;
    //总数量
    var CurrentPageSizeSum = '<%=Model.TotalRecords%>';
    //总数量除以每页显示多少
    var CurrentPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);

    var PagesNumber = '<%=Model.PagesNumber%>';
    //全部
    $("#QuanBu").text(CurrentPageSizeSum);

    //获取要执行的URL
    if (CurrentPageSizeSum > 0) {
        $(".mod-page").show();
    }
    else {
        $(".mod-page").hide();
    }

    function ActivityView(activityIndex) {

        //点击事件

        activityIndex = CurrentPageIndex;
        $.ajax({
            async: false,
            type: "Post",
            url: '../../WeiXinManage/GetActivity?Groups=' + activityQuery.Groups,
            data: { "activityIndex": activityIndex },
            dataType: "html",
            success: function (responseData) {
                $(".mod-table").html(responseData); //render table 
                //  CurrentPageSizeSum = '<%=Model.TotalRecords%>';
                // $(".label-mod #types ul").html(" <li class='current' dir='q1'><a class='c16' href='#'>全部(<%=Model.TotalRecords%> )</a></li>");
                totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
                $(".turn-ul").pager({ pagenumber: activityIndex, pagecount: CurrentPageNumber, buttonClickCallback: ActivityView });

            }
        });
        //分页显示
        var flag = (activityIndex * CurrentPageSize) > CurrentPageSizeSum;
        $("#pages").text(CurrentPageSize * (activityIndex - 1) + 1);

        if (flag) {
            $("#number").text(CurrentPageSizeSum);
        } else {
            $("#number").text(activityIndex * CurrentPageSize);
        }

        if (flag) {
            return false;
        }

        if (PagesNumber < CurrentPageSize) {
            $("#number").text(PagesNumber);
        } else {
            $("#number").text(activityIndex * CurrentPageSize);
        }

    };
    $("#sum").text(CurrentPageSizeSum);

</script>
