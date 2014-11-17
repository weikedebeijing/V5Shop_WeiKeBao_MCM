<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%if (ViewData["ItemInDrpInfo"] != null)
      { %>
    <div>
        <% V5.MetaData.Customer.Model.ItemInDrpInfo itemInDrpInfo = (V5.MetaData.Customer.Model.ItemInDrpInfo)ViewData["ItemInDrpInfo"];%>
        <div class="MCM-C-M ">
            <div class="con style01">
                <div class="mod-tab-con">
                    <div class="search-bar">
                        <%--    <ul style="display: block;" class="ul-search">
                        <li>上一条：<a href="javascript:void(0)" class="c06">会员1</a></li>
                        <li>下一条：<a href="javascript:void(0)" class="c06">会员2</a></li>
                    </ul>--%>
                    </div>
                    <ul class="btn">
                        <li><a id="goBack" href="" title="返回" class="returnBtn">返回</a> 分销店铺列表 </li>
                    </ul>
                </div>
                <div id="separationLine" class="separationLine">
                </div>
                <div>
                    <%=itemInDrpInfo.ProductName %></div>
                <div class="separationLine">
                </div>
            </div>
            <div class="mod-table">
                <div class="mod-table-head">
                    <div class="con style01">
                        <table cellspacing="0" cellpadding="0" border="0" style="min-width: 740px;">
                            <colgroup>
                                <col style="width: 200px;">
                                <col style="width: 150px;">
                                <col style="width: 150px;">
                                <col style="width: 150px;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th class="x-tab">
                                        商家编码
                                    </th>
                                    <th class="x-tab">
                                        商品品类
                                    </th>
                                    <th class="x-tab">
                                        所属产品线
                                    </th>
                                    <th class="x-tab">
                                        分销店铺总数
                                    </th>
                                    <th>
                                    </th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="mod-table-main">
                    <div class="con style01" id="GetGradeViewFlag">
                        <table cellspacing="0" cellpadding="0" border="0" style="min-width: 740px;">
                            <colgroup>
                                <col style="width: 200px;">
                                <col style="width: 150px;">
                                <col style="width: 150px;">
                                <col style="width: 150px;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td>
                                        <%=itemInDrpInfo.OuterCode %>
                                    </td>
                                    <td>
                                        <%=itemInDrpInfo.CategoryName %>
                                    </td>
                                    <td>
                                        <%=itemInDrpInfo.ProductLineName %>
                                    </td>
                                    <td>
                                        <%=itemInDrpInfo.ShopCount %>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div style="height: 40px">
            </div>
            <div>
                分销店铺列表</div>
            <div class="separationLine">
            </div>
            <div style="clear: both;">
                <!--放表格的容器-->
                <div id="flexigridDiv">
                    <% 
                        Html.RenderAction("GetItemInDrpChannelList", new { CurrentPageIndex = 0, Where = "" });//首次加载，实际上不需要出现数据，数据有ajax请求呈现，这里将currentIndex置为0
                    %>
                </div>
                <!--放表格的容器-->
            </div>
        </div>
        <!--Page Start-->
        <div class="mod-page" style="display: none;">
            <div class="style01">
                <div class="mod-footer-page">
                    <div>
                        每页最多显示：15条</div>
                    <div class="footer-p-div2 tac">
                        <%--<div class="footer-p-div2 tac">
                    </div>--%>
                    </div>
                    <%-- <div class="float-r tar">
                        共有(<span id="span"></span>)条记录</div>--%>
                </div>
            </div>
        </div>
        <!--Page End-->
    </div>
    </div> </div>
    <%}
      else
      {%>
    <div class="errorDivContainer">
        <div class="errorDiv">
            该商品已下架或不存在！ <a href="javascript:history.go(-1);">返 回</a></div>
    </div>
    <%} %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <style type="text/css">
        #skuDetailTable th, td
        {
            /*width: 170px;*/
            height: 25px;
            line-height: 25px;
            text-align: left;
        }
        .errorDivContainer
        {
            width: 80%;
            text-align: center;
            float: left;
        }
        .errorDiv
        {
            width: auto;
            height: 32px;
            line-height: 32px;
            background-color: #cccccc;
            text-align: center;
            margin: 40px auto;
            display: inline-block;
            min-width: 300px;
        }
        .errorDiv a
        {
            color: #06c;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            var lastUrl = document.referrer;
            $("#goBack").attr("href", "index?appCode=C002&MenuCode=C115");
            SelectByGroupClick(1);
        });
        function GetPrice(obj, OuterNo, SessionKey) {
            var tagtd = $(obj).parent("td");
            tagtd.html('<img style="height: 16px" src="../../Images/loading.gif" />')
            $.ajax({
                type: "post",
                url: "../../Product/GetItemPrice",
                data: { "OuterNo": OuterNo, "SessionKey": SessionKey },
                success: function (jsonRes) {
                    tagtd.html(jsonRes);
                }
            });
//            alert("OuterNo=" + OuterNo + ",SeesionKey=" + SessionKey)
            //            alert(1);
        }
    </script>
</asp:Content>
