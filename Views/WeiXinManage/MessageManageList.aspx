<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../../Scripts/Js/allselect.js" type="text/javascript"></script>
    <script src="../../Scripts/dialog/artDialog.source.js?skin=default" type="text/javascript"></script>
    <script src="../../Scripts/publicPlug-in/linkUrlJs.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        // 分组查询条件
        var searchQuery = new Object();
        // 给searchQuery赋一个初始值
        searchQuery.Groups = new Array();

        // 非日期的分组查询 默认全部
        searchQuery.Groups[0] = 'q0';

        // 日期分组查询 
        searchQuery.Groups[1] = '';

        searchQuery.Query = '';
    </script>
    <!--tab begin-->
    <div class="mod-tab t20">
        <div class="con style0big">
             <ul id="allCount">
                <li class="current" dir="all"><a href="javascript:void(0)">全部（<span id="quanbu"><%:ViewData["TotalCount"] %></span>）</a></li>
                <li dir="q1"><a href="javascript:void(0)" id="PromotionDatePast">待回复（<span><%:ViewData["noReplyMsg"] %></span>）</a></li>
                <li dir="q2"><a href="javascript:void(0)" id="promotionClosed">已回复（<span><%:ViewData["hasReplyMes"]%></span>）</a></li>
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
                <li><a class="search-btn search" href="#" onclick="javascript:txtSearch();"></a>
                </li>
            </ul>
        </div>
    </div>
    <!--搜索 end-->
    <!--标签 begin-->

    <div class="mod-condition t20">
        <div class="con style0list">
            <ul id="dateGroupSearch">
                <%--<li dir="q1"><a href="#" id="PromotionDatePast">待回复（<span><%:ViewData["noReplyMsg"] %></span>）</a></li>
                <li dir="q2"><a href="#" id="promotionClosed">已回复（<span><%:ViewData["hasReplyMes"]%></span>）</a></li>--%>
                <li dir="Date1"><a href="#">今天（<span id="groupDate1"></span>）</a></li>
                <li dir="Date2"><a href="#">昨天（<span id="groupDate2"></span>）</a></li>
                <li dir="Date3"><a href="#">三天以内（<span id="groupDate3"></span>）</a></li>
                <li dir="Date4"><a href="#">一周以内（<span id="groupDate4"></span>）</a></li>
              
            </ul>
        </div>
    </div>
    <!--标签 end-->
    <!--操作栏 begin-->
    <div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list">
                <li><a class="a-btn" href="#" onclick="javascript:replyMessageBatchShow(event);">批量回复</a>
                    <i dir="iconStyle" class="ico20" style="display: none;"></i></li>
                <li><a class="a-btn" href="#" onclick="javascript:deleteBatch(event);">批量删除</a></li>
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
    <%--隐藏操作栏 Start--%>
    <div id="replyMsgPopup" style="display: none;">
        <div class="content" style="width:760px;">
            <div class="mod-form">
                <div class="con style0alert">
                    <ul class="list-ul">
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span>
                                <label>
                                    回复信息
                                </label>
                            </div>
                            <div class="float-l">
                                <textarea id="reply_Msg" style="width: 390px; height: 100px;"></textarea>
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
                <button class="submit01-alert r10" onclick="javascript:btnReplyMessageConfirm();">
                    保存</button>
                <button type="button" onclick="javascript:popupClose('replyMsg');" class="reset01-alert">
                    取消</button>
                <input type="hidden" dir="" name="editGroupID" />
            </div>
        </div>
    </div>
    <%--隐藏操作栏 End--%>
    <!--列表 Start-->
    <div style="clear: both;">
        <div class="sourcelist">
            <%--局部试图 Start--%>
            <% Html.RenderAction("GetMessageManageView", new { CurrentPageIndex = 0 }); %>
            <%--局部试图 End--%>
        </div>
    </div>
    <!--列表 End-->
    <div style="display: none;">
        <input type="hidden" value='<%:ViewData["MaxMessageID"] %>' id='MaxMessageID' />
    </div>
    <%--弹层 Start--%>
    <div id="leaveMsgDetailAlert" style="display: none;">
        <div class="content scroll" style="width: 600px; height: 400px">
            <div class="mod-form">
                <div class="con style0alert">
                    <div class="mod-guestreply">
                        <div class="con style0wechat" id="leaveMsgHtmlFlag">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--弹层 Start--%>
    <script src="../../Scripts/jquery.pager.js" type="text/javascript"></script>
    <script type="text/javascript">
        // 留言最大ID
        var maxMessageID = $("#MaxMessageID").val();

        // 初始化操作
        $(function () {
            // 调用分页 【上面html代码是不会返回数据的】
            MessageManageView(1);

            // 注册 查询输入文本框
            txtSearchTips();

            // 设置定时器 去监听是否有消息传送过来 6.5s 监听一次
            setInterval(setIntervalListener, 6500);
        });

        // 查看留言详情
        var leaveMesageDetail = function (leaveMessageID) {
            var jsonDatas;
            $.ajax({
                url: '/WeiXinManage/ReturnReplyMsgDetail',
                data: { "leaveMessageID": leaveMessageID },
                dataType: "json",
                type: "post",
                async: false,
                success: function (datas) {
                    jsonDatas = datas;
                }
            });

            var LeaveMessage_UserInfos = jsonDatas.LeaveMessage_UserInfos;
            var replyMessages = jsonDatas.replyMessages;
            var leaveMsgHtml = getLeaveMsgHtml(LeaveMessage_UserInfos, replyMessages);
            $("#leaveMsgHtmlFlag").html(leaveMsgHtml);
            popupOperate("leaveMsgDetailAlert", "查看留言详情", 'leaveMsgDetail');

        };

        // 返回留言回复的html
        var getLeaveMsgHtml = function (LeaveMessage_UserInfos, replyMessages) {
            var returnStrs = "";

            for (var i = 0; i < LeaveMessage_UserInfos.length; i++) {
                returnStrs += "<div class='historydata'>";
                returnStrs += "<span class='datatime'>" + LeaveMessage_UserInfos[i].rowCreatedDate + "</span></div>\n";
                returnStrs += " <!--ask begin-->\n";
                returnStrs += "<dl class='ask'>";
                returnStrs += "<dt class='headsculpture'><i class='icon-head028'></i>\n";
                returnStrs += "<p class='name'>";
                returnStrs += "" + LeaveMessage_UserInfos[i].NickName + "</p>\n";
                returnStrs += "</dt>\n";
                returnStrs += "<dd class='ask-content'>";
                returnStrs += "<div class='talk'>";
                returnStrs += "<i class='arrow'></i><span>" + LeaveMessage_UserInfos[i].LeaveContent + "</span>";
                returnStrs += " </div>\n";
                returnStrs += "</dd>\n";
                returnStrs += " </dl>\n";
                returnStrs += "<div class='clear'>\n";
                returnStrs += "</div>\n";
                returnStrs += "<!--ask end-->\n";
                returnStrs += "<!--answer begin-->\n";
                // 循环
                for (var j = 0; j < replyMessages.length; j++) {
                    if (replyMessages[j].LeaveMessageID == LeaveMessage_UserInfos[i].LeaveMessageID) {

                        var replyDate = new Date(replyMessages[j].ReplyDate);
                        var leaveDate = new Date(LeaveMessage_UserInfos[i].rowCreatedDate);

                        var showReplyDate = chargeDateDiffer(leaveDate, replyDate);

                        if (showReplyDate) {
                            returnStrs += "<div class='historydata'><span class='datatime'>" + replyMessages[j].ReplyDate + "</span></div>\n";
                        }

                        returnStrs += "<dl class='answer'>";
                        returnStrs += "<dt class='headsculpture'><i>";
                        returnStrs += "<img src='../../Images/plate-head.png' width='28' height='28'></i>\n";
                        returnStrs += "<p class='name'>";
                        returnStrs += " 平台</p>\n";
                        returnStrs += "</dt>\n";
                        returnStrs += "<dd class='answer-content'>";
                        returnStrs += "<div class='talk'>";
                        returnStrs += " <i class='arrow'></i><span>" + replyMessages[j].ReplyContent + "</span>";
                        returnStrs += " </div>\n";
                        returnStrs += " </dd>\n";
                        returnStrs += "</dl>\n";
                        returnStrs += "<div class='clear'>\n";
                        returnStrs += " </div>\n";
                    }
                }
            }
            return returnStrs;
        };

        // 判断时间差，符合条件返回 true 否则 返回 false (10分钟为例)
        var chargeDateDiffer = function (beginDate, endDate) {
            // 年差
            var yearDiffer = endDate.getFullYear() - beginDate.getFullYear();
            // 月差
            var monthDiffer = endDate.getMonth() - beginDate.getMonth();
            // 天差
            var dayDiffer = endDate.getDate() - beginDate.getDate();
            // 时差
            var hourDiffer = endDate.getHours() - beginDate.getHours();
            // 分差
            var minuteDiffer = endDate.getMinutes() - beginDate.getMinutes();

            if (yearDiffer > 0 || monthDiffer > 0 || dayDiffer > 0 || hourDiffer > 0 || minuteDiffer > 10) {
                return true;
            } else {
                return false;
            }
        };

        // 监听是否有新消息过来
        function setIntervalListener() {
            $.ajax({
                url: "/WeiXinManage/ListennerMaxMessageID",
                type: "post",
                data: {},
                success: function (returnData) {
                    if (returnData == "no") { 
                    
                    }else if(returnData != maxMessageID) {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("有新消息过来,点击<a linkUrl='/WeiXinManage/MessageManageList' onclick='GoToLinkUrl(event)'  href='javascript:void(0)'>刷新</a>").change();
                        maxMessageID = returnData;
                    }
                }
            });
        };

        // ↓-----------------回复用户留言 Start ---------------↓

        function replyMessageBatchShow(event) {
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
                popupOperate("replyMsgPopup", "批量回复消息", 'replyMsg');
            } else {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请勾选要添加的项").change();
            }
        };

        // 发送消息
        function btnReplyMessageConfirm() {
            var userInfoIDs = new Array();
            var leaveMessageIDs = new Array();
            var checks = $("#content input[type=checkbox]");
            for (var i = 0; i < checks.length; i++) {
                var check = $(checks[i]).attr("checked");
                if (check == "checked") {
                    var userInfoID = $(checks[i]).attr("dir");
                    // 把id 放到集合中去 形如2,4,5
                    userInfoIDs.push(userInfoID);

                    // 把leaveMessageID
                    var leaveMessageID = $(checks[i]).attr("id");
                    leaveMessageID = leaveMessageID.substring(9, leaveMessageID.length);
                    leaveMessageIDs.push(leaveMessageID);
                }
            }

            var textMessage = $("#reply_Msg").val();
            if (textMessage.trim() == '') {
                validataPrompt($("#reply_Msg"), '请输入要发送的文本内容');
                return false;
            };

            $.ajax({
                url: "/WeiXinManage/ReplyMessage",
                type: "post",
                data: { userInfoIDs: JSON.stringify(userInfoIDs), leaveMessageIDs: JSON.stringify(leaveMessageIDs), condiction: "batch", textMessage: textMessage },
                async: false,
                success: function (returnData) {
                    if (returnData == "ok") {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("留言回复成功").change();
                        setTimeout(function () {
                            GoToLinkUrl("", "/WeiXinManage/MessageManageList")
                        }, 1000);
                    } else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html("删除出现异常，联系管理员").change();
                    }
                }
            });

        };

        // ↑-----------------回复用户留言 End -----------------↑

        // 分组查询 点击操作
        $("#groupSearch li").click(function () {
            // 这样就会选中当前选中的项
            $("#groupSearch li").removeClass("current");
            $(this).addClass("current");

            searchQuery.Query = '';
            searchQuery.Groups[0] = $(this).attr("dir");

            // 调用分页
            MessageManageView(1);
        });

        // 点击全部时
        $("#allCount li").click(function () {
            $("#allCount li").removeClass("current");
            $(this).addClass("current");
            searchQuery.Query = '';
            searchQuery.Groups[0] = $(this).attr("dir");
            searchQuery.Groups[1] = '';
            // 调用分页
            MessageManageView(1);
        });

        // 分组日期查询 点击操作
        $("#dateGroupSearch li").click(function () {
            // 这样就会选中当前选中的项
            $("#dateGroupSearch li").removeClass("current");
            $(this).addClass("current");

            searchQuery.Query = '';
            searchQuery.Groups[1] = $(this).attr("dir");
            // 调用分页
            MessageManageView(1);
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
                    searchQuery.Groups[0] = '';
                    searchQuery.Groups[1] = '';
                    searchQuery.Query = searchCondition;
                    MessageManageView(1);
                }
            }
        }

        // 查询
        function txtSearch() {
            var searchCondition = $("#txtSearch").val();
            if (searchCondition == "请输入用户昵称..." || searchCondition.trim() == "") {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请输入查询条件").change();
            }
            else {
                searchQuery.Groups[0] = '';
                searchQuery.Groups[1] = '';
                searchQuery.Query = searchCondition;
                MessageManageView(1);
            }
        }

        // 单个删除
        function deleteSingle(event, leaveMessageID) {
            if (confirmThis(event, "确定要删除选中的项？")) {
                $.ajax({
                    url: "/WeiXinManage/DeleteMessage",
                    data: { IDs: leaveMessageID, condiction: "single" }, // 会自动转换成 字符串数组
                    type: "post",
                    success: function (succData) {
                        if (succData == "ok") {

                            GoToLinkUrl("", "/WeiXinManage/MessageManageList");
                            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                            $("#operateTip").html("删除成功").change();
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
        };

        // 批量删除
        function deleteBatch(event) {
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
            if (strIDs.length > 0) {
                if (confirmThis(event, "确定要删除选中的项？")) {
                    $.ajax({
                        url: "/WeiXinManage/DeleteMessage",
                        data: { IDs: JSON.stringify(strIDs) }, // 会自动转换成 字符串数组
                        type: "post",
                        success: function (succData) {
                            if (succData == "ok") {
                                GoToLinkUrl("", "/WeiXinManage/MessageManageList")
                                $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                                $("#operateTip").html("删除成功").change();
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
                $(".Loading").removeClass("style0greed style0red").addClass("style0yellow");
                $("#operateTip").html("请勾选要删除的项").change();
                return false;
            }
        };

        // 晚点执行刷新的动作
        function waitAction() {
            window.location.href = "/WeiXinManage/MessageManageList?appCode=C001&MenuCode=C375";
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
    </script>
</asp:Content>
