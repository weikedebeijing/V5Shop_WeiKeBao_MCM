<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="MCM-N-L">
        <div class="MCM-C-M ">
            <!--title begin-->
            <div class="mod-title">
                <div class="con style0h1">
                    <a href="/WeiXinManage/UserGroupManageList" title="返回" class="a-btn float-l"><i class="icon-back t6">
                    </i></a>
                    <h1 class="spanTitle">
                        修改用户组</h1>
                </div>
            </div>
            <!--title end-->
            <!--添加内容 开始-->
            <%var userGroup = (V5.MetaData.WeiXin.Model.UserGroup)ViewData["userGroup"]; %>
            <div>
                <div class="mod-form">
                    <div class="con style01">
                        <dl>
                            <dt class="w80">分组名称</dt>
                            <dd class="l80">
                                <input type="text" id="groupName" value="<%:userGroup.GroupName %>" class="w230" />
                            </dd>
                            <dt class="w80"></dt>
                            <dd>
                                <button type="button" onclick="javascript:btnSave();" class="submit01 t10">
                                    保存</button>
                                <%-- <button type="button" class="cancelBtn l10 t10" onclick="javascript:btnCancel()">
                                    取消</button>--%>
                            </dd>
                        </dl>
                    </div>
                </div>
            </div>
            <input type="hidden" id="userGroupId" value="<%:userGroup.ID %>" />
            <!--添加内容 结束-->
        </div>
    </div>
    <script type="text/javascript">
        // 保存
        function btnSave() {
            var groupName = $("#groupName").val();

            if (groupName.trim() == '') {
                $(".Loading").removeClass("style01 style03").addClass("style02");
                $("#operateTip").html("请输入分组名称").change();
                return false;
            }

            $.ajax({
                url: "/WeiXinManage/WeiXinUserGroupEdit",
                type: "post",
                data: { "groupName": groupName, "userGroupId": $("#userGroupId").val() },
                success: function (returnData) {
                    if (returnData == "ok") {
                        $(".Loading").removeClass("style03 style02").addClass("style01");
                        $("#operateTip").html("修改成功! 点击跳转到<a href='/WeiXinManage/UserGroupManageList'>用户组管理列表</a> ").change();
                        $("#groupName").val('');
                    } else if (returnData == "repeat") {
                        $(".Loading").removeClass("style01 style03").addClass("style02");
                        $("#operateTip").html("已经存在同名分组").change();
                        $("#groupName").val('');
                        $("#groupName").focus();
                    } else {
                        $(".Loading").removeClass("style01 style02").addClass("style03");
                        $("#operateTip").html("删除出现异常，联系管理员").change();
                    }
                }
            });

        };

        // 取消
        function btnCancel() {
            window.location.href = "/WeiXinManage/UserGroupManageList";
        };
    </script>
</asp:Content>
