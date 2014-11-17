<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../../Scripts/Js/allselect.js" type="text/javascript"></script>
    <%--<script src="../../Scripts/dialog/artDialog.source.js?skin=default" type="text/javascript"></script>--%>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        // 分组查询条件
        var searchQuery = new Object();
        // 给searchQuery赋一个初始值
        searchQuery.Groups = '';
        searchQuery.Query = '';
    </script>
    <!--tab begin-->
    <div class="mod-tab t20">
        <div class="con style0big">
            <ul id="allCount">
                <li class="current" dir="q0"><a href="#" class="c16"><span>全部（<%:ViewData["totalCount"]%>）</span>
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
                    <input type="text" name="" id="txtSearch" class="search-input" placeholder="请输入用户昵称..." />
                </li>
                <li><a class="search-btn search" href="#" onclick="javascript:btnSearch();"></a>
                </li>
            </ul>
        </div>
    </div>
    <!--搜索 end-->
    <!--标签 begin-->
    <div class="mod-condition t20" style="display: none">
        <div class="con style0list">
            <ul id="groupSearch">
                <%var userGroups = (List<V5.MetaData.WeiXin.Model.UserGroup>)ViewData["userGroups"]; %>
                <%for (var i = 1; i < userGroups.Count + 1; i++)
                  { %>
                <li dir="<%:userGroups[i-1].ID %>"><a href="#">
                    <%:userGroups[i-1].GroupName%>（<span id="group_<%:userGroups[i-1].ID %>"></span>）</a></li>
                <% if (i != 0 && (i % 7) == 0) // 六个就换行
                   { %>
                <br />
                <br />
                <%} %>
                <%} %>
            </ul>
        </div>
    </div>
    <!--标签 end-->
    <!--操作栏 begin-->
    <div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list">
                <%--<li><a class="a-btn" href="/WeiXinManage/AddWeiXinUserManage">创建用户分组</a></li>--%>
                <li><a class="a-btn" href="#" onclick="javascript:groupUser(event);">批量分组</a> <i
                    dir="iconStyle" class="ico20" style="display: none;"></i></li>
                <li><a class="a-btn" href="#" onclick="javascript:sendBatchMessage(event);">批量发送消息</a>
                    <i dir="iconStyle" class="ico20" style="display: none;"></i></li>
                <li><a class="a-btn" href="#" onclick="javascript:EditUserMessage();">更新关注者信息</a> <i
                    dir="iconStyle" class="ico20" style="display: none;"></i></li>
            </ul>
        </div>
    </div>
    <!--操作栏 end-->
    <%--Page Start--%>
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
    <!--列表 Start-->
    <div style="clear: both;">
        <div class="sourcelist">
            <%--局部试图 Start--%>
            <% Html.RenderAction("GetUserGroupView", new { CurrentPageIndex = 0 }); %><!--对应文件UserGroupView.ascx-->
            <%--局部试图 End--%>
        </div>
    </div>
    <!--列表 End-->
    <%--隐藏操作栏 Start--%>
    <%--批量分组 Start--%>
    <div id="groupUserPopup" style="display: none;">
        <div class="content" style="width: 400px;">
            <div class="mod-form">
                <div class="con style0alert">
                    <ul class="list-ul">
                        <li class="list-li">
                            <div class="float-l w100">
                                <span class="star"></span>
                                <label>
                                    分组名称
                                </label>
                            </div>
                            <div class="float-l">
                                <select id="userGroup_select" class="w230">
                                    <% foreach (var item in (List<V5.MetaData.WeiXin.Model.UserGroup>)ViewData["userGroups"])
                                       { %>
                                    <option value="<%:item.ID %>">
                                        <%:item.GroupName%></option>
                                    <%} %>
                                </select>
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
                <button class="submit01-alert r10" onclick="javascript:btnGroupUserConfirm();">
                    保存</button>
                <button type="button" onclick="javascript:popupClose('groupUser');" class="reset01-alert">
                    取消</button>
            </div>
        </div>
    </div>
    <%--创建用户分组 End--%>
    <%--用户批量发消息 Start--%>
    <div id="sendMsgPopup" style="display: none;">
        <div class="content" style="width: 760px;">
            <div class="mod-form">
                <div class="con style0alert">
                    <ul class="list-ul">
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span>
                                <label>
                                    批量发消息
                                </label>
                            </div>
                            <div class="float-l">
                                <textarea id="send_Msg" style="width: 450px; height: 100px;"></textarea>
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
                <button class="submit01-alert r10" onclick="javascript:btnSendMessageConfirm();">
                    保存</button>
                <button type="button" onclick="javascript:popupClose('sendMsg');" class="reset01-alert">
                    取消</button>
            </div>
        </div>
    </div>
    <%--用户批量发消息 End--%>
    <%--隐藏操作栏 End--%>
    <%--查看用户详情弹层 Start--%>
    <div id="userDetailPopup" style="display: none;">
        <div class="content" style="width: 500px;">
            <div class="mod-form">
                <div class="con style0alert">
                    <div class="mod-table-main">
                        <div class="con style0label">
                            <table style="width: 100%;">
                                <colgroup>
                                    <col style="width: 15%;">
                                    <col style="width: 35%;">
                                    <col style="width: 15%;">
                                    <col style="width: 35%;">
                                </colgroup>
                                <tbody id="userInfoDetailFlag">
                                    <tr>
                                        <td class="td_bg">
                                            用户昵称
                                        </td>
                                        <td dir="nickName">
                                        </td>
                                        <td class="td_bg">
                                            关注状态
                                        </td>
                                        <td dir="subscribe">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_bg">
                                            用户性别
                                        </td>
                                        <td dir="sex">
                                        </td>
                                        <td class="td_bg">
                                            所在地区
                                        </td>
                                        <td dir="country">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_bg">
                                            用户语言
                                        </td>
                                        <td dir="language">
                                        </td>
                                        <td class="td_bg">
                                            关注时间
                                        </td>
                                        <td dir="subscribeTime">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--查看用户详情弹层 End--%>
    <input type="hidden" id="returnStrs" value="<%:ViewData["returnStrs"]%>" />
    <input type="hidden" id="noGroupingCount" value="<%:ViewData["noGroupingCount"]%>" />
    <script src="../../Scripts/jquery.pager.js" type="text/javascript"></script>
    <script type="text/javascript">
        // 初始化操作
        $(function () {
            // 调用分页 【上面html代码是不会返回数据的】
            UserGroupView(1);

            // 注册 查询输入文本框
            txtSearchTips();

            // 给动态生成的分组的数量赋值 以及和为未组的标签赋值
            setCountToGroup();
        });

        // ↓-----------------发送消息 Start ---------------↓

        // 查看
        var userInfoDetail = function (openID) {
            var userInfo;
            $.ajax({
                url: "/WeiXinManage/GetWeiXinUserinfoDetail",
                data: { "openID": openID },
                dataType: "json",
                async: false,
                success: function (jsonData) {
                    userInfo = jsonData;
                }
            });

            var nickName = userInfo.NickName;
            var subscribe = userInfo.Subscribe;
            var sex = userInfo.Sex;
            var country = userInfo.Country + " " + userInfo.Province + " " + userInfo.City;
            var language = userInfo.Language;
            var subscribeTime = userInfo.SubscribeTime;

            if (userInfo.Subscribe == "0") {
                subscribe = "用户取消关注";
            } else {
                subscribe = "用户已关注";
            }

            if (userInfo.Sex == "1") {
                sex = "男";
            } else {
                sex = "女";
            }

            if (null != userInfo.SubscribeTime) {
                subscribeTime = userInfo.SubscribeTime;
            } else {
                subscribeTime = "";
            }

            popupOperate("userDetailPopup", "查看用户详情", 'userDetail');

            $("#userInfoDetailFlag").find("td[dir=nickName]").text(nickName);
            $("#userInfoDetailFlag").find("td[dir=subscribe]").text(subscribe);
            $("#userInfoDetailFlag").find("td[dir=sex]").text(sex);
            $("#userInfoDetailFlag").find("td[dir=country]").text(country);
            $("#userInfoDetailFlag").find("td[dir=language]").text(language);
            $("#userInfoDetailFlag").find("td[dir=subscribeTime]").text(subscribeTime);
        };

        // 发送批量消息
        function sendBatchMessage(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;

            var hasChecked = false;
            var checks = $("#content input[type=checkbox]").each(function () {
                if ($(this).attr("checked") == "checked") {
                    hasChecked = true;
                    return false; // 等同于 C# break
                }
            });

            if (hasChecked) {
                // 弹层
                popupOperate("sendMsgPopup", "批量发送消息", 'sendMsg');
            } else {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请勾选要添加的项").change();
            }
        };

        // 确定
        function btnSendMessageConfirm() {
            var strIDs = new Array();
            var checks = $("#content input[type=checkbox]");

            for (var i = 0; i < checks.length; i++) {
                var check = $(checks[i]).attr("checked");
                if (check == "checked") {
                    var openID = $(checks[i]).attr("dir");
                    // 把id 放到集合中去 形如2,4,5
                    strIDs.push(openID);
                }
            }

            if (strIDs.length <= 0) {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请勾选要添加的项").change();
                return false;
            }

            var textMessage = $("#send_Msg").val();
            if (textMessage.trim() == '') {
                validataPrompt($("#send_Msg"), '请输入要发送的文本内容');
                return false;
            };
            $.ajax({
                url: "/WeiXinManage/SendBatchMessage",
                type: "post",
                data: { weiXinOpenIDs: JSON.stringify(strIDs), messageContent: textMessage },
                async: false,
                success: function (returnData) {
                    if (returnData == "ok") {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("批量发送消息成功").change();
                        setTimeout(function () {
                            window.location.reload();
                        }, 600);
                    } else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html("删除出现异常，联系管理员").change();
                    }
                }
            });

        };

        // 取消
        function btnSendMessageConfirmCancel() {
            $("#sendBatchMessageBlock").css("display", "none");

            $("i[dir=iconStyle]").each(function () {
                $(this).css("display", "none");
            });
        };

        // ↑-----------------发送消息 End ---------------↑

        // ↓-----------------把微信用户添加到组 Start ---------------↓

        function groupUser(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;

            var hasChecked = false;
            var checks = $("#content input[type=checkbox]").each(function () {
                if ($(this).attr("checked") == "checked") {
                    hasChecked = true;
                    return false; // 等同于 C# break
                }
            });

            if (hasChecked) {
                // 弹层
                popupOperate("groupUserPopup", "批量分组", 'groupUser');
            } else {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请勾选要添加的项").change();
            }
        };

        function btnGroupUserConfirm() {
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
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请勾选要添加的项").change();
                return false;
            }

            var userGroupID = $("#userGroup_select").val();

            $.ajax({
                url: "/WeiXinManage/AddWeiXinUserToUserGroup",
                type: "post",
                data: { weiXinUserIDs: JSON.stringify(strIDs), userGroupID: userGroupID },
                async: false,
                success: function (returnData) {
                    if (returnData == "ok") {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("添加成功").change();
                        window.location.reload();
                    } else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0greed");
                        $("#operateTip").html("删除出现异常，联系管理员").change();
                    }
                }
            });
        };

        function btnGroupUserCancel() {
            $("#groupUsersBlock").css("display", "none");

            $("i[dir=iconStyle]").each(function () {
                $(this).css("display", "none");
            });
        };

        // ↑-----------------把微信用户添加到组 End ---------------↑

        // enter 键模糊查询
        document.onkeypress = function () {
            var iKeyCode = -1;
            if (arguments[0]) {
                iKeyCode = arguments[0].which;
            }
            else {
                iKeyCode = event.keyCode;
            }

            if (iKeyCode == 13) {
                var searchCondition = $("#txtSearch").val();
                if (searchCondition == "请输入用户昵称..." || searchCondition.trim() == "") {
                    $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                    $("#operateTip").html("请输入查询条件").change();
                }
                else {

                    searchQuery.Groups = '';
                    searchQuery.Query = searchCondition;
                    UserGroupView(1);
                }
            }
        }

        function btnSearch() {
            var searchCondition = $("#txtSearch").val();
            if (searchCondition == "请输入用户昵称..." || searchCondition.trim() == "") {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请输入查询条件").change();
            }
            else {

                searchQuery.Groups = '';
                searchQuery.Query = searchCondition;
                UserGroupView(1);
            }
        };

        // 去除前、中、后的空格
        function IgnoreSpaces(Str) {
            var ResultStr = "";
            Temp = Str.split(" "); //双引号之间是一个空格  
            for (i = 0; i < Temp.length; i++) {
                ResultStr += Temp[i];
            }
            return ResultStr;
        }

        // 分组查询 点击操作
        $("#groupSearch li").click(function () {
            // 这样就会选中当前选中的项
            $("#groupSearch li").removeClass("current");
            $(this).addClass("current");

            searchQuery.Query = '';
            searchQuery.Groups = $(this).attr("dir");
            // 调用分页
            UserGroupView(1);
        });

        // 点击全部时
        $("#allCount li").click(function () {
            $("#groupSearch li").removeClass("current");
            searchQuery.Query = '';
            searchQuery.Groups = $(this).attr("dir");
            // 调用分页
            UserGroupView(1);
        });

        // 查询输入文本框
        function txtSearchTips() {
            $("#txtSearch").focus(function () {
                if ($(this).val() == "请输入用户昵称...") {
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

        // 给动态生成的分组的数量赋值 以及和未分组的标签赋值
        function setCountToGroup() {
            // 为未分组标签赋值
            $("#noGrouping").text($("#noGroupingCount").val());

            // 动态生成的标签数量赋值
            var returnStrs = $("#returnStrs").val().split('|'); // 形如 UserGroupID,UserGroupCount|
            for (var i in returnStrs) {
                var returnStr = returnStrs[i].split(',');
                $("#group_" + returnStr[0]).text(returnStr[1]);
            }
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





        //更新关注着信息
        function EditUserMessage() {

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
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请勾选要更新的项").change();
                return false;
            }


            $.ajax({
                url: "/WeiXinManage/EditUserMessage",
                type: "post",
                data: { weiXinUserIDs: JSON.stringify(strIDs) },
                async: false,
                success: function (returnData) {
                    if (returnData == "ok") {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("更新成功").change();
                        window.location.reload();
                    } else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html(returnData).change();
                    }
                }
            });

        }

    </script>
</asp:Content>
