<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% V5.MetaData.DRP.Model.EmailConfig EmailConfig = (V5.MetaData.DRP.Model.EmailConfig)ViewData["EmailConfig"];%>

        <div class="mod-title">
            <div class="con style0h1-02">
                <a class="a-btn float-l" href="/DrpSetting/EmailConfigList?MenuCode=C530"><i class="icon-back t6">
                </i></a>
                <h1 class="spanTitle">
                    邮件服务设置</h1>
            </div>
        </div>

    <!--title end-->
    <!--添加内容 开始-->
    <div>
        <% Html.EnableClientValidation(); %>
        <%using (Ajax.BeginForm("EditEmailConfig", "DRPSetting", new { }, new AjaxOptions() { HttpMethod = "post", OnBegin = "AjaxFormValidata", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "UpdateTargetHiddenID" }))  // , new { id = "ajaxFrmAdd" }
          { %>
        <div class="mod-form t20">
            <input type="hidden" id="id" name="id" value="<%=EmailConfig.ID%>" />
            <div class="con style0page">
                <ul class="list-ul">
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star">*</span><label>发件邮箱</label></div>
                        <div class="float-l">
                            <input type="text" id="LoginID" name="LoginID" class="w230" value="<%=EmailConfig.LoginID %>" /><span
                                class="spMessage"></div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star">*</span><label>发件人</label></div>
                        <div class="float-l">
                            <input type="text" id="Name" name="Name" class="w230" value="<%=EmailConfig.Name %>" /><span
                                class="spMessage"></span></div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star">*</span><label>SMTP服务器</label></div>
                        <div class="float-l">
                            <input type="text" id="Smtp" name="Smtp" class="w230" value="<%=EmailConfig.Smtp %>" />
                            <span class="spMessage"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star">*</span><label>SMTP端口号</label></div>
                        <div class="float-l">
                            <input type="text" id="Port" name="Port" class="w230" value="<%=EmailConfig.Port %>" />
                            <span class="spMessage"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star">*</span><label>SMTP密码</label></div>
                        <div class="float-l">
                            <input type="password" id="LoginPass" name="LoginPass" class="w230" value="<%=EmailConfig.LoginPass %>" /><span
                                class="spMessage"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                        </div>
                        <div class="float-l">
                            <button class="submit01 t10" type="submit">
                                保存</button>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star">*</span><label>测试邮件地址</label></div>
                        <div class="float-l">
                            <input id="txtEmail" type="text" name="txtEmail" class="w230"><input type="button"
                                name="btnSendTest" value="测试邮件发送" id="btnSendTest" class="btn03">
                        </div>
                    </li>
                </ul>
            </div>
        </div>
       <span id="UpdateTargetHiddenID" style="display: none"></span>
        <%} %>
    </div>
    <!--添加内容 结束--> <script src="../../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-validate/jquery.validate.js" type="text/javascript"></script>
    <script src="../../Scripts/jscommon.js" type="text/javascript"></script> <script
    src="../../Scripts/Js/Common.js" type="text/javascript"></script> <script type="text/javascript">
    $(function () { // 默认把操作结果隐藏 if ($("#IsUsed").val() == '1') { $("#checkbox").attr("checked",
    "checked"); } else { $("#checkbox").attr("checked",""); } $("#checkbox").click(function
    () { if ($(this).attr("checked") == true) { $("#IsUsed").val("1"); } else { $("#IsUsed").val("0");
    } }) $("#btnSendTest").click(function () { var Smtp = $("#Smtp").val(); var Port
    = $("#Port").val(); var Name = $("#Name").val(); var LoginID = $("#LoginID").val();
    var LoginPass = $("#LoginPass").val(); var RevertEmail = $("#RevertEmail").val();
    var txtEmail = $("#txtEmail").val(); $.ajax({ url:"TestMessage", data: { "Smtp":
    Smtp,"Port": Port,"Name": Name,"LoginID": LoginID,"LoginPass": LoginPass,"RevertEmail":
    RevertEmail,"txtEmail": txtEmail }, async: false, cache: false, success: function
    (data) { alert(data); }, }) }) }); // ajax.BeginForm 的提交前验证 function AjaxFormValidata()
    { // $(".spMessage").text(""); // $("#operateTip").css("display", "none"); // if
    ($("#Account").val() == "") { // $("#Account").siblings(".spMessage").text("支付宝账户不能为空");
    // return false; // } // if (!IsPositiveNum($("#PID"))) { // $("#PID").siblings(".spMessage").text("合作者身份(PID)格式不对");
    // return false; // } // if ($("#Key").val() == "") { // $("#Key").siblings(".spMessage").text("安全校验码(Key)不能为空");
    // return false; // } } function afterOnSuccess() { if ($("#UpdateTargetHiddenID").html()
    == "ok") { $(".Loading").removeClass("style0red style0yellow").addClass("style0green"); $("#operateTip").html("编辑成功!
    点击跳转到<a href='/DRPSetting/EmailConfigList'>邮件服务列表</a> ").change(); // // 把添加成功放到<span>中
    // $("#ResultTip").css("display", "block").text("添加支付方式成功"); // }else{ // $("#ResultTip").css("display",
    "block").text($("#UpdateTargetHiddenID").html()); } else { $(".Loading").removeClass("style0green style0yellow").addClass("style0red"); $("#operateTip").html($("#UpdateTargetHiddenID").html()).change();
    } } // 添加会员等级失败 function afterOnFailure() { // 把添加失败放到<span>中 $("#operateTip").html("添加邮件服务失败").change();
    }; // 点击取消的时候 function btnCancel() { window.location.href = "../../DRPSetting/EmailConfigList?MenuCode=C530";
    }; </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
</asp:Content>
