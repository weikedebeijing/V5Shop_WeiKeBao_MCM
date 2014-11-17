<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BootstrapSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
    <script src="../../../Scripts/Js/allselect.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/MicrosoftMvcAjax.js" type="text/javascript"></script>
    <script src="../../Scripts/bootstrap/jquery.pager.js"></script>
    <script src="../../Scripts/bootstrap/bootstrapCommon.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        // 分组查询条件
        var searchQuery = new Object();
        // 给searchQuery赋一个初始值
        searchQuery.Groups = '';
        searchQuery.Query = '';
    </script>
    <!--tab begin-->
    <%--<div class="mod-tab t20">
        <div class="con style0big" id="type">
            <ul>
                <li class="current"><a href="#" class="c16"><span>全部（<%:ViewData["totalCount"]%>）</span>
                </a></li>
            </ul>
        </div>
    </div>--%>
    <!--tab end-->
    <!--搜索 begin-->
    <%--<div class="mod-search">
        <div class="con style0list">
            <ul>
                <li>
                    <input type="text" name="" id="txtSearch" class="search-input" placeholder="请输入账户名..." />
                </li>
                <li><a class="search-btn search" href="#" onclick="javascript:txtSearch();"></a>
                </li>
            </ul>
        </div>
    </div>--%>
    <!--搜索 end-->
    <!--操作栏 begin-->
    <div class="row funbar">
        <div class="span6 funbar-l">
            <a href="javascript:void(0)" onclick="javascript:addUserPopup();" class="btn btn-small fun-a"><i class="icon-add-gray"></i>添加账号</a>
            <a href="javascript:void(0)" onclick="javascript:FreezeUser(event);" class="btn btn-small fun-a"><i class="icon-close-gray"></i>冻结账号</a>
            <a href="javascript:void(0)" onclick="javascript:UNFreezeUser(event);" class="btn btn-small fun-a"><i class="icon-open-gray"></i>解除账号</a>
            <a href="javascript:void(0)" class="btn btn-small fun-a" onclick="javascript:DeleteBatch(event);" id="AllDeleteTransportation"><i class="icon-del-gray"></i>删除</a>
        </div>
        <div class="span3 funbar-r">
            <div class="form-search">
                <div class="bs-docs-example">
                    <input type="text" data-provide="typeahead" id="txtSearch" placeholder="请输入账户名..." class="input-large search-query">
                    <button class="btn-search" onclick="txtSearch();" type="submit"></button>

                </div>
            </div>
        </div>
    </div>
    <%--<div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list">
                <li class="hidden"><a class="a-btn" href="javascript:void(0);" onclick="javascript:addUserPopup();">
                    添加账号</a> </li>
                <li class="hidden"><a class="a-btn" href="#" onclick="javascript:FreezeUser(event);">
                    冻结帐号</a> </li>
                <li class="hidden"><a class="a-btn" href="#" onclick="javascript:UNFreezeUser(event);">
                    解除冻结</a> </li>
                <li class="hidden"><a class="a-btn" href="#" onclick="javascript:DeleteBatch(event);">
                    刪除</a> </li>
            </ul>
        </div>
    </div>--%>
    <!--操作栏 end-->
    <%--Page Start--%>
    <%--<div class="mod-page">
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
    </div>--%>
    <%--Page End--%>
    <!--List Start-->
    <div class="main">
        <div class="sourcelist">
            <%--局部试图 Start--%>
            <%Html.RenderAction("GetUserView", new { CurrentPageIndex = 0 }); %>
            <%--局部试图 End--%>
        </div>
        <div class="page">
            <div class="page-left">当前<span id="numberStart"></span>~<span id="numberEnd"></span>条,总计<span id="pageTotalCount"></span>条</div>
            <div class="page-select">
                每页显示
       
                    <div class="btn-group dropup">
                        <button class="btn" id="ddlPageSize">15</button>
                        <button data-toggle="dropdown" class="btn dropdown-toggle"><span class="caret"></span></button>
                        <ul class="dropdown-menu selectpage" id="numbers">
                            <li><a href="#">15</a></li>
                            <li><a href="#">20</a></li>
                            <li><a href="#">30</a></li>
                            <li><a href="#">40</a></li>
                            <li><a href="#">50</a></li>
                        </ul>
                    </div>
                条
     
            </div>
            <div class="pagination pagination-right" id="turn-ul">
                <%--<ul>
                        <li class="disabled"><a href="#">|&lt;</a></li>
                        <li class="disabled"><a href="#">&lt;</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">...</a></li>
                        <li><a href="#">12</a></li>
                        <li><a href="#">&gt;</a></li>
                        <li><a href="#">&gt;|</a></li>
                    </ul>--%>
            </div>
        </div>
    </div>
    <!--List End-->
    <!--Page Start-->
    <!--Page End-->
    <%--弹层 Start--%>
    <%--添加用户 Start--%>
    <div style="display: none;" id="myModal" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
        <%Html.EnableClientValidation(); %>
        <%using (Ajax.BeginForm("addUser", "User", new { }, new AjaxOptions()
                  {
                      OnBegin = "ajaxFormAddUserValidata",
                      HttpMethod = "post",
                      OnSuccess = "afterAddOnSuccess",
                      OnFailure = "afterAddOnFailure",
                      UpdateTargetId = "UpdateTargetHiddenID"
                  }))
          { %>
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="myModalLabel">添加用户</h3>
        </div>
        <div class="modal-body">
            <div class="form-horizontal">
                <div class="control-group" id="roleError">
                    <label class="control-label" for="inputError">角色</label>
                    <div class="controls">
                        <select name="RoleID" id="addRoleID">

                            <option value="请选择...">请选择…</option>
                            <% var Roles1 = (List<V5.MetaData.Security.Model.Role>)ViewData["Roles"];%>
                            <% foreach (var role in Roles1)
                               {%>
                            <option name="RoleID" value="<%:role.ID %>">
                                <%:role.RoleName %></option>
                            <%} %>
                        </select>
                        <span class="help-inline" id="rolePrompt" style="display: none;">请选择角色</span>
                    </div>
                </div>
                <div class="control-group" id="userNameError">
                    <label class="control-label" for="inputError">用户名</label>
                    <div class="controls">
                        <input name="UserCode" id="addUserCode" type="text">
                        <span class="help-inline" id="userNamePrompt" style="display: none;">请输入用户名</span>
                    </div>
                </div>
                <div class="control-group" id="passwordError">
                    <label class="control-label" for="inputError">密码</label>
                    <div class="controls">
                        <input name="Password" id="addPassword" type="password" onblur="javascript:pwdOnblur(event);">
                        <span class="help-inline" id="passwordPrompt" style="display: none;">请输入密码</span>
                    </div>
                </div>
                <div class="control-group" id="confirmPassError">
                    <label class="control-label" for="inputError">密码确认</label>
                    <div class="controls">
                        <input name="RepeatPassword" id="addRepeatPassword" type="password">
                        <span class="help-inline" id="confirmPassPrompt" style="display: none;">请输入密码</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
            <button class="btn btn-info" id="btn" data-dismiss="modal" aria-hidden="true">保存</button>
            <button style="display: none;" id="addSubmit" type="submit">
                保存</button>
        </div>
        <%} %>
    </div>

    <%--添加用户 End--%>
    <%--编辑用户 Start--%>
    <div style="display: none;" id="EditModal" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
        <%using (Ajax.BeginForm("EditUser", "User", new { }, new AjaxOptions() { HttpMethod = "post", OnBegin = "ajaxFormEditUserValidata", OnSuccess = "afterEditOnSuccess", OnFailure = "afterEditOnFailure", UpdateTargetId = "UpdateTargetHiddenID" }))
          { %>
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h3 id="H1">编辑用户</h3>
        </div>
        <div class="modal-body">
            <div class="form-horizontal">
                <div class="control-group" id="editRoleError">
                    <label class="control-label" for="inputError">角色</label>
                    <div class="controls">
                        <% var Roles = (List<V5.MetaData.Security.Model.Role>)ViewData["Roles"];%>
                        <select name="RoleID" id="editRoleID" class="v5-select">
                            <option>请选择…</option>
                            <% foreach (var role in Roles)
                               {%>
                            <option name="RoleID" value="<%:role.ID %>">
                                <%:role.RoleName%></option>
                            <%} %>
                        </select>
                        <span class="help-inline" id="editRolePrompt" style="display: none;">请选择角色</span>
                    </div>
                </div>
                <div class="control-group" id="editUserError">
                    <label class="control-label" for="inputError">用户名</label>
                    <div class="controls">
                        <input type="text" name="UserCodeAdmin"
                            style="display: none;" readonly="readonly" id="UserCodeAdmin" value="" />
                        <input type="text" class="w230" name="UserCode" id="editUserCode" style="display: none;"
                            value="" />
                        <span class="help-inline" id="editUserPrompt" style="display: none;">请输入用户名</span>
                    </div>
                </div>
                <div class="control-group" id="editpwdError">
                    <label class="control-label" for="inputError">密码</label>
                    <div class="controls">
                        <input type="password" name="pwd" id="editpwd" onblur="javascript:pwdOnblur(event);" placeholder="密码为空时代表不修改此密码">
                        <span class="help-inline" id="editpwdPrompt" style="display: none;">请输入密码</span>
                    </div>
                </div>
                <div class="control-group" id="editRepeatPwdError">
                    <label class="control-label" for="inputError">密码确认</label>
                    <div class="controls">
                        <input type="password" name="repeatPwd" id="editRepeatPwd" placeholder="密码为空时代表不修改此密码">
                        <span class="help-inline" id="editRepeatPwdPrompt" style="display: none;">请输入密码</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
            <button class="btn btn-info" id="editBtn" data-dismiss="modal" aria-hidden="true">保存</button>
            <input type="hidden" name="UserID" id="UserID" />
            <button style="display: none;" id="editSubmit" type="submit">
                保存</button>

        </div>
        <%} %>
    </div>
    <%--<div id="editUserPopup" style="display: none;">
        <div class="content" style="width: 500px;">
            <%using (Ajax.BeginForm("EditUser", "User", new { }, new AjaxOptions() { HttpMethod = "post", OnBegin = "ajaxFormEditUserValidata", OnSuccess = "afterEditOnSuccess", OnFailure = "afterEditOnFailure", UpdateTargetId = "UpdateTargetHiddenID" }))
              { %>
            <div class="mod-form">
                <div class="con style0alert">
                    <!---name begin--->
                    <ul class="list-ul">
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span><label>角色</label></div>
                            <div class="float-l">
                                <% var Roles = (List<V5.MetaData.Security.Model.Role>)ViewData["Roles"];%>
                                <select name="RoleID" id="editRoleID" class="v5-select">
                                    <option>请选择…</option>
                                    <% foreach (var role in Roles)
                                       {%>
                                    <option name="RoleID" value="<%:role.ID %>">
                                        <%:role.RoleName%></option>
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
                                <input type="text" class="w230" onclick="javascript: btnTip();" name="UserCodeAdmin"
                                    style="display: none;" readonly="readonly" id="UserCodeAdmin" value="" />
                                <input type="text" class="w230" name="UserCode" id="editUserCode" style="display: none;"
                                    value="" />
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star"></span>
                                <label>
                                    密码</label></div>
                            <div class="float-l">
                                <input type="text" class="w230" type="password" name="pwd" id="editpwd" onblur="javascript:pwdOnblur(event);" placeholder="密码为空时代表不修改此密码"  /></div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star"></span>
                                <label>
                                    密码确认</label></div>
                            <div class="float-l">
                                <input type="text" class="w230" type="password" name="repeatPwd" id="editRepeatPwd" placeholder="密码为空时代表不修改此密码"/></div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                    </ul>
                    <!---name end--->
                </div>
            </div>
            <input type="hidden" name="UserID" id="UserID" />
            <button style="display: none;" id="editSubmit" type="submit">
                保存</button>
            <%} %>
        </div>
        <div class="btn">
            <div class="indiv">
                <button type="button" onclick="javascript:editUser();" class="submit01-alert r10">
                    保存</button>
                <button type="button" onclick="javascript:popupClose('editUser')" class="reset01-alert">
                    取消</button>
            </div>
        </div>
    </div>--%>
    <%--编辑用户 End----%>
    <%--弹层 End----%>
    <span id="UpdateTargetHiddenID" style="display: none"></span>
    <%--<script src="../../Scripts/jquery-1.8.0.min.js" type="text/javascript"></script>--%>
    <script type="text/javascript" language="javascript">
        $(function () {
            GetUserView(1, $("#ddlPageSize").text());

            txtTips();

            $("#btn").click(function () {
                var validata = ajaxFormAddUserValidata();
                if (validata) {
                    addUser();
                }
                else {
                    return validata;
                }
            });

            $("#editBtn").click(function () {
                var editvalidata = ajaxFormEditUserValidata();
                if (editvalidata) {
                    editUser();
                }
                else {
                    return editvalidata;
                }
            });

            $("#numbers li").click(function () {
                $("#ddlPageSize").text($(this).text());

                btnPageSize = parseInt($("#ddlPageSize").text());

                GetUserView(1, btnPageSize);
            });
        });

        var pwdOnblur = function (event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;

            var pwd = $(eventSrc).val().trim();
            if (pwd.length < 6 && pwd.length > 0) {
                validataPrompt($(eventSrc), '密码长度不能小于6位');
            } else {
                $(".prompt").text('');
            }

        };

        $("#type ul li").click(function () {
            searchQuery.Groups = 'A';
            searchQuery.Query = '';
            GetUserView(1, $("#ddlPageSize").text());
        });

        // 输入文本框
        function txtTips() {
            //            $("#txtSearch").focus(function () {
            //                if ($(this).val() == "请输入账户名...") {
            //                    $(this).val('');
            //                    $(this).val('').css("color", "#6b6969");
            //                }
            //            });
            $("#txtSearch").blur(function () {
                condition = $(this).val().replace(/^\s*/g, "").replace(/\s*$/g, "");
                if (condition == "") {
                    $(this).focus();
                    $(this).val("");
                }
            })
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
                if ($("#txtSearch").val() == null || $("#txtSearch").val() == "请输入账户名..." || $("#txtSearch").val().trim() == '') {
                    $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                    $("#operateTip").html("请输入账户名").change();
                    return false;
                }
                else {
                    searchQuery.Query = $("#txtSearch").val().trim();
                    GetUserView(1, $("#ddlPageSize").text());
                }
                // 把返回的数量绑定到”进行中”、”过期”、”未开始”也要和“全部”、“直销”、”分销”关联
            }
        }

        // 查询
        function txtSearch() {
            if ($("#txtSearch").val() == null || $("#txtSearch").val() == "请输入账户名..." || $("#txtSearch").val().trim() == '') {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请输入账户名").change();
                return false;
            }
            else {
                searchQuery.Query = $("#txtSearch").val().trim();
                GetUserView(1, $("#ddlPageSize").text());
            }
        };
        //清空弹层样式
        function Clear() {
            $("#rolePrompt").css("display", "none");
            $("#roleError").removeClass("error");
            $("#userCodePrompt").css("display", "none");
            $("#userNameError").removeClass("error");
            $("#passwordPrompt").text("请输入密码");
            $("#passwordPrompt").css("display", "none");
            $("#passwordError").removeClass("error");
            $("#confirmPassPrompt").text("请输入密码");
            $("#confirmPassPrompt").css("display", "none");
            $("#confirmPassError").removeClass("error");
            $("#addRepeatPassword,#addPassword").attr("placeholder", "");
        }
        /*
        01-添加用户 Start---------------------
        */
        // 1.0 添加用户弹层
        function addUserPopup() {
            $("#addRoleID").val("0");
            $("#addUserCode").val("");
            $("#addPassword").val("");
            $("#addRepeatPassword").val("");
            Clear();
            // popupOperate("addUserPopup", "添加用户", 'addUser');
            $("#myModal").modal("show");
        }

        // 添加用户
        function addUser() {
            $("#addSubmit").submit(); // 提交
        }

        // 1.1 添加用户 表单验证
        var ajaxFormAddUserValidata = function () {
            var username = $("#addUserCode").val().trim();
            var pwd1 = $("#addPassword").val().trim();
            var pwd2 = $("#addRepeatPassword").val().trim();
            var roleName = $("#addRoleID").val().trim();

            if (roleName == "请选择...") {
                validataPrompts("role", "请选择角色");
                return false;
            }
            if (username.length == 0) {
                validataPrompts("userName", "用户名不能为空");
                return false;
            }

            if (pwd1.length == 0) {
                validataPrompts("password", "密码不能为空");
                return false;
            }

            if (pwd2.length == 0) {
                validataPrompts("confirmPass", "密码不能为空");
                return false;
            }

            if (pwd1.length < 6) {
                validataPrompts("password", "密码长度不能小于6位");
                return false;
            }

            if (pwd1 != pwd2) {
                validataPrompts("confirmPass", "两次密码不一致");
                return false;
            }
            return true;
        };

        // 1.2 添加会员等级失败
        function afterAddOnFailure() {
            errorTip("添加管理员失败");
        };

        // 1.3 添加会员等级之后
        function afterAddOnSuccess() {
            var result = $("#UpdateTargetHiddenID").html();
            if (result == "ok") {
                successTip("保存成功");
                GetUserView(1, $("#ddlPageSize").text());
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

        /*
        02-编辑用户 Start---------------------
        */
        // 2.0 编辑用户弹层
        var editUserPopup = function (editID) {

            $.getJSON("/User/GetUserInfo", { "userId": editID }, function (jsonData) {
                if (jsonData.UserCode == 'admin') {
                    $("#UserCodeAdmin").val(jsonData.UserCode);
                    $("#UserCodeAdmin").css("display", "block");

                } else {
                    $("#editUserCode").val(jsonData.UserCode);
                    $("#editUserCode").css("display", "block");
                }

                $("select[id=editRoleID]").find('option').each(function () { // 让用户拥有的权限选中
                    var currentValue = $(this).val().trim();
                    if (currentValue == jsonData.RoleID) {
                        $(this).attr("selected", "selected");
                    }
                });
            });
            $("#UserID").val(editID);
            //popupOperate("editUserPopup", "修改用户", 'editUser');
            $("#repeatPwd,#editPwd").val("");
            Clear();
            $("#EditModal").modal("show");
        };

        // 2.1 编辑用户
        function editUser() {
            $("#editSubmit").submit(); // 提交
        }

        // 2.2 编辑用户 表单验证
        var ajaxFormEditUserValidata = function () {
            $(".prompt").text('');
            var roleName = $("#editRoleID").val().trim();
            var username = $("#editUserCode").val().trim();
            var pwd1 = $("#editpwd").val().trim();
            var pwd2 = $("#editRepeatPwd").val().trim();
            if (roleName == "请选择…") {
                validataPrompts("editRole", "请选择角色");
                return false;
            }

            if (username.length <= 0 && ($("#UserCodeAdmin").val() != "admin")) { // 不是编辑 admin
                validataPrompts("editUser", "用户名不能为空");
                return false;
            }

            if (pwd1 != pwd2) {
                validataPrompts("editRepeatPwd", "输入的密码不一致");
                return false;
            }
            return true;
        };

        // 2.3
        // 添加会员等级失败
        function afterEditOnFailure() {
            errorTip("保存失败");
        };


        // 2.4 编辑用户等级之后
        function afterEditOnSuccess() {
            var result = $("#UpdateTargetHiddenID").text();

            var result = $("#UpdateTargetHiddenID").html();

            if (result == "ok") {
                successTip("保存成功!");
                GetUserView(1, $("#ddlPageSize").text());
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

        // 2.5 admin 名称不能修改
        function btnTip() {
            warningTip("admin拥有特殊权限 名称不能修改！");
        }


        // 单个删除
        function DeleteUser(event, UserID) {
            //if (confirmThis(event, '确定要删除？')) {
                $.post("/User/DeleteUserSingle", "id=" + UserID + "", function (returnData) {
                    if (returnData == "ok") {
                        successTip("删除成功");
                        GetUserView(1, $("#ddlPageSize").text());
                    } else if (returnData == "error") {
                        errorTip("删除失败，联系管理员");
                    } else if (returnData == "can not delete") {
                        warningTip("admin 不能删除");
                    }
                });
            //}
        };

        // 批量删除 
        function DeleteBatch(event) {
            var strIDs = getCheckedIDs();

            // 如果存储id的数组不为空
            if (strIDs.length > 0) {
                //if (confirmThis(event, "确定要删除选中的项?")) {
                    $.ajax({
                        url: "/User/DeleteUsers",
                        data: "IDs=" + strIDs + "",
                        type: "post",
                        success: function (succData) {
                            if (succData == "ok") {
                                successTip("删除管理员成功");
                                GetUserView(1, $("#ddlPageSize").text());
                            } else if (succData == "can not delete admin") {
                                warningTip("admin 不能删除");
                            } else {
                                warningTip("请选中要删除的项");
                            }
                        },
                        error: function (errData) {
                            errorTip("删除出现异常，联系管理员");
                        }
                    });
                //};
            } else {
                warningTip("请勾选要删除的管理员");
                return false;
            }
        };

        //批量解除冻结管理员 包括解除冻结所有管理员
        function UNFreezeUser(event) {
            var strIDs = getCheckedIDs();

            // 如果存储id的数组不为空 (批量解除冻结)
            if (strIDs.length > 0) {
                //if (confirmThis(event, "确定要解除冻结选中的帐号？")) {
                    $.ajax({
                        url: "/User/UNFreezeUsers",
                        data: "IDs=" + strIDs + "",
                        type: "post",
                        success: function (succData) {
                            if (succData == "ok") {
                                successTip("批量解除冻结帐号成功");
                                GetUserView(1, $("#ddlPageSize").text());
                            } else {
                                warningTip("请选中要解除冻结的帐号");
                            }
                        },
                        error: function (errData) {
                            errorTip("解除冻结出现异常，联系管理员");
                        }
                    });
                //} else {
                //    return false;
                //}
            } else {
                warningTip("请勾选要解除冻结的管理员");
                return false;
            }
        };

        //批量冻结管理员 
        function FreezeUser(event) {
            var strIDs = getCheckedIDs();

            // 如果存储id的数组不为空
            if (strIDs.length > 0) {
                //if (confirmThis(event, "确定要冻结选中的帐号？")) {
                    $.ajax({
                        url: "/User/FreezeUsers",
                        data: "IDs=" + strIDs + "",
                        type: "post",
                        success: function (succData) {
                            if (succData == "ok") {
                                successTip("批量冻结帐号成功");
                                GetUserView(1, $("#ddlPageSize").text());
                            } else if (succData == "can not freeze self") {
                                warningTip("不能冻结自己的帐号");
                            } else {
                                warningTip("请选中要冻结的帐号");
                            }
                        },
                        error: function (errData) {
                            errorTip("冻结出现异常，联系管理员");
                        }
                    });
                //} else {
                //    return false;
                //}
            } else {
                warningTip("请勾选要冻结的管理员");
                return false;
            }
        };

        // 获取选中的项的IDs
        var getCheckedIDs = function () {
            // 遍历所有的复选框 遍历每一个checkbox,并且把checkbox的id属性过滤出id,存到数组中
            var strIDs = new Array();
            var checks = $("#content input[type=checkbox]");

            for (var i = 0; i < checks.length; i++) {
                var check = $(checks[i]).attr("checked");

                if (check == "checked") { // 如果checkbox被选中

                    // 取出 id  形如checkbox_7
                    var checkID = $(checks[i]).attr("id");
                    var strID = checkID.substring(9, checkID.length);

                    // 把id 放到集合中去 形如2,4,5
                    strIDs.push(strID);
                }
            }
            return strIDs;
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

        var validataPrompts = function (element, msg) {
            $("#" + element + "Prompt").text(msg);
            $("#" + element + "Prompt").css("display", "block");
            $("#" + element + "Error").addClass("error");
        };

        var successTip = function (msg) {
            Show(msg, "success");
        };

        var warningTip = function (msg) {
            Show(msg, "prompt");
        };

        var errorTip = function (msg) {
            Show(msg, "error");
        };
    </script>
</asp:Content>
