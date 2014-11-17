<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="V5.MetaData.DRP.Model" %>
<div class="mod-table-head">
    <div class="con style0list">
        <table>
            <colgroup>
                <col style="width: 20%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: auto;">
            </colgroup>
            <tbody>
                <tr>
                    <th>
                        商品名称
                    </th>
                    <th>
                        推荐人
                    </th>
                    <th>
                        分享人
                    </th>
                    <th>
                        当前层级
                    </th>
                    <th>
                        分享次数
                    </th>
                    <th>
                        分享时间
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
    <div class="con style0line">
        <table>
            <colgroup>
                <col style="width: 20%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: 15%;">
                <col style="width: 10%;">
                <col style="width: auto;">
            </colgroup>
            <tbody>
                <%
                    if (Model.DataSource != null)
                    {
                        foreach (var productSharePlus in Model.DataSource)
                        { %>
                <tr>
                    <td>
                        <div class="cell" name="productName">
                        </div>
                    </td>
                    <td>
                        <%if (productSharePlus.productShare.Depth == 0)
                          { %>
                        <div class="cell">
                        </div>
                        <%}
                          else
                          { %>
                        <div class="cell" name="shareName">
                        </div>
                        <%} %>
                    </td>
                    <td>
                        <div class="cell">
                            <%=productSharePlus.productShare.LoginName%></div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=productSharePlus.productShare.Depth + 1%></div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=productSharePlus.productShare.HitCount%></div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=productSharePlus.productShare.DateCreated%></div>
                    </td>
                    <td>
                        <div class="cell">
                            <%if (productSharePlus.isNext)
                              { %>
                            <div class="mod-operate">
                                <div class="con style0editdel">
                                    <a name="nextUrl" href="ProductShare?id=<%=productSharePlus.productShare.ID%>&depth=<%=productSharePlus.productShare.Depth%>&sharename=<%=productSharePlus.productShare.LoginName%>&name="
                                        class="view">查看下级</a>
                                </div>
                            </div>
                            <%}
                              else
                              { %>
                            <span class="c01-5">无下级分享</span>
                            <%}%>
                        </div>
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
<input type="hidden" value="<%=Session["ProductShareCrumb"] %>" id="sessionval" />
<script src="../../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
<script src="../../Scripts/jquery.pager.js" type="text/javascript"></script>
<script src="../../Scripts/jscommon.js"></script>
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

    var name = "";
    var SelectByGroupClick = function (pageclicknumber) {
        var id = request("productid");
        var type = 1;
        var depth = request("depth").trim();
        name = request("name").trim();

        depth = parseInt(depth) + 1;
        if (id == "") {
            type = 0;
            id = request("id");
        }
        CurrentPageIndex = pageclicknumber;
        var Where = "";
        //        var State = "";
        //        var HerfId = $("#slProvince").val();
        //        if (HerfId != -1) {
        //            Where = "HrefId='" + HerfId + "'";
        //        }
        //        $("#type ul li").each(function () {
        //            if ($(this).attr("class") != undefined && $(this).attr("class").indexOf("current") != -1) {
        //                State = $(this).attr("dir");
        //            }
        //        })
        $.ajax({
            async: false,
            type: "Post",
            url: "../../Product/GetProductShare",
            data: { "CurrentPageIndex": CurrentPageIndex, "Where": id, "type": type, "depth": depth, "name": name }, //"Groups": productQuery.Groups,
            dataType: "html",
            success: function (responseData) {
                $("#flexigridDiv").html(responseData); //render table  
                //                CurrentPageSizeSum = '<%=Model.TotalRecords%>';
                var list = $("#sessionval").val();
                list = decodeURIComponent(list);
                list = list.split(',');
                for (var i = 0; i < list.length; i++) {
                    var arr = list[i].split('|');
                    if (i == 0) {
                        $("#ul").append(list[i]);
                    } else if (i == 1) {
                        $("#ul").append('<span class="r15 l15">/</span>');
                        $("#ul").append('二级分享:<a href="' + arr[1] + '" class="c07">' + arr[0] + '</a>');
                    } else {
                        $("#ul").append('<span class="r15 l15">/</span>');
                        $("#ul").append('三级分享:<a href="' + arr[1] + '" class="c07">' + arr[0] + '</a>');
                    }
                }
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
                if (parseInt(CurrentPageSizeSum) > 0) {
                    $(".mod-page").css("display", "block");
                } else {
                    $(".mod-page").css("display", "none");
                }

                //                if (PagesNumber < CurrentPageSize) {
                //                    $("#number").text(PagesNumber);
                //                } else {
                //                    $("#number").text(OrderPageIndex * CurrentPageSize);
                //                }
            }
        });

    };
    $("#quanbu").text(CurrentPageSizeSum);
    $("#sum").text(CurrentPageSizeSum);
    $("div[name='productName']").html(decodeURI(request("name").trim()));
    $("div[name='shareName']").html(decodeURI(request("shareName").trim()));
    //  $("a[name='nextUrl']").attr("href", $("a[name='nextUrl']").attr("href") + decodeURI(request("name").trim()));
    $("a[name='nextUrl']").each(function () {
        $(this).attr("href", $(this).attr("href") + decodeURI(request("name").trim()));

    })
    
    
</script>
