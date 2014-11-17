<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Import Namespace="V5.MetaData.Customer.Model" %>
<%@ Import Namespace="V5.Service.Customer.Repositories" %>
<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/jquery.pager.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery.cookie.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/allselect.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        // 文本框输入查询条件
        // 分组查询条件
        var customerQuery = new Object();
        customerQuery.Groups = new Array(3);
        customerQuery.Groups[2] = "AppCode-" + '<%=ViewData["appCode"]%>';
    </script>
    <div style="display: none" id="CustomerMembership">
        <div style="width: 600px; height: 250px;" class="content scroll">
            <div class="mod-table-main">
                <div class="con style03">
                    <table style="width: 100%;">
                        <colgroup>
                            <col style="width: 15%;">
                            <col style="width: 35%;">
                            <col style="width: 15%;">
                            <col style="width: 35%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <td class="td_bg">会员帐号：
                                </td>
                                <td>
                                    <span id="TrueName"></span>
                                </td>
                                <td class="td_bg">会员等级：
                                </td>
                                <td>
                                    <span id="LevelIDoRName"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_bg">会员状态：
                                </td>
                                <td>
                                    <span id="Freeze"></span>
                                </td>
                                <td class="td_bg">注册邮箱:
                                </td>
                                <td>
                                    <span id="Email"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_bg">注册时间：
                                </td>
                                <td>
                                    <span id="RegDate"></span>
                                </td>
                                <td class="td_bg">最近登录：
                                </td>
                                <td>
                                    <span id="RegisterDate"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_bg">会员来源：
                                </td>
                                <td>
                                    <span id="Type"></span>
                                </td>
                                <td class="td_bg">账户余额：
                                </td>
                                <td>
                                    <span id="Balance"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_bg">最近消费金额：
                                </td>
                                <td>
                                    <span id="ConsumeAmount"></span>
                                </td>
                                <td class="td_bg">客单价：
                                </td>
                                <td>
                                    <span id="PerTranscation"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_bg">消费频次：
                                </td>
                                <td>
                                    <span id="frequency"></span>
                                </td>
                                <td class="td_bg">消费总额：
                                </td>
                                <td>
                                    <span id="ConsumeAmountSum"></span>
                                </td>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!--选项卡 begin-->
    <div class="mod-tab t20">
        <div class="con style0big" id="freeze">
            <ul>
                <li class="current" dir="q1"><a href="javascript:void(0)">全部（<span id="QuanBu"></span>）</a></li>
                <li dir="d3"><a href="javascript:void(0)">正常（<span id="ZhengChang"></span>）</a></li>
                <li dir="d1"><a href="javascript:void(0)">冻结（<span id="DongJie"></span>）</a></li>
            </ul>
        </div>
    </div>
    <!--选项卡 end-->
    <!--搜索 begin-->
    <div class="mod-search">
        <div class="con style0list">
            <ul>
                <li>
                    <input name="" class="search-input" placeholder="请输入会员帐号..." style="color: #999;" type="text"
                        id="TexUser">
                </li>
                <li><a href="javascript:void(0)" class="search-btn" id="btnSelect"></a></li>
            </ul>
        </div>
    </div>
    <!--搜索 end-->
    <!--标签 begin-->
    <%--<div class="mod-condition t20">
        <div class="con style0list" id="freeze">
            <ul>
                <li dir="d3"><a href="javascript:void(0)">正常（<span id="ZhengChang"></span>）</a></li>
                <li dir="d1"><a href="javascript:void(0)">冻结（<span id="DongJie"></span>）</a></li>
            </ul>
        </div>
    </div>--%>
    <!--标签 end-->
    <!--操作栏 begin-->
    <div class="mod-operate t20" id="Operate">
        <div class="con style0list">
            <ul class="ul-list">
                <li><a class="a-btn" href="javascript:void(0)" id="freezes" onclick="SetFreeze(event,1)">冻结账号</a></li>
                <li><a class="a-btn" href="javascript:void(0)" id="SolveFreeze" onclick="SetFreeze(event,0)">解除冻结</a></li>
                <li><a class="a-btn" href="javascript:void(0)" onclick="Getpassword(event)" title=""
                    id="password">密码重置</a></li>
            </ul>
        </div>
    </div>
    <!--操作栏 end-->
    <div class="mod-page">
        <div class="con style0list">
            <div class="turn">
                <%-- <ul class="turn-ul">
                    <li class="next"></li>
                    <li class="prev"></li>
                </ul>--%>
            </div>
            <div class="number">
                当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条
            </div>
        </div>
    </div>
    <div class="clear h10">
    </div>
    <!--列表 Start-->
    <div class="mod-table">
        <% 
            Html.RenderAction("GetCustomerStraight", new { CurrentPageIndex = 0 });
            Html.RenderAction("GetSubunderwriting", new { CurrentPageIndex = 0 });
            Html.RenderAction("PageSelected", new { CurrentPageIndex = 0 });
                 
        %>
    </div>
    <!--列表 End-->
    <script type="text/javascript">


        var appCode = GetUrlAppCode();
        var menuCode = GetUrlMenuCode();

        if (appCode != 'PLATFORM' && appCode != "" && appCode != null) {

            $("#type").css("display", "none");
            $("#Operate ul").css("display", "none");
            $(".separationLine").css("display", "none");

        }





    </script>
    <script type="text/javascript">


        function GetMembership(id, event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            popupOperate("CustomerMembership", "会员详细", "CustomerMembership");

            $.ajax({
                type: "post",
                url: "../../CustomerManage/GetMembership",
                data: { "id": id },
                success: function (res) {
                    if (res != "{}") {
                        var jsonRes = JSON.parse(res);
                        $("#TrueName").text(jsonRes.LoginName);
                        $("#LevelIDoRName").text(jsonRes.LevelIDoRName);
                        $("#Freeze").text(jsonRes.Status === 1 ? "冻结" : "正常");
                        $("#Email").text(jsonRes.Email == null ? "" : jsonRes.Email);
                        $("#RegDate").text(jsonRes.RegDate.replace("T", "\n").replace(/\..*/g, ""));
                        $("#RegisterDate").text(jsonRes.rowModifiedDate.replace("T", "\n").replace(/\..*/g, ""));
                        $("#Type").text(jsonRes.CodeToTitle);
                        $("#Balance").text("0");
                        $("#ConsumeAmount").text(jsonRes.LastConsumeAmount.toFixed(2));
                        $("#ConsumeAmountSum").text(jsonRes.ConsumeAmount);
                        $("#PerTranscation").text(jsonRes.UnitPrice);
                        $("#frequency").text(jsonRes.ConsumptionFrequency + " 次/月");


                    }

                }
            });


        }

        function utcToDate(utcCurrTime) {
            utcCurrTime = utcCurrTime + "";
            var date = "";
            var month = new Array();
            month["Jan"] = 1;
            month["Feb"] = 2;
            month["Mar"] = 3;
            month["Apr"] = 4;
            month["May"] = 5;
            month["Jun"] = 6;
            month["Jul"] = 7;
            month["Aug"] = 8;
            month["Sep"] = 9;
            month["Oct"] = 10;
            month["Nov"] = 11;
            month["Dec"] = 12;
            var week = new Array();
            week["Mon"] = "一";
            week["Tue"] = "二";
            week["Wed"] = "三";
            week["Thu"] = "四";
            week["Fri"] = "五";
            week["Sat"] = "六";
            week["Sun"] = "日";

            str = utcCurrTime.split(" ");
            date = str[5] + "-";
            date = date + month[str[1]] + "-" + str[2] + "-" + str[3];
            return date;
        }


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

                $(".mod-tab #type ul li").removeClass("current c16");
                $(this).addClass("current c16");
                $("#freeze ul li").removeClass("current c16");
                customerQuery.Query = "";
                customerQuery.Groups[0] = "";
                customerQuery.Groups[0] = $(this).attr("dir");
                customerQuery.Groups[1] = "";


                if ($(this).attr("dir") == "q1") { CustomerView(1) }
                if ($(this).attr("dir") == "q2") { CustomerpageClick(1); }
                if ($(this).attr("dir") == "q3") { CustomerSubunderwritingpageClick(1); }
            });

            $("#freeze ul li").click(function () {
                if ($(this).attr("dir") == "d1") {
                    $("#Operate .style01 .btn li:eq(0)").hide();
                    $("#Operate .style01 .btn li:eq(1)").show();
                    $("#Operate .style01 .btn li:eq(2)").hide();
                }
                else {
                    $("#Operate .style01 .btn li:eq(1)").hide();
                    $("#Operate .style01 .btn li:eq(2)").show();
                    $("#Operate .style01 .btn li:eq(0)").show();
                }

                $("#freeze ul li").removeClass("current c16");
                $(this).addClass("current c16");
                customerQuery.Groups[1] = "";
                customerQuery.Groups[1] = $(this).attr("dir");

                if (customerQuery.Groups[0] == "q1") { CustomerView(1); }
                if (customerQuery.Groups[0] == "q2") { CustomerpageClick(1); }
                if (customerQuery.Groups[0] == "q3") { CustomerSubunderwritingpageClick(1); }
            });
        });

        $("#btnSelect").click(function () {

            if ($("#TexUser").val() != "" && $("#TexUser").val() != "请输入会员帐号...") {
                customerQuery.Query = $("#TexUser").val();
                CustomerView(1);
            }
            else {
                $(".Loading").removeClass("style0red style0green").addClass("style0yellow");
                $("#operateTip").html("请输入正确的会员账号").change();
                return false;
            }
        });

        $(function () {

            $("#TexUser").blur(function () {
                condition = $(this).val().replace(/^\s*/g, "").replace(/\s*$/g, "");
                if (condition == "") {
                    $(this).focus();
                    $(this).val("");
                }
            })

        });
        //重设密码
        function Getpassword(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;

            var CustomerID = new Array();
            $("input[name='sub']:checked").each(function () {

                CustomerID.push($(this).val());
            });
            if (CustomerID.length == 0) {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请先勾选文本框再进行批量操作！").change();
                return;
            }

            if (confirmThis(event, "您确定要密码重置？")) {
                $.ajax({
                    type: "post",
                    url: "../../CustomerManage/ReSetPassword",
                    data: { "srt": JSON.stringify(CustomerID) },
                    dataType: "json",
                    success: function (jsonRes) {
                        if (jsonRes.Code == null && jsonRes.Message == null) {
                            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                            $("#operateTip").html("操作成功！密码为123456。").change();

                            CustomerView(1);
                        }
                        else {
                            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");

                            $("#operateTip").html(JSON.stringify(jsonRes)).change();
                        }
                    }
                });
            }
        };


        //冻结账号
        function SetFreeze(event, status) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var CustomerID = new Array();
            $("input[name='sub']:checked").each(function () {
                CustomerID.push($(this).val());
            });

            if (CustomerID.length == 0) {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请先勾选文本框再进行批量操作！").change();

                return;
            }
            if (status == "1") {
                if (confirmThis(event, "您确定要冻结账号？")) {


                    var Url = "../../CustomerManage/GetFreezeNumberOrSolveFreeze";

                    SetFreezeAjxa(Url, CustomerID, status);
                }

            }
            else if (status == "0") {
                if (confirmThis(event, "您确定要解除冻结？")) {

                    Url = "../../CustomerManage/GetFreezeNumberOrSolveFreeze";

                    SetFreezeAjxa(Url, CustomerID, status);
                }
            }




        }


        function SetFreezeAjxa(url, customerID, status) {
            $.ajax({
                type: "post",
                url: url,
                data: { "srt": JSON.stringify(customerID), "status": status },

                success: function (jsonRes) {

                    if (jsonRes == "1") {
                        $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                        $("#operateTip").html("操作成功！").change();
                        CustomerView(1);
                    }
                    else if (jsonRes == "repeat") {

                        $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                        $("#operateTip").html("请不要重复操作！").change();
                        return;
                    }
                    else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html(JSON.stringify(jsonRes)).change();


                    }
                }
            });
        }


        $("#Examine").click(function () {
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

                        CustomerView(1);
                    }
                    else {
                        $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                        $("#operateTip").html(JSON.stringify(jsonRes)).change();

                    }
                }
            });

        });


        $("#Reject").click(function () {
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

                        CustomerView(1);
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
    <% if (ViewData["menuCode"].ToString() == "C016")
       { %>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#type>ul>li[dir='q3']").trigger("click");
            $("#freeze>ul>li[dir='d3']").trigger("click");
        });
    </script>
    <% }
       else
       { %>
    <script type="text/javascript">
        $(document).ready(function () {
            //初始化切换显示
            var Code = '<%=ViewData["appCode"]%>';
            if (Code == "C002") {
                customerQuery.Groups[0] = "q3";


                CustomerSubunderwritingpageClick(1);

            }
            else if (Code == "PLATFORM") {
                customerQuery.Groups[0] = "q1";
                CustomerView(1);
            }

            else { customerQuery.Groups[0] = "q2"; CustomerpageClick(1); }


        });
    </script>
    <% } %>
</asp:Content>
