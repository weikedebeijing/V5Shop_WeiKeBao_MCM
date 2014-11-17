<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BootstrapSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script type="text/javascript" src="../../Scripts/bootstrap/BootstrapCssLoadV2.js?Item=set"></script>
    <script>
        $(document).ready(function () {
            $("#proCancel").hide();
            $("#storeCancel").hide();
            $("#proCancel").click(function () {
                $(".product .text").show();
                $(".product input").hide();
                $("#proEdit").show();
                $("#proCancel").hide();
                buthide();
            })
            $("#storeCancel").click(function () {
                $(".store .text").show();
                $(".store input").hide();
                $("#storeEdit").show();
                $("#storeCancel").hide();
                buthide();
            })
            function buthide() {
                if ($("#proCancel").is(":hidden") && $("#storeCancel").is(":hidden")) {
                    $(".button").hide();
                }
            }
            $("#proEdit").click(function () {
                $(".product .text").hide();
                $(".product input").show();
                $("#proEdit").hide();
                $("#proCancel").show();
                $(".button").show();
            })
            $("#storeEdit").click(function () {
                $(".store .text").hide();
                $(".store input").show();
                $("#storeEdit").hide();
                $("#storeCancel").show();
                $(".button").show();
            })
        })

        //document.addEventListener('WeixinJSBridgeReady', function() {
        //    WeixinJSBridge.on("menu:share:appmessage",
        //        function () {
        //            WeixinJSBridge.invoke("sendAppMessage", {
        //                "appid": "",
        //                "img_url": "http://html.v5portal.com/mcm/content/images/test/1.jpg",
        //                "link": "http://192.168.1.13/weixinmanage/share",
        //                "desc": '商品分享',
        //                "title": "商品分享",
        //                "img_width": "120",
        //                "img_height": "120"
        //            }, function (callback) {
        //                alert(callback)
        //            });
        //        });
        //});
        </script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <% string ShopName = ViewData["ShopName"] as string; %>
<div class="RIGHT share"> 
    <!--big title begin-->
    <div class="bigTitle">
      <div class="bigTitle-name" >
          <span class="text">分享内容设置</span></div>
    </div>
    <!--big title end--> 
    <div class="main">
        <div class="card">
          <h3 class="title">名片设置</h3>
          <dl>
            <dt>
              <span class="head"><i class="icon-head"></i></span>
            </dt>
            <dd>
              <p class="name">马云<span class="job">CEO</span></p>
              <p class="company">阿里巴巴集团</p>
              <p class="mobile">15021108999</p>
              <p class="hot"><span>收藏热度：</span><span class="star">★★★★★</span></p>
            </dd>
          </dl>
        </div>        
        <div class="product">
          <h3 class="title"><span>商品设置</span><a href="javascript:void(0)" class="edit" id="proEdit">编辑</a><a href="javascript:void(0)" class="edit" id="proCancel">取消</a></h3>
          <h4 class="pro-title"><span>Apple/苹果 iPhone 5s</span></h4>
          <dl>
            <dt>
              <span class="img"></span>
            </dt>
            <% V5.MetaData.Product.Model.DRPShare drpShare = ViewData["DrpShare"] as V5.MetaData.Product.Model.DRPShare; %>
              <%if (drpShare == null)
                {%>
                 <dd>
              <p class="price"><span class="text" id="pricespan">惊爆价：</span><input class="w60" type="text" value="惊爆价："  placeholder="请输入价格标题"/><span class="number">￥265.00</span></p>
              <p class="advertisiment"><span class="text" id="descspan">微信专享，正品保证</span><input class="input-medium" type="text" value="微信专享，正品保证"/></p>
              <p class="hot"><span>收藏热度：</span><span class="star">★★★★★</span></p>
            </dd>
          </dl>
        </div>
        <div class="store">
          <h3 class="title">店铺设置<a href="javascript:void(0)" class="edit" id="storeEdit">编辑</a><a href="javascript:void(0)" class="edit" id="storeCancel">取消</a></h3>
          <h4 class="store-title"><span class="text pre"  id="opendescspan">欢迎访问</span><input type="text" value="欢迎访问" class="input-medium" placeholder="请输入欢迎语"  /><span id="shopName" class="storeName"><%=ShopName %></span></h4>
          <dl>
            <dt>
              <span class="img"></span>
            </dt>
            <dd>
              <p class="price"><span class="text advertisiment" id="openremarkspan1">全场正品，天天特价</span><input class="input-medium" id="txtOpenRemark" type="text" value="全场正品，天天特价"  placeholder="请输入内容"/></p>
              <p class="more"><span class="text" id="openremarkspan2">查看更多惊喜</span><input class="input-medium"  type="text" value="查看更多惊喜"/></p>
              <p class="hot"><span>收藏热度：</span><span class="star">★★★★★</span></p>
            </dd>
          </dl>
                <%}
                else
                { %>
            <dd>
              <p class="price"><span class="text" id="pricespan"><%=drpShare.PriceDesc %></span><input class="w60" type="text" value="<%=drpShare.PriceDesc %>"："  placeholder="请输入价格标题"/><span class="number">￥265.00</span></p>
              <p class="advertisiment"><span class="text" id="descspan"><%=drpShare.ProductDesc %></span><input class="input-medium" type="text" value="<%=drpShare.ProductDesc %>"/></p>
              <p class="hot"><span>收藏热度：</span><span class="star">★★★★★</span></p>
            </dd>
          </dl>
        </div>
        <div class="store">
          <h3 class="title"><span>店铺设置</span><a href="javascript:void(0)" class="edit" id="storeEdit">编辑</a><a href="javascript:void(0)" class="edit" id="storeCancel">取消</a></h3>
          <h4 class="store-title"><span class="text pre"  id="opendescspan"><%=drpShare.OpenDesc %></span><input type="text" class="input-medium" value="<%=drpShare.OpenDesc %>" placeholder="请输入欢迎语"  /><span class="storeName"  id="shopName"><%=ShopName %></span></h4>
          <dl>
            <dt>
              <span class="img"></span>
            </dt>
            <dd>
              <p class="price"><span class="text advertisiment" id="openremarkspan1"><%=drpShare.OpenRemark1 %></span><input id="txtOpenRemark" class="input-medium" type="text" value="<%=drpShare.OpenRemark1 %>"  placeholder="请输入内容"/></p>
              <p class="more"><span class="text" id="openremarkspan2"><%=drpShare.OpenRemark2 %></span><input class="input-medium" type="text" value="<%=drpShare.OpenRemark2 %>"/></p>
              <p class="hot"><span>收藏热度：</span><span class="star">★★★★★</span></p>
            </dd>
          </dl>
        <%} %>
        </div>        
    </div>
    <p class="button">
          <button class="btn btn-large btn-primary" id="btnSave" type="button">保存</button>
        </p>
  </div>    <script>
        $(function () {
            $("#btnSave").click(function () {
                $("#btnSave").attr("disabled", true);
                var PriceDesc = $(".price input").val();
                var ProductDesc = $(".advertisiment input").val();
                var OpenDesc = $(".store-title input").val();
                var OpenRemark1 = $("#txtOpenRemark").val();
                var OpenRemark2 = $(".more input").val();
                var shareEntity = {
                    "ID": 1,
                    "PriceDesc": PriceDesc,
                    "ProductDesc": ProductDesc,
                    "OpenDesc": OpenDesc,
                    "OpenRemark1": OpenRemark1,
                    "OpenRemark2": OpenRemark2
                }
                var shareView = JSON.stringify(shareEntity);
                $.ajax({
                    type: "post",
                    url: "../../WeiXinManage/EditShare",
                    data: { "shareView": shareView },
                    dataType: "html",
                    async: false,
                    success: function (content) {
                        $("#pricespan").text(PriceDesc);
                        $("#descspan").text(ProductDesc);
                        $("#opendescspan").text(OpenDesc);
                        $("#openremarkspan1").text(OpenRemark1);
                        $("#openremarkspan2").text(OpenRemark2);
                        $("#proCancel").click();
                        $("#storeCancel").click();
                        Show("保存成功", "success");
                        $("#btnSave").attr("disabled", false);
                    }

                });
            });
        });

    </script>

</asp:Content>

