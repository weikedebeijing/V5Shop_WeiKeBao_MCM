<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--right begin-->
  <div class="payset">
  <!--big title begin-->
    <div class="bigTitle">
      <div class="bigTitle-name"><span class="text">绑定微信公众账号</span></div>      
    </div>
  <!--big title end-->
    <div class="main">
         <!--small title-->
          <div class="smallTitle">
            <i class="icon-help-green"></i><span class="text">如何配置服务器</span><a class="ahelp" href="javascript:void(0);"onclick="window.history.go(-1);"><i class="icon-back-blue"></i>返回</a>
          </div>
         <!--small title-->
         <ul class="applyStep ml90">
         <li>
             <span class="arrow"></span>
             <div class="content"><a href="https://mp.weixin.qq.com/" target="_blank">登录微信公众平台</a>  </div>
             <span class="number">1</span>
             <span class="line"></span>
           </li> 
           <li>
             <span class="arrow"></span>
             <div class="content">
               点击左侧“开发者中心”菜单，如下图：<br/>
               <img src="http://html.v5portal.com/mcm/content/imagesv2/empower01.png">             
             </div>
             <span class="number">2</span>
             <span class="line"></span>
           </li>
           <li>
             <span class="arrow"></span>
             <div class="content">
               选取右侧“我同意《微信公众平台开发者服务协议》”并点击“成为开发者”按钮，如下图：<br/>
               <img src="http://html.v5portal.com/mcm/content/imagesv2/empower02.png"></div>
             <span class="number">3</span>
             <span class="line"></span>
           </li>
           <li>
             <span class="arrow"></span>
              <div class="content">
               把上一页的"URL"和“Token”填入如下图片的页面位置并点击“提交”按钮：<br/>
              <img src="http://html.v5portal.com/mcm/content/imagesv2/empower03.png"></div>
             <span class="number">4</span>
             <span class="line"></span>
           </li>
           <li>
             <span class="arrow"></span>
              <div class="content">
               点击右侧“启用”按钮，如下图：<br/>
               <img src="http://html.v5portal.com/mcm/content/imagesv2/empower04.png"></div>
             <span class="number">5</span>
             <span class="line"></span>
           </li>
           
           <li>
             <span class="arrow"></span>
             <div class="content">服务器配置并启用已完成。</div>
             <span class="number">6</span>
           </li> 
           
         </ul>
    </div>
  </div>
  <!--right end-->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
        <script src="../../Scripts/bootstrap/BootstrapCssLoadV2.js?Item=set"></script>
</asp:Content>
