<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BootstrapSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%List<string> li = (List<string>)ViewData["UrlList"]; %>
    <div class="payset">
        <div class="bigTitle">
            <div class="bigTitle-name"><span class="text">微信支付设置</span></div>
        </div>
        <!--big title end-->
        <div class="main">
            <!--small title-->
            <div class="smallTitle">
                <i class="icon-help-green"></i><span class="text">如何申请微信支付</span><a class="ahelp" href="EditWxPay"><i class="icon-back-blue"></i>返回</a>
            </div>
            <!--small title-->
            <ul class="applyStep ml90">
                <li>
                    <span class="arrow"></span>
                    <div class="content">
                        <p class="explanation">
                            <a href="https://mp.weixin.qq.com/" target="_blank">登录微信公众平台</a>，点击添加功能插件>微信支付，填写商户基本资料。<br />
                            请将以下信息填至：商户基本资料>微信
                        </p>
                        <span class="title">支付请求类型：</span><span class="text">JS API网页支付</span><br />
                        <span class="title">JS API支付授权目录：</span><span class="text"><%=li[0] %></span><br />
                        <span class="title">JS API支付请求实例：</span><span class="text"><%=li[1] %></span><br />
                        <span class="title">共享收货地址：</span><span class="text">是</span><br />
                        <span class="title">维权通知URL：</span><span class="text"><%=li[2] %></span><br />
                        <span class="title">告警通知URL：</span><span class="text"><%=li[3] %></span><br />

                    </div>
                    <span class="number">1</span>
                    <span class="line"></span>
                </li>
                <li>
                    <span class="arrow"></span>
                    <div class="content">
                        依次填写业务审核资料、财务审核资料。
                    </div>
                    <span class="number">2</span>
                    <span class="line"></span>
                </li>
                <li>
                    <span class="arrow"></span>
                    <div class="content">签署合同，请耐心等待腾讯官方审核。</div>
                    <span class="number">3</span>
                    <span class="line"></span>
                </li>
                <li>
                    <span class="arrow"></span>
                    <div class="content">审核通过后，前往财付通网站缴纳保证金。</div>
                    <span class="number">4</span>
                    <span class="line"></span>
                </li>

                <li>
                    <span class="arrow"></span>
                    <div class="content">缴纳完成后，您将收到微信和财付通发送的确认邮件。</div>
                    <span class="number">5</span>
                </li>

            </ul>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
<script type="text/javascript" src="../../Scripts/bootstrap/BootstrapCssLoadV2.js?Item=set"></script>
</asp:Content>
