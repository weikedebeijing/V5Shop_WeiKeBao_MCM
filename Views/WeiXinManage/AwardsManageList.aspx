<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script type="text/javascript" src="../../../Scripts/Js/allselect.js"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        // 分组查询条件
        var searchQuery = new Object();
        // 给searchQuery赋一个初始值
        searchQuery.Groups = new Array();
        // 全部
        searchQuery.Groups[0] = 'q0';
        searchQuery.Groups[1] = '';
        searchQuery.Query = '';
    </script>
    <!--tab begin-->
    <div class="mod-tab t20">
        <div class="con style0big" id="groupSearch">
            <ul >
                <li class="current"><a href="javascript:void(0)">全部（<span><%:ViewData["TotalCount"]%></span>）</a></li>
                <li dir="group1"><a href="javascript:void(0)">已发放（<span><%=ViewData["HasGiveOut"]%></span>）</a></li>
                <li dir="group2"><a href="javascript:void(0)">未发放（<span><%=ViewData["NoGiveOut"]%></span>）</a></li>
                <li dir="group3"><a href="javascript:void(0)">问题中奖（<span><%=ViewData["QuestionAward"] %></span>）</a></li>
                <li dir="group4"><a href="javascript:void(0)">无效奖品（<span><%=ViewData["NoUseAward"] %></span>）</a></li>
            </ul>
        </div>
    </div>
    <!--tab end-->
    <!--search begin-->
    <div class="mod-search">
        <div class="con style0list">
            <ul>
                <li>
                    <input id="txtSearch" type="text" name="" class="search-input" placeholder="请输入活动名称..." />
                </li>
                <li><a href="#" class="search-btn" onclick="javascript:txtSearch();"></a></li>
            </ul>
        </div>
    </div>
    <!--search end-->
    <!--condition begin-->
    <%--<div class="mod-condition t20" style="display:none">
        <div class="con style0list">
            <ul id="groupSearch">
                <li dir="group1"><a href="javascript:void(0)">已发放（<span><%:ViewData["HasGiveOut"]%></span>）</a></li>
                <li dir="group2"><a href="javascript:void(0)">未发放（<span><%:ViewData["NoGiveOut"]%></span>）</a></li>
                <li dir="group3"><a href="javascript:void(0)">问题中奖（<span><%:ViewData["QuestionAward"] %></span>）</a></li>
                <li dir="group4"><a href="javascript:void(0)">无效奖品（<span><%:ViewData["NoUseAward"] %></span>）</a></li>
            </ul>
        </div>
    </div>--%>
    <!--condition end-->
    <!--operate begin-->
    <div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list">
                <li><a href="javascript:void(0);" class="a-btn" onclick="javascript:giveOutAwards();">
                    发放奖品</a></li>
            </ul>
        </div>
    </div>
    <!--operate end-->
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
    <!--table begin-->
    <div class="mod-table" id="sourcelist">
        <%--局部试图 Start--%>
        <% Html.RenderAction("GetAwardsManageView", new { CurrentPageIndex = 0 }); %>
        <%--局部试图 End--%>
    </div>
    <!--table end-->
    <!--alert begin-->
    <div class="mask" style="display: none;">
    </div>
    <div id="giveOutAlert" style="display: none;">
        <div class="content" style="width:650px;">
            <div class="mod-form">
                <div class="con style0alert">
                    <ul class="list-ul">
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span>
                                <label>
                                    标记
                                </label>
                            </div>
                            <div class="float-l">
                                <div id="operationBtn">
                                    <input type="button" dir="hasGiveOut" value="标记为已发放" class="reset01-alert" />
                                    <input type="button" dir="question" value="标记为问题" class="reset01-alert">
                                    <input type="button" dir="noUse" value="标记为无效" class="reset01-alert">
                                </div>
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star"></span>
                                <label>
                                    备注内容
                                </label>
                            </div>
                            <div class="float-l">
                                <textarea id="markContent" class="w360 h150"></textarea>
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
                <button class="submit01-alert r10" onclick="javascript:btnSave();">
                    保存</button>
                <button type="button" onclick="javascript:popupClose('giveOut');" class="reset01-alert">
                    取消</button>
            </div>
        </div>
    </div>
    <!--alert end-->
    <script src="../../Scripts/jquery.pager.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/popupOperate.js" type="text/javascript"></script>
   
    <script type="text/javascript">
        var operationBtnState = "";

        $(function () {
            GetAwardsManageView(1);

            // 注册 查询输入文本框
            txtSearchTips();
        });

        // ↓-----------------Operation Start ---------------↓

        // 保存
        function btnSave() {
//            $("#operationBtn").find("input[type=button]").each(function () {
//                var classAttr = $(this).attr("class").trim();
//                if (classAttr == "saveBtn") {
//                    operationBtnState = $(this).attr("dir").trim();
//                }
//            });

            var remark = '';
            if (operationBtnState == "") {
                validataPrompt($("#operationBtn"), '请选择对奖品的操作');
                return false;
            };

            if ($("#markContent").val() != "") {
                remark = $("#markContent").val();
            }

            var awardsRecordIDs = new Array();
            var checks = $("#content input[type=checkbox]");
            for (var i = 0; i < checks.length; i++) {
                var check = $(checks[i]).attr("checked");
                if (check == "checked") {
                    var id = $(checks[i]).attr("dir");
                    awardsRecordIDs.push(id);
                }
            }

            var awardState = '';
            if (operationBtnState == "hasGiveOut") {
                awardState = 1;
            } else if (operationBtnState == "question") {
                awardState = 2;
            } else if (operationBtnState == "noUse") {
                awardState = 3;
            }
        
            $.ajax({
                url: "/WeiXinManage/AwardsOperation",
                data: { "awardsRecordIDs": JSON.stringify(awardsRecordIDs), "remark": remark, "awardState": awardState },
                type: "post",
                async: false,
                success: function (returnData) {
                    if ("ok" == returnData) {
                        $(".Loading").removeClass("style0yellow style0red").addClass("style0green");
                        $("#operateTip").html("操作成功").change();
                        setTimeout(waitAction, 1000);
                    } else if ("error" == returnData) {
                        $(".Loading").removeClass("style0yellow style0green").addClass("style0red");
                        $("#operateTip").html("服务器异常，联系管理员").change();
                    }
                }
            });

        };

        // 发放奖品
        function giveOutAwards() {
            var hasChecked = false;
            var checks = $("#content input[type=checkbox]").each(function () {
                if ($(this).attr("checked") == "checked") {
                    hasChecked = true;
                    return false; // 等同于 C# break
                }
            });

            if (hasChecked) {
                popupOperate("giveOutAlert", "发放奖品", 'giveOut');
                buttonChange();
            } else {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请勾选要操作的项").change();
            }

        };

        // 操作按钮的状态改变
        var buttonChange = function () {
            $("#operationBtn").find("input[type=button]").click(function () {
                $("#operationBtn").find("input[type=button]").removeClass("saveBtn");
                $("#operationBtn").find("input[type=button]").addClass("reset01-alert");
                $(this).removeClass("reset01-alert");
                $(this).addClass("saveBtn");
                operationBtnState = $(this).attr("dir");
            });
        };


        // ↑-----------------Operation End -----------------↑


        // ↓-----------------normalOperationRepeat Start ---------------↓
        // 晚点执行刷新的动作
        function waitAction() {
            window.location.reload();
        };

        // 分组日期查询 点击操作
        $("#groupSearch ul li").click(function () {
            // 这样就会选中当前选中的项
            $("#groupSearch li").removeClass("current");
            $(this).addClass("current");

            searchQuery.Query = '';
            searchQuery.Groups[1] = $(this).attr("dir");
            // 调用分页
            GetAwardsManageView(1);
        });

        // 获取所有数据
        function totalResult() {
            searchQuery.Groups[0] = 'q0';
            searchQuery.Groups[1] = '';
            searchQuery.Query = ''
            GetAwardsManageView(1);
        };

        // 查询输入文本框
        function txtSearchTips() {
            $("#txtSearch").focus(function () {
                if ($(this).val() == "请输入活动名称...") {
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

        // 查询
        function txtSearch() {
            var searchCondition = $("#txtSearch").val();
            if (searchCondition == "请输入活动名称..." || searchCondition.trim() == "") {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请输入活动名称...").change();
            }
            else {
                searchQuery.Groups[0] = '';
                searchQuery.Groups[1] = '';
                searchQuery.Query = searchCondition;
                GetAwardsManageView(1);
            }
        }

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
                if (searchCondition == "请输入活动名称..." || searchCondition.trim() == "") {
                    $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                    $("#operateTip").html("请输入活动名称...").change();
                }
                else {
                    searchQuery.Groups[0] = '';
                    searchQuery.Groups[1] = '';
                    searchQuery.Query = searchCondition;
                    GetAwardsManageView(1);
                }
            }
        }

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
        // ↑-----------------normalOperationRepeat End -----------------↑
    </script>
</asp:Content>
