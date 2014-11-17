<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../../Scripts/jquery.pager.js" type="text/javascript"></script>
    <script src="../../../Scripts/jquery.cookie.js" type="text/javascript"></script>
    <script src="../../../Scripts/Js/allselect.js" type="text/javascript"></script>
    <script src="../../../Scripts/Js/Common.js" type="text/javascript"></script>
    <style type="text/css">
        .mod-page .con
        {
            bottom: 0;
            margin-left: 186px;
            position: fixed;
            right: 0;
            z-index: 110;
        }
    </style>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        // 文本框输入查询条件
        // 分组查询条件
        var customerQuery = new Object();
        customerQuery.Groups = new Array();
        customerQuery.Groups[0] = "q1";

    </script>
    <!-- 查询条件 end -->
    <!--展开高级搜索时加class="MCM-N-L MCM-Open"-->
    <div class="MCM-C-M">
        <!--标题 begin-->
        <div class="mod-title" style="margin-bottom: 0px; margin-top: 18px;">
        </div>
        <!--标题 end-->
        <!--选项卡 begin-->
        <div class="mod-tab">
            <div class="con style02" id="type">
                <ul>
                    <li class="current c16" dir="q1"><a href="javascript:void(0)">全部（<span id="count_total"><%=ViewData["count_total"]%></span>）</a></li>
                </ul>
            </div>
        </div>
        <!--选项卡 end-->
        <!--标签 begin-->
        <!--搜索 begin-->
        <div class="search-bar02">
            <ul class="ul-search">
                <li>
                    <input name="" class="v5-input in200 inp-search" value="请输入会员帐号..." style="color: #999;"
                        type="text" id="TexUser">
                </li>
                <li><a href="javascript:void(0)" class="search-btn" id="btnSelect"></a></li>
            </ul>
        </div>
        <!--搜索 end-->
        <div class="label-mod">
            <div class="con style01" id="freeze">
                <ul>
                    <li dir="d1"><a href="javascript:void(0)">待审核（<span id="count_auditing"><%=ViewData["count_auditing"]%></span>）</a></li>
                    <li dir="d2"><a href="javascript:void(0)">已合作（<span id="count_audited"><%=ViewData["count_audited"]%></span>）</a></li>
                    <li dir="d3"><a href="javascript:void(0)">已拒绝（<span id="count_rejected"><%=ViewData["count_rejected"]%></span>）</a></li>
                </ul>
            </div>
        </div>
        <!--标签 end-->
        <!--操作栏 begin-->
        <div class="mod-operate">
            <div class="con style01">
                <div id="Auditing">
                    <ul class="btn" name="pnl_auditing">
                        <li><a class="a-btn" href="javascript:void(0)" name="btn_pass">审核通过</a></li>
                        <li><a class="a-btn" href="javascript:void(0)" name="btn_reject">审核拒绝</a></li>
                    </ul>
                    <ul class="btn" name="pnl_audited" style="display: none">
                        <li><a class="a-btn" href="javascript:void(0)" name="btn_reject">取消合作</a></li>
                    </ul>
                    <ul class="btn" name="pnl_rejected" style="display: none">
                        <li><a class="a-btn" href="javascript:void(0)" name="btn_pass">重新合作</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="mod-page" style="display: none; display: block; float: right; right: 0px;
            margin-top: 6px;">
            <%--position: absolute;--%>
            <div class="style01">
                <div class="mod-footer-page">
                    <div class="r10">
                        当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条</div>
                    <div class="footer-p-div2 tac">
                    </div>
                </div>
            </div>
        </div>
        <!--操作栏 end-->
        <!--列表 Start-->
        <div style="clear: both;">
            <div class="mod-table">
                <div class="sourcelist">
                    <% 
                        Html.RenderAction("GetCustomerProductLineList", new { CurrentPageIndex = 0 });
                    %>
                </div>
            </div>
        </div>
        <!--列表 End-->
    </div>
    <script type="text/javascript">

        var appCode = GetUrlAppCode();
        var menuCode = GetUrlMenuCode();


        if (appCode != 'PLATFORM' && appCode != "" && appCode != null) {
            $("#type").css("display", "none");


            $(".separationLine").css("display", "none");

        }
        if (appCode == "C002") { $("#Auditing").show(); }
        else { $("#Auditing").hide(); }

              
    </script>
    <script type="text/javascript">

        $(function () {

            // enter 键搜索
            document.onkeypress = function () {

                var iKeyCode = -1;
                if (arguments[0]) {
                    iKeyCode = arguments[0].which;
                }
                else {
                    iKeyCode = event.keyCode;
                }
                if (iKeyCode == 13) {
                    // 搜索
                    $("#btnSelect").click();

                }
            }

            $(".mod-tab #type ul li").click(function () {

                // 全部筛选按钮事件
                $(".mod-tab #type ul li").removeClass("current c16");
                $(this).addClass("current c16");
                $(".label-mod #freeze ul li").removeClass("current c16");
                customerQuery.Query = "";
                customerQuery.Groups[0] = $(this).attr("dir");
                customerQuery.Groups[1] = "";
                GetQueryResult(1)
            });

            $(".label-mod #freeze ul li").click(function () {
                // 状态按钮事件
                $(".label-mod #freeze ul li").removeClass("current c16");
                $(this).addClass("current c16");
                customerQuery.Groups[1] = $(this).attr("dir");

                if ($(this).attr("dir") == "d1") {
                    // 待审核状态
                    $("[name='pnl_auditing']").show();
                    $("[name='pnl_audited']").hide();
                    $("[name='pnl_rejected']").hide();
                }

                if ($(this).attr("dir") == "d2") {
                    // 已合作状态
                    $("[name='pnl_auditing']").hide();
                    $("[name='pnl_audited']").show();
                    $("[name='pnl_rejected']").hide();
                }

                if ($(this).attr("dir") == "d3") {

                    // 已拒绝状态
                    $("[name='pnl_auditing']").hide();
                    $("[name='pnl_audited']").hide();
                    $("[name='pnl_rejected']").show();
                }

                GetQueryResult(1);
            }

            );
        });

        $("#btnSelect").click(function () {
            // 查询按钮事件
            if ($("#TexUser").val() != "" && $("#TexUser").val() != "请输入会员帐号...") {
                customerQuery.Query = $("#TexUser").val();
                GetQueryResult(1);
            }
            else {

                $("#operateTip").html("请输入正确的会员账号！").change();


                return false;
            }
        });

        $(function () {

            $("#TexUser").focus(function () {
                if ($(this).val() == "请输入会员帐号...") {
                    $(this).val('');
                    $(this).val('').css("color", "#6b6969");
                }

            });
            $("#TexUser").blur(function () {
                if ($(this).val() == "") {
                    $(this).val("请输入会员帐号...");
                }
            })

        });

        $("[name='btn_pass']").click(function () {
            var CustomerID = new Array();

            $("input[name='sub']:checked").each(function () {
                CustomerID.push($(this).val());
            });

            if (CustomerID.length == 0) {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请先勾选文本框再进行批量操作！").change();
                return;
            }

            $.ajax({
                type: "post",
                url: "../../CustomerManage/SetExamine",
                data: { "srt": JSON.stringify(CustomerID) },
                dataType: "json",
                success: function (jsonRes) {
                    if (jsonRes.Code == null && jsonRes.Message == null) {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("操作成功！").change();

                        GetQueryResult(1);
                    }
                    else {

                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");

                        $("#operateTip").html(JSON.stringify(jsonRes)).change();
                    }
                }
            });

        });

        $("[name='btn_reject']").click(function () {
            var CustomerID = new Array();

            $("input[name='sub']:checked").each(function () {
                CustomerID.push($(this).val());
            });

            if (CustomerID.length == 0) {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请先勾选文本框再进行批量操作！").change();
                return;
            }

            $.ajax({
                type: "post",
                url: "../../CustomerManage/SetReject",
                data: { "srt": JSON.stringify(CustomerID) },
                dataType: "json",
                success: function (jsonRes) {
                    if (jsonRes.Code == null && jsonRes.Message == null) {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("操作成功！").change();


                        GetQueryResult(1);
                    }
                    else {

                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");

                        $("#operateTip").html(JSON.stringify(jsonRes)).change();

                    }
                }
            });
        });


        //查看详细和编辑链接的跳转
        function GoToLinkUrl(event) {

            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;

            var linkUrl = $(eventSrc).attr("linkUrl");
            var linkUrlParts = linkUrl.split('?');
            if (linkUrlParts.length > 1) {//原本已经带参数
                linkUrl = linkUrlParts[0] + "?appCode=" + appCode + "&" + "MenuCode=" + menuCode + "&" + linkUrlParts[1];
            } else {
                linkUrl = linkUrl + "?appCode=" + appCode + "&" + "MenuCode=" + menuCode;
            }

            window.location.href = linkUrl;
        }



    </script>
    <% if (ViewData["menuCode"].ToString() == "C305")
       { %>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#type>ul>li[dir='q1']").trigger("click");

        });
    </script>
    <% }
      
    %>
</asp:Content>
