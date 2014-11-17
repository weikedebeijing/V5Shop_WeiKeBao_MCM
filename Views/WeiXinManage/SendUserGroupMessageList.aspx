<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--title begin-->
    <div class="mod-title t10">
        <div class="con style0h1-02">
            <h1 class="spanTitle">
                群发用户组消息</h1>
        </div>
    </div>
    <!--title end-->
    <!--添加内容 开始-->
    <div class="mod-form t20">
        <div class="con style0page">
            <ul class="list-ul">
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>选择群组</label></div>
                    <div class="overflow" id="group_CheckBox">
                        <%--选项设置 Start----------%>
                        <% var userGroups = (List<V5.MetaData.WeiXin.Model.UserGroup>)ViewData["userGroups"];%>
                        <ul class="overflow" id="Template_All">
                            <li class="float-l r15">
                                <input id="check_All" value="check_All" type="checkbox" onclick="javascript:checkAll(event);" />
                                <label for="check_All">
                                    全选</label>
                            </li>
                            <%for (var i = 0; i < userGroups.Count; i++)
                              {%>
                            <li class="float-l r15">
                                <input id="group_<%:userGroups[i].ID %>" value="<%:userGroups[i].ID %>" type="checkbox"/>
                                <label for="group_<%:userGroups[i].ID %>">
                                    <%:userGroups[i].GroupName%></label>
                            </li>
                            <%} %>
                        </ul>
                        <%--选项设置 End----------%>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>消息内容</label></div>
                    <div class="float-l">
                        <textarea id="send_Msg" class="w564 h250"></textarea>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
            </ul>
            <div class="l130 t30 b20">
                <input type="button" id="btnSave" class="submit01 r10" onclick="javascript:sendMessage();"
                    value="发送" />
            </div>
        </div>
    </div>
    <!--添加内容 结束-->
    <script type="text/javascript">
        // 初始化
        $(function () {

        });

        // 发送消息
        function sendMessage() {
            // 获取选中的checkbox
            var strIDs = new Array();
            var checks = $("#group_CheckBox input[type=checkbox]:not(#check_All)");
            for (var i = 0; i < checks.length; i++) {
                var check = $(checks[i]).attr("checked");
                if (check == "checked") {
                    var userGroupID = $(checks[i]).val();
                    strIDs.push(userGroupID);
                }
            }
            if (strIDs.length <= 0) { // 检查是否有选中的项
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请勾选要发送的用户组").change();
                return false;
            }

            var textMessage = $("#send_Msg").val();
            if (textMessage.trim() == '') { // 检查是否输入了信息
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请输入要发送的文本内容").change();
                return false;
            };

            $.ajax({
                url: "/WeiXinManage/SendUserGroupMessage",
                type: "post",
                data: { "userGroupIDs": JSON.stringify(strIDs), "messageContent": textMessage },
                success: function (returnData) {
                    if (returnData == "ok") {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("消息发送成功").change();
                    }
                    else if ("no weiXinOpenID" == returnData) {
                        $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                        $("#operateTip").html("发送失败，所选用户组不包含用户！").change();
                    } else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html("删除出现异常，联系管理员").change();
                    }
                }
            });
        };

        // 全选
        function checkAll(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            if ($(eventSrc).attr("checked") == "checked") {
                $("input[type=checkbox]:not(#check_All)").attr("checked", true);
            } else {
                $("input[type=checkbox]:not(#check_All)").attr("checked", false);
            };
        };

        // 去除前后空格
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
    </script>
</asp:Content>
