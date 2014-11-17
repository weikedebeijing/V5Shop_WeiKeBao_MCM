<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>"
    ValidateRequest="false" %>

<%@ Import Namespace="V5.MetaData.Market.Model" %>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../../Content/Css/flexigrid/flexigrid.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        /* .tDiv .fbutton .add
        {
            background: url(../../images/add.png) no-repeat left;
        }
        .tDiv .fbutton .delete
        {
            background: url(../../images/close.png) no-repeat left;
        }


        .tDiv .fbutton .modify
        {
            background: url(../../images/edit.png) no-repeat left;
        }
       */
        .v5-page a
        {
            cursor: pointer;
        }
        
        #flexigridtable a
        {
            color: #225599;
        }
        
        .mod-page .con
        {
            bottom: 0;
            left: 185px;
            position: fixed;
            right: 0;
            z-index: 110;
        }
    </style>
    <script src="../../Scripts/Js/allselect.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--<div style=" display:block; " class="Loading">正在加载详细信息，请稍后...</div>--%>
    <div class="MCM-N-L">
        <div class="MCM-C-M">
            <!--标题 begin-->
            <div class="mod-title">
                <div class="con style01">
                    <h1>
                        商品列表</h1>
                    <%--<span>(共14条)</span>--%>
                </div>
            </div>
            <!--标题 end-->
            <!--选项卡 begin-->
            <div class="mod-tab">
                <div class="con style01">
                    <ul>
                        <li id="liProductTotalCount" class="current"><a>全部(<span id="productTotalCount"></span>)</a></li>
                        <li><a href="javascript:void(0)">直销(10)</a></li>
                        <li class="current"><a class="c16" href="javascript:void(0)">分销(28)</a></li>
                        <%--<li id="liNoStockProductCount"><a>缺货商品(<span id="noStockProductCount"></span>)</a></li>--%>
                    </ul>
                </div>
            </div>
            <!--选项卡 end-->
            <!--标签 begin-->
            <div class="label-mod">
                <div class="con style01">
                    <ul>
                        <li class="current"><a href="javascript:void(0)">在售中(40)</a></li>
                        <li><a href="javascript:void(0)">仓库中(10)</a></li>
                        <li><a href="javascript:void(0)">库存预警(10)</a></li>
                    </ul>
                </div>
            </div>
            <!--标签 end-->
            <%--  <ul class="nav nav-tabs" style="margin-bottom: 0px;">
            <li class="active"><a id="1" href="#" data-toggle="tab">全部商品</a></li>
            <li><a id="2" href="#" data-toggle="tab">缺货商品</a></li>
        </ul>--%>
            <!--快捷操作条-->
            <%-- <div class="functionItemBar">
                    <div>
                        <a href="../../Product/AddProduct">
                            <input class="functionItemButton" style="width:100px;" type="button" name="name" value="添加" /></a></div>
                    <div>
                        删除</div>
                    <div style="width: 80px;">
                        快速发布</div>
                    <div>
                        <input class="functionItemButton" style="width:100px;" type="button" value="上架" onclick="Grounding()" /></div>
                    <div>
                        <input class="functionItemButton" style="width:100px;" type="button" value="下架" onclick="Undercarriage()" /></div>
                </div>--%>
            <!--快捷操作条-->
            <!--操作栏 begin-->
            <div class="mod-operate">
                <div class="con style01">
                    <!--搜索 begin-->
                    <div class="search-bar">
                        <ul style="display: block;" class="ul-search">
                            <li>
                                <input id="txtSearchCondition" type="text" style="color: #999;" x-webkit-grammar="builtin:translate"
                                    x-webkit-speech="" value="请输入商品名称/商家编码..." class="v5-input in200 search" name="" />
                            </li>
                            <li><a class="search-btn" href="#">查询</a></li>
                        </ul>
                    </div>
                    <!--搜索 end-->
                    <ul class="btn">
                        <li><a class="a-btn" href="../../Product/AddProduct?productID=0">添加</a></li>
                        <li><a class="a-btn" href="javascript:void(0)" onclick="DeleteTheseProduct()">删除</a></li>
                        <li><a data="0" href="#" class="a-btn">上架</a><i class="ico20 hidden" style="display: block;"></i></li>
                        <li><a data="1" href="#" class="a-btn">下架</a><i class="ico20 hidden" style="display: none;"></i></li>
                    </ul>
                </div>
            </div>
            <!--操作栏 end-->
            <div class="mod-operate-detail" style="display: none;">
                <div class="mod-form">
                    <div class="con style03">
                        <dl>
                            <dt>请选择上架的店铺</dt>
                            <dd>
                                <input type="checkbox" name="os_shop" code="C002" />
                                <label class="r30" for="shop01">
                                    分销商城</label>
                                <%foreach (var item in ViewData["shop"] as List<Opened>)
                                  { %>
                                <input type="checkbox" id="shop01" name="os_shop" code="<%=item.Code %>" />
                                <label class="r30" for="shop01">
                                    <%= item.Title %></label>
                                <% } %>
                            </dd>
                            <div class="h20" name="pn_C002" style="display: none">
                            </div>
                            <dt name="pn_C002" style="display: none">分销商城价格设置</dt>
                            <dd name="pn_C002" style="display: none">
                                <ul>
                                    <li>
                                        <input type="checkbox" id="price04" name="marketPrice">
                                        <label class="r5">
                                            建议零售价&nbsp;：&nbsp;一口价&nbsp;*</label>
                                        <input type="text" class="v5-input in50" name="marketPrice">%</li>
                                    <li>
                                        <input type="checkbox" id="price05" name="wholeSalePrice">
                                        <label for="price05" class="r5">
                                            经销商采购价&nbsp;：&nbsp;一口价&nbsp;*</label>
                                        <input type="text" class="v5-input in50" name="wholeSalePrice">
                                        % </li>
                                    <li>
                                        <input type="checkbox" id="price06" name="distributionPrice">
                                        <label for="price06" class="r5">
                                            代销商采购价&nbsp;：&nbsp;一口价&nbsp;*</label>
                                        <input type="text" class="v5-input in50" name="distributionPrice">
                                        % </li>
                                    <li>
                                        <input type="checkbox" id="price07" name="enableDiscount">
                                        <label for="price07" class="r5">
                                            参与会员折扣</label>
                                    </li>
                                </ul>
                            </dd>
                            <%foreach (var item in ViewData["shop"] as List<Opened>)
                              { %>
                            <div class="h20" name="pn_<%=item.Code %>" style="display: none">
                            </div>
                            <dt name="pn_<%=item.Code %>" style="display: none">
                                <%=item.Title %>价格设置</dt>
                            <dd name="pn_<%=item.Code %>" style="display: none">
                                <ul>
                                    <li>
                                        <input type="checkbox" name="salesPrice" code="<%=item.Code %>">
                                        <label for="price01" class="r5">
                                            店铺零售价&nbsp;：&nbsp;一口价&nbsp;*</label>
                                        <input type="text" class="v5-input in50" name="salePrice">
                                        % </li>
                                    <li>
                                        <input type="checkbox" name="enableDiscount">
                                        <label for="price02" class="r5">
                                            参与会员折扣</label>
                                    </li>
                                </ul>
                            </dd>
                            <% } %>
                        </dl>
                        <h1 class="fb">
                            当前仅支持立刻上架</h1>
                        <button type="button" class="submit01 t10" name="pull_on">
                            &nbsp;&nbsp;&nbsp;上架&nbsp;&nbsp;&nbsp;</button>
                        <button type="button" class="submit01 t10" name="cancel">
                            &nbsp;&nbsp;&nbsp;取消&nbsp;&nbsp;&nbsp;</button>
                    </div>
                </div>
            </div>
            <div class="mod-operate-detail" style="display: none;">
                <div class="mod-form">
                    <div class="con style01">
                        <div style="border-bottom: 0;" class="title">
                            <h3>
                                <input type="checkbox" id="cg-tb1" name="shop_all" />
                                <label for="cg-tb1">
                                    请选择下架店铺</label>
                            </h3>
                        </div>
                        <dl>
                            <dd class="0">
                                <%foreach (var item in ViewData["shop"] as List<Opened>)
                                  { %>
                                <input type="checkbox" id="cg-tb1-01" name="shop" code="<%=item.Code %>" />
                                <label for="cg-tb1-01" class="r30">
                                    <%= item.Title %></label>
                                <% } %>
                            </dd>
                        </dl>
                        <h1 class="fb">
                            当前仅支持立刻下架</h1>
                        <button type="button" class="submit01 t10" name="pull_off">
                            &nbsp;&nbsp;&nbsp;下架&nbsp;&nbsp;&nbsp;</button>
                        <button type="button" class="submit01 t10" name="cancel">
                            &nbsp;&nbsp;&nbsp;取消&nbsp;&nbsp;&nbsp;</button>
                    </div>
                </div>
            </div>
        </div>
        <!--点上架按钮显示的内容-->
        <div style="clear: both;">
            <!--放表格的容器-->
            <div id="flexigridDiv">
                <table id="flexigridtable" class="flexigridtableClass" style="display: none; border: none;">
                </table>
            </div>
            <!--放表格的容器-->
        </div>
    </div>
    <!--Page Start-->
    <div class="mod-page">
        <div id="pageDiv" class="con style01" style="margin-bottom: -35px;">
            <%--<div class="total">
                共有20条记录</div>--%>
            <%--   <div id="dvUpOrDown" style="width: 100%; height: 10px; background-color: Gray;">
            </div>--%>
            <div class="page-show">
                <label>
                    每页最多显示：</label>
                <span class="page-entry">20条</span>
            </div>
            <div class="v5-page">
                <input type="hidden" id="hiddenPageCount" name="name" value=" " />
                <%--<a href="#">«</a> <span class="current">1</span> <a href="#">2</a> <a href="#">3</a>
                <a href="#">4</a> <a href="#">5</a> ... <a href="#">30</a> <a href="#">31</a> <a
                    href="#">»</a>--%>
                <a onclick="GoToFirstPage()" href="#">«</a> <span id="pageIndexContainer"></span>
                <a onclick="GoToLastPage()" href="#">»</a>
            </div>
        </div>
    </div>
    <!--Page End-->
    <script src="../../Scripts/jquery-easyui-1.3.2/jquery-1.8.0.min.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/flexigrid.js" type="text/javascript"></script>
    <%--<script src="../../Scripts/Js/flexigrid.pack.js" type="text/javascript"></script>--%>
    <script src="../../Scripts/Js/bootstrap_Expand.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/SetProductPriceRequest.js" type="text/javascript"></script>
    <script src="../../../Scripts/Js/NumberPaging.js" type="text/javascript"></script>
    <script src="../../../Scripts/Js/Common.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            ChangeTabs();
        })

        function Grounding() {
            var productId = 0;
            $("#flexigridtable tr").each(function () {
                productId = $("input[type='checkbox']:checked").next().val();
            });


            window.location.href = "/Product/ProductGrounding?productID=" + productId;
            // window.location.href = "/Product/ProductGrounding?productID=" + 434;
            //            $.ajax({
            //                url: "/Product/ProductGrounding",
            //                type: "post",
            //                data: { "productId": productId },
            //                success: function (result) {
            //                    if (result != null) {
            //                        window.location.href = "/Product/ProductGrounding";
            //                    }
            //                }
            //            })

        }

        function Undercarriage() {
            window.location.href = "/Product/Undercarriage";
        }


        //搜索按钮
        $(function () {
            $(".search-btn").click(function () {
                if ($("input", $(".search-btn").parents("ul")).val() == "请输入商品名称/商家编码...") {
                    $("input", $(".search-btn").parents("ul")).val("");
                    $("input", $(".search-btn").parents("ul")).focus();
                }
                if ($("input", $(".search-btn").parents("ul")).val() == "") {
                    $("input", $(".search-btn").parents("ul")).focus();
                }
            })
            $("input", $(".search-btn").parents("ul")).click(function () {
                if ($(this).val() == "请输入商品名称/商家编码...") {
                    $(this).val("");
                    $(this).focus();
                }
            })
            $("input", $(".search-btn").parents("ul")).blur(function () {
                if ($(this).val() == "") {
                    $(this).val("请输入商品名称/商家编码...");
                }
            })
        })

        $(function () {
            $width = $(window).width() - 200;
            //            //页面load完成后加载表格
            //            var url = window.location.href;
            //            var currentPage = url.match(/page=\d+/g);
            //            //页码过滤条件
            //            var currentPageIndex = "1";
            //            if (currentPage != null) {
            //                currentPageIndex = currentPage[0].substring(currentPage[0].lastIndexOf('=') + 1);
            //            }
            //            //搜索过滤条件
            //            var searchCondition = url.match(/&condition=.*/g);
            //            //searchCondition = searchCondition == null ? "" : searchCondition;
            //            //给搜索框赋值（从url获取的）
            //            var conditionItemMark = "";
            //            if (searchCondition != "") {
            //                conditionItemMark = searchCondition[0].substring(searchCondition[0].lastIndexOf('=') + 1);
            //                if (conditionItemMark != "") {
            //                    conditionItemMark = decodeURI(conditionItemMark)
            //                    $("#txtSearchCondition").val(conditionItemMark);
            //                }
            //            }

            //            //有无库存过滤条件
            //            var noStock = url.match(/&noStock=1/g);
            //            noStock = noStock == null ? "&noStock=0" : "&noStock=1";
            //            if (noStock == "&noStock=0") {
            //                $("li", $("#liProductTotalCount").parent()).removeClass("current");
            //                $("a", $("#liProductTotalCount").parent()).removeClass("c16");
            //                $("#liProductTotalCount").addClass("current");
            //                $("#liProductTotalCount a").addClass("c16");
            //            } else if (noStock == "&noStock=1") {
            //                $("li", $("#liNoStockProductCount").parent()).removeClass("current");
            //                $("a", $("#liNoStockProductCount").parent()).removeClass("c16");
            //                $("#liNoStockProductCount").addClass("current");
            //                $("#liNoStockProductCount a").addClass("current");
            //            }

            //调用表格显示数据

            UseFlexigridTable("flexigridtable", $width, currentPageIndex, 0, searchCondition[0]);



            //            //两个小标签的显示数字
            //            var partUrl = url.substring(url.indexOf('?') + 1);
            //            partUrl = partUrl.replace(/&noStock=\d/g, "&noStock=0");
            //            $.ajax({
            //                url: '../../Product/ProductListCount?' + partUrl + '',
            //                type: 'get',
            //                async: false,
            //                success: function (res) {
            //                    $("#productTotalCount").text(res);
            //                }
            //            })
            //            partUrl = partUrl.replace(/&noStock=\d/g, "&noStock=1");
            //            $.ajax({
            //                url: '../../Product/ProductListCount?' + partUrl + '',
            //                type: 'get',
            //                async: false,
            //                success: function (res) {
            //                    $("#noStockProductCount").text(res);
            //                }
            //            })
            //数字分页
            //            var productTotalCount = 0;
            //            if (noStock == "&noStock=0") {
            //                productTotalCount = $("#productTotalCount").text();
            //            } else {
            //                productTotalCount = $("#noStockProductCount").text();
            //            }
            //            //var currentPage = $("#hiddenCurrentPageMark").val();
            //            var pageCount = Math.ceil(parseInt(productTotalCount) / 20);
            //            $("#hiddenPageCount").val(pageCount);
            //            $("#pageIndexContainer").text("");
            //            currentPageIndex = parseInt(currentPageIndex);
            //            if (currentPageIndex < 1) {
            //                currentPageIndex = 1;
            //            } else if (currentPageIndex > pageCount) {
            //                currentPageIndex = pageCount;
            //            }

            NumberPaging(currentPageIndex, pageCount, "pageIndexContainer");



            //            $(window).resize(function () {

            //                $width = $(window).width() - 200;

            //                //调用表格显示数据
            //                UseFlexigridTable("flexigridtable", $width, currentPageIndex, noStock, searchCondition[0]);

            //            })


            //            $(".search-btn").click(function () {
            //                var conditionItem = $("#txtSearchCondition").val().replace(/^\s*/g, "").replace(/\s*$/g, "");
            //                if (conditionItem != "") {
            //                    url = url.replace(/&condition=.*/g, "&condition=" + conditionItem + "").replace(/page=\d*&/g, "page=1&");
            //                    window.location.href = url;
            //                }
            //            })

            //            $("#liProductTotalCount").click(function () {
            //                $("li", $(this).parent()).removeClass("current");
            //                $(this).addClass("current");

            //                var noStock = url.match(/&noStock=\d/g);
            //                url = url.replace(/&noStock=\d/g, "&noStock=0");
            //                url = url.replace(/page=\d+/g, "page=1");
            //                window.location.href = url;
            //            })
            //            $("#liNoStockProductCount").click(function () {
            //                $("li", $(this).parent()).removeClass("current");
            //                $(this).addClass("current");
            //                var noStock = url.match(/&noStock=\d/g);
            //                url = url.replace(/&noStock=\d/g, "&noStock=1");
            //                url = url.replace(/page=\d+/g, "page=1");
            //                window.location.href = url;
            //            })
        })



        function UseFlexigridTable(flexigridtableID, width, page, noStock, conditionItem) {
            $('#' + flexigridtableID + '').flexigrid({
                url: '../../Product/ProductList?page=' + page + '' + noStock + '' + conditionItem + '',
                dataType: 'json',
                method: "get", //IE必需
                colModel: [
				{ display: '商品名称', name: 'productName', width: 300, sortable: false, align: 'left' },
                { display: '商家编码', name: 'productCode', width: 150, sortable: false, align: 'left' },
                { display: '所在店铺', name: 'SelllingShop', width: 100, sortable: false, align: 'left' },
			    { display: '价格', name: 'productSalesPrice', width: 80, sortable: false, align: 'left' },
                { display: '库存', name: 'productTotalStock', width: 80, sortable: false, align: 'left' },
                { display: '更新时间', name: 'productUpdateDate', width: 200, sortable: false, align: 'left' }
				],

                procmsg: '正在处理数据，请稍候 ...', //正在处理的提示信息
                width: width,
                height: 350,
                showCheckbox: true,
                showDetail: true,
                showOperate: true,
                detailUrl: '../../Product/ProductDetail?productID=',
                editUrl: "../../Product/AddProduct?productID=",
                deleteUrl: "../../Product/DeleteProduct",
                chinese: [{ "selectAll": "全选" }, { "op": "操作" }, { "detail": "查看" }, { "edit": "编辑" }, { "deleted": "删除" }, ]
            });
        }

//        function Operate() {
//            alert("添加删除修改");
//        }

        //单个删除商品
        function DeleteThisProduct(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var productID = $(eventSrc).attr("id");
            $.ajax({
                url: "../../Product/DeleteProduct?id=" + productID + "",
                type: "get",
                success: function (res) {
                    var jsonRes = JSON.parse(res);
                    if (jsonRes.Code == null && jsonRes.Message == null) {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("删除成功").change();
                        window.location.href = window.location.href;
                    }
                },
                error: function () {
                    $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                    $("#operateTip").html("单个删除商品过程中出错").change();
                }
            })
        }

        function DeleteTheseProduct() {
            var deleteProductIDArray = new Array();
            $("#flexigridtable tr input[type=checkbox]:checked").each(function () {
                deleteProductIDArray.push($(this).siblings().val());
            })
            if (deleteProductIDArray.length != 0) {

                deleteProductIDArray = JSON.stringify(deleteProductIDArray);
                $.ajax({
                    url: "../../Product/DeleteAllSelectedProduct",
                    type: "post",
                    data: { "deleteProductIDArray": deleteProductIDArray },
                    success: function (res) {
                        var jsonRes = JSON.parse(res);
                        if (jsonRes.Code == null && jsonRes.Message == null) {
                            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                            $("#operateTip").html("删除成功").change();
                            window.location.href = window.location.href;
                        }
                    },
                    error: function () {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html("批量删除商品过程中出错").change();
                    }
                })
            } else {
            $(".Loading").removeClass("style0red style0green").addClass("style0yellow");
            $("#operateTip").html("请先选择要删除的商品").change();
            }
        }

    </script>
    <!-- 上架 begin -->
    <script type="text/javascript">
        $(function () {
            // 初始化显示
            $("input[name='os_shop']:checked").each(function () {
                var code = $(this).attr("code");
                $("[name='pn_" + code + "']").show();
            });

            // 选中店铺显示价格
            $("input[name='os_shop']").click(function () {
                if ($(this).attr("checked")) {
                    var code = $(this).attr("code");
                    $("[name='pn_" + code + "']").show();
                }
                else {
                    var code = $(this).attr("code");
                    $("[name='pn_" + code + "']").hide();
                }
            });

            //克隆实体类
            function clone(myObj) {
                if (typeof (myObj) != 'object') return myObj;
                if (myObj == null) return myObj;
                var myNewObj = new Object();
                for (var i in myObj) myNewObj[i] = clone(myObj[i]);
                return myNewObj;
            }

            function checkRate(value, caption) {
                if (value == undefined || value == "") {
                    alert("请输入" + caption + "!");
                    return false;
                }

                if (isNaN(value)) {
                    alert(caption + "格式错误!");
                    return false;
                }

                if (parseFloat(value) < 0) {
                    alert(caption + "不能为负数!");
                    return false;
                }

                return true;
            }

            // 上架提交
            $("button[name='pull_on']").click(function () {
                //禁用按钮
                $(this).removeClass("submit01").addClass("disabled").attr("disabled", "disabled");

                var multiID = new Array();
                $("#flexigridtable tr input[type=checkbox]:checked").each(function () {
                    multiID.push($(this).siblings().val());
                })

                if (multiID.length == 0) {
                $(".Loading").removeClass("style0red style0green").addClass("style0yellow");
                $("#operateTip").html("请选择上架商品").change();
                    //启用按钮
                    $("button[name='pull_on']").addClass("submit01").removeClass("disabled").attr("disabled", false);
                    return;
                }

                // 获取页面设置的价格比率
                var template = $.parseJSON('<%= ViewData["priceTemplate"] %>');
                var data = clone(template);
                data.MultiProductID = multiID;
                data.ChannelPriceRates = new Array();

                $("input[name='os_shop']:checked").each(function () {
                    var code = $(this).attr("code");
                    var $pannel = $("[name='pn_" + code + "']");
                    var rate = clone(template.ChannelPriceRates[0]);
                    rate.Code = code;
                    if (code == "C002") {
                        // 分销商城
                        if ($("input[type='checkbox'][name='marketPrice']:checked", $pannel).length > 0) {
                            var marketPriceRate = $("input[type='text'][name='marketPrice']", $pannel).val();
                            if (!checkRate(marketPriceRate, '建议零售价')) {
                                //启用按钮
                                $("button[name='pull_on']").addClass("submit01").removeClass("disabled").attr("disabled", false);
                                return;
                            }
                            rate.MarketPriceRate = marketPriceRate;
                        }

                        if ($("input[type='checkbox'][name='wholeSalePrice']:checked", $pannel).length > 0) {
                            var wholeSalePriceRate = $("input[type='text'][name='wholeSalePrice']", $pannel).val();
                            if (!checkRate(wholeSalePriceRate, '经销商采购价')) {
                                //启用按钮
                                $("button[name='pull_on']").addClass("submit01").removeClass("disabled").attr("disabled", false);
                                return;
                            }
                            rate.WholeSalePriceRate = wholeSalePriceRate;
                        }

                        if ($("input[type='checkbox'][name='distributionPrice']:checked", $pannel).length > 0) {
                            var distributionPriceRate = $("input[type='text'][name='distributionPrice']", $pannel).val();
                            if (!checkRate(distributionPriceRate, '代销商采购价')) {
                                //启用按钮
                                $("button[name='pull_on']").addClass("submit01").removeClass("disabled").attr("disabled", false);
                                return;
                            }
                            rate.DistributionPriceRate = distributionPriceRate;
                        }
                    }
                    else {

                        if ($("input[type='checkbox'][name='salePrice']:checked", $pannel).length > 0) {
                            var salePriceRate = $("input[type='text'][name='salePrice']", $pannel).val();
                            if (!checkRate(salePriceRate, '店铺零售价')) {
                                //启用按钮
                                $("button[name='pull_on']").addClass("submit01").removeClass("disabled").attr("disabled", false);
                                return;
                            }
                            rate.SalePriceRate = salePriceRate;
                        }
                    }

                    rate.EnableDiscount = false;

                    if ($("[name='enableDiscount']", $pannel).attr("checked") == "checked") {
                        rate.EnableDiscount = true;
                    }

                    data.ChannelPriceRates.push(rate);
                });

                $.ajax({
                    url: "/Product/SetProductOnSale",
                    type: "post",
                    dataType: 'json',
                    data: { "setOnSaleRequestStr": JSON.stringify(data) },
                    success: function (result) {
                        //启用按钮
                        $("button[name='pull_on']").addClass("submit01").removeClass("disabled").attr("disabled", false);
                        if (result.Code == null && result.Message == null) {
                            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                            $("#operateTip").html("商品上架成功").change();
                            $(".mod-operate-detail").hide();
                        }
                        else {
                            //启用按钮
                            $("button[name='pull_on']").addClass("submit01").removeClass("disabled").attr("disabled", false);
                            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                            $("#operateTip").html(result.Message).change();
                        }
                    }
                });
            });
        }); 
        
    </script>
    <!-- 上架 end -->
    <!-- 下架 begin -->
    <script type="text/javascript">

        $(function () {
            // 取消
            $("button[name='cancel']").click(function () {
                $(".mod-operate-detail").hide();
            });

            // 下架选中全部
            $("input[name='shop_all']").click(function () {
                $("input[name='shop']").attr("checked", this.checked);
            });

            // 下架提交
            $("button[name='pull_off']").click(function () {
                //禁用按钮
                $(this).removeClass("submit01").addClass("disabled").attr("disabled", "disabled");

                var multiCode = new Array();

                $("input[name='shop']").each(function () {
                    if ($(this).attr("checked") == "checked") {
                        var code = $(this).attr("code");
                        multiCode.push(code);
                    }
                });

                if (multiCode.length == 0) {
                $(".Loading").removeClass("style0red style0green").addClass("style0yellow");
                $("#operateTip").html("请选择店铺").change();
                    $("button[name='pull_off']").addClass("submit01").removeClass("disabled").attr("disabled", false);
                    return;
                }

                var multiID = new Array();
                $("#flexigridtable tr input[type=checkbox]:checked").each(function () {
                    multiID.push($(this).siblings().val());
                })

                if (multiID.length == 0) {
                    $(".Loading").removeClass("style0red style0green").addClass("style0yellow");
                    $("#operateTip").html("请选择下架商品").change();
                    $("button[name='pull_off']").addClass("submit01").removeClass("disabled").attr("disabled", false);
                    return;
                }

                $.ajax({
                    url: "/Product/SetProductInStock",
                    type: "post",
                    dataType: 'json',
                    data: { "multiIDStr": JSON.stringify(multiID), "multiCodeStr": JSON.stringify(multiCode) },
                    success: function (result) {
                        //启用按钮
                        $("button[name='pull_off']").addClass("submit01").removeClass("disabled").attr("disabled", false);
                        if (result.Code == null && result.Message == null) {
                            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                            $("#operateTip").html("商品下架成功").change();
                            $(".mod-operate-detail").hide();
                        }
                        else {
                            //启用按钮
                            $("button[name='pull_off']").addClass("submit01").removeClass("disabled").attr("disabled", false);
                            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                            $("#operateTip").html("商品下架失败").change();
                        }
                    }
                });
            });
        });

    </script>
    <!-- 下架 end -->
</asp:Content>
