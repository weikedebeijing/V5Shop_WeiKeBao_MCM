<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%var Promotions = Model.DataSource; %>
<%@ Import Namespace="V5.MetaData.Util" %>
<div class="mod-table">
    <div class="mod-table-head">
        <div class="con style0list">
            <table>
                <colgroup>
                    <%--
                    <col style="width: 5%;">
                    --%>
                    <col style="width: 20%;">
                    <col style="width: 25%;">
                    <col style="width: 25%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                    <tr>
                        <%--<th>
                            <label>
                                <input type="checkbox" onclick="CheckAll(event);" value="" name="" id="ckall" /></label>
                        </th>--%>
                        <th>活动名称
                        </th>
                        <th>活动对象
                        </th>
                        <th>活动时间
                        </th>
                        <th>
                            <div class="iconbg-arrow up">
                                状态
                            </div>
                        </th>
                        <th>操作
                        </th>
                        <th></th>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="mod-table-main">
        <div class="con style0line">
            <table>
                <colgroup>
                    <%--
                    <col style="width: 5%;">--%>
                    <col style="width: 20%;">
                    <col style="width: 25%;">
                    <col style="width: 25%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: auto;">
                </colgroup>
                <tbody id="content">
                    <%foreach (var Promotion in Promotions)
                      { %>
                    <%
                          var PromotionID = Promotion.ID;
                          var PromotionStatus = Promotion.Status; // 活动状态
                          int saleType = Promotion.SaleType;
                          string Type = "";

                          if (saleType == (int)AppEnum.ChannelType.All) // saleType 为空时
                          {
                              Type = "全部";
                          }
                          else if (saleType == (int)AppEnum.ChannelType.WeiXin)
                          {
                              Type = "直销";
                          }
                          else if (saleType == (int)AppEnum.ChannelType.DRP_Personal)
                          {
                              Type = "分销";
                          }
                          if (PromotionStatus == "N")
                          {
                              if (Promotion.DateStart > DateTime.Now)
                              {
                                  PromotionStatus = "未开始";
                              }
                              else if (Promotion.DateEnd < DateTime.Now)
                              {
                                  PromotionStatus = "已过期";
                              }
                              else if (DateTime.Now > Promotion.DateStart && DateTime.Now < Promotion.DateEnd)
                              {
                                  PromotionStatus = "正在进行中";
                              }
                          }
                          else if (PromotionStatus == "C")
                          {
                              if (Promotion.DateEnd > DateTime.Now)// 未过期已关闭才是关闭
                              {
                                  PromotionStatus = "已关闭";
                              }
                              else
                              {
                                  PromotionStatus = "已过期";
                              }
                          }

                          if (string.IsNullOrEmpty(Promotion.Opened_Code))
                          {
                              Promotion.Opened_Title = "全网店";
                          }
                          var activityName = Type + "→" + Promotion.Opened_Title + "→" + Promotion.Grade_Name;
                          var activityDate = Promotion.DateStart + " 至 " + Promotion.DateEnd;
   
                    %>
                    <tr class="tr-Current">
                        <%--<td>
                               <div style="cursor: pointer;">
                                   <label>
                                       <input type="checkbox" id="checkbox_<%:Promotion.ID %>" value="" name="sub" onclick="CheckThis()" /></label></div>
                           </td>--%>
                        <td>
                            <div class="cell">
                                <%:Promotion.Name %>
                            </div>
                        </td>
                        <td>
                            <div class="cell" title=" <%:activityName%>">
                                <%:activityName%>
                            </div>
                        </td>
                        <td>
                            <div class="cell">
                                <%:activityDate%>
                            </div>
                        </td>
                        <td>
                            <div class="cell">
                                <%if (PromotionStatus == "未开始")
                                  { %>
                                <span class="c01-1">未开始</span>
                                <%}
                                  else if (PromotionStatus == "已过期")
                                  {%>
                                <span class="c01-5">已过期</span>
                                <%}
                                  else if (PromotionStatus == "正在进行中")
                                  { %>
                                <span class="c06">正在进行中</span>
                                <%}
                                  else if (PromotionStatus == "已关闭")
                                  {%>
                                <span class="c03">已关闭</span>
                                <%} %>
                            </div>
                        </td>
                        <td>
                            <div class="cell">

                                <%if (DateTime.Now < Promotion.DateStart)
                                  {%>
                                <a href="javascript:void(0)" class="r15 c07" onclick="javascript:PromotionEdit(<%:PromotionID %>)">编辑</a>
                                <%} %>
                                <%if (DateTime.Now > Promotion.DateStart && DateTime.Now < Promotion.DateEnd && Promotion.Status == "N")
                                  {%>
                                <a href="#" class="r15 c07" onclick="javascript:ClosePromotionSingle(<%:PromotionID %>)">关闭</a>
                                <%} %>
                                <%if (DateTime.Now < Promotion.DateStart)
                                  { %>
                                <a href="#" class="r15 c07" onclick="javascript:DeleteSingle(event,<%:PromotionID %>);">删除</a>
                                <%} %>

                                <a href="#" class="r15 c07" onclick="javascript:promotionDetailPopup(<%:PromotionID %>);">查看</a>
                            </div>
                        </td>
                        <td></td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" language="javascript">

    //总数量
    var totalCount = '<%=Model.TotalRecords%>';
    //页数
    var CurrentPageIndex = 1;
    //显示多少显示数字条
    var currentPageSize = 15;
    //总数量
    var currentPageSizeSum = '<%:Model.TotalRecords %>';

    //总数量除以每页显示多少
    var totalPageNumber = Math.ceil(currentPageSizeSum / currentPageSize);

    // 当前页的大小
    var currentPageNumber = '<%=Model.PagesNumber%>';

    //控制分页是否显示
    if (totalCount > 0) {
        $(".mod-page").show();
    }
    else {
        $(".mod-page").hide();
        //$("#allUserGroupCount").text('0');
    }
    //获取要执行的URL
    var url = '/Promotion/GetShowPromotionView';
    //点击事件

    var PromotionView = function (pageclicknumber) {

        CurrentPageIndex = pageclicknumber;
        $.ajax({
            async: false,
            type: "Post",
            url: url,
            data: { "CurrentPageIndex": CurrentPageIndex, "Where": searchQuery.Query, "Groups": searchQuery.Groups, "openedCode": openedCode, "type": type },
            dataType: "html",
            success: function (responseData) {
                $(".sourcelist").html(responseData); //render table  

                $("#dvPage").pager({ pagenumber: pageclicknumber, pagecount: totalPageNumber, buttonClickCallback: PromotionView });
            }
        });

        //分页显示
        var flag = (pageclicknumber * currentPageSize) > totalCount;

        $("#numberBegin").text(currentPageSize * (pageclicknumber - 1) + 1);
        if (flag) {
            $("#numberEnd").text(totalCount);
        } else {
            $("#numberEnd").text(pageclicknumber * currentPageSize);
        }

        if (flag) {
            return false;
        }

        if (currentPageNumber < currentPageSize) {
            $("#numberEnd").text(totalCount);
        } else {
            $("#numberEnd").text(pageclicknumber * currentPageSize);
        }
    };
    $("#sum").text(totalCount);

    // 营销活动详情
    function PromotionDetail(PromotionID) {
        // 要提前检测 做活动的商品是否被删除 或者库存为0
        $.post("/Promotion/CheckProductIsDelete", { "PromotionID": PromotionID }, function (data) {
            if (data == "prouct is Delete") {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("存在活动中的商品被删除").change();
            }
        });

        window.location.href = "/Promotion/PromotionDetail?PromotionID=" + PromotionID + "";
    };

    // 营销活动的编辑
    function PromotionEdit(PromotionID) {
        // 先到后台验证 只有没有开始的营销活动才能够编辑
        $.ajax({
            url: "/Promotion/CheckCanEdit",
            data: { "promotionID": PromotionID },
            type: "post",
            success: function (returnData) {
                if (returnData == "ok") {
                    window.location.href = "/Promotion/PromotionEdit?PromotionID=" + PromotionID + "&MenuCode=" + menuCode + "&Type=<%=ViewData["type"]%>";
                } else if (returnData == "error") {
                    $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                    $("#operateTip").html("服务器异常，联系管理员").change();
                } else {
                    $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                    $("#operateTip").html(returnData).change();
                }
            }
        });


    }

</script>
