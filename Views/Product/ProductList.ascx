<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="V5.MetaData.Product.Model" %>
<!--列表 Start-->
<%--<link href="../../../Content/Css/css4.0/module.css" rel="stylesheet" type="text/css" />
<script src="../../../Scripts/Js/allselect.js" type="text/javascript"></script>--%>
<div class="mod-table">
    <div class="mod-table-head">
        <div class="con style0list">
            <table>
                <colgroup>
                    <col style="width: 5%;">
                    <col style="width: 20%;">
                    <col style="width: 10%;">
                    <col style="width: 10%;">
                    <%--    <col class="shopMark" style="width: 120px;">--%>
                    <%--  <col class="drpShopMark" style="width: 120px;">
                    <col class="drpShopMark" style="width: 120px;">--%>
                    <col style="width: 10%;">
                    <col style="width: 15%;">
                    <col style="width: 10%;">
                    <col style="width: 10%;">
                    <col class="weiXinShopMark" style="width: 10%;">
                    <col style="width: auto;">
                </colgroup>
                <tr>
                    <th>
                        <label>
                            <input type="checkbox" value="" name="" id="ckall" onclick="CheckAll(event)">
                        </label>
                    </th>
                    <th>商品名称
                    </th>
                    <th>商家编码
                    </th>
                    <th>销售价格
                    </th>
                    <%--  <th class="shopMark">
                        <div class="iconbg-arrow down">
                            所在店铺</div>
                    </th>--%>
                    <%--   <th class="drpShopMark">
                        <div class="iconbg-arrow down">
                            分销店铺数量</div>
                    </th>
                    <th class="drpShopMark">
                        <div class="iconbg-arrow down">
                            分销价格状态</div>
                    </th>--%>
                    <th>库存总数
                    </th>
                    <th>更新时间
                    </th>
                    <th class="weiXinShopMark">
                        <div class="iconbg-arrow down">
                            分享次数
                        </div>
                    </th>
                    <th>排序
                    </th>
                    <th>操作
                    </th>
                    <th></th>
                </tr>
            </table>
        </div>
    </div>
    <div class="mod-table-main">
        <div class="con style0line" style="width: 100%;">
            <table cellspacing="0" cellpadding="5" border="0" width="100%">
                <colgroup>
                    <col style="width: 5%;">
                    <col style="width: 20%;">
                    <col style="width: 10%;">
                    <col style="width: 10%;">
                    <%-- <col class="shopMark" style="width: 120px;">--%>
                    <%--     <col class="drpShopMark" style="width: 120px;">
                    <col class="drpShopMark" style="width: 120px;">--%>
                    <col style="width: 10%;">
                    <col style="width: 15%;">
                    <col style="width: 10%;">
                    <col class="weiXinShopMark" style="width: 10%;">
                    <col style="width: 10%">
                    <col style="width: auto;">
                </colgroup>
                <%string drpUrl = ViewData["drpUrl"] == null ? "" : ViewData["drpUrl"].ToString();
                  foreach (var item in Model.DataSource)
                  {%>
                <tr class="tr-Current" <% 
                      if (item.TagID == 0)
                      {
                        %>
                    style="font-weight: bold; color: #333333;" <% } %>>
                    <td>
                        <div class="cell">
                            <label>
                                <input type="checkbox" value="" name="sub" onclick="CheckThis()" />
                                <input type="hidden" name="name" value="<%=item.ID %>" />
                            </label>
                            <!--<span class="flag-gray"></span>-->
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=item.Name%>
                            <%--<%Response.Write(item.Name.Length > 16 ? item.Name.Substring(0, 16) + "..." : item.Name);%></a>--%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=item.OuterCode %>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=item.SalesPrice %>
                        </div>
                    </td>
                    <%--            <td class="shopMark">
                        <div class="cell">
                            <% string shopsStr = item.SelllingShop;
                               if (!string.IsNullOrEmpty(shopsStr))
                               {
                                   string[] shops = shopsStr.Split(',');
                                   bool markTaobao = false;
                                   foreach (var item2 in shops)
                                   {
                                       if (item2 == "C002")
                                       {%>
                            <%--  <i class='icon-fenxiao'></i>
                            <div class="dvGoToDrpContainer">
                                <div class="iconLeft">
                                </div>
                                <div class="dvGoToDrp">
                                    <div class="dvDrpLink">
                                        <a href='<%=drpUrl%>/product.aspx?id=<%=item.ID %>' target="_blank">分销商城&nbsp;&nbsp;&gt;&gt;</a>
                                    </div>
                                </div>
                            </div>
                            <!--屏蔽分销商城-->
                            <% }
                                       else if (item2 == "C001")
                                       {%>
                            <div style="*z-index: 1;" class="mod-pops">
                                <div class="con style0icon">
                                    <div class="pop-surround">
                                        <a href="#"><i class="icon-wechat"></i></a>
                                       
                                    </div>
                                </div>
                            </div>
                            <% }
                                       else
                                       {
                                           if (markTaobao == false)
                                           {%>
                            <div style="*z-index: 2;" class="mod-pops">
                                <div class="con style0icon">
                                    <div class="pop-surround">
                                        <a href="#"><i class="icon-taobao"></i></a>
                                        <div class="pop-a-content">
                                            <i class="arrow"></i>
                                            <div class="text">
                                                <%foreach (var itemInChannelInfo in item.SellingProductInShop)
                                                  {%>
                                                <a href='http://item.taobao.com/item.htm?id=<%=itemInChannelInfo.Value %>' target="_blank">
                                                    <%=itemInChannelInfo.Key %>&nbsp;&nbsp;&gt;&gt;</a>
                                                <% } %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <% markTaobao = true;
                                           }

                                       }
                                   }
                               }
                            %></div>
                    </td>--%>
                    <%--    <td class="drpShopMark">
                        <div class="cell c07">
                            <a href="../../product/ItemInDrpChannel?productid=<%=item.ID%>">
                                <%=item.DrpChannelCount%></a>
                        </div>
                    </td>
                    <td class="drpShopMark">
                        <div class="cell">
                            <%=item.DrpPriceState%>
                        </div>
                    </td>--%>
                    <td>
                        <div class="cell">
                            <%=item.Stock%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=item.rowModifiedDate%>
                        </div>
                    </td>
                    <td class="weiXinShopMark">
                        <div class="cell c07">
                            <a href="../..//product/productshare?productID=<%=item.ID%>&name=<%=item.Name%>">
                                <%=item.HitCount%></a>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <div class="mod-operate">
                                <div class="con style0editdel">
                                    <a href="javascript:void(0)" class="edit" onclick="ChangeSort('TOP',<%=item.ID %>)">顶</a> <a class="edit" href="javascript:void(0)" onclick="ChangeSort('UP',<%=item.ID %>)">上</a> <a href="javascript:void(0)" class="edit" onclick="ChangeSort('DOWN',<%=item.ID %>)">下</a> <a href="javascript:void(0)" onclick="ChangeSort('BOTTOM',<%=item.ID %>)" class="edit">底</a>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <div class="mod-operate">
                                <div class="con style0editdel">
                                    <a href="../../product/AddProduct?appCode=PLATFORM&MenuCode=C125&productID=<%=item.ID %>"
                                        class="edit">编辑</a> <a id="<%=item.ID %>" class="del" href="javascript:void(0)" onclick="DeleteThisProduct(event)">删除</a> <a href="javascript:void(0)" onclick=" dialog(<%=item.ID %>)" id="view01"
                                            class="view" title="<%Response.Write(item.Name);%>">查看</a>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td></td>
                </tr>
                <% } %>
            </table>
            <%--   <script type="text/javascript">

                if (appCode != "PLATFORM") {
                    $(".shopMark").css("display", "none");
                }

                if (appCode != "C002") {
                    $(".drpShopMark").css("display", "none");
                }

                //                if (appCode != "C001") {
                //                    $(".weiXinShopMark").css("display", "none");
                //                }

                var $trs = $(".mod-table-main tr");
                $trs.each(function () {
                    $(".icon-taobao", $(this)).hover(function () {
                        $(".dvGoToTaobaoContainer", $trs).css("display", "none");
                        var offsetL = $(this).offset().left;
                        var cellOffsetL = $(this).parents(".cell").offset().left;
                        var left = offsetL - cellOffsetL + 16;
                        if ($(".dvGoToTaobao", $(this).siblings("div")).text() != "") {
                            $(this).next("div").css({ "display": "block", "left": left + "px" });
                        }
                    })

                    $(".icon-fenxiao", $(this)).hover(function () {
                        $(".dvGoToDrpContainer", $trs).css("display", "none");
                        var offsetL = $(this).offset().left;
                        var cellOffsetL = $(this).parents(".cell").offset().left;
                        var left = offsetL - cellOffsetL + 16;
                        if ($(".dvGoToDrp", $(this).siblings("div")).text() != "") {
                            $(this).next("div").css({ "display": "block", "left": left + "px" });
                        }
                    })

                    $(".dvGoToTaobaoContainer", $(this)).mouseleave(function () {
                        $(this).css("display", "none");
                    })

                    $(".dvGoToDrpContainer", $(this)).mouseleave(function () {
                        $(this).css("display", "none");
                    })

                    $(".icon-fenxiao,.icon-taobao", $(this)).mouseleave(function () {
                        $(this).next().css("display", "none");
                    })
                    $(".dvGoToDrpContainer,.dvGoToTaobaoContainer", $(this)).mouseenter(function () {
                        $(this).css("display", "block");
                    })
                })
            </script>--%>
        </div>
    </div>
</div>
<!--列表 End-->
<script src="../../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
<script src="../../Scripts/jquery.pager.js" type="text/javascript"></script>
<script type="text/javascript">

    //页数
    var ProductPageIndex = 1;
    //显示多少显示数字条
    var CurrentPageSize = 15;
    //总数量
    var CurrentPageSizeSum = '<%=Model.TotalRecords%>';
    //总数量除以每页显示多少，即共有多少页
    var totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
    var PagesNumber = '<%=Model.PagesNumber%>';
    //点击事件

    if (parseInt(CurrentPageSizeSum) > 0) {
        $(".mod-page").css("display", "block");
    } else {
        $(".mod-page").css("display", "none");
    }

    //在售中
    $("#productZaishou").parent().attr('title', '在售中（' + $("#productZaishou").text() + '）');
    //仓库中
    $("#productCangku").parent().attr('title', '仓库中（' + $("#productCangku").text() + '）');
    //库存预警
    $("#productYujing").parent().attr('title', '库存预警（' + $("#productYujing").text() + '）');
    //店铺推荐
    $("#productTuijian").parent().attr('title', '店铺推荐（' + $("#productTuijian").text() + '）');



    $("#q1sum").text(<%= ViewData["tempQuanBu"] %>);
    $("#productZaishou").text(<%= ViewData["d1"]  %>);
    $("#productCangku").text(<%=  ViewData["d2"] %>);
    $("#productYujing").text(<%= ViewData["d3"] %>);
    $("#productTuijian").text(<%=  ViewData["d4"]  %>);


    //点击事件
    var ProductView = function (ProductPageIndex) {
        ProductPageIndex = ProductPageIndex;
        $.ajax({
            async: false,
            type: "Post",
            url: "../../Product/ProductList?Grouos=" + ProductQuery.Groups,
            data: { "ProductPageIndex": ProductPageIndex, "Where": ProductQuery.Query },
            dataType: "html",

            success: function (responseData) {

                $("#mod-table").html(responseData); //render table  
                // CurrentPageSizeSum = '<%=Model.TotalRecords%>';
                totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
                $(".turn-ul").pager({ pagenumber: ProductPageIndex, pagecount: totalPageNumber, buttonClickCallback: ProductView });


            }
        });
        //分页显示
        var flag = (ProductPageIndex * CurrentPageSize) > CurrentPageSizeSum;

        $("#pages").text(CurrentPageSize * (ProductPageIndex - 1) + 1);
        $("#pagenum").text(ProductPageIndex);

        if (flag) {
            $("#number").text(CurrentPageSizeSum);
        } else {
            $("#number").text(ProductPageIndex * CurrentPageSize);
        }

        if (flag) {
            return false;
        }

        if (PagesNumber < CurrentPageSize) {
            $("#number").text(PagesNumber);
        } else {
            $("#number").text(ProductPageIndex * CurrentPageSize);
        }
    };

    $("#sum").text(CurrentPageSizeSum);


















    //    var SelectByGroupClick = function (pageclicknumber) {
    //        CurrentPageIndex = pageclicknumber;
    //        $.ajax({
    //            async: false,
    //            type: "Post",
    //            url: "../../Product/ProductLists?Groups=" + productQuery.Groups,
    //            data: { "CurrentPageIndex": CurrentPageIndex, "Where": productQuery.Query }, //"Groups": productQuery.Groups,
    //            dataType: "html",
    //            success: function (responseData) {

    //                $(".sourcelist").html(responseData); //render table  

    //                // CurrentPageSizeSum = '<%=Model.TotalRecords%>';

    //                // totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
    //                $("#dvPage").pager({ pagenumber: pageclicknumber, pagecount: totalPageNumber, buttonClickCallback: SelectByGroupClick });


    //            }
    //        });

    //        window.location.hash = CurrentPageIndex;

    //        $("#numberBegin").text((CurrentPageIndex - 1) * CurrentPageSize + 1);
    //        $("#numberEnd").text((CurrentPageIndex * CurrentPageSize) > CurrentPageSizeSum ? CurrentPageSizeSum : (CurrentPageIndex * CurrentPageSize));
    //        $("#sum").text(CurrentPageSizeSum);
    //        var reg = /用户没有权限/g;
    //        if (reg.test($(".sourcelist").html())) {
    //            window.location.href = "../../Login/Login";
    //        }
    //    };

    //    var SelectByGroupClickSub = function (containerID, condition) {
    //        productQuery.Groups[1] = condition;
    //        $.ajax({
    //            async: false,
    //            type: "Post",
    //            url: "../../Product/GetProductCountByGroups?Groups=" + productQuery.Groups,
    //            data: { "CurrentPageIndex": CurrentPageIndex, "Where": productQuery.Query, "PageSize": 15 }, //"Groups": productQuery.Groups,
    //            dataType: "html",
    //            success: function (res) {
    //                $("#" + containerID + "").text(res);
    //            }
    //        });
    //        productQuery.Groups[1] = "";
    //    };

    //    var SearchBtnClick = function (pageclicknumber) {

    //        var CurrentPageIndex = pageclicknumber;
    //        $.ajax({
    //            async: false,
    //            type: "Post",
    //            url: "../../Product/SearchProducts",
    //            data: { "condition": condition, "appCode": appCode },
    //            dataType: "html",
    //            success: function (responseData) {
    //                $(".sourcelist").html(responseData); //render table  
    //                //CurrentPageSizeSum = '<%=Model.TotalRecords%>';

    //                //totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
    //                $(".footer-p-div2").pager({ pagenumber: pageclicknumber, pagecount: totalPageNumber, buttonClickCallback: SearchBtnClick });

    //            }
    //        });
    //        $("#numberBegin").text((CurrentPageIndex - 1) * CurrentPageSize + 1);
    //        $("#numberEnd").text((CurrentPageIndex * CurrentPageSize) > CurrentPageSizeSum ? CurrentPageSizeSum : (CurrentPageIndex * CurrentPageSize));
    //        $("#sum").text(CurrentPageSizeSum);
    //    };
    //    function getPagesInfo() {
    //        $("#numberBegin").text((CurrentPageIndex - 1) * CurrentPageSize + 1);
    //        $("#numberEnd").text(CurrentPageIndex * CurrentPageSize);
    //        $("#sum").text(CurrentPageSizeSum);
    //    }

</script>
