<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!--title begin-->
    <div class="mod-title">
        <div class="con style0h1-02">
            <h1 class="spanTitle">
                创建帐号</h1>
        </div>
    </div>
    <!--title end-->
    <!--form begin-->
    <div class="mod-form t20">
        <div class="con style0alert">
            <%Html.EnableClientValidation(); %>
            <%using (Ajax.BeginForm("addUser", "User", new { }, new AjaxOptions() { HttpMethod = "post", OnBegin = "ajaxFormValidata", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "UpdateTargetHiddenID" }))
              { %>
            <!---name begin--->
            <ul class="list-ul">
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>角色</label></div>
                    <div class="float-l">
                        <% var Roles = (List<V5.MetaData.Security.Model.Role>)ViewData["Roles"];%>
                        <select name="RoleID" id="RoleID" class="v5-select">
                            <option>请选择…</option>
                            <%--<option>平台管理员</option>--%>
                            <% foreach (var role in Roles)
                               {%>
                            <option name="RoleID" value="<%:role.ID %>">
                                <%:role.RoleName %></option>
                            <%} %>
                        </select>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>用户名</label></div>
                    <div class="float-l">
                        <input type="text" name="UserCode" id="UserCode" class="w230" /></div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span>
                        <label>
                            密码</label></div>
                    <div class="float-l">
                        <input type="text" class="w230" name="Password" id="Password" type="password" /></div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span>
                        <label>
                            密码确认</label></div>
                    <div class="float-l">
                        <input type="text" class="w230" name="RepeatPassword" id="RepeatPassword" type="password"></div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
            </ul>
            <!---name end--->
            <div class="l130 t30 b20">
                <button type="submit" id="submit" class="submit01 r10">保存</button>
                <button type="button" onclick="javascript:btnCancel()" class="reset01">
                    取消</button>
               <span id="UpdateTargetHiddenID" style="display: none"></span>
            </div>
            <%} %>
        </div>
    </div>
    <!--form end-->
    <script src="../../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-validate/jquery.validate.js" type="text/javascript"></script>
    <script type="text/javascript">
        // 初始化
        $(function () {
        });

        // 提交前的表单验证
        var ajaxFormValidata = function () {
            $(".prompt").text('');

            var username = $("#UserCode").val().trim();
            var pwd1 = $("#Password").val().trim();
            var pwd2 = $("#RepeatPassword").val().trim();
            var roleName = $("#RoleID").val().trim();

            if (roleName == "请选择…") {
                validataPrompt($("#RoleID"), "请选择角色");
                return false;
            }
            if (username.length == 0) {
                validataPrompt($("#UserCode"), "用户名不能为空");
                return false;
            }

            if (pwd1.length == 0) {
                validataPrompt($("#Password"), "密码不能为空");
                return false;
            }

            if (pwd2.length == 0) {
                validataPrompt($("#RepeatPassword"), "密码不能为空");
                return false;
            }

            if (pwd1.length < 6) {
                validataPrompt($("#Password"), "密码长度不能小于6位");
                return false;
            }

            if (pwd1 != pwd2) {
                validataPrompt($("#RepeatPassword"), "两次密码不一致");
                return false;
            }
            successTip("努力提交中......");
        };

        // 添加会员等级之后
        function afterOnSuccess() {
            var result = $("#UpdateTargetHiddenID").html();
            if (result == "ok") {
                successTip("添加成功! 点击跳转到<a href='/User/UserList?MenuCode=C510'> 用户列表</a>");

                $("#UserCode").val("");
                $("#Password").val("");
                $("#RepeatPassword").val("");
                $("#RoleID").val("请选择…");

            } else if (result == "repeat") {
                errorTip("添加失败，已存在同名管理员");
            } else if (result == "pwd not the same") {
                warningTip("两次密码要一致");
            } else if (result == "chose role") {
                warningTip("请选择角色");
            } else {
                errorTip("未知异常，联系管理员");
            }
        };

        // 添加会员等级失败
        function afterOnFailure() {
            errorTip("添加管理员失败");
        };

//        // enter 提交 高版本浏览器 按enter键会自动提交
//        document.onkeypress = function () {
//            var iKeyCode = -1;
//            if (arguments[0]) {
//                iKeyCode = arguments[0].which;
//            }
//            else {
//                iKeyCode = event.keyCode;
//            }

//            if (iKeyCode == 13) {
//                // 登录
//                $("#submit").submit();
//            }
//        }

        // 点击取消的时候
        function btnCancel() {
            window.location.href = "/User/UserList?MenuCode=C510";
        };

        //-------------通用------
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

        // 验证提示
        var validataPrompt = function ($element, msg) {
            $element.parent().next().find(".prompt").text(msg);
        };

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
    </script>
</asp:Content>
