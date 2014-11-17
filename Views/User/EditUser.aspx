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
                编辑帐号</h1>
        </div>
    </div>
    <!--title end-->
    <!--form begin-->
    <div class="mod-form t20">
        <div class="con style0page">
            <%using (Ajax.BeginForm("EditUser", "User", new { }, new AjaxOptions() { HttpMethod = "post", OnBegin = "ajaxFormValidata", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "UpdateTargetHiddenID" }))
              { %>
            <%
                var User = (V5.MetaData.Security.Model.User)ViewData["User"];

                var UserCode = User.UserCode;
                var pwd = User.Password;
                var UserID = User.ID;        
            %>
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
                            <%var currentRoleID = Convert.ToInt32(ViewData["CurrentRoleID"]); %>
                            <% foreach (var role in Roles)
                               {%>
                            <% if (role.ID == currentRoleID)
                               { %>
                            <option name="RoleID" selected="selected" value="<%:role.ID %>">
                                <%:role.RoleName%></option>
                            <%}
                               else
                               {%>
                            <option name="RoleID" value="<%:role.ID %>">
                                <%:role.RoleName%></option>
                            <%} %>
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
                        <%-- admin 用户不能够修改--%>
                        <% if (UserCode == "admin")
                           { %>
                        <input type="text" class="w230" onclick="javascript:btnTip();" name="UserCode" readonly="readonly"
                            id="UserCode" value="<%:UserCode %>" />
                        <%}
                           else
                           {%>
                        <input type="text" class="w230" name="UserCode" id="UserCode" value="<%:UserCode %>" />
                        <%} %></div>
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
                        <input type="text" class="w230" type="password" name="pwd" id="pwd" /></div>
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
                        <input type="text" class="w230" type="password" name="repeatPwd" id="repeatPwd" /></div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
            </ul>
            <!---name end--->
            <div class="l130 t30 b20">
                <button type="submit" class="submit01 r10" />
                保存</button>
                <button type="button" class="reset01" onclick="javascript:btnCancel()">
                    取消</button>
                <input type="hidden" name="UserID" value="<%:User.ID %>" />
               <span id="UpdateTargetHiddenID" style="display: none"></span>
            </div>
            <%} %>
        </div>
    </div>
    <script src="../../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            // 默认把操作结果隐藏
            $("#ResultTip").css("display", "none");
        });

        // 提交前的表单验证
        var ajaxFormValidata = function () {
            $(".prompt").text('');
            var username = $("#UserCode").val().trim();
            var pwd1 = $("#pwd").val().trim();
            var pwd2 = $("#repeatPwd").val().trim();
            if (username.length <= 0) {
                validataPrompt($("#UserCode"), "用户名不能为空");
                return false;
            }

            if (pwd1 != pwd2) {
                validataPrompt($("#repeatPwd"), "输入的密码不一致");
                return false;
            }
            successTip("努力提交中......");
        };

        // 添加会员等级之后
        function afterOnSuccess() {
            var result = $("#UpdateTargetHiddenID").text();

            var result = $("#UpdateTargetHiddenID").html();

            if (result == "ok") {
                successTip("修改成功! 点击跳转到<a href='/User/UserList?MenuCode=C510'> 用户列表</a>");
            } else if (result == "pwd not the same") {
                warningTip("两次密码要一致");
            } else if (result == "chose role") {
                warningTip("请选择角色");
            } else if (result == "pwd is short") {
                warningTip("密码长度不能小于6位");
            } else if (result == "userName repeat") {
                warningTip("已经存在同名的用户");
            } else if (result == "update admin") {
                alert('.....');
            } else {
                errorTip("未知异常，联系管理");
            }
        };

        // 添加会员等级失败
        function afterOnFailure() {
            errorTip("保存失败");
        };

        // 点击取消的时候
        function btnCancel() {
            window.location.href = "/User/UserList?MenuCode=C510";
        };

        // admin 名称不能修改
        function btnTip() {
            warningTip("admin拥有特殊权限 名称不能修改！");
        }

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
