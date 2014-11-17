<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BootstrapSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <!--right begin-->
  <div class="payset">
  <!--big title begin-->
    <div class="bigTitle">
      <div class="bigTitle-name"><span class="text">微信支付设置</span></div>      
    </div>
  <!--big title end-->
    <div class="main">
         <!--small title-->
          <div class="smallTitle">
            <i class="icon-help-green"></i><span class="text">如何发布</span><a class="ahelp" href="EditWxPay"><i class="icon-back-blue"></i>返回</a>
          </div>
         <!--small title-->
         <ul class="applyStep ml90">
         <li>
             <span class="arrow"></span>
             <div class="content">请联系我们的技术人员进行接口测试。</div>
             <span class="number">1</span>
           </li> 
           <li>
             <span class="arrow"></span>
             <div class="content">
               <a href="https://mp.weixin.qq.com/" target="_blank">登录微信公众平台</a>               
             </div>
             <span class="number">2</span>
             <span class="line"></span>
           </li>
           <li>
             <span class="arrow"></span>
             <div class="content">
               点击左侧“添加功能插件”菜单，如下图：<br/>
               <img src="../../content/imagesv2/play02.png" width="700"></div>
             <span class="number">3</span>
             <span class="line"></span>
           </li>
           <li>
             <span class="arrow"></span>
              <div class="content">
               点击右侧“微信支付”模块，如下图：<br/>
               <img src="../../content/imagesv2/play03.png" width="700"></div>
             <span class="number">4</span>
             <span class="line"></span>
           </li>
           <li>
             <span class="arrow"></span>
              <div class="content">
               点击右下角“发布”按钮，如下图：<br/>
               <img src="../../content/imagesv2/play04.png" width="700"></div>
             <span class="number">5</span>
             <span class="line"></span>
           </li>
           
           <li>
             <span class="arrow"></span>
             <div class="content">发布已完成。</div>
             <span class="number">6</span>
           </li> 
           
         </ul>
    </div>
  </div>
  <!--right end-->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
 <script type="text/javascript" src="../../Scripts/bootstrap/BootstrapCssLoadV2.js?Item=set"></script>
</asp:Content>
