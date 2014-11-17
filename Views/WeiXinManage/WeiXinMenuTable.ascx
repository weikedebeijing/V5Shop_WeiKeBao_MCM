<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<div class="mod-table-head">
    <div class="con style0list">
        <table>
            <colgroup>
                <%--         <col style="width: 5%;">--%>
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 20%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: auto;">
            </colgroup>
            <tbody>
                <tr>
                    <%--  <th>
                        <label>
                            <input type="checkbox" onclick="CheckAll(event)" id="ckall" name="" value=""></label>
                    </th>--%>
                    <th>
                        顺序
                    </th>
                    <th>
                        菜单名
                    </th>
                    <th>
                        触发关键词或外链URL
                    </th>
                    <th>
                        点击次数
                    </th>
                    <th>
                        创建时间
                    </th>
                    <th>
                        修改时间
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
                <%--         <col style="width: 5%;">--%>
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 20%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: auto;">
            </colgroup>
            <tbody>
                <%if (Model.DataSource != null)
                  {
                      foreach (var item in Model.DataSource)
                      {%>
                <tr>
                    <%--  <td>
                        <div class="cell">
                            <label>
                                <input type="checkbox" onclick="CheckThis()" name="sub" value="">
                                <input type="hidden" value="<%=item.ID %>" name="name">
                            </label>
                        </div>
                    </td>--%>
                    <td>
                        <div class="cell">
                            <%=item.Order%></div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=item.MenuName%></div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=item.KeyOrUrl%></div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=item.ClickTimes%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=item.CreateDate%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=item.ModifyDate%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <div class="mod-operate">
                                <div class="con style0editdel">
                                    <a onclick="GoToLinkUrl(event)" linkurl="../../WeiXinManage/UpdateMenu?ID=<%=item.ID %>"
                                        href="javascript:void(0)" class="edit">编辑</a> <a dir="59" class="del" name="autoReolyDelect"
                                            href="javascript:void(0)" onclick="MenuDel(event,'<%=item.ID %>')">删除</a>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>
                    </td>
                </tr>
                <input type="hidden" id="MenuId" value="<%=item.ID %>" />
                <%  }
                  }%>
            </tbody>
        </table>
    </div>
</div>

<script type="text/javascript">
   $("#all").text(<%=Model.TotalRecords %>)

</script>
<%--<script type="text/javascript">
    function MenuDel(id) {
        if (confirmThis(this,"确认删除")) {
            $.ajax({
                url: "/WeiXinManage/DelMenu",
                type: "post",
                data: { "delIDsStr": id },
                success: function (res) {
                  
                    if (res == "0") {
                        $(".Loading").removeClass("style02 style03").addClass("style01");
                        $("#operateTip").html("删除成功").change();
                        RedirectToUrlByTime(window.location.href, 1000);
                    } else if (res == "2") {
                        $(".Loading").removeClass("style01 style03").addClass("style02");
                        $("#operateTip").html("有二级菜单的一级菜单不能删除").change();
                        RedirectToUrlByTime(window.location.href, 1000);
                    } else {
                        $(".Loading").removeClass("style01 style02").addClass("style03");
                        $("#operateTip").html("未能删除").change();
                    }
                }
            })
        }

    }
</script>
--%>