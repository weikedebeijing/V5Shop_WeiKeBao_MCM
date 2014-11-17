<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="V5.MetaData.Customer.Model" %>
<%@ Import Namespace="V5.MetaData.Util" %>
<!--列表 Start-->
<%=Combres.WebExtensions.CombresLink("PagerJs")%>

<div class="mod-table-head">
    <div class="con style0list">
        <table>
            <colgroup>
                <col style="width: 2%;">
                <col style="width: 8%;">
                <col style="width: 10%;">
                <col style="width: 10%;">
                <col style="width: 8%;">
                <col style="width: 12%;">
                <col style="width: 8%;">
                <col style="width: 8%;">
                <col style="width: 8%;">
                <col style="width: 6%;">
                <col style="width: 10%;">
<%--                <col style="width: 10%;">--%>
                <col style="width: auto;">
            </colgroup>
            <tbody>
                <tr>
                    <th>
                        <label>
                            <input value="" name="check" id="ckall" type="checkbox" onclick="CheckAll(event)"></label>
                    </th>
                    <th>会员帐号
                    </th>
                    <th>会员QQ号
                    </th>
                    <th>会员微信号
                    </th>
                    <th>帐号状态
                    </th>
                    <th>会员来源
                    </th>
                    <th>会员等级
                    </th>
                    <th>交易总金额
                    </th>
                    <th>交易次数
                    </th>
                    <th>联系人
                    </th>
                    <th>手机号码
                    </th>
<%--                    <th>最近交易时间
                    </th>--%>
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
                <col style="width: 2%;">
                <col style="width: 8%;">
                <col style="width: 10%;">
                <col style="width: 10%;">
                <col style="width: 8%;">
                <col style="width: 12%;">
                <col style="width: 8%;">
                <col style="width: 8%;">
                <col style="width: 8%;">
                <col style="width: 6%;">
                <col style="width: 10%;">
<%--                <col style="width: 10%;">--%>
                <col style="width: auto;">
            </colgroup>
            <tbody>
                <% var Freeze = ""; %>
                <%foreach (CustomerReport grade in Model.DataSource)
                  { %>
                <tr>
                    <td>
                        <div class="cell">
                            <label>
                                <input value="<%=grade.ID%>" name="sub" type="checkbox" onclick="CheckThis()" /></label><!--<span class="flag-gray"></span>-->
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=grade.LoginName %>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=grade.Question %>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=grade.Answer %>
                        </div>
                    </td>
                    <td>
                        <%if (grade.Status == (int)AppEnum.CustomerStatusType.Normal)
                          {%>
                        <span class="c06">正常</span>
                        <% } %>
                        <%
                          else if (grade.Status == (int)AppEnum.CustomerStatusType.Freeze)
                          { %>
                        <span class="c03">冻结</span>
                        <%    
                              }
                        %>
                    </td>
                    <td>
                        <div class="cell">
                            <%=grade.CodeToTitle %>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=grade.LevelIDoRName%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=grade.ConsumeAmount.ToString("0.00")%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=grade.ConsumeTimes%><%--<%=grade.PurchaseAmount%>--%>
                        </div>
                    </td>
<%--                    <td>
                        <div class="cell">
                            <%=grade.UnitPrice.ToString("0.00")%>
                        </div>
                    </td>--%>
                    <td>
                        <div class="cell">
                            <%=grade.TrueName%>
                        </div>
                    </td>
                    <td>
                        <div class="cell">
                            <%=grade.MobilePhone%>
                        </div>
                    </td>
<%--                    <td>
                         <%if (grade.ConsumeTimes == 0)
                          { %>
                        <div class="cell">
                        </div>
                        <%   } %>
                        <%else
                          { %>
                        <div class="cell">
                            <%=grade.RecentlySpendingTime%>
                        </div>
                        <% } %>
                    </td>--%>
                    <td>
                        <div class="cell">
                            <div class="mod-operate">
                                <div class="con style0editdel">
                                    <a href="javascript:void(0)" onclick="GetMembership(<%=grade.ID %>,event);" class="view" id="view01">查看 </a>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td></td>
                </tr>
                <% } %>
            </tbody>
        </table>
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
    var PagesNumber = '<%=Model.PagesNumber%>';
    //控制分页是否显示
    if (CurrentPageSizeSum > 0) {
        $(".mod-page").show();
    }
    else {
        $(".mod-page").hide();
    }

    $("#QuanBu").text('<%=ViewData["QuanBu"] %>');

    $("#FenXiao").text('<%=ViewData["FenXiao"]  %>');
    $("#ZhengChang").text('<%=ViewData["zc"] %>');
    $("#DongJie").text('<%=ViewData["dj"] %>');

    //获取要执行的URL
    var url = '../../CustomerManage/PageSelected';

    //点击事件
    var CustomerView = function (CurrentPageIndex) {

        if (customerQuery.Groups[0] == "q2") { url = '../../CustomerManage/GetCustomerStraight?Groups=' + customerQuery.Groups; }
        if (customerQuery.Groups[0] == "q1") { url = '../../CustomerManage/PageSelected?Groups=' + customerQuery.Groups; }
        if (customerQuery.Groups[0] == "q3") { url = '../../CustomerManage/GetSubunderwriting?Groups=' + customerQuery.Groups; }
        CurrentPageIndex = CurrentPageIndex;
        $.ajax({
            async: false,
            type: "Post",
            url: url,
            data: ({ "CurrentPageIndex": CurrentPageIndex, "Where": customerQuery.Query }),
            dataType: "html",
            success: function (responseData) {

                $(".mod-table").html(responseData); //render table  
                // CurrentPageSizeSum = '<%=Model.TotalRecords%>';
                // $("#aa").html(CurrentPageSizeSum);
                // alert(CurrentPageSizeSum);
                totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);

                $(".turn").pager({ pagenumber: CurrentPageIndex, pagecount: CurrentPageNumber, buttonClickCallback: CustomerView });

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
