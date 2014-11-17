<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <link href="../../Content/jquery-fallr-1.3.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=wechat"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--form begin-->
    <% V5.MetaData.WeiXin.Model.Warranty warranty = (V5.MetaData.WeiXin.Model.Warranty)ViewData["warranty"];  %>
    <div class="mod-title t10">
          <div class="con style0h1-02">
            <h1 class="spanTitle">绑定微信公众账号</h1>
          </div>
        </div>
    <div class="mod-form t20">
        <div class="con style0page">
            <!---active begin--->
            <h2 class="title-h2">
                <i class="icon-line r10"></i><span class="text">微信公众账号</span></h2>
            <ul class="list-ul l26">
                <li class="list-li">
                    <div class="float-l w80">
                        <span class="star">*</span><label>微信号</label></div>
                    <div class="float-l">
                        <input type="text" class="w230" name="name" value="<%=warranty.publicNumber %>" id="publicNumber"></div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w80">
                        <span class="star">*</span><label>类型</label></div>
                    <div class="float-l">
                        <input type="radio" name="type-wechat" id="type-wechat-01" disabled="disabled"><label
                            for="type-wechat-01" class="r25">订阅号</label>
                        <input type="radio" name="type-wechat" id="type-wechat-02" checked=""><label for="type-wechat-02">服务号</label></div>
                </li>
            </ul>
            <!---active end--->
            <!---prize begin--->
            <h2 class="title-h2 t30">
                <i class="icon-line r10"></i><span class="text">服务器配置</span><span class="fs12 c01-3">（于接收用户消息）</span></h2>
            <div class="mod-box t10 l26">
                <div class="con style0border w430">
                    <p class="fb fs14">
                        URL:</p>
                    <div class="empower-account">
                        <div class="empower-account-url w340" id="warrantyUrl">
                            <%:ViewData["DrpUrl"] %></div>
                        <div class="empower-account-btn">
                            <button class="btn-gradient-blue" id="copyWarrantyUrl">
                                复制</button></div>
                    </div>
                    <p class="fb fs14 clear">
                        Token:</p>
                    <div class="empower-account">
                        <div class="empower-account-url w340" id="warrantyToken">
                            TOKEN</div>
                        <div class="empower-account-btn">
                            <button class="btn-gradient-blue" id="copyWarrantyToken">
                                复制</button></div>
                    </div>
                </div>
            </div>
            <div class="t10 l26">
                <span>请将以上URL及Token填到微信公众平台中，以完成绑定。</span><a href="WeiXinHelp01" class="c07 fb">详细绑定步骤</a></div>
            <!---prize end--->
            <div class="hr10">
            </div>
            <!---condition begin--->
            <h2 class="title-h2 t30">
                <i class="icon-line r10"></i><span class="text">绑定开发者账号</span><span class="fs12 c01-3">（选填，用于配置自定义菜单）</span></h2>
            <ul class="list-ul l26">
                <li class="list-li">
                    <div class="float-l">
                        <input type="text" class="w460 icon-admin-input" name="name" value="<%=warranty.AppID %>"
                            id="appID"></div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l">
                        <input type="text" class="w460 icon-lock-input" name="name" value="<%=warranty.AppSecret %>"
                            id="appsecret"></div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
            </ul>
            <div class="t10 l26">
                <span>AppID以及Appsecret来自于您申请开发接口时提供的账号和密码。</span><a href="WeiXinHelp02" class="c07 fb">详细绑定步骤</a></div>
            <!---condition end--->
            <div class="l26 t30 b20">
                <% if (warranty.AppID != "")
                   { %>
                <button class="submit01 r10" id="btnSave" onclick="javascript:btnSave(event);">
                    修改</button>
                <input type="hidden" id="IsChange" value="true" />
                <% }
                   else
                   { %>
                <button class="submit01 r10" id="btnSave" onclick="javascript:btnSave(event);">
                    保存</button>
                <input type="hidden" id="IsChange" value="false" />
                <% } %>
            </div>
        </div>
    </div>
    <!--form end-->
    <script src="../../Scripts/Copy/jquery.zclip.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-fallr-1.3.pack.js" type="text/javascript"></script>
    <script type="text/javascript">
        // 初始化
        $(function () {
            txtInputTips();
        });

        // 赋值 URL
        $("#copyWarrantyUrl").zclip({
            path: "../../Scripts/Copy/ZeroClipboard.swf",
            copy: function () {
                $(".Loading").removeClass("style03 style02").addClass("style01");
                $("#operateTip").html("复制成功").change();
                return $('#warrantyUrl').text().trim();
            }
        });

        // 赋值 Token
        $("#copyWarrantyToken").zclip({
            path: "../../Scripts/Copy/ZeroClipboard.swf",
            copy: function () {
                $(".Loading").removeClass("style03 style02").addClass("style01");
                $("#operateTip").html("复制成功").change();
                return $('#warrantyToken').text().trim();
            }
        });





        function btnSave(event) {
            var appID = $("#appID").val().trim();
            var appsecret = $("#appsecret").val().trim();
            var publicNumber = $("#publicNumber").val().trim();

            var token = $("#warrantyToken").text();


            if (appID.length <= 0 || appsecret.length <= 0) {
                $(".Loading").removeClass("style01 style03").addClass("style02");
                $("#operateTip").html("AppID 或 Appsecret 不能为空！").change();
                return;
            }

            if (appID == "请输入 appID") {
                $(".Loading").removeClass("style01 style03").addClass("style02");
                $("#operateTip").html("请输入 AppID！").change();
                return;
            }

            if (appsecret == "请输入 appsecret") {
                $(".Loading").removeClass("style01 style03").addClass("style02");
                $("#operateTip").html("请输入 Appsecret！").change();
                return;
            }

            if (publicNumber == "请输入 微信号") {
                $(".Loading").removeClass("style01 style03").addClass("style02");
                $("#operateTip").html("请输入 微信号！").change();
                return;
            }
            var bool = false;

            if ($("#IsChange").val() == "true") {
                if (confirmThis(event, "特别注意：变更公众号将导致数据无法恢复！")) {
                    bool = true;
                }
            } else {
                bool = true;
            }
            if (bool) {
                $("#btnSave").removeClass().addClass("disabled l10");
//                $(".aui_state_highlight").attr('disabled', "true");
                $("#btnSave").attr('disabled', "true");
                $.ajax({
                    url: "/WeiXinManage/Warranty",
                    data: { "appID": appID, "appsecret": appsecret, "token": token, "publicNumber": publicNumber },
                    type: "post",
                    async: false, // 同步执行
                    success: function (returnData) {
                        if ("OK" == returnData) {
                            $(".Loading").removeClass("style03 style02").addClass("style01");
                            $("#operateTip").html("授权成功").change();
                        } else if ("error" == returnData) {
                            $(".Loading").removeClass("style01 style02").addClass("style03");
                            $("#operateTip").html("重新授权错误").change();
                        } else {
                            $(".Loading").removeClass("style01 style02").addClass("style03");
                            $("#operateTip").html(returnData).change();
                        }
                    },
                    error: function (returnData) {
                        $(".Loading").removeClass("style01 style02").addClass("style03");
                        $("#operateTip").html("未知异常，联系管理员").change();
                    }
                });
                $("#btnSave").removeClass().addClass("submit01 r10");
                $("#btnSave").removeAttr('disabled');
            }
        };


        // 查询输入文本框
        function txtInputTips() {
            $("#appID").focus(function () {
                if ($(this).val() == "请输入 AppID") {
                    $(this).val('');
                    $(this).val('').css("color", "#aaa");
                }
            });
            $("#appID").blur(function () {
                if ($(this).val() == "") {
                    $(this).val("请输入 AppID");
                }
            })

            $("#appsecret").focus(function () {
                if ($(this).val() == "请输入 Appsecret") {
                    $(this).val('');
                    $(this).val('').css("color", "#aaa");
                }
            });
            $("#appsecret").blur(function () {
                if ($(this).val() == "") {
                    $(this).val("请输入 Appsecret");
                }
            })

            $("#publicNumber").focus(function () {
                if ($(this).val() == "请输入 微信号") {
                    $(this).val('');
                    $(this).val('').css("color", "#aaa");
                }
            });
            $("#publicNumber").blur(function () {
                if ($(this).val() == "") {
                    $(this).val("请输入 微信号");
                }
            })
        };

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
    </script>
</asp:Content>
