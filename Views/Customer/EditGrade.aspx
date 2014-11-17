<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <%--<script src="../../Scripts/jquery-1.8.0.min.js" type="text/javascript"></script>--%>
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <!--title begin-->
    <div class="mod-title">
        <div class="con style0h1-02">
            <h1 class="spanTitle">
                编辑会员等级
            </h1>
        </div>
    </div>
    <!--title end-->
    <div class="mod-form t20">
        <div class="con style0page">
            <% Html.EnableClientValidation(); %>
                <%using (Ajax.BeginForm("EditGrade", "customer", new { }, new AjaxOptions() { HttpMethod = "post", UpdateTargetId = "UpdateTargetHiddenID", OnBegin = "AjaxFormValidata", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure" }))//, InsertionMode = InsertionMode.InsertAfter
                  { %>
                <%
                      var Grade = (V5.MetaData.Customer.Model.Grade)ViewData["grade"];

                      var name = Grade.Name;
                      var ConsumeAmount = Grade.ConsumeAmount;
                      var ConsumeTimes = Grade.ConsumeTimes;
                      var DiscountRate = Grade.DiscountRate;
                      var ChannelCode = Grade.ChannelCode;
                      var saleType = Grade.SaleType;
                      var isDefault = Grade.IsDefault;
                %>
            <ul class="list-ul l26">
                <li class="list-li">
                   <input type="hidden" id="shopTypeCode_Opened" value="<%:ChannelCode %>" />
                   <input type="hidden" id="shopType" value="<%:saleType %>" />
                    <div class="float-l w130">
                        <span class="star"></span>
                        <label>
                            店铺客户</label></div>
                    <div class="float-l">
                           <select name="shopType" id="shopTypeChangeID">
                            <% if (Grade.SaleType == "A")
                                {%>
                            <option value="A" selected="selected">零售</option>
                            <option value="B">分销</option>
                            <%}
                                else if (Grade.SaleType == "B")
                                {%>
                            <option value="A">零售</option>
                            <option value="B" selected="selected">分销</option>
                            <%} %>
                        </select>
                        <select name="shopTypeCode" id="opened">
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
                            会员等级</label>
                    </div>
                    <div class="float-l">
                        <% if (isDefault == true)
                            { %>
                        <input type="radio" id="normalCustomer" value="1" name="customerGrade" checked="checked" />
                        <label for="normalCustomer">普通会员</label>
                        <%}
                            else
                            {%>
                         <input type="radio" id="selfCustomer" value="0" name="customerGrade" checked="checked" />
                         <label for="selfCustomer">自定义</label>
                        <%} %>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                 <li class="list-li" id="GradeNameLi">
                    <div class="float-l w130">
                        <span class="star">*</span>
                        <label>
                            等级名称</label>
                    </div>
                    <div class="float-l">
                        <input type="text" id="GradeName" value="<%:name %>" name="GradeName" onchange="javascript:onchangeForValidata(event);"
                            class="w230" />
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li" id="meetConditionLi">
                    <div class="float-l w130">
                        <span class="star">*</span>
                        <label>
                            需满足条件</label>
                    </div>
                    <div class="float-l">
                            <label class="w60 float-l r10">
                                消费金额</label><label class="float-l r10">&gt;</label>
                            <% if (isDefault == true)
                                { %>
                            <input name="ConsumeAmount" value="<%:ConsumeAmount %>" type="text" readonly="readonly"
                                class="v5-input in100" />
                            <%}
                                else
                                {%>
                            <input name="ConsumeAmount" value="<%:ConsumeAmount %>" id="ConsumeAmount" onkeyup="value=value.replace(/[^\d]/g,'')"
                                onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                                type="text" class="v5-input in100" />
                            <%} %>
                            &nbsp; 元
                        <br />
                          <label class="w60 float-l r10">
                                或消费次数</label><label class="float-l r10">&gt;</label>
                            <% if (isDefault == true)
                                { %>
                            <input name="ConsumeTimes" value="<%:ConsumeTimes %>" readonly="readonly" type="text"
                                class="v5-input in100" />
                            <%}
                                else
                                {%>
                            <input name="ConsumeTimes" value="<%:ConsumeTimes %>" id="ConsumeTimes" onkeyup="value=value.replace(/[^\d]/g,'')"
                                onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                                type="text" class="v5-input in100" />
                            <%} %>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span>
                        <label>
                            可享受折扣</label>
                    </div>
                    <div class="float-l">
                        <input name="DiscountRate" value="<%:DiscountRate %>" type="text" id="DiscountRate"
                        onkeyup="value=value.replace(/[^\d]/g,'')" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                        onchange="javascript:onchangeForValidata(event);" class="w230" /> （0~100）%
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
            </ul>
            <!--operate end-->
            <div class="l26 t30 b20">
                <input type="hidden" name="GradeID" id="GradeID" value="<%:Grade.ID %>" />
               <span id="UpdateTargetHiddenID" style="display: none"></span>
                <button type="submit" class="submit01 r10"">保存</button>
                <input type="button" value="取消" onclick="javascript:btnCancel();"  class="reset01"/>
            </div>
         <%} %>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            // 注册"直销或者分销"改变时触发的事件
            shopTypeChangeing();

            // 注册默认加载"店铺"
            GetShopTypeCode();

            // 根据会员类型不同 处理dom 元素的显隐性
            defaultDealCustomerGrade();
        });

        // 根据会员类型不同 处理dom 元素的显隐性
        var defaultDealCustomerGrade = function () {
            var customerGrade = $("input[name=customerGrade]").val();
            if (customerGrade == "1") {  // 普通会员（默认等级）
                $("#GradeNameLi").css("display", "none");
                $("#meetConditionLi").css("display", "none");
            };
        };

        // 当输入内容时 取消提示字
        function onchangeForValidata(event) {
            $(".prompt").text('');
        };

        // ajax.BeginForm 的提交前验证
        function AjaxFormValidata() {
            $(".prompt").text('');

            var customerGrade = $("input[name=customerGrade]").val(); // customerGrade == "0" 是 自定义会员


            if ($("#GradeName").val() == "" && customerGrade == "0") {
                $("#GradeName").focus();
                validataPrompt($("#GradeName"), '等级名称不能为空');
                return false;
            }

            if ($("#ConsumeAmount").val() == "" && $("#ConsumeTimes").val() == "" && customerGrade == "0") { 
                $("#ConsumeAmount").focus();
                validataPrompt($("#ConsumeTimes"), '消费金额或消费次数最少填写一个');
                return false;
            }

            if ($("#DiscountRate").val() == "" ) {
                $("#DiscountRate").focus();
                validataPrompt($("#DiscountRate"), '折扣不能为空');
                return false;
            }

            if ($("#DiscountRate").val() <= 0 || $("#DiscountRate").val() >= 100) {
                $("#DiscountRate").focus();
                validataPrompt($("#DiscountRate"), '折扣要在0~100之间');
                return false;
            }

        };

        // "直销或者分销"改变时触发的事件
        function shopTypeChangeing() {
            // 从后台获取数据 动态的拼接到前台
            $("#shopTypeChangeID").change(function () {
                // 首先要移除“店铺”下的元素
                $("#opened").children().remove();

                // 获取到当前选中的值
                var saleType = $(this).attr("value");

                $.ajax({
                    url: "../../Customer/ShopTypeChangeing",
                    data: "saleType=" + saleType + "",
                    success: function (returnData) {
                        if (returnData != null && returnData.length > 0) {
                            $("#opened").css("display", "inline");
                            // 将返回的结果绑定上去
                            $("#opened").append(returnData);
                        } else {
                            $("#opened").css("display", "none");
                        }

                    },
                    error: function (error) {
                        errorTip("服务器端错误，联系管理员");
                    }
                });
            });
        };

        //默认加载"店铺"
        function GetShopTypeCode() {
            var ChannelCode = $("#shopTypeCode_Opened").val();
            var saleType = $("#shopType").val();

            $.post("../../Customer/GetShopTypeCode", "ChannelCode=" + ChannelCode + "&saleType=" + saleType + "", function (returnData) {
                if (returnData != null && returnData.length > 0) {
                    $("#opened").css("display", "inline");
                    $("#opened").append(returnData);
                } else {
                    $("#opened").css("display", "none");
                }
            });
        };

        // 修改会员等级之后
        function afterOnSuccess() {
            var data = $("#UpdateTargetHiddenID").html();
            if (data == "ok") {
                successTip("修改会员等级成功");
                window.location.href = "/Customer/GradeList?MenuCode=C325";
            } else if (data == "edit repeat") {
                warningTip("已经存在相同的会员等级和会员名称");
            } else if (data == "no meet") {
                warningTip("有店铺才能添加会员等级,请联系有关人员");
            }
            else {
                errorTip("未知异常,联系管理员");
            }
        };

        // 添加会员等级失败
        function afterOnFailure() {
            errorTip("修改会员等级失败");
        };

        // 点击取消的时候
        function btnCancel() {
            if (confirm("确定取消，取消后你的记录将不被保存")) {
                window.location.href = "../../Customer/GradeList?MenuCode=C325";
            }
        };

        //-----------通用方法 Start----------------------->
        // 去空格
        if (!String.prototype.trim) {
            String.prototype.trim = function () {
                var str = this.replace(/^\s+/, ""),
                      end = this.length - 1,
                      ws = /\s/;
                while (ws.test(this.charAt(end))) {
                    end--;
                }
                return this.slice(0, end + 1);
            }
        }

        var successTip = function (msg) {
            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
            $("#operateTip").html(msg).change();
        };

        var warningTip = function (msg) {
            $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
            $("#operateTip").html(msg).change();
        };

        var errorTip = function (msg) {
            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
            $("#operateTip").html(msg).change();
        };

        // 验证提示
        var validataPrompt = function ($element, msg) {
            $element.parent().next().find(".prompt").text(msg);
        };

        //-----------通用方法 End----------------------->
        
    </script>
</asp:Content>
