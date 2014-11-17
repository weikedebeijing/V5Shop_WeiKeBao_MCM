<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="MCM-N-L" style="margin-top:15px;">
        <div class="MCM-C-M">
            <%--添加成功后把结果放到<span>标签中--%>
            <!--标题 begin-->
            <div class="mod-table">
                <div class="mod-table-head">
                    <div class="con style01">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <colgroup>
                                <col style="width: 30%;">
                                <col style="width: 30%;">
                                <col style="width: 30%;">
                                <col style="width: 10%;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <%--<th>
                                        <label>
                                            <input name="" id="ckall" type="checkbox" value=""></label>
                                    </th>--%>
                                    <th class="x-tab">
                                        <%--<i class="icon-resize"></i>--%>商品组名称
                                    </th>
                                    <th class="x-tab">
                                        <%--<i class="icon-resize"></i>--%>备注
                                    </th>
                                    <th class="x-tab">
                                        <%--<i class="icon-resize"></i>--%>创建日期
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
                    <div class="con style0line" style="width: 100%; height: 500px;">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <colgroup>
                                <col style="width: 30%;">
                                <col style="width: 30%;">
                                <col style="width: 30%;">
                                <col style="width: 10%;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody id="content">
                                <%var SysGroups = (List<V5.MetaData.DRP.Model.SysGroup>)ViewData["SysGroups"]; %>
                                <%for (int i = 0; i < SysGroups.Count(); i++)
                                  { %>
                                <%var SysGroupID = SysGroups[i].ID; %>
                                <tr class="tr-Current">
                                    <%--<td>
                                        <div class="cell">
                                            <label>
                                                <input name="" type="checkbox" id="checkbox_<%:Users[i].ID %>" value="" /></label>
                                        </div>
                                    </td>--%>
                                    <td>
                                        <div class="cell">
                                            <%:SysGroups[i].Name%></div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            <%:SysGroups[i].Remark%></div>
                                    </td>
                                     <td>
                                        <div class="cell">
                                            <%:SysGroups[i].DateCreated%></div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            <span class="c07"><a href="#" onclick="javascript:itemGroupEdit(<%:SysGroupID %>);">编辑</a> </span>
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
        <!--Page Start-->
        <!--Page End-->
    </div>
    <script src="../../Scripts/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            // 注册全选
            checkAll();
        });

        // 商品分组的编辑
        function itemGroupEdit(SysGroupID) {
            window.location.href = "/ItemGroup/ItemGroupEdit?SysGroupID=" + SysGroupID + "";
        };

    </script>
</asp:Content>
