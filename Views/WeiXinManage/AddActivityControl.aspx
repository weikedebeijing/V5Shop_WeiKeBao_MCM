<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="LinkContent" runat="server">
    <script type="text/javascript" src="../../Scripts/datepicker/WdatePicker.js"></script>
    <script src="../../Scripts/Js/popupOperate.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Scripts/Js/allselect.js"></script>
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
    <script src="../../Scripts/Activity/AddActivityControlJS.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/ajaxFileUpload.js" type="text/javascript"></script>
    <script src="../../../Scripts/dialog/artDialog.source.js?skin=default" type="text/javascript"></script>
    <script src="../../Scripts/publicPlug-in/linkUrlJs.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!--弹出层-->
    <div class="gray-bg" id="gray-bg" style="display: none;">
        <div class="title">
            <h2>
                添加奖项</h2>
            <span class="icon-close"></span>
        </div>
        <div class="content scroll" style="width: 560px; height: 280px;">
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
                                    <input name="txtAwarDsprice" id="txtAwarDsprice" class="w230" type="text" /></div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <div id="hide" style="display: none">
                                <li class="list-li">
                                    <div class="float-l w80">
                                        <span class="star">*</span>
                                        <label>
                                            订单满</label></div>
                                    <div class="float-l">
                                        <input class="w230" type="text" value="" name="name" id="txtConditions" type="text">
                                        <span>元</span>
                                    </div>
                                    <div class="float-l w80">
                                        <span class="prompt"></span>
                                    </div>
                                </li>
                                <li class="list-li">
                                    <div class="float-l w80">
                                        <span class="star">*</span>
                                        <label>
                                            有效期</label></div>
                                    <div class="float-l">
                                        <input type="text" onfocus="var DateEnd=$dp.$('txtPeriodEnd');WdatePicker({onpicked:function(){DateEnd.focus();},dateFmt:'yyyy-MM-dd 00:00:00',minDate:'%y-%M-#{%d+1}'})"
                                            name="txtPeriodStart" id="txtPeriodStart" class="w150" />
                                        <span class="unit r10">一</span>
                                        <input type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd 00:00:00',minDate:'#F{$dp.$D(\'txtPeriodStart\')}'})"
                                            name="txtPeriodEnd" id="txtPeriodEnd" class="w150" /></div>
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
                                    <input name="txtPrizeAmount" id="txtPrizeAmount" class="w230" type="text" /></div>
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
                                    <input name="txtProbability" id="txtProbability" class="w230" type="text" />%</div>
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
                        <ul class="list-ul">
                            <li class="list-li">
                                <div class="float-l w80">
                                </div>
                                <div class="float-l">
                                    <button type="button" class="submit01-alert r10" id="txtDetermine">
                                        保存</button>
                                    <button id="txtUpdateDetermine" class="submit01-alert r10" type="button">
                                        确定</button>
                                    <button id="close" class="reset01-alert" type="button">
                                        关闭</button>
                                </div>
                            </li>
                        </ul>
                        <%--  <div class="l130 t20 b20">
                           
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mask" style="display: none;">
    </div>
    <div class="mod-title">
        <div class="con style0h1-02">
            <h1 class="spanTitle">
                添加活动</h1>
        </div>
    </div>
    <%--  <div>
        <div class="Loading" style="display: none;">
            <span id="operateTip"></span>&nbsp;&nbsp; <a href="javascript:void(0)">X</a>
        </div>
    </div>--%>
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
                            <%--      <%if (menuCode == "C905")
                              {%>
                            <option value="2">大转盘</option>
                            <%}
                              else if (menuCode == "C910")
                              {%>
                            <option value="1">刮刮乐</option>
                            <%}
                              else if (menuCode == "C911")
                              { %>
                            <option value="3">砸金蛋</option>
                            <%}
                              else if (menuCode == "C912")
                              {
                            %>
                            <option value="4">九宫格</option>
                            <%  }
                            %>--%>
                        </select>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span>
                        <label>
                            活动名称：</label></div>
                    <div class="float-l">
                        <input id="txtAwardsName" class="w230" type="text" name="txtAwardsName"><span class="unit"></span></div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span>
                        <label>
                            活动时间：</label></div>
                    <div class="float-l">
                        <input id="DateStart" class="w230 Wdate" value="活动开始时间" type="text" onfocus="var DateEnd=$dp.$('DateEnd');WdatePicker({onpicked:function(){DateEnd.focus();},dateFmt:'yyyy-MM-dd 00:00:00',minDate:'%y-%M-#{%d+1}'})"
                            checked="checked" name="DateStart">
                        <input id="DateEnd" class="w230 Wdate" value="活动结束时间" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd 00:00:00',minDate:'#F{$dp.$D(\'DateStart\')}'})"
                            name="DateEnd"><span class="unit"></span></div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                  <li class="list-li">
                    <div class="float-l w130">
                        <label>
                            活动说明：</label></div>
                    <div class="float-l">
                        <textarea id="AwardContentName" style="width: 501px; height: 170px;"></textarea>
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
                        <%--                        <li><a href="javascript:void(0)" class="a-btn" id="demo">demo</a></li>--%>
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
                                <col style="width: 5%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 10%;">
                                <col style="width: 10%;">
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
                                <col style="width: 5%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 10%;">
                                <col style="width: 10%;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
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
            <div class="l100 t30 b20">
                <button class="submit01" onclick="btnSave()">
                    保存</button>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        var awardReportInfo = '<%=ViewData["awardReport"] %>';
        var materialManage = '<%=ViewData["materialManage"] %> ';

        var menuCode = GetUrlMenuCode();



        $(function () {
            txtTips();
        });

        function txtTips() {
            $("#DateStart").focus(function () {
                if ($(this).val() == "活动开始时间") {
                    $(this).val('');
                    $(this).val('').css("color", "#6b6969");
                }
            });
            $("#DateStart").blur(function () {
                if ($(this).val() == "") {
                    $(this).val("");
                }
            });

            $("#DateEnd").focus(function () {
                if ($(this).val() == "活动结束时间") {
                    $(this).val('');
                    $(this).val('').css("color", "#6b6969");
                }
            });
            $("#DateEnd").blur(function () {
                if ($(this).val() == "") {
                    $(this).val("");
                }
            });
        }

        //demo, 发布时删除  开始
        //        $(function () {
        //            popupOperate("demoDiv", "添加奖项", "demo", textFunction);
        //        })
        //        function textFunction() {
        //            alert("提交成功");
        //        }
        //demo, 发布时删除  结束
    </script>
</asp:Content>
