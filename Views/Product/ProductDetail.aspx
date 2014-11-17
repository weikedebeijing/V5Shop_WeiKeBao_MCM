<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <link href="../../../Content/Css/css4.0/product.css" rel="stylesheet" type="text/css" />
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%if (ViewData["productObj"] != "")
      { %>
    <!--标题 begin-->
    <div class="mod-title t10">
        <div class="con style0h1-02">
            <h1 class="spanTitle">
                商品详情</h1>
            <div class="mod-page">
                <div class="con style0list">
                    <div class="turn">
                        <ul class="turn-ul">
                            <%List<V5.MetaData.Product.Model.Product> listResult = ViewData["preAndNext"] as List<V5.MetaData.Product.Model.Product>; %>
                            <a id="nextA" href="../../Product/ProductDetail?appCode=&productID=<%=listResult[1].ID %>&&MenuCode=">
                                <li class="next"></li>
                            </a><a id="preA" href="../../Product/ProductDetail?appCode=&productID=<%=listResult[0].ID %>&&MenuCode=">
                                <li class="prev"></li>
                            </a>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--标题 end-->
    <script type="text/javascript">
        var appCode = GetUrlAppCode();
        var menuCode = GetUrlMenuCode();
        var href = "";
        href = $("#preA").attr("href");
        href = href.replace("appCode=", "appCode=" + appCode).replace("MenuCode=", "MenuCode=" + menuCode);
        $("#preA").attr("href", href);
        href = $("#nextA").attr("href");
        href = href.replace("appCode=", "appCode=" + appCode).replace("MenuCode=", "MenuCode=" + menuCode);
        $("#nextA").attr("href", href);
    </script>
    <div class="pro-summary">
        <%V5.MetaData.Product.View.ProductView productObj = ViewData["productObj"] as V5.MetaData.Product.View.ProductView;%>
        <div class="pic c03">
            <img src="/<%=productObj.Product.DefaultImageData%>" alt="商品主图" />
        </div>
        <div class="text">
            <h2>
                <%= productObj.Product.Name%></h2>
            <div class="attribute">
                <span>商品品类：</span>
                <%= ViewData["TBCategoryName"].ToString()%>
                <br>
                <span>商家编码：</span>
                <%= productObj.Product.OuterCode%><span class="l15">产品线：</span>
                <%= ViewData["productLineName"].ToString()%>
                <span class="l15">规格数量：</span>
                <%= productObj.DetailList.Count%>
            </div>
        </div>
    </div>
    <div class="h10">
    </div>
    <div class="mod-title">
        <div class="con style02">
            <h2>
                SKU分布</h2>
        </div>
    </div>
    <div class="mod-table">
        <div class="mod-table-head">
            <div class="con style0list-bg">
                <table>
                    <colgroup>
                        <col style="width: 20%">
                        <col style="width: 20%">
                        <col style="width: 20%">
                        <col style="width: 20%">
                        <col style="width: 20%">
                        <col style="width: auto">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>
                                店铺名称
                            </th>
                            <th>
                                在售SKU数量
                            </th>
                            <th>
                                销售状态
                            </th>
                            <th>
                                售价范围
                            </th>
                            <th>
                                库存数量
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
                        <col style="width: 20%">
                        <col style="width: 20%">
                        <col style="width: 20%">
                        <col style="width: 20%">
                        <col style="width: 20%">
                        <col style="width: auto">
                    </colgroup>
                    <tbody>
                        <%List<V5.App.BMC.UI.ViewModels.Product.ProductChennelInfoModel> list = ViewData["productChannelList"] as List<V5.App.BMC.UI.ViewModels.Product.ProductChennelInfoModel>;
                          string drpUrl = ViewData["drpUrl"] == null ? "" : ViewData["drpUrl"].ToString();
                          foreach (var item in list)
                          {  %>
                        <tr>
                            <td>
                                <%if (item.ChannelCode == "C002")
                                  {%>
                                <a class="c07" target="_blank" href="<%=drpUrl %>/product.aspx?id=<%= productObj.Product.ID%>"><span
                                    class="icon-fenxiao"></span>
                                    <%=item.ChannelName%>
                                </a>
                                <% }
                                  else if (item.ChannelCode == "C001")
                                  {%>
                                <a class="c07" href="javascript:void(0);"><span class="icon-wechat"></span>
                                    <%=item.ChannelName%>
                                </a>
                                <%}
                                  else
                                  {%>
                                <a class="c07" target="_blank" href="http://item.taobao.com/item.htm?id=<%=item.Numiid%>">
                                    <span class="icon-taobao"></span>
                                    <%=item.ChannelName%>
                                </a>
                                <% }%>
                            </td>
                            <td>
                                <%=item.SKUCount%>
                            </td>
                            <td>
                                <%=item.State == 1 ? "在售" : "仓库中"%>
                            </td>
                            <td>
                                <%=item.PriceRange%>
                            </td>
                            <td>
                                <%=item.TotalStock%>
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
    <div class="h10">
    </div>
    <%if (productObj.Product.IsSpecificationEnabled == true)
      { %>
    <div class="mod-title">
        <div class="con style02">
            <h2>
                规格列表</h2>
        </div>
    </div>
    <div class="mod-table">
        <div class="mod-table-head">
            <div class="con style0list-bg">
                <table>
                    <colgroup>
                        <col style="width: 20%">
                        <col style="width: 20%">
                        <col style="width: 15%">
                        <col style="width: 20%">
                        <col style="width: 15%">
                        <col style="width: 10%">
                        <col style="width: auto">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>
                                商品规格
                            </th>
                            <th>
                                商家编码
                            </th>
                            <th>
                                成本价
                            </th>
                            <th>
                                售价范围
                            </th>
                            <th>
                                商品状态
                            </th>
                            <th>
                                库存数量
                            </th>
                            <th>
                            </th>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="mod-table-main" id="detailSpecTable">
            <div class="con style0dotted">
                <table>
                    <colgroup>
                        <col style="width: 20%">
                        <col style="width: 20%">
                        <col style="width: 15%">
                        <col style="width: 20%">
                        <col style="width: 15%">
                        <col style="width: 10%">
                        <col style="width: auto">
                    </colgroup>
                    <tbody>
                        <%foreach (var item in productObj.DetailList)
                          {%>
                        <tr>
                            <td>
                                <%foreach (var item2 in item.SpecificationList)
                                  {%>
                                <span>
                                    <%=item2.ProductSpecification.Alias == "" ? item2.ProductSpecification.Name : item2.ProductSpecification.Alias%></span><span>、</span>
                                <% } %>
                            </td>
                            <td>
                                <%=item.ProductDetail.OuterCode%>
                            </td>
                            <td>
                                <%=item.ProductDetail.CostPrice%>
                            </td>
                            <td>
                                <% var skuDic = ViewData["skuDic"] as Dictionary<int, string>;
                                   string priceRange = "";
                                   if (skuDic != null)
                                   {
                                       foreach (var itemSku in skuDic)
                                       {
                                           if (itemSku.Key == item.ProductDetail.ID)
                                           {
                                               priceRange = itemSku.Value;
                                           }
                                       }
                                   }
                                %>
                                <%=priceRange%>
                            </td>
                            <td>
                                <%=ViewData["skuSaleState"].ToString() == "1" ? "在售" : "仓库中"%>
                            </td>
                            <td>
                                <%=item.ProductDetail.Stock%>
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
    <% }
      }
      else
      {%>
    <div class="errorDivContainer">
        <div class="errorDiv">
            该商品已下架或不存在！ <a href="javascript:history.go(-1);">返 回</a></div>
    </div>
    <%} %>
    <script type="text/javascript">
        $(function () {
            $("#detailSpecTable table tr td").each(function () {
                $("span:last", $(this)).remove();
            })
        })
    </script>
</asp:Content>
