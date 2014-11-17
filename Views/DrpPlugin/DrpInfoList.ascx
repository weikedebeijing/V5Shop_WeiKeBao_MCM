<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="V5.MetaData.DRP.Model" %>
<div class="mod-table">
    <div class="sourcelist">
        <div class="mod-table-head">
            <div class="con style0list">
                <table cellspacing="0" cellpadding="0" border="0" class="min-widthTable">
                    <colgroup>
                        <col style="width: 10%;">
                        <col style="width: 15%;">
                        <col style="width: 15%;">
                        <col style="width: 10%;">
                        <col class="shopMark" style="width: 100px;">
                        <col style="width: 10%;">
                        <col style="width: 15%;">
                        <col style="width: 15%;">
                        <col style="width: 15%;">
                        <col style="width: 10%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th class="x-tab">
                                店铺名称
                            </th>
                            <th class="x-tab">
                                旺旺
                            </th>
                            <th class="x-tab">
                                <div class="iconbg-arrow up">
                                    店铺等级</div>
                            </th>
                            <th class="x-tab">
                                <div class="iconbg-arrow down">
                                    商品数量</div>
                            </th>
                            <th class="x-tab shopMark">
                                <div class="iconbg-arrow down">
                                    月销量</div>
                            </th>
                            <th class="x-tab">
                                <div class="iconbg-arrow down">
                                    店铺类目</div>
                            </th>
                            <th class="x-tab">
                                <div class="iconbg-arrow down">
                                    联系方式</div>
                            </th>
                            <th class="x-tab">
                                <div class="iconbg-arrow down">
                                    备注</div>
                            </th>
                            <th>
                            </th>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="mod-table-main">
            <div class="con style0line" style="width: 100%;">
                <table cellspacing="0" cellpadding="5" border="0" width="100%">
                    <colgroup>
                        <col style="width: 10%;">
                        <col style="width: 15%;">
                        <col style="width: 15%;">
                        <col style="width: 10%;">
                        <col class="shopMark" style="width: 100px;">
                        <col style="width: 10%;">
                        <col style="width: 15%;">
                        <col style="width: 15%;">
                        <col style="width: 15%;">
                        <col style="width: 10%;">
                    </colgroup>
                    <tbody>
                        <%
                            if (Model.DataSource != null)
                            {
                                foreach (var ShopTaoBao in Model.DataSource)
                                { %>
                        <tr class="tr-Current">
                            <td>
                                <div class="cell">
                                    <input type="text" style="display:none" />
                                    <a href="<%=ShopTaoBao.Url%>" target="_blank" title="<%=ShopTaoBao.Url%>" style="width: 200px;
                                        overflow: hidden;">
                                        <%=ShopTaoBao.Name%></a>
                                </div>
                            </td>
                            <td>
                                <div class="cell">
                                    <a target="_blank" href="http://www.taobao.com/webww/ww.php?ver=3&amp;touid=<%=ShopTaoBao.KeeperUrl%>&amp;siteid=cntaobao&amp;status=1&amp;charset=utf-8">
                                        <img border="0" src="http://amos.alicdn.com/realonline.aw?v=2&amp;uid=<%=ShopTaoBao.KeeperUrl%>&amp;site=cntaobao&amp;s=2&amp;charset=utf-8"
                                            alt="点击这里给我发消息"><span style="float: none" title="<%=ShopTaoBao.Keeper%>"><%=ShopTaoBao.Keeper%></span></a>
                            </td>
                            <td>
                                <div class="cell">
                                    <%=ShopTaoBao.TypeIcon%></div>
                            </td>
                            <td>
                                <div class="cell">
                                    <%=ShopTaoBao.ProductNum%>
                                </div>
                            </td>
                            <td>
                                <div class="cell">
                                    <%=ShopTaoBao.SaleNum%></div>
                            </td>
                            <td>
                                <div class="cell">
                                    <%=ShopTaoBao.Category%>
                                </div>
                            </td>
                            <td>
                                <div class="cell">
                                    <%=ShopTaoBao.Info%></div>
                            </td>
                            <td>
                                <div class="cell">
                                    <%=ShopTaoBao.Remark%></div>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <%}
                            }%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="../../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
<script src="../../Scripts/jquery.pager.js" type="text/javascript"></script>
<script type="text/javascript">

    //页数
//    var CurrentPageIndex = 1;
    //显示多少显示数字条
    var CurrentPageSize = 15;
    //总数量
    var CurrentPageSizeSum = '<%=Model.TotalRecords%>';
    //总数量除以每页显示多少，即共有多少页
    var CurrentPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);

    //获取要执行的URL
    var url = '';
    //点击事件

    if (parseInt(CurrentPageSizeSum) > 0) {
        $(".mod-page").css("display", "block");
    } else {
        $(".mod-page").css("display", "none");
    }
    var SelectByGroupClick = function (pageclicknumber) {
        CurrentPageIndex = pageclicknumber;
        var Where = "";
        var State = "";
        var HerfId = $("#slProvince").val();
        if (HerfId != -1) {
            Where = "HrefId='" + HerfId + "'";
        }
        $("#type ul li").each(function () {
            if ($(this).attr("class") != undefined && $(this).attr("class").indexOf("current") != -1) {
                State = $(this).attr("dir");
            }
        })
        $.ajax({
            async: false,
            type: "Post",
            url: "../../DrpPlugin/GetTaobaoShop",
            data: { "CurrentPageIndex": CurrentPageIndex, "Where": Where, "State": State }, //"Groups": productQuery.Groups,
            dataType: "html",
            success: function (responseData) {
                $("#flexigridDiv").html(responseData); //render table  
                //                CurrentPageSizeSum = '<%=Model.TotalRecords%>';

                totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
                $(".footer-p-div2").pager({ pagenumber: pageclicknumber, pagecount: CurrentPageNumber, buttonClickCallback: SelectByGroupClick });
                //分页显示
                var flag = (CurrentPageIndex * CurrentPageSize) > CurrentPageSizeSum;

                $("#pages").text(CurrentPageSize * (CurrentPageIndex - 1) + 1);

                if (flag) {
                    $("#number").text(CurrentPageSizeSum);
                } else {
                    $("#number").text(CurrentPageIndex * CurrentPageSize);
                }

                if (flag) {
                    return false;
                }

//                if (PagesNumber < CurrentPageSize) {
//                    $("#number").text(PagesNumber);
//                } else {
//                    $("#number").text(OrderPageIndex * CurrentPageSize);
//                }
            }
        });
    };
    $("#sum").text(CurrentPageSizeSum);
</script>
