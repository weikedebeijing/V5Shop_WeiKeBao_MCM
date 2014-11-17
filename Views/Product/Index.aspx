<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>"
    ValidateRequest="false" %>

<%@ Import Namespace="V5.MetaData.Market.Model" %>
<%@ Import Namespace="V5.MetaData.Product.Model" %>
<%@ Import Namespace="V5.Service.Product.Repositories" %>
<%@ Import Namespace="Combres" %>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=mcm"></script>
    <script src="../../Scripts/product/productDetailJs.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var appCode = ViewData["appCode"].ToString().ToLower();
                    // if (appCode == "PLATFORM") {
                    //    appCode = "C001";
                    //}
    %>
    <script type="text/javascript">
        var ProductQuery = new Object();
        ProductQuery.Groups = new Array(1);

        ProductQuery.Groups[0] = "q1";

    </script>
    <!--选项卡 begin-->
    <div class="mod-tab t20">
        <div id="dvState" class="con style0big">
            <ul>
                <li dir="q1" class="current c16"><a href="javascript:void(0)">全部（<span id="q1sum"></span>）</a></li>
                <li id="liliZaishou" dir="d1"><a title="" href="javascript:void(0)">在售中（<span id="productZaishou"></span>）</a></li>
                <li id="liCangku" dir="d2"><a title="" href="javascript:void(0)">仓库中（<span id="productCangku"></span>）</a></li>
                <li id="liYujing" dir="d3"><a title="" href="javascript:void(0)">库存预警（<span id="productYujing"></span>）</a></li>
                <li id="liTuijian" style="display: none" dir="d4"><a title="" href="javascript:void(0)">店铺推荐（<span id="productTuijian"></span>）</a></li>
            </ul>
            <%--
            <script type="text/javascript">
                if (appCode == 'PLATFORM') {
                    $("#liTuijian").css("display", "none");
                }
                else if(appCode=='')
            </script>--%>
        </div>
    </div>
    <!--搜索 begin-->
    <div class="mod-search">
        <div class="con style0list">
            <ul style="display: block;" class="ul-search">
                <li>
                    <input type="text" id="txtSearchCondition" style="color: #999;" placeholder="请输入商品名称/商家编码..."
                        class="search-input" name="" />
                    <%--x-webkit-grammar="builtin:translate" x-webkit-speech="" --%>
                </li>
                <li><a class="search-btn" href="#"></a></li>
            </ul>
        </div>
    </div>
    <!--搜索 end-->
    <%--<script type="text/javascript" src="../../../Scripts/Js/Common.js"></script>--%>
    <script type="text/javascript">

        var appCode = GetUrlAppCode();
        //        if (appCode == 'PLATFORM') {
        //            appCode = 'C001';
        //        }
        var menuCode = GetUrlMenuCode();

        if (appCode != 'PLATFORM' && appCode != "" && appCode != null) {
            $("#dvType li:not(:first)").css("display", "none");
            $("#dvSep1").css("display", "none");
            //                        var tt = document.getElementById("dvType");
            //                        tt.style.display = "none";
        }
    </script>
    <!--选项卡 end-->
    <!--标签 begin-->
    <%--    <div id="dvState" class="mod-condition t20">
        <div class="con style0list">
            <ul>
                <li id="liZaishou" dir="d1" class="current"><a href="javascript:void(0)">在售中（<span id="productZaishou"><%=ViewData          ["quanbuZaishou"]%></span>）</a></li>
                <li id="liCangku" dir="d2"><a href="javascript:void(0)">仓库中（<span id="productCangku"><%=ViewData["quanbuCangku"]%></span>）</a></li>
                <li id="liYujing" dir="d3"><a href="javascript:void(0)">库存预警（<span id="productYujing"><%=ViewData["quanbuYujing"]%></span>）</a></li>
                <li id="liTuijian" dir="d4"><a href="javascript:void(0)">店铺推荐（<span id="productTuijian"><%=ViewData["quanbuTuijian"]%></span>）</a></li>
            </ul>
        </div>
    </div>--%>
    <!--标签 end-->
    <!--操作栏 begin-->
    <div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list">
                <li><a id="btn-Add" class="a-btn" href="../../Product/AddProduct?appCode=PLATFORM&MenuCode=C110&productID=0">添加</a></li>
                <li><a class="a-btn" href="javascript:void(0)" onclick="DeleteTheseProduct(event)">删除</a></li>
                <li><a id="btn-Up" data="0" href="javascript:void(0)" class="a-btn" onclick=" popupOperate('dvShopUp', '商品上架', 'dvUp');">全网上架</a><i class="ico20 hidden"></i></li>
                <li><a id="btn-Down" data="1" href="javascript:void(0)" class="a-btn" onclick="popupOperate('dvShopDown', '商品下架','dvDown');">全网下架</a><i class="ico20 hidden"></i></li>
                <li><a id="btn-Recommend" data="2" href="javascript:void(0)" class="a-btn" onclick="popupOpen()">推荐</a><i class="ico20 hidden"></i></li>
                <li><a id="btn-UnRecommend" data="3" href="javascript:void(0)" class="a-btn" onclick="unPopupOpen()">取消推荐</a><i class="ico20 hidden"></i></li>
                <li><a id="btn-ShopCat" data="4" href="javascript:void(0)" class="a-btn" onclick="shipCatPopupOpen()">店铺分类</a><i class="ico20 hidden"></i></li>
                <li><a id="btn-UpdatePrice" data="5" href="javascript:void(0)" class="a-btn" onclick="popupOperate('dvShopUpdatePrice', '批量调价','dvUpdatePrice');">批量调价</a><i class="ico20 hidden"></i></li>
                <li><a id="btn-UpdateTitle" data="6" href="javascript:void(0)" class="a-btn" onclick="popupOperate('dvShopUpdateTitle', '批量修改标题','dvUpdateTitle');">批量修改标题</a><i class="ico20 hidden"></i></li>
                <li><a id="btn-GetDrpPrice" href="javascript:void(0)" class="a-btn">开启分销商价格监控</a></li>
                <%
                    var channelCode = Request["appCode"];
                %>
                <%--  <%if (channelCode == "C001")
                  { %>--%>
                <li><a href="javascript:void(0)" class="a-btn" onclick="javascript:printDimensionCodes();">批量生成二维码</a></li>
                <%--        <%} %>--%>
            </ul>
            <script type="text/javascript">
                //                if (appCode != 'PLATFORM' && appCode != "" && appCode != null) {
                //                    $("#btn-Add").parent().css("display", "none");
                //                    $("#btn-Recommend").parent().css("display", "block");
                //                    $("#btn-UnRecommend").parent().css("display", "block");
                //                } else {
                //                    $("#btn-ShopCat").parent().css("display", "none");
                //                    $("#btn-Recommend").parent().css("display", "none");
                //                    $("#btn-UnRecommend").parent().css("display", "none");
                //                }

                if (appCode == 'C002') {
                    $("#btn-GetDrpPrice").parent().css("display", "block");
                } else {
                    $("#btn-GetDrpPrice").parent().css("display", "none");
                }
                $.ajax({
                    url: "../../Product/IsTimerEnabled",
                    type: "get",
                    success: function (res) {
                        if (res == "1") {
                            $("#btn-GetDrpPrice").text("分销商价格监控已开启");
                        } else {
                            $("#btn-GetDrpPrice").text("开启分销商价格监控");
                        }
                    }
                })

                $("#btn-GetDrpPrice").click(function () {
                    if ($("#btn-GetDrpPrice").text() == "开启分销商价格监控") {
                        $.ajax({
                            url: "../../product/GetAllDrpPrice",
                            data: { "type": "open" },
                            type: "get",
                            cache: false
                        })
                        $("#btn-GetDrpPrice").text("分销商价格监控已开启");
                    } else {
                        $.ajax({
                            url: "../../product/GetAllDrpPrice",
                            data: { "type": "close" },
                            type: "get",
                            cache: false
                        })
                        $("#btn-GetDrpPrice").text("开启分销商价格监控");
                    }
                })

            </script>
        </div>
    </div>
    <!--操作栏 end-->
    <!--Page Start-->
    <div class="mod-page">
        <div class="con style0list">
            <div class="turn">
                <ul class="turn-ul" id="dvPage">
                    <li class="next"></li>
                    <li class="prev"></li>
                </ul>
            </div>
            <div class="number">
                <div class="r10">
                    <span id="pagenum" style="display: none"></span>当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条
                </div>
            </div>
        </div>
    </div>
    <!--Page End-->
    <div class="mod-operate-detail" id="dvShopUp" style="display: none;">
        <div class="content scroll" style="min-width: 500px; height: 240px;">
            <div class="mod-form">
                <%--style="width:500px; height:400px;"--%>
                <div class="con style0alert">
                    <ul class="list-ul">
                        <li class="list-li" id="ddShopUp">
                            <div class="float-l w100">
                                <span class="star">*</span>
                                <label>
                                    店铺选择</label>
                            </div>
                            <div class="float-l">
                                
                                <%--      <input type="checkbox" id="upShop002" name="os_shop" code="C002" onclick="upInfo(event)" />
                            <label class="r30" for="upShop002">
                                分销商城</label>--%>
                                <%foreach (var item in ViewData["shop"] as List<Opened>)
                                  {
                                      if (item.Code != "C002")
                                      { %>
                                <input type="checkbox" id="upShop<%=item.Code %>" name="os_shop" code="<%=item.Code %>"
                                    onclick="upInfo(event)" />
                                <label class="r30" for="upShop<%=item.Code %>">
                                    <%= item.Title%></label>
                                <% }
                                  } %>
                                <script type="text/javascript">
                                    $("#ddShopUp input[type=checkbox]").each(function () {
                                        var code = $(this).attr("code");
                                        if (appCode != "PLATFORM") {
                                            if (code != appCode) {
                                                $(this).css("display", "none");
                                                $(this).next().css("display", "none");
                                            }
                                        }
                                    })
                                </script>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="mod-box" style="display: none" id="modBox">
                <div class="con style0bg">
                    <ul class="pro-online">
                        <%-- <dt name="pn_C002" style="display: none">分销商城价格设置</dt>
            <dd name="pn_C002" style="display: none">
                <ul>
                    <li>产品线
                        <select id='slProductLineForRapid' style="width: 120px;">
                            <%foreach (var item in ViewData["productLineInfo"] as List<ProductLine>)
                              {%>
                            <option value="<%=item.ID %>">
                                <%=item.Name %></option>
                            <% } %>
                        </select></li>
                    <li>
                        <input type="checkbox" id="price07" name="enableDiscount" />
                        <label for="price07" class="r5">
                            参与分销商城价格会员折扣</label>
                    </li>
                </ul>
            </dd>--%>
                        <%foreach (var item in ViewData["shop"] as List<Opened>)
                          {
                              if (item.Code != "C002")
                              {%>
                        <li name="pn_<%=item.Code%>" style="display: none">
                            <div class="mod-title">
                                <div class="con style03">
                                    <h2>
                                        <%=item.Title%>价格设置</h2>
                                </div>
                            </div>
                            <div>
                                <input id="upRdChange1"  checked="checked"  type="radio" name="upChangePrice" value="" />
                                <label class="w100">
                                    将商品的价格修改为：
                                    当前价格</label>
                                <select id="upSlOprator" class="changePriceInput">
                                    <option value="minus">-</option>
                                    <option value="plus">+</option>
                                    <option value="multiply">*</option>
                                    <option value="devide">/</option>
                                </select>
                                <input class="w150 r5" type="text" name="salePrice" /><label>
                                    元</label>
                                <span class="c03"></span>
                            </div>
                            <div>
                            
                                <input id="upRdChange2" type="radio" name="upChangePrice" value="" />
                                <label class="w100">
                                    将商品的价格统一修改为：</label>
                                <input id="uptxtFloatPrice" type="text" name="salePrice" value="" class="changePriceInput">
                                <label>
                                    元</label>
                                <span class="c03"></span>
                            </div>
                            <div style="display: none">
                                <input id="partake01" class="l100" name="enableDiscount" type="checkbox">
                                <label for="partake01">
                                    参与会员折扣</label>
                            </div>
                            <div class="h20" name="pn_<%=item.Code %>" style="display: none">
                            </div>
                        </li>

                        <% }
                          }%>
                    </ul>
                </div>
            </div>
        </div>
        <div class="btn">
            <div class="indiv">
                <button class="submit01-alert r10" name="pull_on" onclick="shopUp()">
                    上架</button>
                <button class="reset01-alert" name="cancel" onclick="popupClose('dvUp')">
                    取消</button>
            </div>
        </div>
    </div>
    <div class="mod-operate-detail" id="dvShopDown" style="display: none;">
        <div class="content scroll" style="min-width: 500px; min-height: 120px;">
            <div class="mod-form">
                <div class="con style0alert">
                    <ul class="list-ul">
                        <li class="list-li" id="ddShopDown">
                            <div class="float-l w100">
                                <span class="star">*</span>
                                <label>
                                    店铺选择</label>
                            </div>
                            <div class="float-l">
                                <%--     <input type="checkbox" id="downShopC002" name="shop" code="C002" />
                            <label class="r30" for="downShopC002">
                                分销商城</label>--%>
                                <!--屏蔽分销商城-->
                                <%foreach (var item in ViewData["shop"] as List<Opened>)
                                  {
                                      if (item.Code != "C002")
                                      {%>
                                <input type="checkbox" id="downShop<%=item.Code %>" name="shop" code="<%=item.Code %>" />
                                <label for="downShop<%=item.Code %>" class="r30">
                                    <%= item.Title%></label>
                                <% }
                                  } %>
                                <script type="text/javascript">
                                    $("#ddShopDown input[type=checkbox]").each(function () {
                                        var code = $(this).attr("code");
                                        if (appCode != "PLATFORM") {
                                            if (code != appCode) {
                                                $(this).css("display", "none");
                                                $(this).next().css("display", "none");
                                            }
                                        }
                                    })
                                </script>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="btn">
            <div class="indiv">
                <button class="submit01-alert r10" name="pull_off" onclick="shopDown()">
                    下架</button>
                <button class="reset01-alert" name="cancel" onclick="popupClose('dvDown')">
                    取消</button>
            </div>
        </div>
    </div>
    <div class="mod-operate-detail" id="dvShopRecommend" style="display: none;">
        <div class="content scroll" style="min-width: 500px; min-height: 120px;">
            <div class="mod-form">
                <div class="con style0alert">
                    <ul class="list-ul">
                        <li class="list-li" id="ddRecommend">
                            <div class="float-l w100">
                                <span class="star">*</span>
                                <label>
                                    商品推荐</label>
                            </div>
                            <div class="float-l">
                                <%--  <input type="checkbox" id="recShopC002" name="recommend" code="C002" />
                            <label class="r30" for="recShopC002">
                                分销商城</label>--%>
                                <!--屏蔽分销商城-->
                                <input type="checkbox" id="ShopNewProduct" value="newProduct" name="os_shop" code="C001" />
                                <label class="r30" for="ShopNewProduct">
                                    新品
                                </label>
                                <input type="checkbox" id="ShopFineSelect" value="fineSelect" name="os_shop" code="C001" />
                                <label class="r30" for="ShopFineSelect">
                                    精选
                                </label>
                                <input type="checkbox" id="ShopPreferential" value="preferential" name="os_shop"
                                    code="C001" />
                                <label class="r30" for="ShopPreferential">
                                    特惠
                                </label>
                                <script type="text/javascript">
                                    $("#ddRecommend input[type=checkbox]").each(function () {
                                        var code = $(this).attr("code");
                                        if (appCode != "PLATFORM") {
                                            if (code != appCode) {
                                                $(this).css("display", "none");
                                                $(this).next().css("display", "none");
                                            }
                                        }
                                    })
                                </script>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="btn">
            <div class="indiv">
                <button class="submit01-alert r10" name="recommend" onclick="shopRecommend()">
                    推荐</button>
                <button class="reset01-alert" name="cancel" onclick="popupClose('dvRecommend')">
                    取消</button>
            </div>
        </div>
    </div>
    <div class="mod-operate-detail" id="dvShopUnRecommend" style="display: none;">
        <div class="content scrol" style="min-width: 500px; min-height: 120px;">
            <div class="mod-form">
                <div class="con style0alert">
                    <ul class="list-ul">
                        <li class="list-li" id="ddUnRecommend">
                            <div class="float-l w100">
                                <span class="star">*</span>
                                <label>
                                    店铺选择</label>
                            </div>
                            <div class="float-l">
                                <%--   <input type="checkbox" id="unRecShopC002" name="unRecommend" code="C002" />
                            <label class="r30" for="unRecShopC002">
                                分销商城</label>--%>
                                <input type="checkbox" id="upShopNewProduct" value="newProduct" name="un_shop" code="C001" />
                                <label class="r30" for="upShopNewProduct">
                                    新品
                                </label>
                                <input type="checkbox" id="upShopFineSelect" value="fineSelect" name="un_shop" code="C001" />
                                <label class="r30" for="upShopFineSelect">
                                    精选
                                </label>
                                <input type="checkbox" id="upShopPreferential" value="preferential" name="un_shop"
                                    code="C001" />
                                <label class="r30" for="upShopPreferential">
                                    特惠
                                </label>
                                <script type="text/javascript">
                                    $("#ddUnRecommend input[type=checkbox]").each(function () {
                                        var code = $(this).attr("code");
                                        if (appCode != "PLATFORM") {
                                            if (code != appCode) {
                                                $(this).css("display", "none");
                                                $(this).next().css("display", "none");
                                            }
                                        }
                                    })
                                </script>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="btn">
            <div class="indiv">
                <button class="submit01-alert r10" name="unRecommend" onclick="shopUnRecommend()">
                    取消推荐</button>
                <button class="reset01-alert" name="cancel" onclick="popupClose('dvUnRecommend')">
                    取消</button>
            </div>
        </div>
    </div>
    <div class="mod-operate-detail" id="dvShopCategory" style="display: none;">
        <div class="content" style="min-width: 500px; min-height: 120px;">
            <div class="mod-form">
                <div class="con">
                    <dl>
                        <dd>
                            <div id="dvProductInCategoryContainer">
                                <ul>
                                </ul>
                            </div>
                        </dd>
                    </dl>
                </div>
            </div>
        </div>
        <div class="btn">
            <div class="indiv">
                <button class="submit01-alert r10" name="SetShopCategory" onclick="shopCategory()">
                    确定</button>
                <button class="reset01-alert" name="cancel" onclick="popupClose('dvCategory')">
                    取消</button>
            </div>
        </div>
    </div>
    <div class="mod-operate-detail" id="dvShopUpdatePrice" style="display: none;">
        <div class="content" style="min-width: 500px; min-height: 120px;">
            <div class="mod-form">
                <div class="con style0alert b10">
                    <ul class="list-ul">
                        <li class="list-li">
                            <div class="float-l w190">
                                <input id="rdChange1" type="radio" name="changePrice" value="" checked="checked" /><label>将商品的价格修改为</label>
                            </div>
                            <div class="float-l">
                                <label>
                                    当前价格</label>
                                <%--*
                                <input id="txtPriceRate" type="text" name="name" value="100" class="changePriceInput"
                                    style="color: #cccccc;" />%--%>
                                <select id="slOprator" class="changePriceInput">
                                    <option value="minus">-</option>
                                    <option value="plus">+</option>
                                    <option value="multiply">*</option>
                                    <option value="devide">/</option>
                                </select>
                                &nbsp;
                                <input id="txtFloatPrice" type="text" name="name" value="" class="changePriceInput" />
                                <label>
                                    元</label>
                                <span class="c03"></span>
                            </div>
                        </li>
                        <li class="list-li">
                            <div class="float-l w190">
                                <input id="rdChange2" type="radio" name="changePrice" value="" /><label>将商品的价格统一修改为</label>
                            </div>
                            <div class="float-l">
                                <input id="txtAllPrice" type="text" name="name" value="" class="changePriceInput" />
                                <label>
                                    元</label>
                                <span class="c03"></span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="btn">
            <div class="indiv">
                <button class="submit01-alert r10" name="updatePrice" onclick="shopUpdatePrice()">
                    确定</button>
                <button class="reset01-alert" name="cancel" onclick="popupClose('dvUpdatePrice')">
                    取消</button>
            </div>
        </div>
        <script type="text/javascript">
            $("#txtPriceRate").blur(function () {
                if ($(this).val() == "100") {
                    $(this).css("color", "#cccccc");
                } else {
                    $(this).css("color", "#333333");
                }
            })
        </script>
    </div>
    <div class="mod-operate-detail" id="dvShopUpdateTitle" style="display: none;">
        <div class="content scroll" style="min-width: 500px; height: 240px;">
            <div class="mod-form">
                <div class="con style0alert">
                    <div class="replaceTileMark">
                        <ul class="list-ul">
                            <li class="list-li">
                                <div class="float-l w120">
                                    <label>
                                        将标题中的关键字</label>
                                </div>
                                <div class="float-l">
                                    <input id="txtKeyword" class="titleInput" type="text" name="name" value="">
                                </div>
                                <div class="float-l r10 l10">
                                    <label>
                                        替换为</label>
                                </div>
                                <div class="float-l">
                                    <input id="txtreKeyword" class="titleInput" type="text" name="name" value="">
                                </div>
                                <div class="float-l">
                                    <div class="mod-operate">
                                        <div class="con style0editdel">
                                            <a id="btnAddTitleItem" class="edit" href="javascript:void(0);" onclick="addTitleItem()">增加</a> <a id="btnRemoveTitleItem" class="del" href="javascript:void(0);" onclick="deleteTitleItem()">删除</a>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="list-li t20">
                                <div class="float-l w120">
                                    <label>
                                        添加标题的前后缀</label>
                                </div>
                                <div class="float-l">
                                    <input id="txtPreFix" type="text" name="name" value="" class="titleInput" />
                                </div>
                                <div class="float-l r10 l5">
                                    <label>
                                        +标题+</label>
                                </div>
                                <div class="float-l">
                                    <input id="txtSufFix" type="text" name="name" value="" class="titleInput" />
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="btn">
            <div class="indiv">
                <button class="submit01-alert r10" name="updateTitle" onclick="shopUpdateTitle()">
                    确定</button>
                <button class="reset01-alert" name="cancel" onclick="popupClose('dvUpdateTitle')">
                    取消</button>
            </div>
        </div>
    </div>
    <div class="clear h10">
    </div>
    <div style="clear: both;">
        <!--放表格的容器-->
        <div class="sourcelist" id="mod-table">
            <%  
                Html.RenderAction("ProductList", new { ProductPageIndex = 0 });//首次加载，实际上不需要出现数据，数据有ajax请求呈现，这里将currentIndex置为0
            %>
        </div>
        <!--放表格的容器-->
    </div>
    <!--点上架按钮显示的内容-->
    <%-- <script src="../../Scripts/jquery-easyui-1.3.2/jquery-1.8.0.min.js" type="text/javascript"></script>--%>
    <%-- <script src="../../Scripts/Js/flexigrid.js" type="text/javascript"></script>--%>
    <%--<script src="../../Scripts/Js/flexigrid.pack.js" type="text/javascript"></script>--%>
    <%--<script src="../../Scripts/Js/bootstrap_Expand.js" type="text/javascript"></script>--%>
    <%--<script src="../../../Scripts/Js/NumberPaging.js" type="text/javascript"></script>--%>
    <%--<script src="../../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script> hsw 2013-11-29 16:42:42
    <script src="../../Scripts/Js/allselect.js" type="text/javascript"></script> 
    <script src="../../Scripts/Js/SetProductPriceRequest.js" type="text/javascript"></script> 
    <script src="../../../Scripts/Js/Common.js" type="text/javascript"></script> 
    <script src="../../Scripts/jquery.pager.js" type="text/javascript"></script> 
    <script src="../../../Scripts/Js/Recommend.js" type="text/javascript"></script>
    <script src="../../../Scripts/Js/ShopCategory.js" type="text/javascript"></script>
    <script src="../../../Scripts/Js/UpdatePrice.js" type="text/javascript"></script> --%>
    <%=WebExtensions.CombresLink("productIndexJs")%>
    <script type="text/javascript">

        var pageIndex = (!window.location.hash) ? 1 : window.location.hash.replace("#", "");

        function Grounding() {
            var productId = 0;
            $("#flexigridtable tr").each(function () {
                productId = $("input[type='checkbox']:checked").next().val();
            });


            window.location.href = "/Product/ProductGrounding?productID=" + productId;


        }

        function Undercarriage() {
            window.location.href = "/Product/Undercarriage";
        }


        //        var productQuery = new Object();

        //        productQuery.Query = appCode;
        //        productQuery.Groups = new Array();
        //        if (menuCode == "C115") {
        //            productQuery.Groups[0] = "q2";
        //        } else {
        //            productQuery.Groups[0] = "q1";
        //        }
        //        if (menuCode == "C115") {

        //            //            productQuery.Groups[1] = "d1";
        //            //            $("#dvState li").removeClass("current");
        //            //            $("#dvState li").each(function () {
        //            //                if ($(this).attr("dir") == "d1") {
        //            //                    $(this).addClass("current");
        //            //                }
        //            //            })
        //        } else if (menuCode == "C120") {
        //            productQuery.Groups[1] = "d2";
        //            $("#dvState li").removeClass("current");
        //            $("#dvState li").each(function () {
        //                if ($(this).attr("dir") == "d2") {
        //                    $(this).addClass("current");
        //                }
        //            })
        //            //        } else if (menuCode == "C125") {
        //            //            productQuery.Groups[1] = "d3";
        //            //            $("#dvState li").removeClass("current");
        //            //            $("#dvState li").each(function () {
        //            //                if ($(this).attr("dir") == "d3") {
        //            //                    $(this).addClass("current");
        //            //                }
        //            //            })
        //        } else if (menuCode == "C130") {
        //            productQuery.Groups[1] = "d4";
        //            $("#dvState li").removeClass("current");
        //            $("#dvState li").each(function () {
        //                if ($(this).attr("dir") == "d4") {
        //                    $(this).addClass("current");
        //                }
        //            })
        //        } else {
        //            productQuery.Groups[1] = "";
        //        }
        //        SelectByGroupClick(pageIndex);
        //        SelectByGroupClickSub("q1sum", "");
        //        SelectByGroupClickSub("productZaishou", "d1");
        //        SelectByGroupClickSub("productCangku", "d2");
        //        SelectByGroupClickSub("productYujing", "d3");
        //        SelectByGroupClickSub("productTuijian", "d4");


        var condition = ""; //搜索的条件，放在外面做全局变量，局部视图也用到
        $(function () {

            ProductView(1);
            //            if (menuCode == "C115") {
            //                productQuery.Groups[0] = "q2";
            //                productQuery.Groups[1] = "";

            //                SelectByGroupClick(pageIndex);
            //                SelectByGroupClickSub("productZaishou", "d1");
            //                SelectByGroupClickSub("productCangku", "d2");
            //                SelectByGroupClickSub("productYujing", "d3");
            //                SelectByGroupClickSub("productTuijian", "d4");
            //            }


            //            $("#dvType ul li").click(function () {

            //                $("#dvType ul li").removeClass("current c16");
            //                $(this).addClass("current c16");
            //                $("#dvState ul li").removeClass("current c16");
            //                //customerQuery.Query = "";
            //                //customerQuery.Groups[0] = "";
            //                productQuery.Groups[0] = $(this).attr("dir");
            //                productQuery.Groups[1] = "";

            //                SelectByGroupClick(pageIndex);
            //                SelectByGroupClickSub("q1sum", "");
            //                SelectByGroupClickSub("productZaishou", "d1");
            //                SelectByGroupClickSub("productCangku", "d2");
            //                SelectByGroupClickSub("productYujing", "d3");
            //                SelectByGroupClickSub("productTuijian", "d4");

            //            });

            $("#dvState ul li").click(function () {

                $("#dvState ul li").removeClass("current c16");
                $(this).addClass("current c16");


                ProductQuery.Groups[0] = "";

                ProductQuery.Groups[0] = $(this).attr("dir");
                ProductView(1);






                //customerQuery.Groups[1] = "";

                //                if ($(this).attr("dir") == 'q1') {
                //                    productQuery.Groups[1] = ''

                //                } else {
                //                    productQuery.Groups[1] = $(this).attr("dir");
                //                }
                //                SelectByGroupClick(pageIndex);

            });


            //搜索按钮
            $("#txtSearchCondition").blur(function () {
                condition = $(this).val().replace(/^\s*/g, "").replace(/\s*$/g, "");
                if (condition == "") {
                    $(this).focus();
                    $(this).val("");
                } else {
                    //                    SearchBtnClick(1);
                }

            })

            $(".search-btn").click(function () {

                condition = $("#txtSearchCondition").val().replace(/^\s*/g, "").replace(/\s*$/g, "");


                ProductQuery.Query = condition;
                ProductView(1);


            })
            // enter 键搜索
            document.onkeypress = function () {

                var iKeyCode = -1;
                if (arguments[0]) {
                    iKeyCode = arguments[0].which;
                }
                else {
                    iKeyCode = event.keyCode;
                }
                if (iKeyCode == 13) {
                    // 搜索
                    $(".search-btn").click();

                }
            }




            //            $("input", $(".search-btn").parents("ul")).click(function () {
            //                if ($(this).val() == " ") {
            //                    $(this).val("");
            //                    $(this).focus();
            //                }
            //            })
            //            $("input", $(".search-btn").parents("ul")).blur(function () {
            //                condition = $("input", $(this).parents("ul")).val().replace(/^\s*/g, "").replace(/\s*$/g, "");
            //                if ($(this).val() == " ") {
            //                    $(this).val("");
            //                    $(this).focus();
            //                }
            //            })

        })

        //查看详细和编辑链接的跳转

        //        function GoToLinkUrl(event) {
        //            event = event ? event : window.event;
        //            var eventSrc = event.srcElement ? event.srcElement : event.target;
        //            var linkUrl = $(eventSrc).attr("linkUrl");
        //            var linkUrlParts = linkUrl.split('?');
        //            if (linkUrlParts.length > 1) {//原本已经带参数
        //                linkUrl = linkUrlParts[0] + "?appCode=" + appCode + "&" + linkUrlParts[1] + "&MenuCode=" + menuCode;
        //            } else {
        //                linkUrl = linkUrl + "?appCode=" + appCode + "&MenuCode=" + menuCode;
        //            }

        //            window.location.href = linkUrl;
        //        }

        function GetPageNum() {
            return $("#pagenum").text();
        }

        //单个删除商品
        function DeleteThisProduct(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var productID = $(eventSrc).attr("id");
            if (confirmThis(event, "您确认删除这条数据?")) {
                $.ajax({
                    url: "../../Product/DeleteProduct",
                    type: "get",
                    data: { "id": productID, "appCode": appCode },
                    success: function (res) {
                        var jsonRes = JSON.parse(res);
                        if (jsonRes.Code == null && jsonRes.Message == null) {
                            //                            alert("删除成功");
                            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                            $("#operateTip").html("删除成功").change();
                            //   location.reload();
                            ProductView(GetPageNum());
                        }
                    },
                    error: function () {
                        //                      alert("单个删除商品过程中出错");
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html("单个删除商品过程中出错").change();
                    }
                })
            }
        }

        function DeleteTheseProduct(event) {
            var deleteProductIDArray = new Array();
            $(".mod-table-main tr input[type=checkbox]:checked").each(function () {
                deleteProductIDArray.push($(this).siblings().val());
            })
            if (deleteProductIDArray.length != 0) {
                if (confirmThis(event, "您确认删除这些数据?")) {
                    deleteProductIDArray = JSON.stringify(deleteProductIDArray);
                    $.ajax({
                        url: "../../Product/DeleteAllSelectedProduct",
                        type: "post",
                        data: { "deleteProductIDArray": deleteProductIDArray, "appCode": appCode },
                        success: function (res) {
                            var jsonRes = JSON.parse(res);
                            if (jsonRes.Code == null && jsonRes.Message == null) {
                                //                                alert("删除成功");
                                $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                                $("#operateTip").html("删除成功").change();
                                ProductView(GetPageNum());
                                // location.reload();
                            }
                        },
                        error: function () {
                            //                            alert("批量删除商品过程中出错");
                            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                            $("#operateTip").html("批量删除商品过程中出错").change();
                        }
                    })
                }
            } else {
                //             alert("请先选择要删除的商品");
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请先选择要删除的商品").change();
            }
        }

        //推荐按钮点击事件(店铺橱窗推荐)
        function shopRecommend() {

            $("button[name='recommend']").removeClass("submit01-alert").addClass("disabled-alert").attr("disabled", "disabled");
            var recommendInfo = new RecommendInfo();
            var multiValue = new Array();
            $("input[name='os_shop']").each(function () {

                if ($(this).attr("checked") == "checked") {
                    if ($(this).val() == "newProduct") {
                        recommendInfo.entity.NewProduct = true;
                    }
                    else if ($(this).val() == "fineSelect") {
                        recommendInfo.entity.FineSelect = true;
                    }
                    else if ($(this).val() == "preferential") {
                        recommendInfo.entity.Preferential = true;
                    }
                    var value = $(this).val();
                    multiValue.push(value);
                }
            });

            if (multiValue.length == 0) {
                //                    alert("请选择店铺！");
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请勾选要推荐的项！").change();
                $("button[name='recommend']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                return;
            }
            var multiID = new Array();
            $(".mod-table-main tr input[type=checkbox]:checked").each(function () {
                multiID.push($(this).siblings().val());
            })

            if (multiID.length == 0) {
                //                    alert("请选择推荐商品！");
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请选择推荐商品！").change();
                //启用按钮
                $("button[name='recommend']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                return;
            }

            $(".mod-table-main tr input[type=checkbox]:checked").each(function () {
                recommendInfo.entity.MultiID.push($(this).siblings().val());
            })
            $("#ddRecommend input[type=checkbox]:checked").each(function () {
                recommendInfo.entity.ChannelCodeList.push($(this).attr("code"));
            })
            var recommendInfoStr = JSON.stringify(recommendInfo.entity);

            $.ajax({
                url: "../../Product/RecommendToChannel",
                type: "post",
                data: { "recommendInfoStr": recommendInfoStr },
                success: function (res) {
                    //                        alert(res);
                    $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                    $("#operateTip").html(res).change();
                    //启用按钮
                    $("button[name='recommend']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                    if (res == "推荐成功") {
                        //$(".mod-operate-detail").hide();
                        $("#btn-Recommend").siblings("i").css("display", "none");
                        //                        $("name='os_shop'").checked = false;
                        //                        $("name='un_shop'").checked = false;
                        //location.reload();
                        popupClose('dvRecommend');
                        ProductView(GetPageNum());
                    }
                },
                error: function () {

                }
            })
        }

        //取消推荐按钮点击事件(店铺取消橱窗推荐)
        function shopUnRecommend() {

            $("button[name='unRecommend']").removeClass("submit01-alert").addClass("disabled-alert").attr("disabled", "disabled");
            var recommendInfo = new RecommendInfo();
            var multiValue = new Array();
            $("input[name='un_shop']").each(function () {
                if ($(this).attr("checked") == "checked") {
                    if ($(this).val() == "newProduct") {
                        recommendInfo.entity.NewProduct = false;
                    }
                    else if ($(this).val() == "fineSelect") {
                        recommendInfo.entity.FineSelect = false;
                    }
                    else if ($(this).val() == "preferential") {
                        recommendInfo.entity.Preferential = false;
                    }
                    var value = $(this).val();
                    multiValue.push(value);
                }
            });

            if (multiValue.length == 0) {
                //                    alert("请选择店铺！");
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请选择推荐商品！").change();
                $("button[name='unRecommend']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                return;
            }
            var multiID = new Array();
            $(".mod-table-main tr input[type=checkbox]:checked").each(function () {
                multiID.push($(this).siblings().val());
            })

            if (multiID.length == 0) {
                //                    alert("请选择要取消推荐的商品！");
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请选择要取消推荐的商品！").change();
                //启用按钮
                $("button[name='unRecommend']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                return;
            }

            $(".mod-table-main tr input[type=checkbox]:checked").each(function () {
                recommendInfo.entity.MultiID.push($(this).siblings().val());
            })
            $("#ddUnRecommend input[type=checkbox]:checked").each(function () {
                recommendInfo.entity.ChannelCodeList.push($(this).attr("code"));
            })
            var recommendInfoStr = JSON.stringify(recommendInfo.entity);

            $.ajax({
                url: "../../Product/UnRecommendToChannel",
                type: "post",
                data: { "recommendInfoStr": recommendInfoStr },
                success: function (res) {
                    //                      alert(res);
                    $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                    $("#operateTip").html(res).change();
                    //启用按钮
                    $("button[name='unRecommend']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                    if (res == "取消推荐成功") {
                        //$(".mod-operate-detail").hide();
                        $("#btn-UnRecommend").siblings("i").css("display", "none");
                        //  location.reload();

                        popupClose('dvUnRecommend');
                        ProductView(GetPageNum());
                    }

                },
                error: function () {

                }
            })
        }

        //更新商品的价格
        function shopUpdatePrice() {
            $("button[name='updatePrice']").removeClass("submit01-alert").addClass("disabled-alert").attr("disabled", "disabled");
            $(".c03").text("");
            var multiID = new Array();
            $(".mod-table-main tr input[type=checkbox]:checked").each(function () {
                multiID.push($(this).siblings().val());
            })

            if (multiID.length == 0) {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请选择要更新价格的商品！").change();
                //启用按钮
                $("button[name='updatePrice']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                return;
            }
            var updatePrice = new UpdatePriceInfo();
            $(".mod-table-main tr input[type=checkbox]:checked").each(function () {
                updatePrice.entity.MultiID.push($(this).siblings().val());
            })
            if ($("#rdChange1").attr("checked") == "checked") {
                updatePrice.entity.Groups = 0;
                //var priceRate = TrimSpace($("#txtPriceRate").val()) == "" ? "100" : TrimSpace($("#txtPriceRate").val());
                var oprator = TrimSpace($("#slOprator").val());
                var floatPrice = TrimSpace($("#txtFloatPrice").val());
                if (floatPrice == "") {
                    // $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                    $(".c03", $("#txtFloatPrice").parents("li")).html("价格不能为空").change();
                    //$(".prompt", $("#txtProductCategory").parents("li")).text("请选择商品类目");
                    $("button[name='updatePrice']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                    return false;
                }
                if (parseFloat(floatPrice) == 0) {
                    // $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                    $(".c03", $("#txtFloatPrice").parents("li")).html("价格不能为0").change();
                    //$(".prompt", $("#txtProductCategory").parents("li")).text("请选择商品类目");
                    $("button[name='updatePrice']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                    return false;
                }
                var r = /^\d+(\.\d+|\d*)$/g;
                if (r.test(floatPrice) == false) {
                    //                        alert("价格只能为整数，小数");
                    // $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                    $(".c03", $("#txtFloatPrice").parents("li")).html("价格只能为整数，小数").change();
                    $("button[name='updatePrice']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                    return false;
                }

                updatePrice.entity.Rules1 = 0 + "," + oprator + "," + floatPrice;
                updatePrice.entity.ChannelCode = appCode;
            } else {
                updatePrice.entity.Groups = 1;
                var val = $("#txtAllPrice").val();
                if (val == "") {
                    // $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                    $(".c03", $("#txtAllPrice").parents("li")).html("价格不能为空").change();
                    //$(".prompt", $("#txtProductCategory").parents("li")).text("请选择商品类目");
                    $("button[name='updatePrice']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                    return false;
                }
                if (parseFloat(val) == 0) {
                    // $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                    $(".c03", $("#txtAllPrice").parents("li")).html("价格不能为0").change();
                    //$(".prompt", $("#txtProductCategory").parents("li")).text("请选择商品类目");
                    $("button[name='updatePrice']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                    return false;
                }
                var r = /^\d+(\.\d+|\d*)$/g;
                if (r.test(val) == false) {
                    //                        alert("价格只能为整数，小数");
                    // $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                    $(".c03", $("#txtAllPrice").parents("li")).html("价格只能为整数，小数").change();
                    $("button[name='updatePrice']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                    return false;
                }
                updatePrice.entity.Rules2 = TrimSpace($("#txtAllPrice").val());
                updatePrice.entity.ChannelCode = appCode;
            }

            var updatePriceStr = JSON.stringify(updatePrice.entity);
            var multiIDStr = JSON.stringify(multiID);
            var resMark = 0;
            $.ajax({
                url: "../../product/IsOutOfDate",
                type: "post",
                async: false,
                data: { "channelCode": appCode, "multiIDStr": multiIDStr },
                success: function (res) {
                    if (res != "0") {
                        $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                        $("#operateTip").html(res + "店铺的价格调整授权已过期,请重新授权").change();
                        //启用按钮
                        $("button[name='updatePrice']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                        resMark = 1;
                        return;
                    }
                }
            })
            if (resMark == 0) {
                $.ajax({
                    url: "../../Product/UpdatePrice",
                    type: "post",
                    data: { "updatePriceStr": updatePriceStr },
                    success: function (res) {
                        //启用按钮
                        $("button[name='updatePrice']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                        var jsonRes = JSON.parse(res);

                        if (jsonRes.Code == null && jsonRes.Message == null) {
                            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                            $("#operateTip").html("设置成功").change();
                            // $(".mod-operate-detail").hide();
                            $("#btn-updatePrice").siblings("i").css("display", "none");
                            popupClose('dvUpdatePrice');
                            ProductView(GetPageNum());


                            //                            location.reload();
                        } else {
                            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                            $("#operateTip").html("" + jsonRes.Message + "").change();
                            //alert(jsonRes.Message);
                        }

                    },
                    error: function () {
                        //启用按钮
                        $("button[name='updatePrice']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                    }
                })
            }
        }

        //批量设置商品标题
        function shopUpdateTitle() {
            $("button[name='updateTitle']").removeClass("submit01-alert").addClass("disabled-alert").attr("disabled", "disabled");
            var multiID = new Array();
            $(".mod-table-main tr input[type=checkbox]:checked").each(function () {
                multiID.push($(this).siblings().val());
            })

            if (multiID.length == 0) {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请选择修改标题的商品！").change();
                //启用按钮
                $("button[name='updateTitle']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                return;
            }
            var titleItem = "";
            var Titleint = 1;
            $("li", $("#dvShopUpdateTitle")).each(function () {
                if (Titleint < $("li", $("#dvShopUpdateTitle")).length) {
                    var repPre = TrimSpace($("input[type=text]:first", $(this)).val());
                    var repRes = TrimSpace($("input[type=text]:last", $(this)).val());
                    if (repPre != "") {
                        titleItem += repPre + ":" + repRes + ",";
                    }
                    Titleint = Titleint + 1;
                }
            })
            titleItem = titleItem.substring(0, titleItem.length - 1);
            var keyword = TrimSpace($("#txtKeyword").val());
            var rekeyword = TrimSpace($("#txtreKeyword").val());
            var prefix = TrimSpace($("#txtPreFix").val());
            var suffix = TrimSpace($("#txtSufFix").val());
            if (titleItem == "" && prefix == "" && suffix == "") {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请填写修改内容！").change();
                //启用按钮
                $("button[name='updateTitle']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                return;
            }

            var multiIDStr = JSON.stringify(multiID);
            $.ajax({
                url: "../../Product/UpdateTitle",
                type: "post",
                data: { "multiIDStr": multiIDStr, "titleItem": titleItem, "prefix": prefix, "suffix": suffix, "channelCode": appCode },
                success: function (res) {
                    if (res == "0") {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("商品标题修改成功!").change();
                        //$(".mod-operate-detail").hide();
                        //                        location.reload();

                        popupClose('dvUpdateTitle');
                        ProductView(GetPageNum());
                    } else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html("" + res + "").change();
                        //$(".mod-operate-detail").hide();
                        $("#btn-UpdateTitle").siblings("i").hide();
                    }
                    //启用按钮
                    $("button[name='updateTitle']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                },
                error: function () {
                    //启用按钮
                    $("button[name='updateTitle']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                }
            })

        }
        //批量设置商品标题（增加修改项）
        function addTitleItem() {

            if ($("#dvShopUpdateTitle ul li").length >= 2) {
                $("#btnRemoveTitleItem").css("display", "block");
            }

            var titleItem = $("<li class='list-li'><div class='float-l w120'><label>将标题中的关键字</label></div><div class='float-l'><input type='text' name='name' value='' class='titleInput' /></div><div class='float-l r10 l10'><label>替换为</label></div><div class='float-l'><input type='text' name='name' value='' class='titleInput'/></div></li>");

            $("#dvShopUpdateTitle ul").prepend(titleItem);

        }

        function deleteTitleItem() {
            if ($("#dvShopUpdateTitle ul li").length <= 3) {
                $("#btnRemoveTitleItem").css("display", "none");
            }

            $("#dvShopUpdateTitle ul li:first").remove();
        }


    </script>
    <!-- 上架 begin -->
    <script type="text/javascript">
        $(function () {
            // 初始化显示
            //            $("input[name='os_shop']:checked").each(function () {
            //                var code = $(this).attr("code");
            //                $("[name='pn_" + code + "']").show();
            //            });

        });

        function upInfo(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            if ($(eventSrc).attr("checked")) {

                var code = $(eventSrc).attr("code");
                $("[name='pn_" + code + "']").show();
            }
            else {
                var code = $(eventSrc).attr("code");
                $("[name='pn_" + code + "']").hide();
            }
            var bl = false;
            $("input[name='os_shop']").each(function () {
                if ($(this).attr("checked")) {
                    bl = true;
                }
            });
            if (bl) {
                $("#modBox").show();
            } else {
                $("#modBox").hide();
            }
        }

        function checkRate(value, caption) {
            if (value == undefined || value == "") {
                // $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                //$("#operateTip").html("请输入" + caption + "!").change();
                $(".c03").html("请输入" + caption + "").change();
                return false;
            }

            if (isNaN(value)) {
                // $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $(".c03").html(caption + "格式错误").change();
                return false;
            }

            if (parseFloat(value) < 0) {
                //$(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $(".c03").html(caption + "不能为负数!").change();
                return false;
            }

            return true;
        }

        function checkValidata(value, caption, id) {
            $(".c03").text("");
            if (value == undefined || value == "") {
                // $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                //$("#operateTip").html("请输入" + caption + "!").change();
                $(".c03", $("#"+id).parent()).html("请输入" + caption + "").change();
                return false;
            }

            if (isNaN(value)) {
                // $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $(".c03", $("#" + id).parent()).html(caption + "格式错误").change();
                return false;
            }

            if (parseFloat(value) < 0) {
                //$(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $(".c03", $("#" + id).parent()).html(caption + "不能为负数!").change();
                return false;
            }

            return true;
        }
        // 上架提交
        function shopUp() {
            //禁用按钮
            $("button[name='pull_on']").removeClass("submit01-alert").addClass("disabled-alert").attr("disabled", "disabled");

            var multiCode = new Array();
            $("input[name='os_shop']").each(function () {
                if ($(this).attr("checked") == "checked") {
                    var code = $(this).attr("code");
                    multiCode.push(code);
                }
            });
            if (multiCode.length == 0) {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请选择店铺！").change();
                $("button[name='pull_on']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                return;
            }

            var multiID = new Array();
            $(".mod-table-main tr input[type=checkbox]:checked").each(function () {
                multiID.push($(this).siblings().val());
            })

            if (multiID.length == 0) {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请选择上架商品！").change();
                //启用按钮
                $("button[name='pull_on']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                return;
            }

            // 获取页面设置的价格比率
            var template = $.parseJSON('<%= ViewData["priceTemplate"] %>');
            var data = clone(template);
            data.MultiProductID = multiID;
            data.ChannelPriceRates = new Array();

            var productLineID = "-1";






            $("input[name='os_shop']:checked").each(function () {
                var code = $(this).attr("code");
                var $pannel = $("[name='pn_" + code + "']");
                var rate = clone(template.ChannelPriceRates[0]);
                rate.Code = code;
                if (code == "C002") {

                    productLineID = $("#slProductLineForRapid").val();
                    // 分销商城
                    if ($("input[type='checkbox'][name='marketPrice']:checked", $pannel).length > 0) {
                        var marketPriceRate = $("input[type='text'][name='marketPrice']", $pannel).val();
                        if (!checkRate(marketPriceRate, '建议零售价')) {
                            //启用按钮
                            $("button[name='pull_on']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                            return;
                        }
                        //rate.MarketPriceRate = marketPriceRate;
                    }

                    if ($("input[type='checkbox'][name='wholeSalePrice']:checked", $pannel).length > 0) {
                        var wholeSalePriceRate = $("input[type='text'][name='wholeSalePrice']", $pannel).val();
                        if (!checkRate(wholeSalePriceRate, '经销商采购价')) {
                            //启用按钮
                            $("button[name='pull_on']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                            return;
                        }
                        rate.WholeSalePriceRate = wholeSalePriceRate;
                    }

                    if ($("input[type='checkbox'][name='distributionPrice']:checked", $pannel).length > 0) {
                        var distributionPriceRate = $("input[type='text'][name='distributionPrice']", $pannel).val();
                        if (!checkRate(distributionPriceRate, '代销商采购价')) {
                            //启用按钮
                            $("button[name='pull_on']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                            return;
                        }
                        rate.DistributionPriceRate = distributionPriceRate;
                    }
                }
                else {

                    //                    if ($("input[type='checkbox'][name='salePrice']:checked", $pannel).length > 0) {
                    //*var salePriceRate = $("input[type='text'][name='salePrice']", $pannel).val();
                    //判断是修改商品统一价格还是修改商品价格
                    var isValidata = false;
                    var salesPrice = 0;
                    var opreaMark = "";
                    if ($("#upRdChange1").attr("checked") == "checked") {
                        salesPrice = $("input[type='text'][name='salePrice']", $("#upRdChange1").parent()).val();
                        opreaMark = $("#upSlOprator").val();
                        isValidata = checkValidata(salesPrice, '价格', "upRdChange1");
                        if (isValidata) {
                            if (parseFloat(salesPrice) == 0) {
                                isValidata = false;
                                $(".c03", $("#upRdChange1").parent()).html("价格不能为0").change();
                            }
                        }
                    }
                    else {
                        salesPrice = $("input[type='text'][name='salePrice']", $("#upRdChange2").parent()).val();
                        opreaMark = "";
                        isValidata = checkValidata(salesPrice, '价格', "upRdChange2");
                        if (isValidata) {
                            if (parseFloat(salesPrice) == 0) {
                                isValidata = false;
                                $(".c03", $("#upRdChange2").parent()).html("价格不能为0").change();
                            }
                        }
                    }
                    
                    if (!isValidata) {
                        $("button[name='pull_on']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                        return;
                    }
                    else {
                        rate.EnableDiscount = false;
                        rate.OpreaMark = opreaMark;
                        rate.OpreaSalePrice = salesPrice;
                        if ($("[name='enableDiscount']", $pannel).attr("checked") == "checked") {
                            rate.EnableDiscount = true;
                        }
                        data.ChannelPriceRates.push(rate);
                        rate.SalePriceRate = 0;
                        $.ajax({
                            url: "/Product/SetProductOnSale",
                            type: "post",
                            dataType: 'json',
                            data: { "setOnSaleRequestStr": JSON.stringify(data), "productLineID": productLineID },
                            success: function (result) {
                                //启用按钮

                                $("button[name='pull_on']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                                if (result.Code == null && result.Message == null) {
                                    $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                                    $("#operateTip").html("商品上架成功!").change();
                                    //$(".mod-operate-detail").hide();
                                    //                                    location.reload();

                                    popupClose('dvUp');
                                    ProductView(GetPageNum());
                                }
                                else {
                                    //启用按钮
                                    $("button[name='pull_on']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                                    alert(result.Message);
                                }
                            }
                        });
                    }

                }




            });


        }

        //克隆实体类
        function clone(myObj) {
            if (typeof (myObj) != 'object') return myObj;
            if (myObj == null) return myObj;
            var myNewObj = new Object();
            for (var i in myObj) myNewObj[i] = clone(myObj[i]);
            return myNewObj;
        }

    </script>
    <!-- 上架 end -->
    <!-- 下架 begin -->
    <script type="text/javascript">

        $(function () {
            // 取消
            $("button[name='cancel']").click(function () {
                $(".mod-operate-detail").hide();
                $(".mod-operate .ico20").css("display", "none");
            });

            // 下架选中全部
            $("input[name='shop_all']").click(function () {
                $("input[name='shop']").attr("checked", this.checked);
            });

        });

        function shopDown() {
            //禁用按钮
            $("button[name='pull_off']").removeClass("submit01-alert").addClass("disabled-alert").attr("disabled", "disabled");

            var multiCode = new Array();

            $("input[name='shop']").each(function () {
                if ($(this).attr("checked") == "checked") {
                    var code = $(this).attr("code");
                    multiCode.push(code);
                }
            });

            if (multiCode.length == 0) {
                //                  alert("请选择店铺！");
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请选择店铺！").change();
                $("button[name='pull_off']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                return;
            }

            var multiID = new Array();
            $(".mod-table-main tr input[type=checkbox]:checked").each(function () {
                multiID.push($(this).siblings().val());
            })

            if (multiID.length == 0) {
                //                  alert("请选择下架商品！");
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请选择下架商品！").change();
                $("button[name='pull_off']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                return;
            }

            $.ajax({
                url: "/Product/SetProductInStock",
                type: "post",
                dataType: 'json',
                data: { "multiIDStr": JSON.stringify(multiID), "multiCodeStr": JSON.stringify(multiCode) },
                success: function (result) {
                    //启用按钮
                    $("button[name='pull_off']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                    if (result.Code == null && result.Message == null) {
                        //                alert("商品下架成功！");
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("商品下架成功！").change();
                        // $(".mod-operate-detail").hide();
                        // location.reload();

                        popupClose('dvDown');
                        ProductView(GetPageNum());
                    }
                    else {
                        //启用按钮
                        $("button[name='pull_off']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                        //                            alert("商品下架失败！");
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html("商品下架失败！").change();
                    }
                }
            });
        }
    </script>
    <!-- 下架 end -->
    <script type="text/javascript">
        $(function () {
            //加载店铺类目数据
            GetProductInCategoryInfo("C001");
        });

        //确定按钮点击事件(店铺类目)
        //        $("button[name='SetShopCategory']").click(function () {

        //        })

        function shopCategory() {

            $("button[name='SetShopCategory']").removeClass("submit01-alert").addClass("disabled-alert").attr("disabled", "disabled");

            var multiID = new Array();
            $(".mod-table-main tr input[type=checkbox]:checked").each(function () {
                multiID.push($(this).siblings().val());
            })

            if (multiID.length == 0) {
                //               alert("请选择要分类的商品！");
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请选择要分类的商品！").change();
                //启用按钮
                $("button[name='SetShopCategory']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                return;
            }

            var multiIDStr = JSON.stringify(multiID);
            //收集用户选择的店铺类目信息
            var productInCategoryCategoryIDs = new Array();
            $("#dvProductInCategoryContainer input[type=checkbox]:checked").each(function () {
                var itsID = $(this).attr("id").replace("shopCat", "");
                productInCategoryCategoryIDs.push(itsID);
            })
            var productInCategoryCategoryIDsStr = JSON.stringify(productInCategoryCategoryIDs);

            $.ajax({
                url: "../../Product/ChanngeProductInCategory",
                type: "post",
                data: { "multiIDStr": multiIDStr, "productInCategoryCategoryIDsStr": productInCategoryCategoryIDsStr, "channelCode": "C001" },
                success: function (res) {
                    //                    alert(res);
                    $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                    $("#operateTip").html(res).change();
                    //启用按钮
                    $("button[name='SetShopCategory']").addClass("submit01-alert").removeClass("disabled-alert").attr("disabled", false);
                    if (res == "设置成功") {
                        //$(".mod-operate-detail").hide();
                        $("#btn-Recommend").siblings("i").css("display", "none");
                        //                        location.reload();

                        popupClose('dvCategory');
                        ProductView(GetPageNum());
                    }
                },
                error: function () {

                }
            })
        }
    </script>
    <script type="text/javascript">
        function ChangeSort(type, productID) {
            // if (type == "UP" || type == "TOP") {
            //                var minValue = $("input[name = 'sub']").first().parent().find('input').eq(1).val();
            //                alert(minValue);
            // }
            $.ajax({
                url: "../../Product/ChangeSort",
                type: "post",
                data: { "type": type, "productID": productID },
                success: function (res) {
                    if (res == "OK") {
                        //location.reload();
                        ProductView(GetPageNum());
                    } else {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html(res).change();
                    }
                },
                error: function () {

                }
            })
        }



        function popupOpen() {
            var BatchSend = new Array();
            $(".mod-table-main tr input[type=checkbox]:checked").each(function () {
                BatchSend.push($(this).siblings().val());
            })
            if (BatchSend.length == 0) {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow"); //黄色
                $("#operateTip").html("请先勾选商品再进行批量操作！").change();
                return;
            }

            $("#ShopNewProduct").attr("checked", false);
            $("#ShopFineSelect").attr("checked", false);
            $("#ShopPreferential").attr("checked", false);

            if (BatchSend.length == 1) {
                $.ajax({
                    url: "../../Product/GetProductByID",
                    type: "get",
                    data: { "productID": BatchSend[0] },
                    success: function (res) {
                        var productinfo = JSON.parse(res);
                        if (productinfo.NewProduct == true) {
                            $("#ShopNewProduct").attr("checked", "checked");
                        }

                        if (productinfo.FineSelect == true) {
                            $("#ShopFineSelect").attr("checked", "checked");
                        }

                        if (productinfo.Preferential == true) {
                            $("#ShopPreferential").attr("checked", "checked");
                        }
                    },
                    error: function () {
                        $(".Loading").removeClass("style0yellow style0green").addClass("style0red");
                        $("#operateTip").html("获取商品信息错误").change();
                    }
                })
            }

            popupOperate('dvShopRecommend', '商品推荐', 'dvRecommend');
        }

        function unPopupOpen() {

            var BatchSend = new Array();
            $(".mod-table-main tr input[type=checkbox]:checked").each(function () {
                BatchSend.push($(this).siblings().val());
            })
            if (BatchSend.length == 0) {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow"); //黄色
                $("#operateTip").html("请先勾选商品再进行批量操作！").change();
                return;
            }

            $("#upShopNewProduct").attr("checked", false);
            $("#upShopFineSelect").attr("checked", false);
            $("#upShopPreferential").attr("checked", false);

            if (BatchSend.length == 1) {
                $.ajax({
                    url: "../../Product/GetProductByID",
                    type: "get",
                    data: { "productID": BatchSend[0] },
                    success: function (res) {
                        var productinfo = JSON.parse(res);
                        if (productinfo.NewProduct == true) {
                            $("#upShopNewProduct").attr("checked", "checked");
                        }

                        if (productinfo.FineSelect == true) {
                            $("#upShopFineSelect").attr("checked", "checked");
                        }

                        if (productinfo.Preferential == true) {
                            $("#upShopPreferential").attr("checked", "checked");
                        }
                    },
                    error: function () {
                        $(".Loading").removeClass("style0yellow style0green").addClass("style0red");
                        $("#operateTip").html("获取商品信息错误").change();
                    }
                })
            }

            popupOperate('dvShopUnRecommend', '取消推荐', 'dvUnRecommend');

        }




        function shipCatPopupOpen() {

            var shipCat = new Array();
            $(".mod-table-main tr input[type=checkbox]:checked").each(function () {
                shipCat.push($(this).siblings().val());
            })
            if (shipCat.length == 0) {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow"); //黄色
                $("#operateTip").html("请先勾选商品再进行批量操作！").change();
                return;
            }

            $("#dvProductInCategoryContainer input[type=checkbox]").each(function () {
                $(this).attr("checked", false);
            })

            if (shipCat.length == 1) {
                $.ajax({
                    url: "../../Product/GetProductInCategoryIDsByProductIDAndChannelCode",
                    type: "get",
                    data: { "productID": shipCat[0], "channelCode": "C001" },
                    success: function (res) {
                        var shopCategoryIDs = JSON.parse(res);
                        for (var i = 0; i < shopCategoryIDs.length; i++) {
                            $("#dvProductInCategoryContainer input[type=checkbox]").each(function () {
                                if ($(this).attr("id").replace("shopCat", "") == shopCategoryIDs[i]) {
                                    $(this).attr("checked", "checked");
                                }
                            })
                        }
                    },
                    error: function () {
                        $(".Loading").removeClass("style0yellow style0green").addClass("style0red");
                        $("#operateTip").html("获取商品的店铺类目时出错").change();
                    }
                })
            }

            popupOperate('dvShopCategory', '店铺分类', 'dvCategory');
        }
    </script>
</asp:Content>
