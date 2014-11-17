<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<%@ Import Namespace="V5.MetaData.Customer.Model" %>
<%@ Import Namespace="V5.MetaData.Util" %>
<!--列表 Start-->
<%=Combres.WebExtensions.CombresLink("PagerJs")%>
<div class="mod-table">
    <div class="mod-table-head">
        <div class="con style0list">
            <table>
                <colgroup>
                    <col style="width: 5%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: 20%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: 10%;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                    <tr>
                        <th>
                            <label>
                                <input value="" name="" id="ckall" type="checkbox" onclick="CheckAll(event)"></label>
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
                        <%--     <th class="x-tab">
                                <div class="iconbg-arrow up">分销产品</div>
                        </th>--%>
                        <th>
                            采购金额
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
        <div class="con style0line" style="height: auto;" style="width: 100%">
            <table border="0" cellpadding="5" cellspacing="0" width="100%">
                <colgroup>
                    <col style="width: 5%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: 20%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: 15%;">
                    <col style="width: 10%;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                    <% var Freeze = ""; var gradeType = "";%>
                    <%foreach (CustomerReport grade in Model.DataSource)
                      { %>
                    <tr>
                        <td>
                            <div class="cell">
                                <label>
                                    <input value="<%=grade.ID%>" name="sub" type="checkbox" onclick="CheckThis()" /></label><!--<span class="flag-gray"></span>--></div>
                        </td>
                        <td>
                            <div class="cell">
                                <%=grade.LoginName %>
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
                     <%--   <td>
                            <%if (grade.Type == "A")
                              {
                                  gradeType = "直销商城";
                              }
                              else
                              {
                                  gradeType = "分销商城";
                              }%>
                            <div class="cell">
                                <%=gradeType %></div>
                        </td>--%>
                        <td>
                            <div class="cell">
                                <%=grade.LevelIDoRName %></div>
                        </td>
                        <td>
                            <div class="cell">
                                0</div>
                        </td>
                        <%--      <td>
                            <div class="cell">
                                <%=grade.LineName %></div>
                        </td>--%>
                        <td>
                            <div class="cell">
                                <%=grade.ConsumeAmount %></div>
                        </td>
                        <td>
                            <a href="javascript:void(0)" onclick="GetMembership(<%=grade.ID %>,event);" style="color: #06c;">
                                查看 </a>
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
    var PagesNumber = '<%=Model.PagesNumber%>';
    //控制分页是否显示
    if (CurrentPageSizeSum > 0) {
        $(".mod-page").show();
    }
    else {
        $(".mod-page").hide();
    }
    $("#ZhiXiao").text('<%=ViewData["FenXiao"]  %>');
    $("#ZhengChang").text('<%=ViewData["zc"] %>');
    $("#DongJie").text('<%=ViewData["dj"] %>');
    //获取要执行的URL
    var url = '../../CustomerManage/GetSubunderwriting';
    //点击事件

    var CustomerSubunderwritingpageClick = function (CurrentPageIndex) {

        if (customerQuery.Groups[0] != "" && customerQuery.Groups[0] != null && customerQuery.Groups[0] == "q2") { url = '../../CustomerManage/GetCustomerStraight?Groups=' + customerQuery.Groups; }
        if (customerQuery.Groups[0] != "" && customerQuery.Groups[0] != null && customerQuery.Groups[0] == "q1") { url = '../../CustomerManage/PageSelected?Groups=' + customerQuery.Groups; }
        if (customerQuery.Groups[0] != "" && customerQuery.Groups[0] != null && customerQuery.Groups[0] == "q3") { url = '../../CustomerManage/GetSubunderwriting?Groups=' + customerQuery.Groups; }


        CurrentPageIndex = CurrentPageIndex;
        $.ajax({
            async: false,
            type: "get",
            url: url,
            data: { "CurrentPageIndex": CurrentPageIndex, "Where": customerQuery.Query },
            dataType: "html",
            success: function (responseData) {

                $(".mod-table").html(responseData); //render table  
                // CurrentPageSizeSum = parseInt('<%=Model.TotalRecords%>');
                totalPageNumber = Math.ceil(CurrentPageSizeSum / CurrentPageSize);
                $(".turn").pager({ pagenumber: CurrentPageIndex, pagecount: CurrentPageNumber, buttonClickCallback: CustomerSubunderwritingpageClick });

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
