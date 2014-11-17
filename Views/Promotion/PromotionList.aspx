<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="V5.MetaData.Customer.Report" %>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../../Scripts/Js/allselect.js" type="text/javascript"></script>
    <style type="text/css">
        .tr-Current .detailInfo
        {
            cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        // 文本框输入查询条件
        // 分组查询条件
        var searchQuery = new Object();
        // 给searchQuery赋一个初始值
        searchQuery.Groups = 'default';
        <%
        var openedCode = ViewData["openedCode"];
        var type = ViewData["type"];
    %>
  
    </script>
    <!--选项卡 begin-->
    <div class="mod-tab t20">
        <div class="con style0big" id="groupSearch">
            <ul>
                <li dir="q4" class="current"><a href="#" id="A5">全部（<span id="spanAllPromotion"><%:ViewData["promotionCount"]%></span>）</a></li>
                <li dir="q5"><a href="#" id="A1">进行中（<span id="spanPromotioning"><%:ViewData["promotioningCount"] %></span>）</a></li>
                <li dir="q6"><a href="#" id="A2">过期（<span id="spanPromotionDatePast"><%:ViewData["PromotionDatePast"]%></span>）</a></li>
                <li dir="q7"><a href="#" id="A3">已关闭（<span id="spanPromotionClosed"><%:ViewData["promotionClosedCount"] %></span>）</a></li>
                <li dir="q8"><a href="#" id="A4">未开始（<span id="spanPromotionNotStart"><%:ViewData["promotionNotStart"]%></span>）</a></li>
                <%--<% if (openedCode.ToString().ToLower() == "platform")
                   {%>
                <li class="current c16" dir="q1"><a href="#">全部（<span><%:ViewData["promotionCount"]%></span>）</a></li>
                <li dir="q2"><a href="#">零售（<span><%=ViewData["Straight"]%></span>）</a></li>
                <li dir="q3"><a href="#">分销（<span id="B_Promo"><%= ViewData["Subunderwriting"]%></span>）</a></li>
                <%}
                   else if (openedCode.ToString().ToLower() == "c002")
                   {%>
                <li class="current c16" dir="q3"><a href="#">全部（<span><%= ViewData["Subunderwriting"]%></span>）</a></li>
                <%}
                   else
                   {%>
                <li class="current c16" dir="q2"><a href="#">全部（<span><%= ViewData["Straight"]%></span>）</a></li>
                <%} %>--%>
            </ul>
        </div>
    </div>
    <!--选项卡 end-->
    <!--搜索 begin-->
    <div class="mod-search">
        <div class="con style0list">
            <ul>
                <li>
                    <input type="text" name="" id="txtSearch" class="search-input" placeholder="请输入活动主题..." />
                </li>
                <li><a class="search-btn search" href="#" onclick="javascript:txtSearch();"></a>
                </li>
            </ul>
        </div>
    </div>
    <!--搜索 end-->
    <!--标签 begin-->
    <%--<div class="mod-condition t20">
        <div class="con style0list">
            <ul id="groupSearch">
                <li dir="q5"><a href="#" id="promotioning">进行中（<span id="spanPromotioning"><%:ViewData["promotioningCount"] %></span>）</a></li>
                <li dir="q6"><a href="#" id="PromotionDatePast">过期（<span id="spanPromotionDatePast"><%:ViewData["PromotionDatePast"]%></span>）</a></li>
                <li dir="q7"><a href="#" id="promotionClosed">已关闭（<span id="spanPromotionClosed"><%:ViewData["promotionClosedCount"] %></span>）</a></li>
                <li dir="q8"><a href="#" id="promotionNotStart">未开始（<span id="spanPromotionNotStart"><%:ViewData["promotionNotStart"]%></span>）</a></li>
            </ul>
        </div>
    </div>--%>
    <!--标签 end-->
    <!--操作栏 begin-->
    <div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list">
                <li><a class="a-btn" href="/Promotion/AddPromotion?appCode=<%=ViewData["openedCode"]%>&MenuCode=<%=ViewData["menuCode"] %>&type=<%=ViewData["type"] %>">增加</a></li>
                <%--<li><a class="a-btn" href="#" onclick="javascript:ClosePromotion();">关闭活动</a></li>--%>
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
                    当前<span id="numberBegin"></span>~<span id="numberEnd"></span>条，总计<span id="sum"></span>条
                </div>
            </div>
        </div>
    </div>
    <div class="clear h10">
    </div>
    <!--列表 Start-->
    <div style="clear: both;">
        <div class="sourcelist">
            <%--局部试图 Start--%>
            <%Html.RenderAction("GetShowPromotionView", new { CurrentPageIndex = 0, openedCode = ViewData["openedCode"], type = ViewData["type"] });%>
            <%--局部试图 End--%>
        </div>
    </div>
    <!--列表 End-->
    <input type="hidden" id="openedCode" value="<%:openedCode.ToString().ToLower() %>" />
    <input type="hidden" id="type" value="<%:type%>" />
    <%--查看弹层 Start--%>
    <div id="promotionDetailPopup" style="display: none;">
        <div class="content" style="width: 800px;">
            <div class="mod-form">
                <div class="con style0alert" id="promotionDetailFlag">
                    <%--局部试图 营销活动详情 Start--%>
                    <%Html.RenderAction("GetPromotionDetail", new { PromotionID = 0 });%>
                    <%--局部试图 营销活动详情 End--%>
                </div>
            </div>
        </div>
    </div>
    <%--查看弹层 End--%>
    <script src="../../Scripts/jquery.pager.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">
        // 全局变量 切换渠道
        var openedCode = $("#openedCode").val();
        var type = $("#type").val();
        $(function () {
            // 第一次加载时 默认显示第一页的数据 (要放到最后，不然会影响其他功能)
            PromotionView(1);

            // 注册文本框的事件
            txtTips();
        });

        // 查看会员营销详情
        var promotionDetailPopup = function (promotionID) {

            // 绑定数据
            GetPromotionDetailView(promotionID);
            popupOperate("promotionDetailPopup", "营销活动详情", 'promotionDetail');

        }

        // 全部 直销 分销 分组查询 (点击后只获取当前点击的dir)
        $(".mod-tab #type ul li").click(function () {
            $(".mod-tab #type ul li").removeClass("current c16");
            $(this).addClass("current c16");
            $("#groupSearch li").removeClass("current");

            searchQuery.Groups = $(this).attr("dir"); // 覆盖之前的状态
            searchQuery.Query = "";
            PromotionView(1);

            var condiction = searchQuery.Groups;
            // "全部"、"进行中"、"过期"、"已关闭" 的数量重新绑定(替换掉)
            $.getJSON("/Promotion/GetChangingCount", { "condiction": condiction, "openedCode": openedCode }, function (ReturnData) {

                if (ReturnData != null) {

                    $("#spanAllPromotion").text("");
                    $("#spanAllPromotion").text(ReturnData.spanAllPromotionCount);

                    $("#spanPromotioning").text("");
                    $("#spanPromotioning").text(ReturnData.spanPromotioningCount);

                    $("#spanPromotionDatePast").text("");
                    $("#spanPromotionDatePast").text(ReturnData.spanPromotionDatePastCount);

                    $("#spanPromotionClosed").text("");
                    $("#spanPromotionClosed").text(ReturnData.spanPromotionClosedCount);

                    $("#spanPromotionNotStart").text("");
                    $("#spanPromotionNotStart").text(ReturnData.spanPromotionNotStartCount);


                }
            });

        });

        // 分组查询 全部、进行中、过期、关闭
        $("#groupSearch li").click(function () {
            // 这样就会选中当前选中的项
            $("#groupSearch li").removeClass("current");
            $(this).addClass("current");

            // 点击同级的不起作用
            if (searchQuery.Groups == 'default' || searchQuery.Groups == "q4" || searchQuery.Groups == "q5" || searchQuery.Groups == "q6" || searchQuery.Groups == "q7" || searchQuery.Groups == "q8") {
                searchQuery.Groups = $(this).attr("dir");
                searchQuery.Query = "";
                PromotionView(1);
            } else {
                // 可以知道上次的状态
                var lastState = searchQuery.Groups; // 比如应该记住 全部、直销、分销
                searchQuery.Groups = searchQuery.Groups + $(this).attr("dir");

                searchQuery.Query = "";
                PromotionView(1);
                // 还原状态
                searchQuery.Groups = lastState;

            }
        });

        // 输入文本框
        function txtTips() {
            //            $("#txtSearch").focus(function () {
            //                if ($(this).val() == "请输入活动主题...") {
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
            });
        };

        // 单个删除
        function DeleteSingle(event, PromotionID) {

            if (confirmThis(event, "确定要删除此条数据？")) {
                $.post("/Promotion/DeletePromotionSingle", "PromotionID=" + PromotionID + "", function (returnData) {
                    if (returnData == "ok") {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("删除成功").change();
                        window.location.reload();
                    } else if (returnData == "NoDeleting") {
                        $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                        $("#operateTip").html("只有未开始的活动才能删除").change();
                        return;
                    } else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html("删除失败,请联系管理员").change();
                    }
                });
            } else {
                return false;
            };
        };

        // 单条关闭营销活动
        function ClosePromotionSingle(promotionID) {
            $.ajax({
                url: "/Promotion/ClosePromotionSingle",
                data: { "promotionID": promotionID },
                type: "post",
                async: false,
                success: function (returnData) {
                    if (returnData == "ok") {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("关闭活动成功").change();
                        window.location.reload();
                    } else if (returnData == "can not close") {
                        $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                        $("#operateTip").html("只有正在进行的活动可以关闭").change();
                    } else if (returnData == "already close") {
                        $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                        $("#operateTip").html("此活动已经关闭").change();
                    } else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html("关闭失败，联系管理员").change();
                    }
                },
            });
        };

        // 批量关闭活动 
        function ClosePromotion(event) {
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

                if (confirmThis(event, "确定要关闭选中的活动？")) {
                    $.ajax({
                        url: "../../Promotion/ClosePromotions",
                        data: "IDs=" + strIDs + "",
                        type: "post",
                        success: function (succData) {
                            if (succData == "ok") {
                                window.location.reload();
                                $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                                $("#operateTip").html("关闭活动成功").change();

                            } else {
                                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                                $("#operateTip").html("请选中要关闭活动").change();
                            }
                        },
                        error: function (errData) {
                            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                            $("#operateTip").html("关闭活动出现异常，联系管理员").change();
                        }
                    });
                } else {
                    return false;
                }
            } else {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请勾选要关闭活动").change();
                return false;
            }
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
                if ($("#txtSearch").val() == null || $("#txtSearch").val() == "请输入活动主题..." || $("#txtSearch").val().trim() == '') {
                    $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                    $("#operateTip").html("请输入活动主题").change();
                    return false;
                }
                else {
                    searchQuery.Query = $("#txtSearch").val().trim();
                    PromotionView(1);
                }
                // 把返回的数量绑定到”进行中”、”过期”、”未开始”也要和“全部”、“直销”、”分销”关联
            }
        }

        // 查询
        function txtSearch() {
            if ($("#txtSearch").val() == null || $("#txtSearch").val() == "请输入活动主题..." || $("#txtSearch").val().trim() == '') {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请输入活动主题").change();
                return false;
            }
            else {
                searchQuery.Query = $("#txtSearch").val().trim();
                PromotionView(1);
            }
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
