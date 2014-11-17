<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<% var templates = Model.DataSource; %>
<div class="mod-table">
    <div class="mod-table-head">
        <div class="con style0list">
            <table>
                <colgroup>
                    <col style="width: 5%;">
                    <col style="width: 30%;">
                    <col style="width: 20%;">
                    <col style="width: 30%;">
                    <col style="width: 15%;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                    <tr>
                        <th>
                            <label>
                                <input name="" id="ckall" type="checkbox" onclick="CheckAll(event)" value=""></label>
                        </th>
                        <th class="x-tab">
                            <%--<i class="icon-resize"></i>--%>模板名称
                        </th>
                        <th class="x-tab">
                            <%--<i class="icon-resize"></i>--%>模板类型
                        </th>
                        <th class="x-tab">
                            <%--<i class="icon-resize"></i>--%>快递公司
                        </th>
                        <th class="x-tab">
                            <%--<i class="icon-resize"></i>--%>操作
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
                    <col style="width: 20%;">
                    <col style="width: 30%;">
                    <col style="width: 15%;">
                    <col style="width: auto;">
                </colgroup>
                <tbody id="content">
                    <%--var templates = (List<V5.MetaData.Delivery.Model.Template>)ViewData["templates"];--%>
                    <%
                        var templateType = string.Empty;
                    %>
                    <%foreach (var template in templates)
                      { %>
                    <%
                        var templateID = template.ID;
                        templateType = template.TemplateType;
                        var ExpressID = template.ExpressID;
                    %>
                    <% if (templateType == "S")
                       { %>
                    <tr class="tr-Current" style="color: #06c;">
                        <td>
                            <div class="cell">
                                <label>
                                    <input name="sub" type="checkbox" id="checkbox_<%:template.ID %>" value="" onclick="CheckThis()" /></label>
                            </div>
                        </td>
                        <td>
                            <div class="cell">
                                <%:template.TemplateName%></div>
                        </td>
                        <td>
                            <% if (templateType == "S")
                               { %>
                            <div class="cell">
                                系统模板</div>
                            <%}
                               else
                               {%>
                            自定义模板
                            <%} %>
                        </td>
                        <td>
                            <div class="cell">
                                <%:template.ExpressName%></div>
                        </td>
                        <td>
                            <div class="cell">
                                <div class="mod-operate">
                                    <div class="con style0editdel">
                                        <a class="edit"  href="javascript:void(0);"  linkUrl="/Logistics/EditPrintTemplate?ID=<%:templateID %>" onclick=" GoToLinkUrl(event)">
                                            编辑</a> <a class="view" id="view01" onclick="javascript:printTemplateDetail(<%:templateID %>);"
                                                href="javascript:void(0);">查看</a>
                                        </div>
                                 </div>
                            </div>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <%}
                       else
                       {%>
                    <tr class="tr-Current">
                        <td>
                            <div class="cell">
                                <label>
                                    <input name="sub" type="checkbox" id="checkbox_<%:template.ID %>" value="" onclick="CheckThis()" /></label>
                            </div>
                        </td>
                        <td>
                            <div class="cell">
                                <%:template.TemplateName%></div>
                        </td>
                        <td>
                            <% if (templateType == "S")
                               { %>
                            <div class="cell">
                                系统模板</div>
                            <%}
                               else
                               {%>
                            自定义模板
                            <%} %>
                        </td>
                        <td>
                            <div class="cell">
                                <%:template.ExpressName%></div>
                        </td>
                        <td>
                            <div class="cell">
                                <div class="mod-operate">
                                    <div class="con style0editdel">
                                <a class="edit" href="javascript:void(0);"  linkUrl="/Logistics/EditPrintTemplate?ID=<%:templateID %>" onclick=" GoToLinkUrl(event)">编辑</a>
                                <a class="del" onclick="javascript:DeletePrintTemplate(event,<%:templateID %>);" href="#">删除</a>
                                <a class="view" id="view01" onclick="javascript:printTemplateDetail(<%:templateID %>);" href="javascript:void(0);">
                                    查看</a>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <%} %>
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
    function GetPrintTemplateView(pageclicknumber) {

        //点击事件
        currentPageIndex = pageclicknumber;
        $.ajax({
            async: false,
            type: "Post",
            url: '/Logistics/GetPrintTemplateView',
            data: { "CurrentPageIndex": currentPageIndex, "Where": searchQuery.Query, "Groups": searchQuery.Groups },
            dataType: "html",
            success: function (responseData) {
                $(".sourcelist").html(responseData); //render table 

                // 调用分页器
                $("#dvPage").pager({ pagenumber: pageclicknumber, pagecount: totalPageNumber, buttonClickCallback: GetPrintTemplateView });
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
