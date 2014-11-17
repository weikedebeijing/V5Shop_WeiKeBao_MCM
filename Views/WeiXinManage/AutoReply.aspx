<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/jquery.pager.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=wechat"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- 查询条件 begin -->
    <script type="text/javascript">
        // 文本框输入查询条件
        // 分组查询条件
        var autoReplyQuery = new Object();
        autoReplyQuery.Groups = new Array(3);
        autoReplyQuery.Groups[0] = "AppCode-" + '<%=ViewData["appCode"]%>';
        autoReplyQuery.Groups[1] = 'q1';

    </script>
    <!--标题 end-->
    <!--选项卡 begin-->
    <div class="mod-tab t20">
        <div class="con style0big" id="types">
            <ul>
                <li class="current"><a href="javascript:void(0)">全部（<span id="quanbu"></span>）</a></li>
                <%--                        <li dir="d1"><a href="javascript:void(0)">用户关注时（<span id="focusOn"></span>）</a></li>
                        <li dir="d2"><a href="javascript:void(0)">消息中包含关键词（<span id="keyword"></span>）</a></li>
                        <li dir="d3"><a href="javascript:void(0)">无法匹配时（<span id="Asuccessfuldeal"></span>）</a></li>--%>
            </ul>
        </div>
    </div>
    <!--选项卡 end-->
    <!--搜索 begin-->
    <div class="mod-search">
        <div class="con style0list">
            <ul class="ul-search">
                <li>
                    <input type="text" id="TexUser" name="" class="search-input" placeholder="请输入消息内容..."
                        style="color: #999;" />
                </li>
                <li><a href="javascript:void(0)" class="search-btn" id="SelectId"></a></li>
            </ul>
        </div>
    </div>
    <!--搜索 end-->
    <!--标签 begin-->
    <%--<div class="mod-condition t20"  style="display:none">
                <div class="con style0list" id="types">
                    <ul>
                        <li dir="d1"><a href="javascript:void(0)">用户关注时（<span id="focusOn"></span>）</a></li>
                        <li dir="d2"><a href="javascript:void(0)">消息中包含关键词（<span id="keyword"></span>）</a></li>
                        <li dir="d3"><a href="javascript:void(0)">无法匹配时（<span id="Asuccessfuldeal"></span>）</a></li>
                        <li dir="d4"><a href="javascript:void(0)">点击微商城时（<span id="clickWie"></span>）</a></li>
                    </ul>
                </div>
            </div>--%>
    <div id="a">
    </div>
    <div id="a1">
    </div>
    <div id="a2">
    </div>
    <!--标签 end-->
    <!--操作栏 begin-->
    <div class="mod-operate t20" id="zz">
        <div class="con style0list">
            <ul class="ul-list" id="favourable">
                <li><a class="a-btn" onclick="GoToLinkUrl(event)" linkurl="../../WeiXinManage/AddAutoReply"
                    href="javascript:void(0)">添加自动回复内容</a></li>
                <li><a class="a-btn" href="javascript:void(0)" onclick="changeRemark(event)">批量删除</a></li>
            </ul>
        </div>
    </div>
    <div class="mod-page">
        <div class="con style0list">
            <div class="turn">
                <ul class="turn-ul">
                    <%--    <li class="next"></li><!--undo class="last"-->
                <li class="first"></li><!--do class="prev"-->--%>
                </ul>
            </div>
            <div class="number">
                当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条
            </div>
        </div>
    </div>
    <script type="text/javascript">

    </script>
    <!--操作栏 end-->
    <div class="clear h10">
    </div>
    <!--列表 Start-->
    <div class="mod-table">
        <% 
            Html.RenderAction("GetAutoReply", new { AutoReplyIndex = 0 });
        %>
    </div>
    <!--列表 End-->
    <script type="text/javascript">
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

        $(function () {
            AutoresponderSettings(1);


            //            $("#TexUser").focus(function () {
            //                if ($(this).val() == "请输入消息内容...") {
            //                    $(this).val('');
            //                    $(this).val('').css("color", "#6b6969");
            //                }
            //            });
            $("#TexUser").blur(function () {
                condition = $(this).val().replace(/^\s*/g, "").replace(/\s*$/g, "");
                if (condition == "") {
                    $(this).focus();
                    $(this).val("");
                }
            });
        });

        $(function () {
            $("#SelectId").click(function () {
                $(".label-mod #types ul li").removeClass("current");
                autoReplyQuery.Groups[1] = "";
                autoReplyQuery.Groups[2] = "";
                autoReplyQuery.Query = $("#TexUser").val();
                AutoresponderSettings(1);
            });
        });




        function changeRemark(event) {
            var autoReply = new Array();

            $("input[name='sub']:checked").each(function () {
                autoReply.push($(this).val());
            });

            if (autoReply.length == 0) {
                $(".Loading").removeClass("style0green style0red").addClass("style0yellow");
                $("#operateTip").html("请先勾选内容再进行批量操作！").change();
                return;
            }
            if (confirmThis(event, "您确认删除这条数据?")) {
                //你将要执行的代码 

                $.ajax({
                    url: "/WeiXinManage/ChangeAutoReply",
                    type: "post",
                    dataType: 'json',
                    data: { "autoReplyStr": JSON.stringify(autoReply) },
                    success: function (result) {
                        if (result.Code == null && result.Message == null) {

                            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                            $("#operateTip").html("删除成功！").change();
                            $(".mod-operate-detail").hide();
                            AutoresponderSettings(1);
                        }
                        else {
                            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                            $("#operateTip").html("删除失败！").change();

                        }
                    }
                });
            }
        }


        function del(event, ID) {
            if (confirmThis(event, "您确认删除这条数据?")) {
                //你将要执行的代码 
                var autoReply = new Array();
                autoReply.push(ID);
                $.ajax({
                    url: "/WeiXinManage/ChangeAutoReply",
                    type: "post",
                    dataType: 'json',
                    data: { "autoReplyStr": JSON.stringify(autoReply) },
                    success: function (result) {
                        if (result.Code == null && result.Message == null) {

                            $(".Loading").removeClass("style0red style0yellow").addClass("style0green");
                            $("#operateTip").html("删除成功！").change();
                            $(".mod-operate-detail").hide();
                            AutoresponderSettings(1);
                        }
                        else {
                            $(".Loading").removeClass("style0green style0yellow").addClass("style0red");
                            $("#operateTip").html("删除失败！").change();

                        }
                    }
                });
            }
        }



    </script>
</asp:Content>
