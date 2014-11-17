<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="V5.MetaData.Product.Messaging" %>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=mcm"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% ImportResult list = ViewData["list"] as ImportResult; %>
    <script type="text/javascript" language="javascript">

        $(function () {
            $("[name=chk_all]").click(function () {
                $("[name=chk_item]").prop("checked", $(this).prop("checked"));
            });
        });

        function OpenImport() {

            var arrList = new Array();
            $("[name=chk_item]").each(function () {
                if ($(this).prop("checked")) {
                    arrList.push($(this).val());
                }
            });

            if (arrList.length == 0) {
            $(".Loading").removeClass("style0red style0green").addClass("style0yellow");
            $("#operateTip").html("请选择订单").change();
                return;
            }

            $.ajax({
                contentType: "application/json",
                url: "/ImportGoods/StartImportFail",
                data: { multiNumID: JSON.stringify(arrList) },
                dataType: 'json',
                success: function (result) {
                    if (result.Code == null && result.Message == null) {
                        window.location.href = "/ImportGoods/ExecuteImport?appCode=PLATFORM&MenuCode=C110";
                    } else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html(result.Message).change();
                    }
                }
            })
        }
    </script>
    <div class="mod-title t10">
        <div class="con style0h1-02">
            <h1 class="spanTitle">
                一键导入商品</h1>
        </div>
    </div>
    <div class="inport">
        <div class="step03">
        </div>
        <div class="inport-warn">
            <i class="icon-warn"></i><span class="text">导入成功<%=Session["SucceedCount"] %>条，导入失败 <b class="c03"><%=Session["FailCount"] %></b>条！ </span>
        </div>
    </div>
    <!--操作 begin-->
    <div class="mod-operate">
        <div class="con style02">
            <ul class="btn">
                <li><a class="a-btn" onclick="javascript:OpenImport()">重新导入</a> </li>
            </ul>
        </div>
    </div>
    <!--操作 end-->
    <!--列表 begin-->
    <div class="mod-table t10" style="clear: both; width: 1150px;">
        <div class="mod-table-head">
            <div class="con style0list-bg">
                <table>
                    <colgroup>
                        <col style="width: 50px;" />
                        <col style="width: 100px;" />
                        <col style="width: 250px;" />
                        <col style="width: 749px;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>
                                <label>
                                    <input type="checkbox" name="chk_all" value="" /></label>
                            </th>
                            <th>
                                商品名称
                            </th>
                            <th>
                                商家编码
                            </th>
                            <th>
                                失败原因
                            </th>
                            <th>
                            </th>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="mod-table-main">
            <div class="con style0dotted">
                <table>
                    <colgroup>
                        <col style="width: 50px;" />
                        <col style="width: 100px;" />
                        <col style="width: 250px;" />
                        <col style="width: 749px;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <%
                            foreach (var item in list.Errors)
                            {
                        %>
                        <tr>
                            <td>
                                <div class="cell">
                                    <label>
                                        <input type="checkbox" name="chk_item" value="<%=item.ExtItemID%>" />
                                    </label>
                                </div>
                            </td>
                            <td>
                                <div class="cell">
                                    <%=item.Name %></div>
                            </td>
                            <td>
                                <div class="cell">
                                    <%=item.ItemID %></div>
                            </td>
                            <td>
                                <div class="cell">
                                    <span class="c03">
                                        <%=item.Message %></span>
                                </div>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!--列表 end-->
</asp:Content>
