<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=wechat"></script>
    <script src="../../Scripts/jscommon.js" type="text/javascript"></script>
    <%--    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>--%>
    <script src="../../Scripts/Js/allselect.js" type="text/javascript"></script>
    <script src="../../Scripts/KindEditor/Editor/kindeditor-min.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/ajaxFileUpload.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/popupOperate.js" type="text/javascript"></script>
    <script src="../../Scripts/Menu/AddMenuJs.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery.pager.js" type="text/javascript"></script>
    <script src="../../Scripts/publicDialog/materialManagedialogJs.js" type="text/javascript"></script>
    <script src="../../Scripts/publicDialog/SelectMaterialManagedialogJS.js" type="text/javascript"></script>
    <script src="../../Scripts/publicPlug-in/linkUrlJs.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="display: none;" class="mask" id="mask-active-cover-add">
    </div>
    <div class="mod-title t10">
        <div class="con style0h1-02">
            <a class="a-btn float-l" onclick="GoToLinkUrl(event)" title="返回" href="javascript:void(0)"><i linkurl="WeiXinMenuList"
                class="icon-back"></i></a>
            <h1 class="spanTitle">
                添加菜单</h1>
        </div>
    </div>
    <div class="mod-form">
        <div class="con style0page">
            <!---active begin--->
            <ul class="list-ul">
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>父菜单</label></div>
                    <div class="float-l">
                        <select id="slParentMenu" class="w140" name="name">
                            <option value="0"></option>
                        </select><input type="hidden" name="name" id="hidMenuID" value="" />
                        <span class="c01-3">父菜单最多3个,子菜单最多5个,菜单字数最多7个.</span>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>子菜单名称</label></div>
                    <div class="float-l">
                        <input id="txtMenuName" type="text" class="w340" name="name" style="color: Gray;"
                            value="请输入菜单名称"></div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star"></span><label>菜单排序</label></div>
                    <div class="float-l">
                        <select id="slOrder">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <%--         <option value="4">4</option>
                            <option value="5">5</option>--%>
                        </select>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>点击菜单后</label>
                    </div>
                    <div class="float-l" id="selectul">
                        <div class="t5">
                            <input type="radio" checked="checked" value="click" id="after01" name="after"><label
                                for="after01" class="l15 r25">触发功能</label><select id="selFunction"></select>
                            <span class="c03" id="cf"></span>
                        </div>
                        <div class="t5">
                            <input type="radio" value="view" id="after02" name="after"><label for="after02" class="l15 r25">进入链接</label><input
                                type="text" id="txtMenuUrl" value="请输入url" class="w260">
                                <span class="c03" id="url"></span>
                        </div>
                        <div class="t5">
                            <input id="after03" type="radio" name="after" value="returnClick">
                            <label class="l15 r25" for="after03">
                                添加素材(文本、单图文、多图文)</label>
                                <span class="c03" id="sc"></span>
                        </div>
                        <div class="t5 l35" id="MenuSimple" style="display: none">
                            <a id="simple-add" class="btn-gradient-blue float-l r5" href="javascript:void(0)">新建素材</a>
                            <a id="simple-select" class="btn-gradient-blue float-l" href="javascript:void(0)">选择素材</a>
                        </div>
                    </div>
                </li>
                <!--single begin-->
                <li style="display: none;" id="MenuSingle" class="list-li">
                    <div class="l165 text-show-content" style="display: none;" id="MenuText">
                    </div>
                    <!--simple text begin-->
                    <div id="divImageText" style="display: none;" class="l165 simplytext-show">
                        <ul class="simplytext-show-ul">
                            <li class="simplytext-show-li">
                                <div class="simpletext-content">
                                    <div class="simpletext-content-title">
                                        <a class="simpletext-emulation-title-a" href="javascript:void(0)" id="title">上海小学排名最新出炉
                                            上海各区县重点小学排行榜</a></div>
                                    <div class="simpletext-content-img">
                                        <img width="326" height="172" src="../../content/css/css4.0/images/test/active-cover.png"
                                            id="imgurl"><span style="display: none;" class="simpletext-emulation-img-text">封面图片</span></div>
                                </div>
                                <div class="form-touch t10" id="plus">
                                    <div class="t2">
                                        <input type="radio" checked="checked" value="none" id="Radio3" name="after1"><label
                                            for="Radio3" class="l5 r5">图文详情(默认)</label>
                                    </div>
                                    <div class="t2">
                                        <input type="radio" value="click" id="Radio1" name="after1"><label for="Radio1" class="l5 r5">触发功能</label>
                                        <select id="selFunction2">
                                        </select>
                                         <span class="c03" id="cf2"></span>
                                        </div>
                                    <div class="t2">
                                        <input type="radio" value="view" id="Radio2" name="after1"><label for="Radio2" class="l5 r5">进入链接</                                                 label><input type="text" id="txtMenuUrl2" value="请输入url" class="w210">
                                            <span class="c03" id="url2"></span>
                                     </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="l165 moretext-show">
                        <ul class="moretext-show-ul" id="divlist">
                        </ul>
                    </div>
                </li>
            </ul>
            <!--single end-->
            <!---active end--->
            <div class="l156 t30 b20">
                <button class="submit01 r10" id="btnSave">
                    保存</button>
                <%-- <button class="reset01" onclick="SubmitProductInfo()">
                    重置</button>
            <button class="disabled l10" onclick="SubmitProductInfo()">
                        禁用按钮</button>--%>
            </div>
        </div>
    </div>
    <input type="hidden" id="hidTagId" onchange="imgtextShow()" />
    <script type="text/javascript">
        var weiXinMenuModelStr = '<%= ViewData["weiXinMenuModel"] %>';
        var hidFuncitonType = JSON.parse('<%=ViewData["FunctionType"]%>');
        $("#simple-add").click(function () {
            dialog("Add");
            $(".c03").text("");
        });
        $("#simple-select").click(function () {
            selectDialog();
            $(".c03").text("");
        });
        function Opan(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var id = $(eventSrc).attr("dir");
            dialog("Update", id);
        }


 
    </script>
</asp:Content>
