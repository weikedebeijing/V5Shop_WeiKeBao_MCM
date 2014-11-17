<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<html>
<%  V5.MetaData.WeiXin.Model.MaterialManage materialManage = ViewData["ImageParticular"] as V5.MetaData.WeiXin.Model.MaterialManage; %>
<%  string SiteUrl = ViewData["SiteUrl"].ToString(); %>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>
        <%=materialManage.Title%></title>
    <link rel="stylesheet" href="http://html.v5portal.com/mobile-template/1/html/css/base.css">
    <link rel="stylesheet" href="http://html.v5portal.com/mobile-template/1/html/css/common.css">
    <link rel="stylesheet" href="http://html.v5portal.com/mobile-template/1/html/css/template01.css">
</head>
<body>
    <section class="article">
    <div class="title"><%=materialManage.Title%></div>
    <%if (materialManage.rowCreatedDate != null)
      {

          var date = materialManage.rowCreatedDate;
          %>
      
             <div ><%=date%></div>
    <%  }%>

    <div class="content" id="img-content">
    <%if (materialManage.IsImg == true)
      {  %>
     <img src="<%=SiteUrl %><%=materialManage.CoverUrl %>" alt="advertisement">
     <%} %>
      <%=materialManage.Text%>
      </div>
  </section>
    <%--  <section class="recommend">
    <a href="" class="recommend-a">推荐阅读</a>
  </section>--%>
</body>
<script type="text/javascript">
    //弹出框中图片的切换
    (function () {
        var imgsSrc = [];
        function reviewImage(src) {
            if (typeof window.WeixinJSBridge != 'undefined') {
                WeixinJSBridge.invoke('imagePreview', {
                    'current': src,
                    'urls': imgsSrc
                });
            }
        }
        function onImgLoad() {
            var imgs = document.getElementById("img-content");
            imgs = imgs ? imgs.getElementsByTagName("img") : [];
            for (var i = 0, l = imgs.length; i < l; i++) {//忽略第一张图 是提前加载的loading图而已
                var img = imgs.item(i);
                var src = img.getAttribute('data-src') || img.getAttribute('src');
                if (src) {
                    imgsSrc.push(src);
                    (function (src) {
                        if (img.addEventListener) {
                            img.addEventListener('click', function () {
                                reviewImage(src);
                            });
                        } else if (img.attachEvent) {
                            img.attachEvent('click', function () {
                                reviewImage(src);
                            });
                        }
                    })(src);
                }
            }
        }
        if (window.addEventListener) {
            window.addEventListener('load', onImgLoad, false);
        } else if (window.attachEvent) {
            window.attachEvent('load', onImgLoad);
            window.attachEvent('onload', onImgLoad);
        }
    })(); 

</script>
</html>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>V5Show-内容详细页面</title>
</head>

<body>
    <div id="news_title">
        <h3>
            <%=materialManage.Title%></h3>
    </div>
    <div>
        <span id="news_span" style="float: left;"></span>
    </div>
    <div id="news_zuizhongcon" style="text-indent: 0em;">
        <%=materialManage.Text%>
    </div>
</body>
</html>--%>
