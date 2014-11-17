<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="System.Activities.Statements" %>
<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <%--    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=wechat"></script>--%>
    <script type="text/javascript" src="../../Scripts/Js/allselect.js"></script>
    <script type="text/javascript" src="../../Scripts/datepicker/WdatePicker.js"></script>
    <script src="../../Scripts/Activity/UpdateActivityControlJS.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/popupOperate.js" type="text/javascript"></script>
    <script src="../../Scripts/jscommon.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/ajaxFileUpload.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <% V5.MetaData.WeiXin.Report.AwardReport awardReport = ViewData["awardReport"] as V5.MetaData.WeiXin.Report.AwardReport; %>
    <!--弹出层-->
    <div class="mask" style="display: none;">
    </div>
    <div class="gray-bg" id="gray-bg" style="display: none;">
        <div class="title">
            <h2>
                修改奖项</h2>
            <span class="icon-close"></span>
        </div>
        <div class="content scroll" style="width: 600px; height: 350px;">
            <div>
                <div class="mod-form l37">
                    <div class="con style0alert b10">
                        <ul class="list-ul">
                            <li class="list-li">
                                <div class="float-l w80">
                                    <span class="star">*</span><label>商品</label></div>
                                <div class="float-l">
                                    <select id="selCommodity" name="selCommodity">
                                        <option value="1" selected="selected">商品</option>
                                        <%--<option value="2">优惠劵</option>--%>
                                    </select></div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w80">
                                    <span class="star">*</span>
                                    <label>
                                        奖项名称</label></div>
                                <div class="float-l">
                                    <input name="txtAwardName" type="text" id="txtAwardName" class="w230" /></div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w80">
                                    <span class="star">*</span>
                                    <label>
                                        奖品价格</label></div>
                                <div class="float-l">
                                    <input name="txtAwarDsprice" type="text" id="txtAwarDsprice" class="w230" /></div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <div id="hide" style="display: none">
                                <li class="list-li">
                                    <div class="float-l w80">
                                        <span class="star">*</span>
                                        <label>
                                            使用条件</label></div>
                                    <div class="float-l">
                                        <input name="txtConditions" type="text" id="txtConditions" class="w230" /></div>
                                    <div class="float-l">
                                        <span class="prompt"></span>
                                    </div>
                                </li>
                                <li class="list-li">
                                    <div class="float-l w80">
                                        <span class="star">*</span>
                                        <label>
                                            有效期</label></div>
                                    <div class="float-l">
                                        <input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd 00:00:00'})" name="txtPeriodStart"
                                            id="txtPeriodStart" class="w230" />
                                        <input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd 00:00:00'})" name="txtPeriodEnd"
                                            id="txtPeriodEnd" class="w230" /></div>
                                    <div class="float-l">
                                        <span class="prompt"></span>
                                    </div>
                                </li>
                            </div>
                            <li class="list-li">
                                <div class="float-l w80">
                                    <span class="star">*</span>
                                    <label>
                                        奖品数量</label></div>
                                <div class="float-l">
                                    <input type="text" name="txtPrizeAmount" id="txtPrizeAmount" class="w230" /></div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w80">
                                    <span class="star">*</span>
                                    <label>
                                        中奖概率</label></div>
                                <div class="float-l">
                                    <input type="text" name="txtProbability" id="txtProbability" class="w230" /></div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w80">
                                    <span class="star">*</span><label>奖品等级</label></div>
                                <div class="float-l">
                                    <select id="txtGrade">
                                    </select>
                                    <input type="hidden" id="hidGradeId" ids="1,2,3" />
                                    <input type="hidden" id="hidGradeName" ids="一等奖,二等奖,三等奖" /></div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                        </ul>
                        <div class="l130 t20 b20">
                            <button type="button" class="submit01-alert r10" id="txtDetermine">
                                确定</button>
                            <button id="txtUpdateDetermine" class="submit01-alert r10" type="button">
                                确定</button>
                            <button id="close" class="reset01-alert" type="button">
                                关闭</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mask" style="display: none;">
    </div>
    <div class="mod-title">
        <div class="con style0h1">
            <h1 class="spanTitle">
                修改推广活动内容</h1>
        </div>
    </div>
    <input type="hidden" id="hidActivityType" value="<%=awardReport.activityAwards.ActivityTypeID %>" />
    <div class="mod-form t20">
        <div class="con style0page">
            <h2 class="title-h2">
                <i class="icon-line r10"></i><span class="text">活动设置</span></h2>
            <ul class="list-ul l26">
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>活动类型：</label></div>
                    <% var menuCode = ViewData["MenuCode"].ToString();%>
                    <div class="float-l">
                        <select id="selActivityType" class="w242">
                            <option value="<%=awardReport.activityAwards.ActivityTypeID %>">
                                <%=awardReport.activityAwards.ActivityTypeName%></option>
                        </select>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star"></span>
                        <label>
                            活动名称：</label></div>
                    <div class="float-l">
                        <input id="txtAwardsName" class="w230" type="text" name="txtAwardsName" value="<%=awardReport.activityAwards.AwardsName %>"><span
                            class="unit"></span></div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star"></span>
                        <label>
                            活动时间：</label></div>
                    <div class="float-l">
                        <input id="DateStart" class="w230 Wdate" value="<%=awardReport.activityAwards.StartDate.ToString("yyyy-MM-dd 00:00:00") %>"
                            type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd 00:00:00'})" checked="checked"
                            name="DateStart">
                        <input id="DateEnd" class="w230 Wdate" value="<%=awardReport.activityAwards.FinishDate.ToString("yyyy-MM-dd 00:00:00") %>"
                            type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd 00:00:00'})" name="DateEnd"><span
                                class="unit"></span></div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <label>
                            活动说明：</label></div>
                    <div class="float-l">
                        <textarea id="AwardContentName" style="width: 501px; height: 170px;"><%=awardReport.activityAwards.AwardContentName %></textarea>
                        </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
            </ul>
            <h2 class="title-h2 t30">
                <i class="icon-line r10"></i><span class="text">奖品设置</span></h2>
            <div class="mod-operate l26 t10">
                <div class="con style0list">
                    <ul class="ul-list">
                        <li><a href="javascript:void(0)" class="a-btn" id="Add">添加</a></li>
                        <li><a href="javascript:void(0)" class="a-btn" id="cancel">删除</a></li>
                        <li><a href="javascript:void(0)" class="a-btn" id="update">编辑</a></li>
                    </ul>
                </div>
            </div>
            <div class="clear h10">
            </div>
            <div class="mod-table l26">
                <div class="mod-table-head">
                    <div class="con style0list-bg">
                        <table>
                            <colgroup>
                                <col style="width: 50px;">
                                <col style="width: 80px;">
                                <col style="width: 150px;">
                                <col style="width: 120px;">
                                <col style="width: 120px;">
                                <col style="width: 150px;">
                                <col style="width: 80px;">
                                <col style="width: 80px;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <label>
                                            <input type="checkbox" value="" name="" id="Checkbox1" onclick="CheckAll(event)"></label>
                                    </th>
                                    <th>
                                        奖项等级
                                    </th>
                                    <th>
                                        奖品名称
                                    </th>
                                    <th>
                                        奖品价格
                                    </th>
                                    <th>
                                        使用条件
                                    </th>
                                    <th>
                                        有效期
                                    </th>
                                    <th>
                                        奖品数量
                                    </th>
                                    <th>
                                        中奖概率
                                    </th>
                                    <th>
                                    </th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="mod-table-main">
                    <div class="con style0dotted">
                        <table id="ThePrizeList">
                            <colgroup>
                                <col style="width: 50px;">
                                <col style="width: 80px;">
                                <col style="width: 150px;">
                                <col style="width: 120px;">
                                <col style="width: 120px;">
                                <col style="width: 150px;">
                                <col style="width: 80px;">
                                <col style="width: 80px;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
                                <%
                                    int i = 0;
                                    foreach (var itme in awardReport.awardList)
                                    {

                                        i++;
                                %>
                                <tr id="activity<%=i %>">
                                    <td>
                                        <input type="checkbox" value="activity<%=i %>" name="sub" onclick="CheckThis()">
                                    </td>
                                    <td>
                                        <%=itme.AwardGrade%>
                                    </td>
                                    <td>
                                        <%=itme.CommodityName%>
                                    </td>
                                    <td>
                                        <%=itme.CommodityPrice == null ? "0" : itme.CommodityPrice.Value.ToString("0.00")%>
                                    </td>
                                    <td>
                                        <% if (itme.EmployCondition <= 0)
                                           {
                                        %>
                                        无
                                        <% } %>
                                        <%
                                            else
                                            {%>
                                        订单满:<%=itme.EmployCondition%>元
                                        <%} %>
                                    </td>
                                    <td>
                                        <%
string str = "";
if (itme.StartDate == "无")
{
    str = itme.StartDate;
}
else
{
    str = itme.StartDate + "~" + itme.FinishDate;
}

                                        %>
                                        <%=str %>
                                    </td>
                                    <td>
                                        <%=itme.AwardNumber%>
                                    </td>
                                    <td>
                                        <%=itme.PrizeProbability%>%
                                    </td>
                                    <td>
                                        <input id="Prize<%=i %>" type="hidden" value="<%=itme.PrizeID %>" />
                                        <input id="PrizeName<%=i %>" type="hidden" value="<%=itme.PrizeName %>" />
                                    </td>
                                </tr>
                                <%  } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <h2 class="title-h2 t30">
                <i class="icon-line r10"></i><span class="text">参与条件</span></h2>
            <ul class="list-ul l26">
                <li class="list-li">
                    <div class="float-l w30">
                        <span class="star"></span>
                        <label>
                        </label>
                    </div>
                    <div class="float-l w190">
                        <input id="RuleConditionID1" type="radio" lang="1" name="RuleConditionID" groupname="ruleCondition">
                        <label for="RuleConditionID1">
                            满就送：</label>
                        <select id="RuleConditionName" class="w90">
                            <option value="1">累计</option>
                            <option value="2">当天</option>
                            <option value="3">单笔</option>
                        </select>
                    </div>
                    <div class="float-l">
                        <input id="RuleConditionMoney1" type="text" name="RuleConditionMoney1" class="w78">
                        元 送
                        <input id="RuleConditionItme1" type="text" name="RuleConditionItme1" class="w78">
                        次
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w30">
                        <span class="star"></span>
                        <label>
                        </label>
                    </div>
                    <div class="float-l w190">
                        <input id="RuleConditionID2" type="radio" lang="2" name="RuleConditionID" groupname="ruleCondition">
                        <label for="RuleConditionID2">
                            买就送：</label>
                        每次消费送</div>
                    <div class="float-l">
                        <input id="RuleConditionItme2" type="text" name="RuleConditionItme2" class="w78">
                        次
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w30">
                        <span class="star"></span>
                        <label>
                        </label>
                    </div>
                    <div class="float-l w190">
                        <input id="RuleConditionID3" type="radio" lang="3" name="RuleConditionID" groupname="ruleCondition">
                        <label for="RuleConditionID3">
                            免费送：</label>
                        <select id="selRuleCondition3" class="w90">
                            <option selected="selected" value="1">所有会员</option>
                            <option value="2">消费会员</option>
                        </select>
                    </div>
                    <div class="float-l">
                        送<input id="RuleConditionItme3" type="text" name="RuleConditionItme3" class="w78">
                        次 <span class="spMessage"></span>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
            </ul>
            <div class="l156 t30 b20">
                <button class="submit01" onclick="btnSave()">
                    保存</button>
            </div>
        </div>
    </div>
    <%-- ReSharper disable once LValueIsExpected --%>
    <script type="text/javascript">


        var awardReportJosn = '<%=ViewData["awardReportJosn"]%>';
        var materialManageJosn = '<%=ViewData["materialManage"] %>'

        $(function () {

            if (materialManageJosn != "") {

                $("#Activities").css("display", "block");
                //封面显示
                var materialManage = $.parseJSON(materialManageJosn);
                $(".active-cover-title").html(materialManage.Title);
                $(".active-cover-img imt").attr("src", materialManage.CoverUrl);
                $(".active-cover-text").html(materialManage.Abstract);
            }

            var awardReportJosns = $.parseJSON(awardReportJosn);
            for (var i = 0; i < awardReportJosns.activityRule.length; i++) {
                if (awardReportJosns.activityRule[i].RuleConditionID == 1) {
                    $("#RuleConditionID1").attr("checked", "checked");
                    $("#RuleConditionMoney1").val(awardReportJosns.activityRule[i].RuleAmount);
                    $("#RuleConditionItme1").val(awardReportJosns.activityRule[i].DrawTime);
                }
                else if (awardReportJosns.activityRule[i].RuleConditionID == 2) {
                    $("#RuleConditionID2").attr("checked", "checked");
                    $("#RuleConditionItme2").val(awardReportJosns.activityRule[i].DrawTime);
                }
                else if (awardReportJosns.activityRule[i].RuleConditionID == 3) {
                    $("#RuleConditionID3").attr("checked", "checked");
                    $("#RuleConditionItme3").val(awardReportJosns.activityRule[i].DrawTime);

                }

            }











        });


    </script>
</asp:Content>
