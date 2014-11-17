<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <body>
        <% List<V5.MetaData.DRP.Model.DrpTemplate> TemplateList = (List<V5.MetaData.DRP.Model.DrpTemplate>)ViewData["TemplateList"];%>
        <% string ajaxUrl = ViewData["ajaxUrl"].ToString();%>
        <div class="Loading" id="ResultTip">
        </div>
        <!--加载end-->
        <!--Left Start-->
        <div class="MCM-N-L">
            <!--展开高级搜索时加class="MCM-N-L MCM-Open"-->
            <div class="MCM-C-M">
                <!--标题 begin-->
                <div class="mod-title">
                    <div class="con style02">
                        <h1>
                            分销模板</h1>
                    </div>
                </div>
                <!--标题 end-->
                <!--操作栏 begin-->
                <div class="mod-operate">
                    <div class="con style01">
                        <ul class="btn">
                            <li><a href="../../DRPSetting/AddTemplate" class="a-btn">添加</a></li>
                            <li><a class="a-btn" onclick="javascript:EditBtn()" href="javascript:void(0)">加载</a></li>
                            <li><a href="javascript:void(0)" id="DeleteBatch" onclick="javascript:DeleteBatch();"
                                class="a-btn" style="display: none">删除</a></li>
                        </ul>
                    </div>
                </div>
                <!--操作栏 end-->
                <!--列表 Start-->
                <div class="mod-table">
                    <div class="mod-table-head">
                        <div class="con style01">
                            <table cellspacing="0" cellpadding="0" border="0" style="min-width: 740px;">
                                <colgroup>
                                    <col style="width: 5%;">
                                    <col style="width: 20%;">
                                    <col style="width: 20%;">
                                    <col style="width: 20%;">
                                    <col style="width: 20%;">
                                    <col style="width: 15%;">
                                    <col style="width: auto;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th>
                                            <label>
                                                <input type="checkbox" id="ckall" name="" value="" onclick="javascript:checkAll()"></label>
                                        </th>
                                        <th class="x-tab">
                                            编号
                                        </th>
                                        <th class="x-tab">
                                            名称
                                        </th>
                                        <th class="x-tab">
                                            建立日期
                                        </th>
                                        <th class="x-tab">
                                            作者
                                        </th>
                                        <th class="x-tab">
                                            是否加载
                                        </th>
                                        <th>
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="mod-table-main">
                        <div style="height: 280px;" class="con style0line" id="GetPaymentViewFlag" style="min-width: 740px;">
                            <table cellspacing="0" cellpadding="0" border="0">
                                <colgroup>
                                    <col style="width: 5%;">
                                    <col style="width: 20%;">
                                    <col style="width: 20%;">
                                    <col style="width: 20%;">
                                    <col style="width: 20%;">
                                    <col style="width: 15%;">
                                    <col style="width: auto;">
                                </colgroup>
                                <tbody id="content">
                                    <%foreach (V5.MetaData.DRP.Model.DrpTemplate template in TemplateList)
                                      { %>
                                    <tr class="tr-Current">
                                        <td>
                                            <label>
                                                <input type="checkbox" id="Checkbox1" name="" value="<%=template.ID %>"></label>
                                        </td>
                                        <td class="cell">
                                            <%=template.Number%>
                                        </td>
                                        <td class="cell">
                                            <%=template.Name%>
                                        </td>
                                        <td class="cell">
                                            <%=template.Date%>
                                        </td>
                                        <td class="cell">
                                            <%=template.Author%>
                                        </td>
                                        <td class="cell">
                                            <%if (template.IsAct == 1)
                                              { %>
                                            是
                                            <%}
                                              else
                                              {%>
                                            否
                                            <%} %>
                                        </td>
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!--列表 End-->
            </div>

        </div>
        <!--Left End-->
        <input type="hidden" id="ajaxUrl" value="<%=ajaxUrl %>" />
    </body>
    <script src="../../Scripts/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            // 默认把操作结果隐藏
            $("#ResultTip").css("display", "none");
        });


        function EditBtn() {
            var strIDs = new Array();
            $("#content input[type=checkbox]").each(function () {
                if ($(this).attr("checked") == "checked") {
                    strIDs.push($(this).val());
                }


            })

            if (strIDs.length > 0) {

                if (strIDs.length == 1) {
                    var url = $("#ajaxUrl").val() + "?action=actTemplate&TemplateId=" + strIDs;
                    $.getScript(url, function (data) {

                    });

                } else {
                    $("#ResultTip").css("display", "block").text("只能选择一套模板进行加载");
                }
            } else {
                $("#ResultTip").css("display", "block").text("选择需要加载的模板");
            }
        }



        // 单个删除
        function DeleteSingle(ID) {
            if (confirm("确定要删除此条数据？")) {
                $.post("/Customer/DeleteSingle", "GradeID=" + ID + "", function (returnData) {
                    if (returnData == "ok") {
                        // 把添加成功放到<span>中
                        $("#ResultTip").css("display", "block").text("删除会员等级成功");
                        window.location.href = "../../Customer/GradeList";
                    } else if (returnData == "is default") {
                        $("#ResultTip").css("display", "block").text("默认等级不能删除，可以修改");
                    } else {
                        $("#ResultTip").css("display", "block").text("删除会员等级失败");
                    }
                });
            } else {
                return false;
            };
        };

        // 全选
        function checkAll() {

            var checkAllState = $("#ckall").attr("checked");
            if (checkAllState == "checked") {
                $("#content input[type=checkbox]").attr("checked", "checked");
            } else {
                $("#content input[type=checkbox]").attr("checked", false);
            };

        };
        function posttrue() {
            location.reload();
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>
