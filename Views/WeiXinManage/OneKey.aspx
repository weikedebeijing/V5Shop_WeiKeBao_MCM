<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/BootstrapSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/bootstrap/BootstrapCssLoadV2.js?item=customer"></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="RIGHT payset">
    <div class="alert-help alert alert-info alert-dismissable bind-alert" data-alert="welcome" id="oneKeyTip_container" style="display: block;">
      <button type="button" class="close" id="oneKeyTip" onclick="closeTip('oneKeyTip');">×</button>
      <strong>小提示！</strong> 通过设置一键关注，可以让买家更便捷快速地关注你的微信公众号。 </div>
    <!--big title begin-->
    <div class="bigTitle">
      <div class="bigTitle-name"><span class="text">一键关注</span><b class="badge" data-alert="welcome">?</b></div>
    </div>
    <!--big title end-->
    <div class="main onekey">
      <div class="alert alert-warning">
        <h5>重要提示</h5>
        <p style="margin-bottom:15px;">设置“一键关注”，需要你先在微信公众平台创建一条新的图文消息，你可以<a href="http://html.v5portal.com/mcm/content/imagesv2/onekeyimg.rar" class="color-blue">下载</a>提示图片压缩包到电脑中，也可以自己制作图片上传，尺寸：360×200像素；创建之后，复制这条图文消息的链接并粘贴到下方对话框，提交网址即可。</p>
        <input id="urlInput" value="<%=ViewData["publicImgUrl"] %>" type="text" class="form-control input-xxlarge" placeholder="粘贴微信公众平台图文素材网址">
        <p class="button">
          <button class="btn btn-large btn-primary" type="button" id="btnSim">提交网址</button>
        </p>
      </div>
      <!--help begin-->
         <!--small title-->
          <div class="smallTitle mt30">
            <i class="icon-help-green"></i><span class="text">如何通过微店设置微信公众号一键关注</span>
          </div>
         <!--small title-->
         <ul class="applyStep ml90">
           <li>
             <span class="arrow"></span>
             <div class="content">
               在重要提示文字框中，点击下载把所需的图片素材先下载到电脑中，这里我们已经为你准备了尺寸合适的图片，解压后备用即可。当然，你也可以自己制作提示关注的图片，注意一下<span class="color-red">图片的尺寸是360x200像素</span>。<br/><br/>
             <img src="../../Images/onekey_03.png" width="600"> 
             </div>
             <span class="number">1</span>
             <span class="line"></span>
           </li>
           <li>
             <span class="arrow"></span>
             <div class="content">根据提示说明，登录微信公众平台，选择管理→素材管理，并创建一条新的图文消息，以下图为例：<br/><br/>
             <img src="../../Images/onekey02.jpeg"><br/><br/>
             相信大家对创建图文消息的方法都已经很熟悉，这里我们就不再赘述了，只需要注意下边几点：<br/>
<span class="color-red">1、在第二步中下载的图片，这里要作为封面图片上传到图文消息，并选择封面图片显示在正文中；<br/>2、这一条图文消息不必添加原文链接。</span>
             </div>
             <span class="number">2</span>
             <span class="line"></span>
           </li>
           <li>
             <span class="arrow"></span>
             <div class="content">保存该条图文消息，并在图文素材列表中找到它，对消息标题单击鼠标右键，选择复制链接。<br/><br/>
             <img src="../../Images/onekey03.jpeg"> </div>
             <span class="number">3</span>
             <span class="line"></span>
           </li>
           <li>
             <span class="arrow"></span>
             <div class="content">回到微店管理后台，将复制的链接粘贴到一键关注界面的对话框中，点击提交网址。这样就完成了一键关注的设置。<br/><br/>
             <img src="../../Images/onekey_04.png" width="600"> </div>
             <span class="number">4</span>
             <span class="line"></span>
           </li>
         </ul>
      <!--help end-->
    </div>
  </div>
  <!--right end-->     <script>
        $(function () {
            $("#btnSim").click(function () {
                $("#btnSim").attr("disabled", true);
                $.ajax({
                    url:"../../WeiXinManage/setOneKey",
                    type: "post",
                    data:{"PublicImgUrl":$("#urlInput").val()},
                    success: function (res) {
                        if (res == "ok") {
                            Show("提交网址成功", "success");
                        }
                        else {
                            Show("提交网址失败", "prompt");
                        }
                        $("#btnSim").attr("disabled", false);
                    },
                    error: function (returnData) {
                        Show("未知异常，联系管理员", "error");
                        $("#btnSim").attr("disabled", false);
                    }
                });
            });
        });

        //全局提示
        function Show(text, type) {

            if (type == "success") {
                $("#success").html("");
                $("#success").append('<button data-dismiss="alert" class="close" type="button">×</button>' + text + '！');
                $("#success").show();
            }
            else if (type == "error") {
                $("#error").html("");
                $("#error").append('<button data-dismiss="alert" class="close" type="button">×</button>' + text + '！');
                $("#error").show();
            }
            else if (type == "prompt") {
                $("#prompt").html("");
                $("#prompt").append('<button data-dismiss="alert" class="close" type="button">×</button>' + text + '！');
                $("#prompt").show();
            }
            setTimeout("hide('"+type+"')", 5000);
        }

        function hide(id) {
            $("#"+id).hide()
        }
    </script>
</asp:Content>

