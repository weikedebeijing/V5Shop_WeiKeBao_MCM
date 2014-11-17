<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var articleGroups = (List<V5.MetaData.DRP.Model.ArticleGroup>)ViewData["articleGroups"];
    %>
    <div class="MCM-N-L">
        <div class="MCM-C-M">
            <!--标题 begin-->
            <%--添加成功后把结果放到<span>标签中--%>
            <div class="mod-title" style="margin-bottom: 0px; margin-top: 18px;">

            </div>
            <!--标题 end-->
            <!--操作栏 begin-->
            <div class="mod-operate">
                <div class="con style01">
                    <ul class="btn">
                        <li class="hidden"><a class="a-btn" href="../../BrandSetting/AddBrandSetting">添加</a>
                        </li>
                        <li class="hidden"><a class="a-btn" href="#" onclick="javascript:DeleteBrandSettings();">
                            刪除</a> </li>
                    </ul>
                </div>
            </div>
            <!--操作栏 end-->
            <!--List Start-->
            <div class="mod-table">
                <div class="mod-table-head">
                    <div class="con style01">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <colgroup>
                                <col style="width: 50px;">
                                <col style="width: 200px;">
                                <%-- <col style="width: 400px;">--%>
                                <col style="width: 180px;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <label>
                                            <input name="" id="ckall" type="checkbox" value=""></label>
                                    </th>
                                    <th class="x-tab">
                                        <%--<i class="icon-resize"></i>--%>品牌名称
                                    </th>
                                    <%--<th class="x-tab">
                                        <i class="icon-resize"></i>操作范围
                                    </th>--%>
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
                    <div class="con style0line" style="width: 100%; height: 500px;">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <colgroup>
                                <col style="width: 50px;">
                                <col style="width: 200px;">
                                <%-- <col style="width: 400px;">--%>
                                <col style="width: 180px;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody id="content">
                                <%for (int i = 0; i < articleGroups.Count(); i++)
                                  { %>
                                <%var roleID = articleGroups[i].ID; %>
                                <tr class="tr-Current">
                                    <td>
                                        <div class="cell">
                                            <label>
                                                <input name="" type="checkbox" id="checkbox_<%:articleGroups[i].ID %>" value="" /></label>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            <%:articleGroups[i].Title%></div>
                                    </td>
                                    <%-- <td>
                                            <div class="cell">
                                                ****</div>
                                        </td>--%>
                                    <td>
                                        <div class="cell">
                                            <span class="c07"><a href="#" onclick="javascript:BrandSettingEdit(<%:articleGroups[i].ArticleID%>)">
                                                编辑&nbsp;&nbsp;</a> </span><span class="c07"><a href="#" onclick="javascript:DeleteBrandSetting(<%:articleGroups[i].ArticleID%>)">
                                                    &nbsp;&nbsp;删除</a> </span>
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
            <!--List End-->
        </div>

    </div>
    <script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            // 默认把操作结果隐藏
            $("#ResultTip").css("display", "none");

            // 注册全选
            checkAll();
        });

        // 全选
        function checkAll() {
            $("#ckall").click(function () {

                var checkAllState = $("#ckall").attr("checked");
                if (checkAllState == "checked") {
                    $("#content input[type=checkbox]").attr("checked", "checked");
                } else {
                    $("#content input[type=checkbox]").attr("checked", false);
                };
            });
        };

        // 批量删除
        function DeleteBrandSettings() {
            var strIDs = new Array();
            var checks = $("#content input[type=checkbox]");

            for (var i = 0; i < checks.length; i++) {
                var check = $(checks[i]).attr("checked");

                if (check == "checked") { // 如果checkbox被选中

                    // 取出 id  形如checkbox_7
                    var checkID = $(checks[i]).attr("id");

                    var strID = checkID.substring(9, checkID.length);
                    strIDs.push(strID);
                }
            }

            // 如果存储id的数组不为空
            if (strIDs.length > 0) {
                if (confirm("确定要删除选中的项？")) {
                    $.ajax({
                        url: "/BrandSetting/DeleteBrandSetting",
                        data: "IDs=" + strIDs + "",
                        type: "post",
                        success: function (succData) {
                            if (succData == "ok") {
                                $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                                $("#operateTip").html("删除成功").change();
                                window.location.reload();
                            } else {
                            $(".Loading").removeClass("style0red style0green").addClass("style0yellow");
                            $("#operateTip").html(succData).change();
                            }
                        },
                        error: function (errData) {
                            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                            $("#operateTip").html("删除失败，联系管理员").change();
                        }
                    });
                } else {
                    return false;
                }
            } else {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请选中要删除的项").change();
                return false;
            }

        };

        // 单条删除
        function DeleteBrandSetting(articleID) {
            if (confirm('确定要删除?')) {
                $.ajax({
                    url: "/BrandSetting/DeleteBrandSetting",
                    data: { "articleID": articleID },
                    type: "post",
                    success: function (returnData) {
                        if (returnData == "ok") {
                            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                            $("#operateTip").html("删除成功").change();
                            window.location.reload();
                        }
                    }
                });
            }
        };

        // 品牌编辑
        function BrandSettingEdit(ArticleID) {
            window.location.href = "/BrandSetting/BrandSettingEdit?ArticleID=" + ArticleID + "";
        };

    </script>
</asp:Content>
