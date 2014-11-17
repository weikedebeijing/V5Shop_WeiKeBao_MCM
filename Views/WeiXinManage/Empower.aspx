<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BootstrapSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">

    <script src="../../Scripts/bootstrap/BootstrapCssLoadV2.js?Item=set"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <% V5.MetaData.WeiXin.Model.Warranty warranty = (V5.MetaData.WeiXin.Model.Warranty)ViewData["warranty"];  %>

    <!--right begin-->
    <div class="RIGHT empower">

        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" class="modal hide fade" id="setExtract">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                <h3 id="H1">特别注意</h3>
            </div>
            <div class="modal-body">
                该操作将导致相关数据无法恢复,请谨慎操作!
       
            </div>
            <div class="modal-footer">
                <button aria-hidden="true" data-dismiss="modal" class="btn">关闭</button>
                <button aria-hidden="true" onclick="btnSave(event)" class="btn btn-info">保存</button>
            </div>
        </div>

        <!--big title begin-->

        <div class="bigTitle">
            <div class="bigTitle-name"><span class="text">绑定微信公众账号</span></div>
        </div>
        <!--big title end-->
        <div class="main">
            <form class="form-horizontal">
                <!--small title-->
                <div class="smallTitle"><span class="text">微信公众账号</span></div>
                <!--small title-->
                <div class="publicaccount">
                    <div class="control-group">
                        <label class="control-label input-label" for="inputEmail">微信号</label>
                        <div class="controls">
                            <input type="text" id="publicNumber" placeholder="" value="<%=warranty.publicNumber %>" /><span class="help-inline"></span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label input-label" for="inputEmail">类型</label>
                        <div class="controls">
                            <label class="radio inline">
                                <input type="radio" name="type01" disabled="disabled">
                                订阅号
                            </label>
                            <label class="radio inline">
                                <input type="radio" name="type01" checked="checked">
                                服务号
                            </label>
                        </div>
                    </div>
                </div>
                <!--small title-->
                <div class="smallTitle mt30"><span class="text">服务器配置</span><span class="muted">（于接收用户消息）</span></div>
                <!--small title-->
                <div class="serve">
                    <dl>
                        <dt>URL:</dt>
                        <dd><span class="text" id="empowerUrl"><%:ViewData["DrpUrl"] %></span>
                            <button id="copyWarrantyUrl" type="button" class="btn">复制</button></dd>
                        <dt>Token:</dt>
                        <dd><span class="text" id="empowerToken">TOKEN</span>
                            <button id="copyWarrantyToken" type="button" class="btn">复制</button></dd>
                    </dl>
                    <p class="muted">请将以上URL及Token填到微信公众平台中，以完成绑定。<a class="ahelp" href="WeiXinHelp01"><i class="icon-help-blue"></i>详细绑定步骤</a></p>
                </div>
                <!--small title-->
                <div class="smallTitle mt30"><span class="text">绑定开发者账号</span><span class="muted">（选填，用于配置自定义菜单）</span> </div>
                <!--small title-->
                <div class="binding">
                    <div class="input-prepend control-group">
                        <span class="add-on"><i class="icon-user"></i></span>
                        <input class="span2" id="appID" value="<%=warranty.AppID %>" type="text" placeholder="AppID" /><span class="help-inline"></span>
                    </div>
                    <div class="mt8"></div>
                    <div class="input-prepend control-group">
                        <span class="add-on"><i class="icon-lock"></i></span>
                        <input class="span2" id="appsecret" type="text" placeholder="Appsecret" value="<%=warranty.AppSecret %>" /><span class="help-inline"></span>
                    </div>
                    <p class="muted mt8">AppID以及Appsecret来自于您申请开发接口时提供的账号和密码。<a class="ahelp" href="WeiXinHelp02"><i class="icon-help-blue"></i>详细绑定步骤</a></p>
                </div>

                <!--small title-->
                <div class="smallTitle mt30"><span class="text">设置业务域名</span><span class="muted">（设置业务域名，用户在相应域名上进行输入时不再出现防欺诈盗号等安全提示）</span> </div>
                <!--small title-->
                <div class="setdomain">
                    <p class="titlestep"><a href="https://mp.weixin.qq.com/" target="_blank">登录微信公众平台</a>点击公众号设置>功能设置>业务域名设置，一次填写：</p>
                    <p class="text-success"><span class="muted">域名1：</span><%:ViewData["DomainUrl"] %></p>
                    <p class="text-success"><span class="muted">域名2：</span><%:ViewData["drpShopDomainUrl"] %></p>
                    <%--<p class="text-success"><span class="muted">域名3：</span><%:ViewData["DomainUrl"] %></p>--%>
                    <p class="titlestep mt30"><a href="https://mp.weixin.qq.com/" target="_blank">登录微信公众平台</a>点击公众号设置>开发者中心>OAuth2.0网页授权>修改：</p>
                    <p class="text-success"><span class="muted">填写授权回调页面域名：</span><%:ViewData["drpShopDomainUrl"] %></p>
                    <p>业务域名设置完毕！</p>
                </div>
                <p class="button mt20">
                    <% if (warranty.AppID != "")
                       { %>
                    <button class="btn btn-large btn-primary" onclick="validateform(event);" type="button">修改</button>

                    <input type="hidden" id="IsChange" value="true" />
                    <% }
                       else
                       { %>
                    <button class="btn btn-large btn-primary" onclick="validateform(event);" type="button">保存</button>
                    <input type="hidden" id="IsChange" value="false" />
                    <% } %>
                </p>
            </form>
        </div>
    </div>
    <!--right end-->
    <script src="../../Scripts/Copy/jquery.zclip.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-fallr-1.3.pack.js" type="text/javascript"></script>
    <script>
        // 赋值 URL
        $("#copyWarrantyUrl").zclip({
            path: "../../Scripts/Copy/ZeroClipboard.swf",
            copy: function () {
                Show("复制成功", "success");
                return $('#empowerUrl').text().trim();
            }
        });

        // 赋值 Token
        $("#copyWarrantyToken").zclip({
            path: "../../Scripts/Copy/ZeroClipboard.swf",
            copy: function () {
                Show("复制成功", "success");
                return $('#empowerToken').text().trim();
            }
        });
        var appID;
        var appsecret;
        var publicNumber;
        var token;
        function validateform(event) {
            $(".help-inline").text('');
            $(".error").removeClass("error");
            appID = $("#appID").val().trim();
            appsecret = $("#appsecret").val().trim();
            publicNumber = $("#publicNumber").val().trim();
            token = $("#empowerToken").text();


            if (publicNumber == "") {
                $("#publicNumber").next().text("微信号不可为空");
                $("#publicNumber").parent().parent().addClass("error");
                $("#publicNumber").focus();
                document.documentElement.scrollTop = document.body.scrollTop = 0;
                return;
            }

            if (appID == "") {
                $("#appID").next().text("AppID不可为空");
                $("#appID").parent().addClass("error");
                $("#appID").focus();
                return;
            }

            if (appsecret == "") {
                $("#appsecret").next().text("Appsecret不可为空");
                $("#appsecret").parent().addClass("error");
                $("#appsecret").focus();
                return;
            }
            if ($("#IsChange").val() == "true") {
                $('#setExtract').modal('show');
            } else {
                btnSave(event);
            }


        }

        function btnSave(event) {
            $(event).addClass("disabled");
            //                $(".aui_state_highlight").attr('disabled', "true");
            $(event).attr('disabled', "true");
            $('#setExtract').modal('hide');
            $.ajax({
                url: "/WeiXinManage/Warranty",
                data: { "appID": appID, "appsecret": appsecret, "token": token, "publicNumber": publicNumber, "flow": false },
                type: "post",
                async: false, // 同步执行
                success: function (returnData) {
                    if ("OK" == returnData) {
                        Show("授权成功", "success");
                    } else if ("error" == returnData) {
                        Show("授权失败", "error");
                    } else {
                        Show(returnData, "error");
                    }
                },
                error: function (returnData) {
                    Show("未知异常，联系管理员", "error");
                }
            });
            document.documentElement.scrollTop = document.body.scrollTop = 0;
            $(event).removeClass().addClass("submit01 r10");
            $(event).removeAttr('disabled');
        }
    </script>
</asp:Content>
