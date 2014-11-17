<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% V5.MetaData.DRP.Model.Payment payment = (V5.MetaData.DRP.Model.Payment)ViewData["Payment"];%>
    <!--title begin-->

        <div class="mod-title">
            <div class="con style0h1-02">
                <a class="a-btn float-l" href="/DrpSetting/PaymentList?MenuCode=C525"><i class="icon-back t6">
                </i></a>
                <h1 class="spanTitle">
                    支付方式设置</h1>
            </div>
        </div>
 
    <!--title end-->
    <!--添加内容 开始-->
    <div>
        <% Html.EnableClientValidation(); %>
        <%using (Ajax.BeginForm("EditPayment", "DRPSetting", new { }, new AjaxOptions() { HttpMethod = "post", OnBegin = "AjaxFormValidata", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "UpdateTargetHiddenID" }))
          { %>
        <div class="mod-form t20">
            <input type="hidden" id="id" name="id" value="<%=payment.ID%>" />
            <input type="hidden" id="DllName" name="DllName" value="<%=payment.DllName%>" />
            <div class="con style0page">
                <ul class="list-ul">
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star">*</span><label>支付平台</label></div>
                        <div class="float-l">
                            <select name="AlipayType" id="AlipayType" class="w230">
                                <option value="Alipay_Standard">支付宝(担保交易)</option>
                                <option value="Alipay_Instant">支付宝(即时到帐)</option>
                            </select></div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star">*</span><label>支付账户</label></div>
                        <div class="float-l">
                            <input type="text" id="Account" name="Account" class="w230" value="<%=payment.QueryArray.Split(',')[0] %>" /><span
                                class="spMessage"></span>
                        </div>
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span><label>合作者身份(PID)</label></div>
                            <div class="float-l">
                                <input type="text" id="PID" name="PID" class="w230" value="<%=payment.QueryArray.Split(',')[1] %>" /><span
                                    class="spMessage"></span>
                            </div>
                        </li>
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span><label>安全校验码(Key)</label></div>
                            <div class="float-l">
                                <input type="text" id="Key" name="Key" class="w230" value="<%= payment.QueryArray.Split(',')[2] %>" /><span
                                    class="spMessage"></span>
                            </div>
                        </li>
                </ul>
                <div class="l130 t20 b20">
                    <button class="submit01 t10" type="submit">
                        保存</button>
                </div>
            </div>
        </div>
       <span id="UpdateTargetHiddenID" style="display: none"></span>
        <%} %>
    </div>
    <!--添加内容 结束-->
    <script src="../../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-validate/jquery.validate.js" type="text/javascript"></script>
    <script src="../../Scripts/jscommon.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
    <script type="text/javascript">


        $(function () {
            // 默认把操作结果隐藏
            $("#ResultTip").css("display", "none");
            $("#AlipayType").val($("#DllName").val());
            $("#AlipayType").attr("disabled", "disabled");

        });

        // ajax.BeginForm 的提交前验证
        function AjaxFormValidata() {
            $(".spMessage").text("");
            $("#ResultTip").css("display", "none");
            if ($("#Account").val() == "") {
                $("#Account").siblings(".spMessage").text("支付宝账户不能为空");
                return false;
            }
            if (!IsPositiveNum($("#PID"))) {
                $("#PID").siblings(".spMessage").text("合作者身份(PID)格式不对");
                return false;
            }
            if ($("#Key").val() == "") {
                $("#Key").siblings(".spMessage").text("安全校验码(Key)不能为空");
                return false;
            }


        }

        function afterOnSuccess() {
            if ($("#UpdateTargetHiddenID").html() == "ok") {
                // 把添加成功放到<span>中
                $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                $("#operateTip").html("编辑成功! 点击跳转到<a href='/DRPSetting/PaymentList'>支付方式列表</a> ").change();
                //                $("#ResultTip").css("display", "block").text("编辑支付方式成功");

                //            } else {
                //                $("#ResultTip").css("display", "block").text($("#UpdateTargetHiddenID").html());
            } else {
                $(".Loading").removeClass("style0green style0yellow").addClass("style0red"); //红色
                $("#operateTip").html($("#UpdateTargetHiddenID").html()).change();
            }

        }

        // 添加会员等级失败
        function afterOnFailure() {
            // 把添加失败放到<span>中
            $(".Loading").removeClass("style0green style0yellow").addClass("style0red"); //红色
            $("#operateTip").html("编辑支付方式失败").change();
        }

        // 点击取消的时候
        function btnCancel() {
            window.location.href = "../../DRPSetting/PaymentList";
        };
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
</asp:Content>
