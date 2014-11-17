<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!doctype html>
<html>
<head runat="server">
    <title>选择素材</title>
    <script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery.pager.js" type="text/javascript"></script>
    <script src="../../Scripts/MaterialManage/seleteMaterialManageJs.js" type="text/javascript"></script>
   <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
     <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=wechat|default"></script>
    <script type="text/javascript">
        var materialQuery = new Object();
        materialQuery.Groups = new Array(1);
        materialQuery.Groups[0] = 'd1';
    </script>
</head>
<body class="alertbody">

    <div class="mod-tip">
        <div style="position: relative; width: 100%;">
            <div class="con style0green Loading" style="display: none;">
                <!--style0green是成功提示；style0yellow是警告提示；style0red是错误提示-->
                <span id="operateTip" class="txt" onclick="change()" onchange="change()" onmouseup="displayNone()"
                    style="float: left; margin: 0px; margin-right: 15px;"></span><i class="close">
                </i>
            </div>
        </div>
    </div>


    <div id="gray-active-cover-add" class="gray-bg" style="margin: -250px 0px 0px -420px;">
        <div class="content scroll" style="height: 388px; width: 773px;">
            <div class="mod-form t-10">
                <div class="con style0alert b20">
                    <ul class="list-ul">
                        <li class="list-li">
                            <div class="float-l w100">
                                <span class="star">*</span><label>消息类型</label></div>
                            <div class="float-l">
                                <input type="radio" dir="d1" value="1" name="ImageText" id="Texts" checked="checked" />
                                <label class="r25 c01-1" for="Texts">
                                    文本</label>
                                <input type="radio" dir="d2" value="2" name="ImageText" id="OneImageTexts" />
                                <label class="r25 c01-1" for="OneImageTexts">
                                    单图文</label>
                                <input type="radio" dir="d3" value="3" name="ImageText" id="MoreImageTexts" />
                                <label class="r25 c01-1" for="MoreImageTexts">
                                    多图文</label>
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!--content begin-->
            <!--page begin-->
            <div class="mod-page">
                <div class="con style0list">
                    <div class="turn">
                        <ul class="turn-ul" id="turn-ul">
                            <%--  <li class="next"></li>
                                <li class="prev"></li>--%>
                        </ul>
                    </div>
                    <div class="number">
                        当前<span id="pages"></span>~<span id="number"></span>条,总计<span id="sum"></span>条</div>
                </div>
            </div>
            <!--page end-->
            <div class="clear">
            </div>
            <!--table begin-->
            <div class="mod-table t10" id="mod-table">
                <% 
                    Html.RenderAction("GetSingleMaterialManage", new { materialManageIndex = 0 });
                 
                    
                %>
            </div>
            <!--table end-->
            <!--content end-->
        </div>
        <div class="btn">
            <div class="indiv">
                <button class="submit01-alert r10" id="SelectSave">
                    保存</button>
                <button class="reset01-alert" id="coles-select">
                    关闭</button>
            </div>
        </div>
    </div>
    <input type="hidden" id="hidSelectSave" />
</body>
</html>
