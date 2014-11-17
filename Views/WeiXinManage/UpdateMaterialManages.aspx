<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!doctype html>
<html>
<head id="Head1" runat="server">
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/KindEditor/Editor/kindeditor-min.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/ajaxFileUpload.js" type="text/javascript"></script>
    <script src="../../Scripts/MaterialManage/upadateMaterialManagesJs.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/materialManageView.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/materialManageModel.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=wechat|default"></script>
    <title>修改素材管理</title>
</head>
<body class="alertbody">
    <div class="mod-tip">
        <div style="position: relative; width: 100%;">
            <div class="con style0green Loading" style="display: none;">
                <!--style0greem是成功提示；style0yellow是警告提示；style0red是错误提示-->
                <span id="operateTip" class="txt" onclick="change()" onchange="change()" onmouseup="displayNone()"
                    style="float: left; margin: 0px; margin-right: 15px;"></span><i class="close">
                </i>
            </div>
        </div>
    </div>
    <div class="alertpage-content scroll" style="width: 800px; height: 400px;">
        <div class="mod-form t-10">
            <!--content begin-->
       
                <div class="con style0alert b20">
                    <ul class="list-ul">
                        <li class="list-li">
                            <div class="float-l w100">
                                <span class="star">*</span><label>消息类型</label></div>
                            <div class="float-l">
                                <input type="radio" checked="checked" id="ModifyImageText" name="ModifyImageText"
                                    value="1" />
                                <label for="ModifyImageText" class="r25 c01-1">
                                    文本</label>
                                <input type="radio" checked="checked" id="ModifyOneImageTexts" name="ModifyImageText"
                                    value="2" />
                                <label for="ModifyOneImageTexts" class="r25 c01-1">
                                    单图文</label>
                                <input type="radio" id="ModifyMoreImageTexts" name="ModifyImageText" value="3" />
                                <label for="ModifyMoreImageTexts" class="r25 c01-1">
                                    多图文</label>
                            </div>
                            <div class="float-l">
                                <span class="prompt"></span>
                            </div>
                        </li>
                    </ul>
                    <!-- text begin-->
                    <div class="div-area" id="text" style="display: block;">
                        <textarea class="w800 h100" id="ttText"></textarea>
                         <span class="prompt" style="color: red" id="prompt"></span>
                    </div>
                    <!-- text end-->
                    <!--simple text begin-->
                    <div style="display: none;" id="ModifysimpleText" class="simpletext t10">
                        <div class="simpletext-area float-l">
                            <div class="simpletext-emulation r25">
                                <i class="arrow"></i>
                                <div class="simpletext-emulation-title" id="ModifycoverTitle">
                                    <a class="simpletext-emulation-title-a" href="">标题</a>
                                </div>
                                <div class="simpletext-emulation-img" id="ModifycoverImg">
                                    <span class="simpletext-emulation-img-text">封面图片</span></div>
                                <div class="simpletext-emulation-title" id="ModifycoverAuthor">
                                    <a href="" class="simpletext-emulation-title-a c01-3"></a>
                                </div>
                            </div>
                        </div>
                        <div class="simpletext-form">
                            <div class="mod-form">
                                <div class="con style0updown">
                                    <ul class="list-ul">
                                        <li class="list-li">
                                            <div class="div-area">
                                                <label>
                                                    标题</label></div>
                                            <div class="div-area">
                                                <input type="text" id="ModifytxtName" class="wb100"></div>

                                                <div class="div-area">
                                            <span class="prompt"></span>
                                        </div>
                                        </li>
                                    <li class="list-li" style="display: none;">
                                            <div class="div-area">
                                                <label>
                                                    作者</label></div>
                                            <div class="div-area">
                                                <input type="text" name="txtAuthor" id="ModifytxtAuthor" class="w230">
                                            </div>
                                            <div class="float-l">
                                                <span class="prompt"></span>
                                            </div>
                                        </li>
                                        <li class="list-li">
                                            <div class="div-area">
                                                <label>
                                                    封面</label>
                                                    <span class="col-annotation">建议图片尺寸:360*200</span>
                                                    </div>
                                            <div class="div-area">
                                                <div class="file01">
                                                    <span class="pic-place wb100 h150" id="ModifyspanImg">
                                                        <p class="nopic" style="line-height: 150px; display: ;">
                                                            暂无图片</p>
                                                    </span>
                                                    <div class="btn">
                                                        <input type="button" value="上传图片" onclick="$('#Modifyfile_upload').click()" class="btn-pic">
                                                        <input type="file" id="Modifyfile_upload" size="0" name="Modifyfile_upload" onchange="ModifyFileUpload()"
                                                            class="inputfile">
                                                        <input type="hidden" id="ModifyhidCoverUrl" name="ModifyhidCoverUrl" />
                                                    </div>
                                                 
                                                </div>
                                                <div>
                                                    <input type="checkbox" id="Modifytxtshowmain"><label for="Modifytxtshowmain">封面图片显示在正文</label></div>
                                            </div>

                                            <div class="div-area">
                                            <span class="prompt"></span>
                                        </div>
                                        </li>
                                        <li class="list-li">
                                            <div class="div-area">
                                                <label>
                                                    摘要</label></div>
                                            <div class="div-area">
                                                <textarea name="ModifytxtAbstract" id="ModifytxtAbstract" class="wb100 h100"></textarea></div>
                                                <div class="div-area">
                                            <span class="prompt"></span>
                                        </div>
                                        </li>
                                        <li class="list-li">
                                            <div class="div-area">
                                                <label>
                                                    正文</label></div>
                                            <div class="div-area">
                                                <textarea name="ModifytxtDescribe" style="width: 425px" id="ModifytxtDescribe" class="wb100 h100"></textarea></div>
                                                <div class="div-area">
                                            <span class="prompt"></span>
                                        </div>
                                        </li>
                                        <li class="list-li">
                                            <div class="div-area">
                                                <label>
                                                    原文链接</label></div>
                                            <div class="div-area">
                                                <input type="text" class="wb100 h100" id="txtTheOriginalLink" /></div>
                                                <div class="div-area">
                                            <span class="prompt"></span>
                                        </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--simple text end-->
                    <!--more text begin-->
                    <div style="display: none;" id="ModifymoreText" class="moretext t10">
                        <div class="moretext-area float-l">
                            <div class="moretext-emulation r25" id="ModifyMoreVessel" >
                                <!--emulation01 begin-->
                                <div class="moretext-emulation01" dir="0" isedit="true">
                                    <i style="" class="arrow"></i>
                                    <div class="moretext-emulation01-img-mask">
                                        <a data-id="0" class="moretext-emulation01-img-operate-edit" onclick="ModifyEditing(event)"
                                            href="javascript:void(0)">编辑</a></div>
                                    <span class="moretext-emulation01-img-text" id="ModifyMoreCoverImg">封面图片</span>
                                    <span class="moretext-emulation01-title-text">标题</span> <a class="moretext-emulation01-title-a"
                                        href="javascript:void(0)"></a>
                                    <input type="hidden" id="ModifyhidTitle0">
                                    <input type="hidden" id="ModifyhidAuthor0">
                                    <input type="hidden" id="ModifyhidCoverUrl0">
                                    <div id="DivText" style="display:none">
                                    <textarea  id="ModifyhidText0"></textarea>
                                 
                                    </div>
                                    <input type="hidden" id="ModifyhidTheOriginalLink0">
                                    <input type="hidden" id="ModifyhidIsImg0" />
                                </div>
                                <!--emulation01 end-->
                            </div>
                            <!--add begin-->
                            <a class="moretext-area-add" href="javascript:void(0)"><i class="moretext-area-add-icon"
                                id="ModifyAddCover"></i></a>
                            <!--add end-->
                        </div>
                        <div class="moretext-form">
                            <div class="mod-form">
                                <div class="con style0updown">
                                    <ul class="list-ul">
                                        <li class="list-li">
                                            <div class="">
                                                <label>
                                                    标题</label></div>
                                            <div class="div-area">
                                                <input type="text" name="ModifytxtMoreTitle" id="ModifytxtMoreTitle" class="wb100"></div>
                                                <div class="div-area">
                                            <span class="prompt"></span>
                                        </div>
                                        </li>
                                     <li class="list-li" style="display: none;">
                                            <div class="div-area">
                                                <span class="star"></span>
                                                <label>
                                                    作者</label></div>
                                            <div class="div-area">
                                                <input type="text" name="ModifytxtMoreAuthor" id="ModifytxtMoreAuthor" class="w230" /></div>
                                            <div class="div-area">
                                                <span class="prompt"></span>
                                            </div>
                                        </li>
                                        <li class="list-li">
                                            <div class="div-area">
                                                <label>
                                                    封面</label>
                                                    <span class="col-annotation">建议图片尺寸:360*200</span>
                                                    
                                                    </div>
                                            <div class="div-area">
                                                <div class="file01">
                                                    <span class="pic-place wb100 h150" id="ModifyMorespanImg">
                                                        <p class="nopic" style="line-height: 150px; display: ;">
                                                            暂无图片</p>
                                                    </span>
                                                    <div class="btn">
                                                        <input type="button" value="上传图片" name="ModifyMorefiles" class="btn-pic" onclick="('#ModifyMoreImage_file_upload').click()">
                                                        <input type="file" id="ModifyMoreImage_file_upload" ize="0" onchange="ModifyMoreImageFileUpload()"
                                                            name="ModifyMoreImage_file_upload" class="inputfile">
                                                    </div>
                                                
                                                </div>
                                                <div>
                                                    <input type="checkbox" id="Modifyshowmaintext"><label for="Modifyshowmaintext">封面图片显示在正文</label></div>
                                            </div>
                                            <div class="div-area">
                                            <span class="prompt"></span>
                                        </div>
                                        </li>
                                        <li class="list-li">
                                            <div class="div-area">
                                                <label>
                                                    正文</label></div>
                                            <div class="div-area">
                                                <textarea class="wb100 h100" style="width: 425px" id="ModifytxtMoreText"></textarea></div>
                                                <div class="div-area">
                                            <span class="prompt"></span>
                                        </div>
                                        </li>
                                        <li class="list-li">
                                            <div class="div-area">
                                                <span class="star"></span>
                                                <label>
                                                    原链接</label></div>
                                            <div class="div-area">
                                                <input type="text" name="ModifytxtMoreTheOriginalLink" id="ModifytxtMoreTheOriginalLink"
                                                    class="w230">
                                            </div>
                                            <div class="div-area">
                                                <span class="prompt"></span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--more text end-->
                </div>
          
            <!--content end-->
        </div>
    </div>

        <div style="position: absolute; bottom: 0; left: 0; right: 0;" class="alertpage-btn">
        <div class="indiv">
            <button id="btnModify" class="submit01-alert r10">
                保存</button>
            <button class="reset01-alert" id="close">
                关闭</button>
        </div>
    </div>

 
</body>
</html>
<script type="text/javascript">




    var materialManageList = '<%= ViewData["materialManage"] %>';





    var refresh = '<%=ViewData["refresh"] %>';
</script>
