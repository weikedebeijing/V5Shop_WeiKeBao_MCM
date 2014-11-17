<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="MCM-N-L">
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
                <a href="/WeiXinManage/UserGroupManageList" title="返回">
                    <button type="button" class="returnBtn">
                        返回</button></a> <span class="spanTitle">添加用户组</span>
            </div>
            <!--title end-->
            <!--添加内容 开始-->
            <div>
                <div class="mod-form">
                    <div class="con style01">
                        <dl>
                            <dt class="w80">分组名称</dt>
                            <dd class="l80">
                                <input type="text" id="groupName" class="w230" />
                            </dd>
                            <dt class="w80"></dt>
                            <dd>
                                <button type="button" onclick="javascript:btnSave();" class="submit01 t10">
                                    保存</button>
                                <%--<button type="button" class="cancelBtn l10 t10" onclick="javascript:btnCancel()">
                                    取消</button>--%>
                            </dd>
                        </dl>
                    </div>
                </div>
            </div>
            <!--添加内容 结束-->
        </div>
    </div>
    <script type="text/javascript">
        // 初始化数据
        $(function () {

        });

        // 保存
        function btnSave() {
            var groupName = $("#groupName").val();

            if (groupName.trim() == '') {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请输入分组名称").change();
                return false;
            }

            $.ajax({
                url: "/WeiXinManage/AddWeiXinUserGroup",
                type: "post",
                data: { "groupName": groupName },
                success: function (returnData) {
                    if (returnData == "ok") {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("添加成功! 点击跳转到<a href='/WeiXinManage/UserGroupManageList'>用户组管理列表</a> ").change();
                        $("#groupName").val('');
                    } else if (returnData == "repeat") {
                        $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                        $("#operateTip").html("已经存在同名分组").change();
                        $("#groupName").val('');
                        $("#groupName").focus();
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
