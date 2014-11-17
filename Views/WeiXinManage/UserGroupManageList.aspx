<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../../Scripts/Js/allselect.js" type="text/javascript"></script>
    <script src="../../Scripts/dialog/artDialog.source.js?skin=default" type="text/javascript"></script>
    <script src="../../Scripts/publicPlug-in/linkUrlJs.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--tab begin-->
    <div class="mod-tab t20" >
        <div class="con style0big">
            <ul id="type">
                <li class="current" dir="q1"><a href="#" class="c16"><span>全部（<%:ViewData["totalCount"]%>）</span>
                </a></li>
            </ul>
        </div>
    </div>
    <!--tab end-->
    <!--操作栏 begin-->
    <div class="mod-operate t20" >
        <div class="con style0list">
            <ul class="ul-list">
                <li><a class="a-btn" href="javascript:void(0);" onclick="javascript:addUserGroupShow();">
                    创建分组</a> <i dir="iconStyle" class="ico20" style="display: none;"></i></li>
                <li><a class="a-btn" href="#" onclick="javascript:deleteBatchGroup(event);">删除</a></li>
            </ul>
        </div>
    </div>
    <!--操作栏 end-->
    <div class="clear h10">
    </div>
    <!--列表 Start-->
    <div style="clear: both;">
        <div class="sourcelist">
            <div class="mod-table">
                <div class="mod-table-head">
                    <div class="con style0list">
                        <table>
                            <colgroup>
                                <col style="width: 5%;">
                                <col style="width: 30%;">
                               
                                <col style="width: 20%;">
                                <col style="width: 30%;">
                                <col style="width: 15%;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th>
                                        <label>
                                            <input type="checkbox" id="ckall" onclick="CheckAll(event)" /></label>
                                    </th>
                                    <th>
                                        分组名称
                                    </th>
                                    <th>
                                        会员数量
                                    </th>
                                    <th>
                                        更新时间
                                    </th>
                                    <th>
                                        操作
                                    </th>
                                    <th>
                                    </th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="mod-table-main">
                    <div class="con style0line">
                        <table>
                            <colgroup>
                                <col style="width: 5%;">
                                <col style="width: 30%;">
                                <col style="width: 20%;">
                                <col style="width: 30%;">
                                <col style="width: 15%;">
                                <col style="width: auto;">
                            </colgroup>
                            <tbody id="content">
                                <%var userGroups = (List<V5.MetaData.WeiXin.View.UserGroup_UserInfo>)ViewData["userGroups"]; %>
                                <%--列表开始--%>
                                <% foreach (var item in userGroups)
                                   {%>
                                <tr>
                                    <td>
                                        <div class="cell">
                                            <label>
                                                <input id="checkbox_<%:item.ID %>" type="checkbox" name="sub" onclick="CheckThis()" />
                                            </label>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="cell" dir="groupName">
                                            <%:item.GroupName%></div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            <%:item.UserInfoCount %>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            <%:item.ModifyDate %>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="cell">
                                            <div class="mod-operate">
                                                <div class="con style0editdel">
                                            <a class="edit" href="javascript:void(0);" onclick="javascript:editGroup(event,<%:item.ID %>);">编辑</a>
                                            <a class="del" href="javascript:void(0);" onclick="javascript:deleteSingle(event,<%:item.ID %>);">
                                                删除</a>
                                                </div>
                                            </div>
                                       </div>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <%} %>
                                <%--列表结束--%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--隐藏操作栏 Start--%>
    <%--创建用户分组 Start--%>
    <div id="createGroupPopup" style="display: none;">
        <div class="content" style="width: 530px;">
            <div class="mod-form">
                <div class="con style0alert">
                    <ul class="list-ul">
                        <li class="list-li">
                            <div class="float-l w100">
                                <span class="star">*</span><label>分组名称</label></div>
                            <div class="float-l">
                                <input type="text" id="addGroupName" value="" class="w230" />
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="btn">
            <div class="indiv">
                <button class="submit01-alert r10" onclick="javascript:btnAddUserGroupConfirm();">
                    保存</button>
                <button type="button" onclick="javascript:popupClose('createGroup');" class="reset01-alert">
                    取消</button>
            </div>
        </div>
    </div>
    <%--创建用户分组 End--%>
    <%--编辑用户分组 Start--%>
    <div id="editGroupPopup" style="display: none;">
        <div class="content" style="width: 540px;">
            <div class="mod-form">
                <div class="con style0alert">
                    <ul class="list-ul">
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span><label>分组名称</label></div>
                            <div class="float-l">
                                <input type="text" id="editGroupName" value="" class="w230" />
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="btn">
            <div class="indiv">
                <button class="submit01-alert r10" onclick="javascript:btnEditUserGroupConfirm();">
                    保存</button>
                <button type="button" onclick="javascript:popupClose('editGroup');" class="reset01-alert">
                    取消</button>
                <input type="hidden" dir="" name="editGroupID" />
            </div>
        </div>
    </div>
    <%--编辑用户分组 End--%>
    <%--隐藏操作栏 End--%>
    <!--列表 End-->
    <script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        // 初始化
        $(function () {
            txtTip();
        });

        var txtTip = function () {
            $("#addGroupName").siblings("span").removeClass("prompt").css("color", "#777");
        };


        // 创建用户分组弹层
        var addUserGroupShow = function () {
            popupOperate("createGroupPopup", "创建用户分组", 'createGroup');
        };

        // 编辑用户分组 时弹层
        var editGroup = function (event, groupID) {

            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;

            var groupName = $(eventSrc).parents("td").siblings("td").find("div[dir=groupName]").text().trim();

            $("#editGroupPopup input[name=editGroupID]").attr("dir", groupID);

            popupOperate("editGroupPopup", "编辑用户分组", 'editGroup');
            $("#editGroupName").val(groupName);
        };

        // 保存编辑用户分组
        var btnEditUserGroupConfirm = function () {

            var groupID = $("#editGroupPopup input[name=editGroupID]").attr("dir");
            var groupName = $("#editGroupName").val().trim();

            if (groupName.length <= 0) {
                validataPrompt($("#editGroupName"), "请输入分组名称");
                return false;
            }

            if (jmz.GetLength(groupName) > 10) {
                validataPrompt($("#editGroupName"), '不能多于5个汉字或10英文字母');
                return false;
            }

            $.ajax({
                url: "/WeiXinManage/WeiXinUserGroupEdit",
                type: "post",
                data: { "groupName": groupName, "userGroupId": groupID },
                success: function (returnData) {
                    if (returnData == "ok") {
                        successTip("修改成功! ");
                        setTimeout(function () {
                            window.location.reload();
                        }, 600);
                    } else if (returnData == "repeat") {
                        validataPrompt($("#editGroupName"), '已经存在同名分组');
                    } else {
                        errorTip("删除出现异常，联系管理员");
                    }
                }
            });
        };

        // 保存添加用户分组
        function btnAddUserGroupConfirm(str) {///<summary>添加用户分组</summary>

            var groupName = $("#addGroupName").val().trim();

            if (groupName.length <= 0) {
                validataPrompt($("#addGroupName"), '请输入分组名称');
                return false;
            }

            if (jmz.GetLength(groupName) > 10) {
                //warningTip("");
                validataPrompt($("#addGroupName"), '不能多于5个汉字或10英文字母');
                return false;
            }

            $.ajax({
                url: "/WeiXinManage/AddWeiXinUserGroup",
                type: "post",
                data: { "groupName": groupName },
                success: function (returnData) {
                    if (returnData == "ok") {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("添加成功!").change();
                        setTimeout(function () {
                            window.location.reload();
                        }, 600);
                    } else if (returnData == "repeat") {
                        warningTip("已经存在同名分组");
                    }
                }
            });
        };

        // 单条删除
        var deleteSingle = function (event, ID) {
            if (confirmThis(event, '确定要删除？')) {
                var strIDs = new Array();
                strIDs.push(ID);

                $.ajax({
                    url: "/WeiXinManage/UserGroupDeleteBatch",
                    type: "post",
                    data: { "userGroupIDs": JSON.stringify(strIDs) },
                    success: function (returnData) {
                        if ("ok" == returnData) {
                            successTip("删除成功");
                            window.location.reload();
                        } else if ("ok but No Del" == returnData) {
                            warningTip("删除成功 但默认分组不能删除");
                            window.location.reload();
                        } else if ("No Del" == returnData) {
                            warningTip("默认分组不能删除");
                        } else {
                            errorTip("删除出现异常，联系管理员");
                        }
                    }
                });
            }
        };

        // 批量删除分组
        function deleteBatchGroup(event) {
            // 获取选中的值
            var strIDs = new Array();
            var checks = $("#content input[type=checkbox]");
            for (var i = 0; i < checks.length; i++) {
                var check = $(checks[i]).attr("checked");
                if (check == "checked") {
                    var checkID = $(checks[i]).attr("id");
                    var strID = checkID.substring(9, checkID.length);
                    // 把id 放到集合中去 形如2,4,5
                    strIDs.push(strID);
                }
            }
            if (strIDs.length <= 0) {
                warningTip("请勾选要添加的项");
                return false;
            }

            if (confirmThis(event, '确定要删除?')) {
                $.ajax({
                    url: "/WeiXinManage/UserGroupDeleteBatch",
                    type: "post",
                    data: { "userGroupIDs": JSON.stringify(strIDs) },
                    success: function (returnData) {
                        if ("ok" == returnData) {
                            successTip("删除成功");
                            window.location.reload();
                        } else if ("ok but No Del" == returnData) {
                            warningTip("删除成功 但默认分组不能删除");
                            window.location.reload();
                        } else if ("No Del" == returnData) {
                            warningTip("默认分组不能删除");
                        } else {
                            errorTip("删除出现异常，联系管理员");
                        }
                    }
                });
            }

        };

        // 验证提示
        var validataPrompt = function ($element, msg) {
            $element.parent().next().find(".prompt").text(msg);
        };

        var successTip = function (msg) {
            $(".Loading").removeClass("style0yellow style0red").addClass("style0green");
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

        var jmz = {};
        jmz.GetLength = function (str) {
            ///<summary>获得字符串实际长度，中文2，英文1</summary>
            ///<param name="str">要获得长度的字符串</param>
            var realLength = 0, len = str.length, charCode = -1;
            for (var i = 0; i < len; i++) {
                charCode = str.charCodeAt(i);
                if (charCode >= 0 && charCode <= 128) realLength += 1;
                else realLength += 2;
            }
            return realLength;
        };

        // 验证提示
        var validataPrompt = function ($element, msg) {
            $element.parent().next().find(".prompt").text(msg);
        };

    </script>
</asp:Content>
