<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="MCM-N-L">
        <!--展开高级搜索时加class="MCM-N-L MCM-Open"-->
        <div class="MCM-C-M">
            <!--标题 begin-->
            <div class="mod-title">
                <div class="con style01">
                    <h1>
                        订单设置</h1>
                </div>
            </div>
            <!--标题 end-->
            <!--选项卡 begin-->
            <div class="mod-tab">
                <div class="con style01">
                    <ul>
                        <li><a >常规</a></li>
                        <li><a >标签</a></li>
                      <%--  <li class="current"><a class="c16">分组</a></li>--%>
                        <li class="current"><a class="c16">问题订单</a></li>
                    </ul>
                </div>
            </div>
            <!--选项卡 end-->
            <!--操作栏 begin-->
            <div class="mod-operate">
                <div class="con style01">
                    <ul class="btn">
                        <li><a href="/OrderSet/AddOrderGroup" class="a-btn">添加分组条件</a> </li>
                    </ul>
                </div>
            </div>
            <!--操作栏 end-->
            <!--列表 Start-->
            <div class="mod-table">
                <div class="mod-table-head">
                    <div class="con style01">
                        <table border="0" cellspacing="0" cellpadding="0">
                            <colgroup>
                                <col style="width: 100px;">
                                <col style="width: 100px;">
                                <col style="width: 100px;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th class="x-tab">
                                        名称
                                    </th>
                                    <th class="x-tab">
                                        分类
                                    </th>
                                    <th class="x-tab">
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
                    <div style="height: 280px;" class="con style01">
                        <table border="0" cellspacing="0" cellpadding="5">
                            <colgroup>
                                <col style="width: 100px;">
                                <col style="width: 100px;">
                                <col style="width: 100px;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
                                <tr class="tr-Current">
                                    <td>
                                        <div class="cell">
                                            全场免邮</div>
                                        <!--<span class="flag-gray"></span>-->
                                    </td>
                                    <td>
                                        <div class="cell">
                                            已启用</div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            <span class="c07"><a class="r15" href="添加或编辑商品-分类.html">编辑</a> <a target="_blank"
                                                href="">删除</a> </span>
                                        </div>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="cell">
                                            热销<!--<span class="flag-gray"></span>--></div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            已禁用</div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            <span class="c07"><a class="r15" href="添加或编辑商品-分类.html">编辑</a> <a target="_blank"
                                                href="">删除</a> </span>
                                        </div>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!--列表 End-->
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/Js/orderset.js" type="text/javascript"></script>
</asp:Content>
