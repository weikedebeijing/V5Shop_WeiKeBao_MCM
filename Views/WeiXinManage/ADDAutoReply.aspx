<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=wechat"></script>
    <script src="../../Scripts/jquery.pager.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
    
    <script src="../../Scripts/Js/popupOperate.js" type="text/javascript"></script>
    <%--    <script src="../../Scripts/KindEditor/Editor/kindeditor-min.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/ajaxFileUpload.js" type="text/javascript"></script>--%>
    <script src="../../Scripts/AutoReply/addAutoReply.js" type="text/javascript"></script>
    <script src="../../Scripts/publicDialog/materialManagedialogJs.js" type="text/javascript"></script>
    <script src="../../Scripts/publicDialog/SelectMaterialManagedialogJS.js" type="text/javascript"></script>
    <script src="../../Scripts/publicPlug-in/linkUrlJs.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mod-title t10">
        <div class="con style0h1-02">
            <a class="a-btn float-l" title="返回" id="a1" onclick="GoToLinkUrl(event)" href="javascript:void(0)">
                <i linkurl="../../WeiXinManage/AutoReply" class="icon-back">
                </i></a>
            <h1 class="spanTitle" id="h1">
                添加自动回复内容</h1>
        </div>
    </div>
    <!--title end-->
    <!--添加内容 开始-->
    <div class="mod-form">
        <div class="con style0page">
            <ul class="list-ul">
                <li class="list-li" id="li1">
                    <div class="float-l w130">
                        <span class="star">*</span><label>自动回复条件</label></div>
                    <div class="float-l">
                        <select id="selConditions">
                        </select><input type="hidden" id="hidConditions" />
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <div id="Divhidden">
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star">*</span><label>关键词</label></div>
                        <div class="float-l">
                            <input type="text" name="txtKeyWord" id="txtKeyWord" class="w230" value="请输入关键词" /></div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star">*</span><label>匹配类型</label></div>
                        <div class="float-l">
                            <input type="radio" name="Contains" checked="checked" value="Contains" id="rdContains" />
                            <label class="r25 c01-1" for="rdContains">
                                模糊匹配</label>
                            <input type="radio" name="Contains" value="Accurate" id="rdAccurate" />
                            <label class="r25 c01-1" for="rdAccurate">
                                精确匹配</label>
                            <input type="hidden" id="hidContains" />
                        </div>
                    </li>
                </div>
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>内容</label></div>
                    <div class="float-l">
                        <div class="float-l">
                            <a id="simple-add" href="javascript:void(0)" class="btn-gradient-blue float-l r5">新建素材</a>
                            <a id="simple-select" href="javascript:void(0)" class="btn-gradient-blue float-l">选择素材</a>
                        </div>
                    </div>
                    <div class="float-l">
                        <span class="prompt"></span>
                    </div>
                </li>
                <li style="display: none;" id="MenuSingle" class="list-li">
                    <div class="l130 text-show-content" style="display: none;" id="MenuText">
                    </div>
                    <!--simple text begin-->
                    <div id="divImageText" style="display: none;" class="l130 simplytext-show">
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
                                         <span class="c03"></span>
                                        </div>
                                    <div class="t2">
                                        <input type="radio" value="view" id="Radio2" name="after1"><label for="Radio2" class="l5 r5">进入链接</label><input
                                            type="text" id="txtMenuUrl2" value="请输入url" class="w210">
                                             <span class="c03"></span>
                                            </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="l130 moretext-show">
                        <ul class="moretext-show-ul" id="divlist">
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
        <div class="l130  t30 b20">
            <button class="submit01 r10" onclick="javascript:btnSave();" id="btnSave">
                保存</button>
            <%--  <button class="reset01" onclick="SubmitProductInfo()">
                重置</button>--%>
        </div>
        <input type="hidden" id="hidTagId" onchange="imgtextShow()" />
    </div>
    <script type="text/javascript">

        var autoresponderSettings = $.parseJSON('<%=ViewData["autoresponderSettings"] %>'.replace(new RegExp("\n", "gm"), "\\n").replace(new RegExp("\t", "gm"), "\\t"));
        var Conditions1 = <%=ViewData["Conditions1"]%>;
        var Conditions3 = <%=ViewData["Conditions3"]%>;
        var hidFuncitonType = JSON.parse('<%=ViewData["FunctionType"]%>');
        $("#simple-add").click(function () {
            dialog("Add");
        });
        $("#simple-select").click(function () {
            selectDialog();
        });
        function Opan(event) {
            event = event ? event : window.event;
            var eventSrc = event.srcElement ? event.srcElement : event.target;
            var id = $(eventSrc).attr("dir");
            dialog("Update", id);
        }
         var type='<%=ViewData["type"] %>'
  
   var type='<%=ViewData["type"] %>'
        if(type=='1'){
            $("#li1").hide();
            $("#a1").hide();
            $("#h1").text("关注时回复");
            $("#Divhidden").hide();
        }else if(type=='3'){
            $("#li1").hide();
            $("#a1").hide();
            $("#h1").text("默认回复");
             $("#Divhidden").hide();
        }else{
               $("#li1").hide();
               $("#h1").text("关键词回复");
        }



    </script>
</asp:Content>
