<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../../Scripts/Js/allselect.js" type="text/javascript"></script>
    <script src="../../../Scripts/jscommon.js" type="text/javascript"></script>
    <script src="../../../Scripts/Js/popupOperate.js" type="text/javascript"></script>
    <script src="../../../Scripts/Js/weiXinMenulist.js" type="text/javascript"></script>
    <%--   <script src="../../../Scripts/Js/Common.js" type="text/javascript"></script>--%>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!-- mod-tab begin-->
    <div class="mod-tab t20">
        <div class="con style0big" id="types">
            <ul>
                <li dir="d1" class="current"><a href="javascript:void(0)">全部（<span id="all"></span>）</a></li>
            </ul>
        </div>
    </div>
    <!-- mod-tab begin-->
    <!--operate begin-->
    <div class="mod-operate t20">
        <div class="con style0list">
            <ul class="ul-list">
                <li><a href="javascript:void(0);" onclick="GoToLinkUrl(event)" linkurl="AddMenu"
                    class="a-btn" id="btnAddMenu">添加</a></li>
                <%--<li><a href="javascript:void(0);" onclick="javascript:MenuDels(event);" class="a-btn"  >批量删除</a></li>--%>
                <li><a href="javascript:void(0);" class="a-btn" id="btnUpdateToWeiXin">更新菜单到微信</a></li>
            </ul>
        </div>
    </div>
    <!--operate end-->
    <div class="clear h10">
    </div>
    <!--table begin-->
    <div class="mod-table" id="sourceList">
        <% Html.RenderAction("WeiXinMenuListPartial"); %>
    </div>
    <!--table end-->
    <!--alert begin-->
    <div class="mask" style="display: none;">
    </div>
    <div class="gray-bg" id="dvPopup" style="display: none;">
        <div class="title">
            <h2>
                弹层标题</h2>
            <span class="icon-close"></span>
        </div>
        <div class="content">
            <div style="width: 555px; height: 450px;">
                <!--form begin-->
                <div class="mod-form t20">
                    <div class="con style0page">
                        <ul class="list-ul">
                            <li class="list-li">
                                <div class="float-l">
                                    父菜单不能超过<span class="prompt">3</span>个,子菜单不能超过<span class="prompt">5</span>个,菜单字数不能超过<span
                                        class="prompt">7</span>个
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l">
                                    <select id="slParentMenu" class="w140" name="name">
                                        <option value="0"></option>
                                    </select><input type="hidden" name="name" id="hidMenuID" value="" /></div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l">
                                    <input id="txtMenuName" type="text" class="w340" name="name" style="color: Gray;"
                                        value="请输入菜单名称"></div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l">
                                    <input id="txtKeyOrUrl" type="text" class="w340" name="name" style="color: Gray;"
                                        value="请输入触发关联词或外链Url"></div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l">
                                    菜单排序</div>
                            </li>
                            <li class="list-li">
                                <div class="float-l">
                                    <select id="slOrder" class="w60" name="name">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select></div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                        </ul>
                        <div class="t20 b20">
                            <button class="submit01" id="btnSave">
                                保存</button>
                            <button class="submit01" id="btnSaveEdit">
                                保存编辑</button>
                        </div>
                    </div>
                </div>
                <!--form end-->
            </div>
        </div>
    </div>
    <!--alert end-->
    <script type="text/javascript">
        var weiXinMenuModelStr = '<%= ViewData["weiXinMenuModel"] %>';



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
    </script>
</asp:Content>
