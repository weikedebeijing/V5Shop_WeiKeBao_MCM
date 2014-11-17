<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>UrlDemo</title>
    <style type="text/css">
      .current{color:Red;font-size:25px;}
    </style>
    <script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            //var url = document.URL;

            var url = 'http://demo-drp.v5shop.net/helpercenterdetail.aspx?ID=32?menuName=helpercenterdetail.aspx?ID=32';
            
            url = url.split('?menuName=')[1];

            $(".Menu-ul li").each(function () {
                if ($(this).attr("name") == url) {
                    $(this).addClass("current");
                    return;
                }
            });
        });
    </script>
</head>
<body>
    <div>
        <ul class="Menu-ul">
            <li class="" id="1" name="index.aspx"><a href="http://demo-drp.v5shop.net/index.aspx?menuName=index.aspx"
                title="首页">首页</a></li>
            <li id="2" name="articlegroup.aspx"><a href="http://demo-drp.v5shop.net/articlegroup.aspx?menuName=articlegroup.aspx"
                title="招募">招募</a></li>
            <li id="3" name="category.aspx"><a href="http://demo-drp.v5shop.net/category.aspx?menuName=category.aspx"
                title="商品目录">商品目录</a></li>
            <li id="4" name="helpercenterdetail.aspx?ID=32"><a href="http://demo-drp.v5shop.net/helpercenterdetail.aspx?ID=32?menuName=helpercenterdetail.aspx?ID=32"
                title="主题活动">主题活动</a></li>
        </ul>
    </div>
</body>
</html>
