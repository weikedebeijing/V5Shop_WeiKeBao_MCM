<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<div class="mod-table-head">
    <div class="con style0list">
        <table>
            <colgroup>
                <col style="width: 8%;">
                 <col style="width: 32%;">
                <col style="width: 45%;">
                 <col style="width: 15%;">
                 <col style="width: auto;">
            </colgroup>
            <tbody>
                <tr>
                    <th>
                        <label>
                            <input type="checkbox" value="" name="" id="ckall" onclick="CheckAll(event)">
                        </label>
                    </th>
                    <th>
                        标题
                    </th>
                    <th>
                        封面
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
                <col style="width: 8%;">
                 <col style="width: 32%;">
                 <col style="width: 45%;">
                 <col style="width: 15%;">
                 <col style="width: auto;">  
            </colgroup>
            <tbody>
                <% foreach (V5.MetaData.WeiXin.Model.MaterialManage materialManage in Model.DataSource)
                   { %>
                <%if (materialManage.MessageType == 3)
                  { 
                %>
                <%if (materialManage.SonId == 0)
                  { %>
                <tr>
                    <td>
                        <div class="cell">
                            <label>
                                <input type="checkbox" value="<%=materialManage.Id %>" name="sub" onclick="CheckThis()">
                            </label>
                        <a href="javascript:void(0)" onclick="GetSuperset(event)"><i class="icon-hide t5 l10" dir="<%=materialManage.Id %>">
                        </i></a>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=materialManage.Title%></div>
                    </td>
                    <td>
                        <div class="cell">
                            <a class="a-img" href="#">
                                <img width="90" height="50" src="../../<%=materialManage.CoverUrl %>"></a></div>
                    </td>
                    <td>
                        <div class="cell">
                        <a class="c07" href="javascript:void(0)" onclick=" Opan(event);" dir="<%=materialManage.Id %>">
                            编辑</a> <a onclick="Delete(event)" class="c07" dir="<%=materialManage.Id %>" href="javascript:void(0)">
                                删除</a> <a onclick="views(event)" dir="<%=materialManage.Id %>" class="c07" href="javascript:void(0)">
                                    查看</a>
                                    </div>
                    </td>
                    <td>
                    </td>
                </tr>
                <% } %>
                <% foreach (var item in Model.DataSource)
                   {
                       
                %>
                <%if (materialManage.Id == item.SonId)
                  {%>
                <tr style="display: none;" name="trPart<%=materialManage.Id %>">
                    <td class="show" colspan="5">
                        <!--subtable begin-->
                        <div class="mod-table-main">
                            <div class="con style0sub">
                                <table>
                                    <colgroup>
                                        <col style="width: 8%;">
                                        <col style="width: 32%;">
                                        <col style="width: 45%;">
                                        <col style="width: 15%;">
                                        <col style="width: auto;">
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                                <div class="cell">
                                                    <%=item.Title%></div>
                                            </td>
                                            <td>
                                                <div class="cell">
                                                    <a class="a-img" href="#">
                                                        <img width="90" height="50" src="../../<%=item.CoverUrl %>"></a></div>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <%--      <tr>
                                            <td>
                                            </td>
                                            <td>
                                                <div class="cell">
                                                    上海小学排名最新出炉 上海各区县重点小学排行榜</div>
                                            </td>
                                            <td>
                                                <div class="cell">
                                                    <a class="a-img" href="#">
                                                        <img width="50" height="50" src="../../content/css/css4.0/images/test/pro01_03.png"></a></div>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>--%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--subtable end-->
                    </td>
                </tr>
                <%} %>
                <% } %>
                <%} %>
                <%if (materialManage.MessageType == 2)
                  {%>
                <tr>
                    <td>
                        <div class="cell">
                            <label>
                                <input type="checkbox" value="<%=materialManage.Id %>" name="sub" onclick="CheckThis()">
                            </label>
                      <%--  <a href="javascript:void(0)"><i class="icon-show t5 l10"></i></a> --%></div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=materialManage.Title%></div>
                    </td>
                    <td>
                        <div class="cell">
                            <a class="a-img" href="#">
                                <img width="90" height="50" src="../../<%=materialManage.CoverUrl %>"></a></div>
                    </td>
                    <td>
                        <a class="c07" href="javascript:void(0)" onclick=" Opan(event);" dir="<%=materialManage.Id %>">
                            编辑</a> <a class="c07" onclick="Delete(event)" dir="<%=materialManage.Id %>" href="javascript:void(0)">
                                删除</a> <a onclick="views(event)" dir="<%=materialManage.Id %>" class="c07" href="javascript:void(0)">
                                    查看</a>
                    </td>
                    <td>
                    </td>
                </tr>
                <%} %>
                <%if (materialManage.MessageType == 1)
                  {%>
                <tr>
                    <td>
                        <div class="cell">
                            <label>
                                <input type="checkbox" value="<%=materialManage.Id %>" name="sub" onclick="CheckThis()">
                            </label>
                       <%-- <a href="javascript:void(0)"><i class="icon-show t5 l10"></i></a>--%></div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=materialManage.Text%></div>
                    </td>
                    <td>
                        <div class="cell">
                        </div>
                    </td>
                    <td>
                        <a class="c07" href="javascript:void(0)" onclick=" Opan(event);" dir="<%=materialManage.Id %>">
                            编辑</a> <a class="c07" onclick="Delete(event)" dir="<%=materialManage.Id %>" href="javascript:void(0)">
                                删除</a> 
                                   
                    </td>
                    <td>
                    </td>
                </tr>
                <%} %>
                <% } %>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript">

    //页数
    var materialManageIndex = 1;
    //显示多少显示数字条
    var CurrentPageSize = 15;
    //总数量
    var CurrentPageSizeSum = '<%=Model.TotalRecords%>';
    //总数量除以每页显示多少
    var CurrentPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
    var PagesNumber = '<%=Model.PagesNumber%>';
    // 全部总数
    $("#all").text('<%=ViewData["all"]%>');

    $("#text").text('<%=ViewData["text"]%>');
    $("#OneImageText").text('<%=ViewData["OneImageText"]%>');
    $("#MoreImageText").text('<%=ViewData["MoreImageText"]%>');

    //控制分页是否显示
    if (CurrentPageSizeSum > 0) {
        $(".mod-page").show();
        //        $("#Message").hide();
    }
    else {
        $(".mod-page").hide();
        //        $("#Message").show();
    }
    function GetmaterialManage(materialManageIndex) {

        //点击事件
        materialManageIndex = materialManageIndex;
        $.ajax({
            async: false,
            type: "Post",
            url: '../../WeiXinManage/GetMaterialManage?groups=' + materialQuery.Groups,
            data: { "materialManageIndex": materialManageIndex, "Where": materialQuery.Query },
            dataType: "html",
            success: function (responseData) {
                $(".mod-table").html(responseData); //render table 
                //                CurrentPageSizeSum = '<%=Model.TotalRecords%>';
                // $(".label-mod #types ul").html(" <li class='current' dir='q1'><a class='c16' href='#'>全部(<%=Model.TotalRecords%> )</a></li>");
                totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
                $(".turn-ul").pager({ pagenumber: materialManageIndex, pagecount: CurrentPageNumber, buttonClickCallback: GetmaterialManage });
            }
        });

        //分页显示
        var flag = (materialManageIndex * CurrentPageSize) > CurrentPageSizeSum;
        $("#pages").text(CurrentPageSize * (materialManageIndex - 1) + 1);

        if (flag) {
            $("#number").text(CurrentPageSizeSum);
        } else {
            $("#number").text(materialManageIndex * CurrentPageSize);
        }

        if (flag) {
            return false;
        }

        if (PagesNumber < CurrentPageSize) {
            $("#number").text(PagesNumber);
        } else {
            $("#number").text(materialManageIndex * CurrentPageSize);
        }

    };
    $("#sum").text(CurrentPageSizeSum);
    //显示隐藏多图文


</script>
