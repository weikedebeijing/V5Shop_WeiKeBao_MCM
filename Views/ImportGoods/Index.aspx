<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="V5.MetaData.Market.Model" %>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=mcm"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% List<Shop> list = ViewData["list"] as List<Shop>; %>
    <script type="text/javascript">

        function Open(code) {
            $.ajax({
                url: "../../ImportGoods/StartImport?Code=" + code,
                dataType: 'json',
                success: function (result) {
                    if (result.Code == null && result.Message == null) {
                        window.location.href = "/ImportGoods/ExecuteImport?appCode=PLATFORM&MenuCode=C110";
                    } else {
                        alert(result.Message)
                    }
                }
            });
        }

    </script>
    <div class="mod-title t10">
        <div class="con style0h1-02">
            <h1 class="spanTitle">
                一键导入商品</h1>
        </div>
    </div>
    <!--步骤 begin-->
    <div class="inport">
        <div class="step01">
        </div>
            <div class="mod-operate t20 overflow">
                <div class="con style0list">
                    <ul class="ul-list">
                       <li><a class="a-btn" target="_blank" href="/Shop/Index?appCode=PLATFORM&MenuCode=C105">新增授权店铺</a>
                       </li> 
                    </ul>
                </div>
            </div>
        <div class="mod-table t10 clear">
            <div class="mod-table-head">
                <div class="con style0list-bg">
                    <table>
                        <colgroup>
                            <col style="width: 33%">
                            <col style="width: 33%">
                            <col style="width: 33%">
                            <col style="width: auto">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>
                                    店铺名称
                                </th>
                                <th>
                                    授权情况
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
                <div class="con style0dotted">
                    <table>
                        <colgroup>
                            <col style="width: 33%">
                            <col style="width: 33%">
                            <col style="width: 33%">
                            <col style="width: auto">
                        </colgroup>
                        
                        <tbody>
                        <%foreach (var item in list)
                          {%>
                            <tr>
                                <%--<td><%=item.ID%></td>--%>
                                <td>
                                    <div class="cell">
                                        <a class="c07" href="javascript:Open('<%=item.ChannelCode %>');"><span class="icon-taobao">
                                        </span>
                                            <%=item.Title%>
                                        </a>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <span class="c01-4">已授权</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <a href="javascript:void(0)" id="b1" class="r5 c07" onclick="Open('<%=item.ChannelCode %>')">
                                            开始导入</a>
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
    </div>
</asp:Content>
