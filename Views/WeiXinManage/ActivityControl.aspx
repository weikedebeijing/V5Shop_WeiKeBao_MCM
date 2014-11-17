<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/jquery.pager.js" type="text/javascript"></script>
    <script src="../../Scripts/Activity/ActivityControlJS.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=wechat"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- 查询条件 begin -->
    <script type="text/javascript">
        // 文本框输入查询条件
        // 分组查询条件
        var activityQuery = new Object();
        activityQuery.Groups = new Array(3);
        //activityQuery.Groups[0] = "AppCode-" + '<%=ViewData["appCode"]%>';
        activityQuery.Groups[0] = '';
        activityQuery.Groups[1] = 'q1';


        var menuCode = '<%:ViewData["MenuCode"] %>';

        if (menuCode == "C440") {
            activityQuery.Groups[0] = 'bigWheel';
        } else if (menuCode == "C430") {
            activityQuery.Groups[0] = 'guaGuaLe';
        } else if (menuCode == "C450") {
            activityQuery.Groups[0] = 'hitGoldenEggs';
        } else if (menuCode == "C460") {
            activityQuery.Groups[0] = 'ScratchableLatex';
        }
    </script>
    <!-- 查询条件 end -->
    <!--展开高级搜索时加class="MCM-N-L MCM-Open"-->
    <!--标题 end-->
    <!--选项卡 begin-->
    <div class="mod-tab t20">
        <div class="con style0big" id="type">
            <ul>
                <li class="current" dir="q1"><a href="javascript:void(0)">全部（<span id="QuanBu"></span>）</a></li>
            </ul>
        </div>
    </div>
    <!--选项卡 end-->
    <!--标签 begin-->
    <%-- <div class="mod-condition t20" style="display:none">
        <div class="con style0list" id="types">
            <ul>
                <li dir="d1"><a href="javascript:void(0)">进行中（<span id="jxz"></span>）</a></li>
                <li dir="d2"><a href="javascript:void(0)">过期（<span id="gq"></span>）</a></li>
            </ul>
        </div>
    </div>--%>
    <!--标签 end-->
    <!--操作栏 begin-->
    <div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list" id="favourable">
                <li><a class="a-btn" href="../../WeiXinManage/AddActivityControl?MenuCode=<%:ViewData["MenuCode"]%>">
                    添加</a></li>
                <li><a class="a-btn" href="javascript:void(0)" id="delete">删除</a></li>
                <li><a class="a-btn" href="javascript:void(0)" id="stop">停止</a></li>
            </ul>
        </div>
    </div>
    <div class="mod-page">
        <div class="con style0list">
            <div class="turn">
                <ul class="turn-ul">
                    <%--        <li class="next"></li><!--undo class="last"-->
                <li class="first"></li><!--do class="prev"-->--%>
                </ul>
            </div>
            <div class="number">
                当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条</div>
        </div>
    </div>
    <script type="text/javascript">
        var url = window.location.href;
        var parameter = url.substring(url.indexOf('?') + 1);
        parameter = parameter.split('&');
        var appCode = parameter[0].replace("appCode=", "");
        var reg = /MenuCode=/g;
        var MenuCode = "";
        for (var i = 0; i < parameter.length; i++) {
            reg.lastIndex = 0;
            if (reg.test(parameter[i])) {
                MenuCode = parameter[i].replace("MenuCode=", "");
                break;
            }
        }

        if (appCode != 'PLATFORM' && appCode != "" && appCode != null) {


            //                       $(".mod-operate").css("display", "none");


            //                        var tt = document.getElementById("dvType");
            //                        tt.style.display = "none";
        }
    </script>
    <!--操作栏 end-->
    <div class="clear h10">
    </div>
    <!--列表 Start-->
    <div class="mod-table">
        <% 
            Html.RenderAction("GetActivity", new { activityIndex = 0 });
        %>
    </div>
    <!--列表 End-->
    <script type="text/javascript">

        $(function () {
            ActivityView(1);
            $("#type ul li").click(function () {
                activityQuery.Query = "";
                activityQuery.Groups[1] = "q1";
                activityQuery.Groups[2] = "";
                ActivityView(1);
            });




        });


    </script>
</asp:Content>
