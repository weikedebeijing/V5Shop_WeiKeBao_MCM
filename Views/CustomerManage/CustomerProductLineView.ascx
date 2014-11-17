<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="V5.MetaData.Customer.Report" %>
<!--列表 Start-->
<%=Combres.WebExtensions.CombresLink("PagerJs")%>
<div class="mod-table">
    <div class="mod-table-head">
        <div class="con style0list">
            <table>
                <colgroup>
                    <col style="width: 5%;">
                    <col style="width: 15%;">
                    <col style="width: 10%;">
                    <col style="width: 15%;">
                    <col style="width: 10%;">
                    <col style="width: 15%;">
                    <col style="width: 20%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                    <tr>
                        <th>
                            <label>
                                <input value="" name="" id="ckall" type="checkbox" onclick="CheckAll(event)" /></label>
                        </th>
                        <th>
                            会员帐号
                        </th>
                        <th>
                            帐号状态
                        </th>
                        <th>
                            会员来源
                        </th>
                        <th>
                            会员等级
                        </th>
                        <th>
                            账号余额
                        </th>
                        <th>
                            分销产品线
                        </th>
                        <th>
                            采购金额
                        </th>
                        <th>
                            审核状态
                        </th>
                        <th>
                        </th>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="mod-table-main">
        <div class="con style0line" style="width: 100%;" id="Message">
            <table>
                <colgroup>
                    <col style="width: 5%;">
                    <col style="width: 15%;">
                    <col style="width: 10%;">
                    <col style="width: 15%;">
                    <col style="width: 10%;">
                    <col style="width: 15%;">
                    <col style="width: 20%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                    <% var Freeze = ""; var gradeType = "";%>
                    <%foreach (CustomerProductLineReport item in Model.DataSource)
                      { %>
                    <tr>
                        <td>
                            <div class="cell">
                                <label>
                                    <input value="<%=item.ID%>" name="sub" type="checkbox" onclick="CheckThis()" /></label></div>
                        </td>
                        <td>
                            <div class="cell">
                                <%-- <a  href="javascript:void(0)" linkurl="../../CustomerManage/Membership?ID=<%=item.CustomerID %>" onclick="GoToLinkUrl(event)" style="color: #0E75BC;">--%>
                                <%=item.LoginName%>
                                <%--    </a>--%>
                            </div>
                        </td>
                        <td>
                            <%if (item.IsLock == false)
                              {%>
                            <span class="c06">正常</span>
                            <% } %>
                            <%
                                else
                                { %>
                            <span class="c03">冻结</span>
                            <%    
                                }
                            %>
                        </td>
                        <td>
                            <%if (item.Type == "A")
                              {
                                  gradeType = "直销商城";
                              }
                              else
                              {
                                  gradeType = "分销商城";
                              }%>
                            <div class="cell">
                                <%= gradeType %></div>
                        </td>
                        <td>
                            <div class="cell">
                                <%=item.GradeName %></div>
                        </td>
                        <td>
                            <div class="cell">
                                <%=item.Balance%></div>
                        </td>
                        <td>
                            <div class="cell">
                                <%=item.ProductLineName %></div>
                        </td>
                        <td>
                            <div class="cell">
                                <%=item.PurchaseAmount%></div>
                        </td>
                        <%
                            string StatusName = "";
                            if (item.Status == "P") { StatusName = "待审核"; }
                            else if (item.Status == "A") { StatusName = "审核通过"; }
                            else if (item.Status == "R") { StatusName = "拒绝审核"; }
                        %>
                        <td>
                            <div class="cell">
                                <%=StatusName%></div>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!--列表 End-->
<script type="text/javascript">

    //页数
    var CurrentPageIndex = 1;
    //显示多少显示数字条
    var CurrentPageSize = 15;
    //总数量
    var CurrentPageSizeSum = '<%=Model.TotalRecords%>';
    //总数量除以每页显示多少
    var CurrentPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
    //控制分页是否显示

    var PagesNumber = '<%=Model.PagesNumber%>';
    if (CurrentPageSizeSum > 0) {
        $(".mod-page").show();
    }
    else {
        $(".mod-page").hide();


    }
    //获取要执行的URL
    var url = '../../CustomerManage/GetCustomerProductLineList';

    $("#count_total").text('<%=ViewData["count_total"] %>');
    $("#count_auditing").text('<%=ViewData["count_auditing"] %>');
    $("#count_audited").text('<%=ViewData["count_audited"] %>');
    $("#count_rejected").text('<%=ViewData["count_rejected"] %>');

    var GetQueryResult = function (pageclicknumber) {
        url = '../../CustomerManage/GetCustomerProductLineList?groups=' + customerQuery.Groups;
        CurrentPageIndex = pageclicknumber;
        $.ajax({
            async: false,
            type: "get",
            url: url,
            data: { "currentPageIndex": CurrentPageIndex, "query": customerQuery.Query },
            dataType: "html",
            success: function (responseData) {
                $(".sourcelist").html(responseData); //render table  

                totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
                $(".footer-p-div2").pager({ pagenumber: pageclicknumber, pagecount: CurrentPageNumber, buttonClickCallback: GetQueryResult });
            }
        });

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

        if (PagesNumber < CurrentPageSize) {
            $("#number").text(PagesNumber);
        } else {
            $("#number").text(CurrentPageIndex * CurrentPageSize);
        }

    };
    $("#sum").text(CurrentPageSizeSum);
</script>
