<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!doctype html>
<html>
<head runat="server">
    <script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/KindEditor/Editor/kindeditor-min.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/ajaxFileUpload.js" type="text/javascript"></script>
    <script src="../../Scripts/MaterialManage/addMaterialManagesJS.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/Common.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=wechat|default"></script>
    <title>添加素材管理</title>
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

    <div class="alertpage-content scroll" style="width: 800px; height: 400px;">
        <div class="mod-form t-10">
            <input type="hidden" id="hidTagId" />
            <!--content begin-->
            <div class="con style0alert b20">
                <ul class="list-ul">
                    <li class="list-li">
                        <div class="float-l w100">
                            <span class="star">*</span><label>消息类型</label></div>
                        <div class="float-l">
                            <input type="radio" value="1" name="ImageText" id="Texts" checked="checked" />
                            <label class="r25 c01-1" for="Texts">
                                文本</label>
                            <input type="radio" value="2" name="ImageText" id="OneImageTexts" />
                            <label class="r25 c01-1" for="OneImageTexts">
                                单图文</label>
                            <input type="radio" value="3" name="ImageText" id="MoreImageTexts" />
                            <label class="r25 c01-1" for="MoreImageTexts">
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
                <div class="simpletext t10" id="simpleText" style="display: none;">
                    <div class="simpletext-area float-l">
                        <div class="simpletext-emulation r25">
                            <i class="arrow"></i>
                            <div id="coverTitle" class="simpletext-emulation-title">
                                <a href="" class="simpletext-emulation-title-a">标题</a></div>
                            <div id="coverImg" class="simpletext-emulation-img">
                                <span class="simpletext-emulation-img-text">封面图片</span></div>
                            <div id="coverAuthor" class="simpletext-emulation-title">
                                <a class="simpletext-emulation-title-a c01-3" href=""></a>
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
                                            <input type="text" class="wb100" id="txtName">
                                        </div>
                                        <div class="div-area">
                                            <span class="prompt"></span>
                                        </div>
                                    </li>
                                    <li class="list-li" style="display: none;">
                                        <div class="div-area">
                                            <label>
                                                作者</label></div>
                                        <div class="div-area">
                                            <input type="text" class="w230" id="txtAuthor" name="txtAuthor">
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
                                                <span id="spanImg" class="pic-place wb100 h150">
                                                    <p style="line-height: 150px; display: ;" class="nopic">
                                                        暂无图片</p>
                                                </span>
                                                <div class="btn">
                                                    <input type="button" name="files" class="btn-pic" value="上传图片">
                                                    <input type="file" class="inputfile" id="file_upload" onchange="FileUpload()" size="0"
                                                        name="file_upload">
                                                    <input type="hidden" name="hidCoverUrl" id="hidCoverUrl">
                                                </div>
                                            </div>
                                            <div>
                                                <input type="checkbox" id="txtshowmain" value="true"><label for="txtshowmain">封面图片显示在正文</label></div>
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
                                            <textarea class="wb100 h100" id="txtAbstract" name="txtAbstract"></textarea></div>
                                        <div class="div-area">
                                            <span class="prompt"></span>
                                        </div>
                                    </li>
                                    <li class="list-li">
                                        <div class="div-area">
                                            <label>
                                                正文</label></div>
                                        <div class="div-area">
                                            <textarea class="wb100 h100" id="txtDescribe" style="width: 425px;" name="txtDescribe"></textarea></div>
                                        <div class="div-area">
                                            <span class="prompt"></span>
                                        </div>
                                    </li>
                                    <li class="list-li">
                                        <div class="div-area">
                                            <label>
                                                原文链接</label></div>
                                        <div class="div-area">
                                            <input type="text" id="txtTheOriginalLink" class="wb100 h100"></div>
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
                <div class="moretext t10" id="moreText" style="display: none;">
                    <div class="moretext-area float-l">
                        <div id="MoreVessel" class="moretext-emulation r25">
                            <!--emulation01 begin-->
                            <div dir="0" class="moretext-emulation01" isedit="true">
                                <i class="arrow"></i>
                                <div class="moretext-emulation01-img-mask">
                                    <a href="javascript:void(0)" onclick="Editing(event)" class="moretext-emulation01-img-operate-edit"
                                        data-id="0">编辑</a></div>
                                <span id="MoreCoverImg" class="moretext-emulation01-img-text"><span class="simpletext-emulation-img-text">
                                    封面图片</span> </span><span class="moretext-emulation01-title-text">标题</span> <a href="javascript:void(0)"
                                        class="moretext-emulation01-title-a"></a>
                                <input type="hidden" id="hidTitle0">
                                <input type="hidden" id="hidAuthor0">
                                <input type="hidden" id="hidCoverUrl0">
                                <input type="hidden" id="hidText0">
                                <input type="hidden" id="hidTheOriginalLink0">
                                <input type="hidden" id="hidIsImg0">
                            </div>
                            <!--emulation01 end-->
                            <!--emulation02 begin-->
                            <div dir="1" class="moretext-emulation02">
                                <i class="arrow" style="display: none;"></i>
                                <div class="moretext-emulation02-mask">
                                    <a href="javascript:void(0)" onclick="Editing(event)" class="moretext-emulation02-operate-edit"
                                        data-id="1">编辑</a><a href="javascript:void(0)" onclick="DelectImageText(event)" class="moretext-emulation02-operate-del l10">删除</a></div>
                                <div class="moretext-emulation02-box">
                                    <div id="thumbnail1" class="moretext-emulation02-img">
                                        缩略图</div>
                                    <div class="moretext-emulation02-text">
                                        标题</div>
                                </div>
                                <input type="hidden" id="hidTitle1">
                                <input type="hidden" id="hidAuthor1">
                                <input type="hidden" id="hidCoverUrl1">
                                <input type="hidden" id="hidText1">
                                <input type="hidden" id="hidTheOriginalLink1">
                                <input type="hidden" id="hidImg1">
                            </div>
                            <!--emulation02 end-->
                        </div>
                        <!--add begin-->
                        <a href="javascript:void(0)" class="moretext-area-add"><i id="AddCover" class="moretext-area-add-icon">
                        </i></a>
                        <!--add end-->
                    </div>
                    <div class="moretext-form">
                        <div class="mod-form">
                            <div class="con style0updown">
                                <ul class="list-ul">
                                    <li class="list-li">
                                        <div class="div-area">
                                            <label>
                                                标题</label></div>
                                        <div class="div-area">
                                            <input type="text" class="wb100" id="txtMoreTitle" name="txtMoreTitle"></div>
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
                                            <input type="text" class="w230" id="txtMoreAuthor" name="txtMoreAuthor"></div>
                                    </li>
                                    <li class="list-li">
                                        <div class="div-area">
                                            <label>
                                                封面</label>
                                            <span class="col-annotation">建议图片尺寸:360*200</span>
                                        </div>
                                        <div class="div-area">
                                            <div class="file01">
                                                <span id="MorespanImg" class="pic-place wb100 h150">
                                                    <p class="nopic" style="line-height: 150px; display: ;">
                                                        暂无图片</p>
                                                </span>
                                                <div class="btn">
                                                    <input type="button" class="btn-pic" name='Morefiles' value="上传图片">
                                                    <input type="file" class="inputfile" size="0" name="MoreImage_file_upload" onchange="MoreImageFileUpload()"
                                                        id="MoreImage_file_upload">
                                                </div>
                                            </div>
                                            <div>
                                            <input type="hidden" id="fucupload" />
                                                <input type="checkbox" id="showmaintext"><label for="showmaintext">封面图片显示在正文</label></div>
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
                                            <textarea id="txtMoreText" style="width: 425px;" style="display: none;" class="wb100 h100"></textarea></div>
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
                                            <input type="text" class="w230" id="txtMoreTheOriginalLink" name="txtMoreTheOriginalLink">
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
            <button id="btnMaterialSave" class="submit01-alert r10">
                保存</button>
            <button class="reset01-alert" id="close">
                关闭</button>
        </div>
    </div>
   
</body>
</html>
<script type="text/javascript">
    var materialManageModel = '<%=ViewData["materialManage"] %> ';

    var refresh = '<%=ViewData["refresh"] %>';


</script>
