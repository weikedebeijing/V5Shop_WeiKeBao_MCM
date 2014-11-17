<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="Combres" %>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <%= WebExtensions.CombresLink("roleListJs")%>
    <script src="../../../Scripts/Js/allselect.js" type="text/javascript"></script>
    <script src="../../Scripts/Role/roleJs.js" type="text/javascript"></script>
    <%=WebExtensions.CombresLink("addRoleJs")%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        // 分组查询条件
        var searchQuery = new Object();
        // 给searchQuery赋一个初始值
        searchQuery.Groups = '';
        searchQuery.Query = '';
    </script>
    <div id="gray-add-role" style="display: none">
        <%using (Ajax.BeginForm("AddRole", "Role", new { }, new AjaxOptions() { HttpMethod = "post", OnBegin = "ajaxFormValidata", OnSuccess = "afterOnSuccess", OnFailure = "afterOnFailure", UpdateTargetId = "UpdateTargetHiddenID" }))
          { %>
       <span id="UpdateTargetHiddenID" style="display: none"></span>
        <input type="hidden" name="sendCheckDatas" id="sendCheckDatas" />
        <div style="width: 850px; height: 350px;" class="content scroll">
            <div>
                <!--content begin-->
                <div class="mod-form">
                    <div class="con style0alert b10">
                        <ul class="list-ul">
                            <li class="list-li">
                                <div class="float-l w100">
                                    <span class="star">*</span>
                                    <label>
                                        角色名称
                                    </label>
                                </div>
                                <div class="float-l">
                                    <input type="text" value="" name="RoleName" id="RoleName" class="w230" />
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w100">
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
                                                                <col style="width: 600px;">
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
                    </div>
                </div>
                <!--content end-->
                <button class="submit01-alert r10" style="display: none" id="addSubmit" type="submit">
                    保存</button>
            </div>
        </div>
        <%} %>
        <div class="btn">
            <div class="indiv">
                <button class="submit01-alert r10" onclick="btn()" type="button" id="btn">
                    保存</button>
                <button class="reset01-alert" onclick="roleClose()">
                    关闭</button>
            </div>
        </div>
    </div>
    <div id="gray-edit-role" style="display: none">
        <%using (Ajax.BeginForm("EditRole", "Role", new { }, new AjaxOptions() { HttpMethod = "post", OnBegin = "EditajaxFormValidata", OnSuccess = "EditafterOnSuccess", OnFailure = "EditafterOnFailure", UpdateTargetId = "EditUpdateTargetHiddenID" }))
          { %>
        <div style="width: 850px; height: 350px;" class="content scroll">
            <div>
                <!--content begin-->
                <div class="mod-form ">
                    <div class="con style0alert b10">
                        <ul class="list-ul">
                            <li class="list-li">
                                <div class="float-l w100">
                                    <span class="star">*</span>
                                    <label>
                                        角色名称
                                    </label>
                                </div>
                                <div class="float-l">
                                    <input type="text" name="EditRoleName" id="EditRoleName" class="w230" />
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w100">
                                    <span class="star">*</span>
                                    <label>
                                        权限
                                    </label>
                                </div>
                                <div class="overflow">
                                    <ul id="EditAllMenuConetnt">
                                        <li id="EditcontentPaltForm">
                                            <input id="Edit01" name="import" dir="top" type="checkbox" onclick='EditAllCheckBoxClick(event);' />
                                            <label for="Edit01">
                                                平台</label>
                                            <!-- 列表 begin -->
                                            <div class="mod-table l30">
                                                <div class="mod-table-main">
                                                    <div class="con style0line">
                                                        <table>
                                                            <colgroup>
                                                                <col style="width: 100px;">
                                                                <col style="width: 600px;">
                                                                <%--控制菜单列的长度--%>
                                                                <col style="width: auto;">
                                                            </colgroup>
                                                            <tbody id="EditplatFormContent">
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
                    </div>
                </div>
                <!--content end-->
                <button type="submit" id="EditSubmit" style="display: none"  class="submit01 r10">
                    保存</button>
            </div>
        </div>
        <input type="hidden" id="currentRoleID" name="EditRoleID" />
        <input type="hidden" id="EditUpdateTargetHiddenID" value="" />
        <input type="hidden" name="EditsendCheckDatas" id="EditsendCheckDatas" />
        <%} %>
        <div class="btn">
            <div class="indiv">
                <button class="submit01-alert r10" onclick="Editbtn()">
                    保存</button>
                <button class="reset01-alert" onclick="btnCancel()">
                    关闭</button>
            </div>
        </div>
    </div>
    <!--tab begin-->
    <div class="mod-tab t20"  >
        <div class="con style0big" id="type">
            <ul>
                <li class="current"><a href="#" class="c16"><span>全部（<%:ViewData["totalCount"]%>）</span>
                </a></li>
            </ul>
        </div>
    </div>
    <!--tab end-->
    <!--搜索 begin-->
    <div class="mod-search">
        <div class="con style0list">
            <ul>
                <li>
                    <input type="text" name="" id="txtSearch" class="search-input" placeholder="请输入角色..."
                        style="color: #999;" />
                </li>
                <li><a class="search-btn search" href="#" onclick="javascript:txtSearch();"></a>
                </li>
            </ul>
        </div>
    </div>
    <!--搜索 end-->
    <!--操作栏 begin-->
    <div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list">
                <li class="hidden"><a class="a-btn" id="addrole" href="javascript:void(0)">添加</a>
                </li>
                <li class="hidden"><a class="a-btn" href="#" onclick="javascript:DeleteBatch(event);">
                    刪除</a> </li>
            </ul>
        </div>
    </div>
    <!--操作栏 end-->
    <div class="mod-page">
        <div class="con style0list">
            <div class="turn">
                <ul class="turn-ul" id="dvPage">
                    <li class="next"></li>
                    <li class="prev"></li>
                </ul>
            </div>
            <div class="number">
                <div class="r10">
                    当前<span id="numberStart"></span>~<span id="numberEnd"></span>条，总计<span id="pageTotalCount"></span>条</div>
            </div>
        </div>
    </div>
    <div class="clear h10">
    </div>
    <%--Page End--%>
    <!--List Start-->
    <div style="clear: both;">
        <div class="sourcelist">
            <%--局部试图 Start--%>
            <%Html.RenderAction("GetRoleView", new { CurrentPageIndex = 0 }); %>
            <%--局部试图 End--%>
        </div>
    </div>
    <!--List End-->
    <script type="text/javascript" language="javascript">
        $(function () {
            GetRoleView(1);

            // 注册文本框的事件
            txtTips();
        });

        $("#type ul li").click(function () {
            searchQuery.Groups = 'A';
            searchQuery.Query = '';

            GetRoleView(1);
        });

        // 输入文本框
        function txtTips() {
            $("#txtSearch").focus(function () {
                if ($(this).val() == "请输入角色...") {
                    $(this).val('');
                    $(this).val('').css("color", "#6b6969");
                }
            });

            $("#txtSearch").blur(function () {
                condition = $(this).val().replace(/^\s*/g, "").replace(/\s*$/g, "");
                if (condition == "") {
                    $(this).focus();
                    $(this).val("");
                }
            });
        };

        // enter 键模糊查询 bug 2013-11-16 14:10:06
        document.onkeypress = function () {
            var iKeyCode = -1;
            if (arguments[0]) {
                iKeyCode = arguments[0].which;
            }
            else {
                iKeyCode = event.keyCode;
            }

            if (iKeyCode == 13) {
                if ($("#txtSearch").val() == null || $("#txtSearch").val() == "请输入角色..." || $("#txtSearch").val().trim() == '') {
                    $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                    $("#operateTip").html("请输入角色").change();
                    return false;
                }
                else {
                    searchQuery.Query = $("#txtSearch").val().trim();
                    GetRoleView(1);
                }
                // 把返回的数量绑定到”进行中”、”过期”、”未开始”也要和“全部”、“直销”、”分销”关联
            }
        }

        // 查询
        function txtSearch() {
            if ($("#txtSearch").val() == null || $("#txtSearch").val() == "请输入角色..." || $("#txtSearch").val().trim() == '') {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请输入角色").change();
                return false;
            }
            else {
                searchQuery.Query = $("#txtSearch").val().trim();
                GetRoleView(1);
            }
        };

        function deleteRole(event, roleID) {
            if (!confirmThis(event, '确定要删除？')) {
                return false;
            }
            $.ajax({
                url: "/Role/DeleteRole",
                data: { "roleID": roleID },
                type: "post",
                async: false,
                success: function (returnData) {
                    if ("ok" == returnData) {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("删除成功").change();
                        GetRoleView(1);
                    } else if ("bind user" == returnData) {
                        $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                        $("#operateTip").html("绑定用户的角色不能删除").change();
                    } else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html("删除出现异常，联系管理员").change();
                    };
                },
                error: function () {
                    $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                    $("#operateTip").html("删除出现异常，联系管理员").change();
                }
            });

        };

        // 批量删除 也包括全部删除
        function DeleteBatch(event) {
            // 遍历所有的复选框 遍历每一个checkbox,并且把checkbox的id属性过滤出id,存到数组中
            var strIDs = new Array();
            var checks = $("#content input[type=checkbox]");

            for (var i = 0; i < checks.length; i++) {
                var check = $(checks[i]).attr("checked");

                if (check == "checked") { // 如果checkbox被选中

                    // 取出 id  形如checkbox_7
                    var checkID = $(checks[i]).attr("id");

                    // 这点处理的不好
                    var strID = checkID.substring(9, checkID.length);

                    // 把id 放到集合中去 形如2,4,5
                    strIDs.push(strID);
                }
            }

            // 如果存储id的数组不为空
            if (strIDs.length > 0) {
                if (confirmThis(event, "确定要删除选中的项？")) {
                    $.ajax({
                        url: "/Role/DeleteRoles",
                        data: "IDs=" + strIDs + "",
                        type: "post",
                        success: function (succData) {
                            if (succData == "ok") {
                                GetRoleView(1);
                                $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                                $("#operateTip").html("删除成功").change();

                            } else if (succData == "ok but bind user") {
                                window.location.href = "/Role/RoleList?appCode=PLATFORM&MenuCode=C520";
                                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                                $("#operateTip").html("删除成功 绑定用户的角色不能删除").change();
                            } else if (succData == "can not delete") {
                                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                                $("#operateTip").html("绑定用户的角色不能删除").change();
                                return false;
                            } else {
                                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                                $("#operateTip").html("请选中要删除的项").change();
                            }
                        },
                        error: function (errData) {
                            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                            $("#operateTip").html("删除出现异常，联系管理员").change();
                        }
                    });
                } else {
                    return false;
                }
            } else {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请勾选要删除的角色").change();
                return false;
            }
        };

    </script>
</asp:Content>
