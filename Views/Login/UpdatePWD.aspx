<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
    <div class="MCM-C-M ">
        <%--添加成功后把结果放到<span>标签中--%>
        <div class="mod-title">
            <div>
                <div class="Loading" style="display: none;">
                    <span id="operateTip"></span>&nbsp;&nbsp; <a href="javascript:void(0)">X</a>
                </div>
            </div>
        </div>
        <!--title begin-->
        <div class="mod-title">
            <a title="返回" href="javascript:window.history.go(-1);">
                <button type="button" class="returnBtn">
                    返回</button></a><span class="spanTitle">修改密码</span>
        </div>
        <!--title end-->
        <!--添加内容 开始-->
        <div>
            <%
                var User = (V5.MetaData.Security.Model.User)ViewData["User"];

                var UserCode = User.UserCode;
                var pwd = User.Password;
                var UserID = User.ID;
                    
            %>
            <div class="mod-form">
                <div class="con style01">
                    <dl>
                        <dt class="w80">用户名</dt>
                        <dd class="l80">
                            <input  class="w230" readonly="readonly" name="UserCode" id="UserCode" value="<%:UserCode %>">
                        </dd>
                        <dt class="w80">原密码</dt>
                        <dd class="l80">
                            <input  class="w230" type="password" name="sincePWD" id="sincePWD">
                        </dd>
                        <dt class="w80">新密码</dt>
                        <dd class="l80">
                            <input  class="w230" type="password" name="pwdFirst" id="pwdFirst">
                        </dd>
                        <dt class="w80">密码确认</dt>
                        <dd class="l80">
                            <input  class="w230" type="password" name="PwdNext" id="PwdNext">
                        </dd>
                        <dt class="w80"></dt>
                        <dd>
                            <button type="button" onclick="javascript:submit01();" class="saveBtn t10">
                                保存</button>
                          <%--  <button type="button" class="cancelBtn l10 t10" onclick="javascript:btnCancel()">
                                取消</button>--%>
                        </dd>
                        <input type="hidden" name="UserID" id="UserID" value="<%:User.ID %>" />
                    </dl>
                </div>
            </div>
        </div>
        <!--添加内容 结束-->
    </div>
    <script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            // 默认把操作结果隐藏
            $("#ResultTip").css("display", "none");
        });

        // 保存修改
        function Save() {
            var sincePWD = $("#sincePWD").val();
            var pwdFirst = $("#pwdFirst").val();
            var PwdNext = $("#PwdNext").val();
            var userID = $("#UserID").val();

            $.ajax({
                url: "/Login/UpdatePWD",
                type: "post",
                data: { "pwdFirst": pwdFirst, "PwdNext": PwdNext, "userID": userID, "sincePWD": sincePWD },
                success: function (succData) {
                    if (succData == "ok") {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("修改密码成功").change();
                        $("#sincePWD").val("");
                        $("#pwdFirst").val("");
                        $("#PwdNext").val("");
                    } else if (succData == "No SincePwd") {
                        $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                        $("#operateTip").html("原密码不正确").change();
                        $("#sincePWD").val("");
                        $("#pwdFirst").val("");
                        $("#PwdNext").val("");
                    } else if (succData == "not same") {
                        $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                        $("#operateTip").html("两次密码不一致").change();
                        $("#sincePWD").val("");
                        $("#pwdFirst").val("");
                        $("#PwdNext").val("");
                    } else if (succData == "pwd empty") {
                        $(".Loading").removeClass("style01 style03").addClass("style02");
                        $("#operateTip").html("密码不能为空").change();
                    } else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html("修改密码失败,请联系管理员").change();
                    }
                }
            });

        };

        // 跳转到空白页
        function btnCancel() {
            // window.location.href = "/Login/WelComePage";
            window.history.go(-1);
        }

    </script>
</asp:Content>
