<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>商品详细</title>
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=default|mcm"></script>
</head>
<body class="alertbody" style="margin: 20px 20px 20px 20px">
    <%if (ViewData["productObj"] != "")
      { %>
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
    <%V5.MetaData.Product.View.ProductView productObj = ViewData["productObj"] as V5.MetaData.Product.View.ProductView;%>
    <div style="width: 650px; height: 400px; position: relative;" class="content scroll">
        <!--product summary begin-->
        <div class="pro-summary">
            <div class="pic c03">
                <img src="/<%=productObj.Product.DefaultImageData%>" alt="商品主图"></div>
            <div class="text">
                <h2>
                    <%= productObj.Product.Name%></h2>
                <div class="attribute">
                    <span>商品品类：</span><%= ViewData["TBCategoryName"].ToString()%><br>
                    <span>商家编码：</span><%= productObj.Product.OuterCode%><span class="l15">产品线：</span><%= ViewData["productLineName"].ToString()%><span
                        class="l15">规格数量：</span><%= productObj.DetailList.Count%>
                </div>
            </div>
        </div>
        <!--product summary end-->
        <!--parameter begin-->
        <div class="h10">
        </div>
        <!--title begin-->
        <div class="mod-title t10">
            <div class="con style03">
                <h2>
                    SKU分布</h2>
            </div>
        </div>
        <!--title end-->
        <!--table begin-->
        <div class="mod-table t5">
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
                                    <div class="cell">
                                        <%
                                        if (item.ChannelCode == "C001")
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
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <%=item.SKUCount%></div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <%=item.State == 1 ? "在售" : "仓库中"%></div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <%=item.PriceRange%></div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <%=item.TotalStock%></div>
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
        <!--table end-->
        <!--parameter end-->
        <!--parameter02 begin-->
        <div class="h10">
        </div>
        <!--title begin-->
        <div class="mod-title t10">
            <div class="con style03">
                <h2>
                    规格列表</h2>
            </div>
        </div>
        <!--title end-->
        <!--table begin-->
        <div class="mod-table t5">
            <div class="mod-table-head">
                <div class="con style0list-bg">
                    <table>
                        <colgroup>
                            <col style="width: 15%">
                            <col style="width: 20%">
                            <col style="width: 15%">
                            <col style="width: 20%">
                            <col style="width: 15%">
                            <col style="width: 15%">
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
            <div class="mod-table-main">
                <div class="con style0dotted">
                    <table>
                        <colgroup>
                            <col style="width: 15%">
                            <col style="width: 20%">
                            <col style="width: 15%">
                            <col style="width: 20%">
                            <col style="width: 15%">
                            <col style="width: 15%">
                            <col style="width: auto">
                        </colgroup>
                        <tbody>
                            <%var i = 0; var str = "";
                              foreach (var item in productObj.DetailList)
                              {%>
                            <tr>
                                <td>
                                    <div class="cell">
                                        <%
                                            i = 0;
                                            str = "";
                                            foreach (var item2 in item.SpecificationList)
                                            {
                                                i++;
                                                str += item2.ProductSpecification.Alias == "" ? item2.ProductSpecification.Name : item2.ProductSpecification.Alias;
                                                if (i != item.SpecificationList.Count)
                                                {
                                                    str += "、";
                                                } %>
                                        <% } %>
                                        <span title="<%=str %>">
                                            <%=str %></span>
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <%=item.ProductDetail.OuterCode%></div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <%=item.ProductDetail.CostPrice%></div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <% var skuDic = ViewData[" "] as Dictionary<int, string>;
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
                                    </div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <%=ViewData["skuSaleState"].ToString() == "1" ? "在售" : "仓库中"%></div>
                                </td>
                                <td>
                                    <div class="cell">
                                        <%=item.ProductDetail.Stock%></div>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!--table end-->
        <!--parameter02 end-->
    </div>
    <%
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
</body>
</html>
