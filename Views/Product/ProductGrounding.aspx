<%@ Import Namespace="V5.App.BMC.UI.ViewModels.Product"%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<ProductPriceViewModel>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div>
   <div class="hr20 clear"></div>
                <div class="rapid-release l30">
                    <div class="mod-form">
                        <div class="con style03">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          <dl>
                <dt>请选择上架的店铺</dt>
         <%foreach (var item in Model.Shops) {%>
                <dd>
                    <input type="hidden" id="shopTitleCode" value="<%=item.Code %>"/>
                    <input id="shop01" type="checkbox"/>
                    <label class="r30" for="shop01"><%=item.Title%></label>
                </dd> <%} %>
          <%foreach (var item in Model.Shops)
                  {%> 
                <dt><input type="hidden" id="Hidden1" value="<%=item.Code %>"/><b><%=item.Title %>价格设置</dt>
                <dd>
                    <ul>
                        <li>
                            <input id="price01" type="checkbox"/>
                            <label class="r5" for="price01"><%=item.Title %>零售价 =<span id="qpricespan"><%=Model.SalesPrice%></span> X</label>
                            <input class="v5-input in50" type="text" id="qpricetext"/>
                            %
                        </li>
                        <li>
                            <input id="price02" type="checkbox"/>
                            <label class="r5" for="price02">参与直营会员折扣</label>
                        </li>
                    </ul>
                </dd>
                <% } %>
                <dt>分销商城价格设置</dt>
                <dd>
                    <ul>
                        <li>
                            <input id="price03" type="checkbox"/>
                            <label class="r5" for="price03">经销商采购价 = <span id="jpricespan"><%=Model.SalesPrice%>
                            </span>&nbsp;X</label>
                            <input class="v5-input in50" type="text"id="jpricetext"/>
                            %
                        </li>
                        <li>
                            <input id="price04" type="checkbox"/>
                            <label class="r5" for="price04">代销商采购价 = <span id="dpricespan"><%=Model.SalesPrice%></span> X</label>
                            <input class="v5-input in50" type="text" id="dpricetext"/>
                            %
                        </li>
                         <li>
                            <label class="r5">建议零售价 = <span><%=Model.SalesPrice%></span>&nbsp;X</label>
                            <input class="v5-input in50" type="text"/>
                            % ～ <span><%=Model.SalesPrice%></span>&nbsp;X 
                            <input class="v5-input in50" type="text"/>
                            %
                        </li>
                        <li>
                            <input id="price05" type="checkbox"/>
                            <label class="r5" for="price05">参与直营会员折扣</label>
                        </li>
                    </ul>
                </dd>
                <dt></dt>
                <dd>
                    <input id="cover" type="checkbox"/>
                    <label for="cover">
                        是否覆盖已存在商品
                        <span class="c01-6">（覆盖后相应商品浏览量、销量、相关评论等将清空）</span>
                    </label>
                </dd>
                <dt></dt>
                <dd>
                    <b id="bState"> 当前仅支持立刻上架</b>
                    <br />
                    <div><input type="button" value="上架" id="btnState" onclick="SetPrice()"/></div>
                </dd>
                </dl>
                </div>
                </div>
	  </div>   
      </div>

 <script src="../../Scripts/Js/SetProductPriceRequest.js" type="text/javascript"></script>
      <script type="text/javascript">
                  //设置渠道价格
          function SetPrice() {
              var productPrice = new ProductPriceRequest();
              //产品id
               productPrice.entity.ProductID = <%= Model.ProductID %>;
              // alert(productPrice.entity.ProductID);
              //经销商价格
              productPrice.entity.WholeSalePrice = $("#jpricespan").text() * $("#jpricetext").val();
              //分销价格
              productPrice.entity.DistributionPrice = $("#dpricespan").text() * $("#dpricetext").val();
              //渠道价格
              $("#table tr").each(function () {
                  var channecPriceListobj = new ChannelPricesList();
                  channecPriceListobj.entity.ChannelPrices.ProductID =  <%= Model.ProductID %>;

                  channecPriceListobj.entity.ChannelPrices.ChannelCode = $("#Shopcode").val();
                  channecPriceListobj.entity.ChannelPrices.SalePrice = $("#qpricespan").text() * $("#qpricetext").val();
                  channecPriceListobj.entity.ChannelPrices.EnableChannelDiscount = document.getElementById("rebate").checked;
                  productPrice.entity.ChannelPrices.push(channecPriceListobj.entity);
              });

              productPrice.entity.ChannelCode.push($("#shopTitleCode").val());

              var productPriceobj = JSON.stringify(productPrice.entity);
              $.ajax({
                  url: "../../Product/TrenchPrice",
                  type:"post",
                  data: { "productPrice": productPriceobj },
                  success: function (result) {
                      if (result != null) {
                      $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("渠道价格设置成功").change();
                      }
                  }
              })
          }
      </script>
    </b>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <link href="../../../Content/Css/css4.0/default.css" rel="stylesheet" type="text/css" />
</asp:Content>
