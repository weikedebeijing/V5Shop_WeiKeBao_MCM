<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="Combres" %>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <%--<script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>--%>
    <%=WebExtensions.CombresLink("editRoleJs")%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!--title begin-->
    <div class="mod-title t10">
        <div class="con style0h1-02">
            <a href="/Role/RoleList?MenuCode=C505" title="返回" class="a-btn float-l"><i class="icon-back">
            </i></a>
            <h1 class="spanTitle">
                角色设置</h1>
        </div>
    </div>
    <!--title end-->
    <!--添加内容 开始-->
    <%using (Ajax.BeginForm("EditRole", "Role", new { }, new AjaxOptions() { HttpMethod = "post", OnBegin = "ajaxFormValidata", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "UpdateTargetHiddenID" }))
      { %>
    <%
        var Role = (V5.MetaData.Security.Model.Role)ViewData["Role"];
        var RoleName = Role.RoleName;
        var RoleID = Role.ID;
             
    %>
    <div class="mod-form t20">
        <div class="con style0page">
            <ul class="list-ul">
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span>
                        <label>
                            角色名称
                        </label>
                    </div>
                    <div class="float-l">
                        <input type="text" value="<%:RoleName %>" name="RoleName" id="RoleName" class="w230" />
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span>
                        <label>
                            权限
                        </label>
                    </div>
                    <div class="overflow">
                        <ul id="AllMenuConetnt">
                            <li id="contentPaltForm">
                                <input id="01" name="import" dir="title" type="checkbox" onclick='AllCheckBoxClick(event);' />
                                <label for="01">
                                    平台</label>
                                <!-- 列表 begin -->
                                <div class="mod-table l30">
                                    <div class="mod-table-main">
                                        <div class="con style0line">
                                            <table>
                                                <colgroup>
                                                    <col style="width: 100px;">
                                                    <col style="width: 800px;">
                                                    <%--控制菜单列的长度--%>
                                                    <col style="width: auto;">
                                                </colgroup>
                                                <tbody id="platFormContent">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                <!-- 列表 end -->
                            </li>
                            <%--这里根据后台拼接的动态表格构建html--%>
                        </ul>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
            </ul>
            <!---name end--->
            <div class="l130 t30 b20">
                <button type="submit" onclick="javascript:sendDatas()" class="submit01 r10">
                    保存</button>
                <button type="button" onclick="javascript:btnCancel()" class="reset01">
                    取消</button>
                <input type="hidden" id="currentRoleID" name="RoleID" value="<%:Role.ID %>" />
               <span id="UpdateTargetHiddenID" style="display: none"></span>
                <input type="hidden" name="sendCheckDatas" id="sendCheckDatas" />
            </div>
        </div>
    </div>
    <%} %>
    <!--添加内容 结束-->
    <script type="text/javascript">
        $(function () {
            // 注册返回menus 的事件
            returnMeuns();
        });

        // 提交过程中的操作
        function ajaxFormValidata() {
            var roleName = $("#RoleName").val().trim();

            $(".prompt").text('');

            if (roleName.length <= 0) {
                //warningTip("请输入角色名称");
                validataPrompt($("#RoleName"), '请输入角色名称');
                $("#RoleName").focus();
                return false;
            }

            successTip("努力提交中......");
        };

        // 注册返回menus 的事
        function returnMeuns() {
            var roleID = $("#currentRoleID").val();
            // 返回平台的菜单
            $.post("/Role/ReturnPlatFormMenusForEdit", "role_ID=" + roleID + "", function (returnData) {
                if (returnData != null) {
                    // 把返回的数据加载到指定的地方
                    $("#platFormContent").prepend(returnData);
                }
            });

            // 返回其他平台的菜单
            $.post("/Role/ReturnAppMenusForEdit", "role_ID=" + roleID + "", function (returnData) {
                if (returnData != null) {
                    // 把返回的数据加载到指定的地方
                    $("#contentPaltForm").after(returnData); // 放到平台菜单之后
                }
            });
        };

        // 点击提交时将选中的数据提交到后台
        function sendDatas() {
            // 方案
            // ①：要确定是哪个 title
            // ②：取到当前 son 的id
            // ③:往后台传递的数据为 title+ids
            // 截取后是0_8 就是平台  是9_77 就是其他

            var SendDatas = "";
            var checks = $("input[type=checkbox]");
            // 遍历所有的checkbox
            for (var i = 0; i < checks.length; i++) {
                // 首先必须是选中的
                if ($(checks[i]).attr("checked") == "checked") {
                    // 里面的字符必须包含 ‘|’的
                    var strCheckID = $(checks[i]).attr("id");
                    var length = strCheckID.indexOf('|');
                    if (length > 0) {
                        var ids = strCheckID.substring(length + 1, strCheckID.length);
                        SendDatas += ids + ",";
                    }
                }
            };
            if (SendDatas.length > 0) {
                SendDatas = SendDatas.substring(0, SendDatas.length - 1);
                // 并放到隐藏域中
                $("#sendCheckDatas").val(SendDatas);
            }
        };

        // 添加会员等级之后
        function afterOnSuccess() {
            var result = $("#UpdateTargetHiddenID").html();
            if (result == "ok") {
                successTip("修改角色成功");
                if (result == "ok") {
                    setTimeout(function () {
                        window.location.href = "/Role/RoleList?MenuCode=C505";
                    }, 600);
                }
            } else if (result == "no menus") {
                warningTip("请勾选权限");
            } else if (result == "No Role") {
                warningTip("角色名称不能为空");
            } else {
                errorTip("未知异常,联系管理员");
            }
        };

        // 添加会员等级失败
        function afterOnFailure() {
            errorTip('修改角色失败');
        };

        // 点击取消的时候
        function btnCancel() {
            window.location.href = "/Role/RoleList?MenuCode=C505";
        };


        // 注册"所有"复选框点击的时候
        function AllCheckBoxClick(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;

            // 当选中的是title
            if ($(eventSrc).attr("dir") == "title") {
                // 控制旗下的所有复选框

                // 选中旗下所有的checkBox
                if ($(eventSrc).attr("checked") == "checked") {
                    $("input[type=checkbox]", $(eventSrc).parent("li")).not($(eventSrc)).attr("checked", "checked");
                } else {
                    $("input[type=checkbox]", $(eventSrc).parent("li")).not($(eventSrc)).attr("checked", false);
                }

            }

            // 当选中的是parent
            if ($(eventSrc).attr("dir") == "parent") {
                // 选中旗下所有的checkBox
                if ($(eventSrc).attr("checked") == "checked") {
                    $("input[type=checkbox]", $(eventSrc).parents("tr")).not($(eventSrc)).attr("checked", "checked");
                } else {
                    $("input[type=checkbox]", $(eventSrc).parents("tr")).not($(eventSrc)).attr("checked", false);
                }
            }

            // 当选中的是son
            if ($(eventSrc).attr("dir") == "son") {
                //alert('son');
            }
        };

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
