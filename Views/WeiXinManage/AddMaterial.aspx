<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="LinkContent" runat="server">
    <script src="../../Scripts/MaterialManage/addMaterialJs.js" type="text/javascript"></script>
    <link rel="stylesheet" href="../../content/css/css4.0/base.css">
    <link rel="stylesheet" href="../../content/css/css4.0/system.css">
    <link rel="stylesheet" href="../../content/css/css4.0/common.css">
    <link rel="stylesheet" href="../../content/css/css4.0/module.css">
    <script src="../../Scripts/Js/popupOperate.js" type="text/javascript"></script>
    <script src="../../Scripts/KindEditor/Editor/kindeditor-min.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/ajaxFileUpload.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--弹层-->
    <div class="mask" style="display: none;">
    </div>
    <div class="gray-bg" id="gray-bg" style="display: none;">
        <div class="title">
            <h2>
                编辑图文</h2>
            <span class="icon-close"></span>
        </div>
        <div class="content">
            <div style="width: 750px; height: 100%;">
                <div class="mod-form t20">
                    <div class="con style0page">
                        <ul>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span><label>标题</label></div>
                                <div class="float-l">
                                    <input type="text" name="txtTitle" id="txtMoreTitle" class="w230" /></div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star">*</span><label>作者</label></div>
                                <div class="float-l">
                                    <input type="text" name="txtAuthor" id="txtMoreAuthor" class="w230" /></div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star"></span>
                                    <label>
                                        封面</label></div>
                                <div class="float-l">
                                    <div id="divMoreImagefile">
                                        <div class="file01">
                                            <input type="hidden" id="hidMoreCoverUrl" name="hidMoreCoverUrl" />
                                            <span class="pic-place w240 h150">
                                                <img id="MoreImage_file_upload_img" style="display: none" />
                                                <p class="nopic" style="line-height: 150px;" id="MoreImage_none">
                                                    暂无图片</p>
                                            </span>
                                            <div class="btn">
                                                <button class="w240 btn-pic a-btn">
                                                    上传图片</button>
                                                <input type="file" id="MoreImage_file_upload" class="w240 inputfile" onchange="MoreImageFileUpload()"
                                                    name="MoreImage_file_upload" />
                                                <span class="spMessage"></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star"></span>
                                    <label>
                                        正文</label></div>
                                <div class="float-l">
                                    <textarea style="width: 600px;" id="txtMoreText"></textarea>
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                            <li class="list-li">
                                <div class="float-l w130">
                                    <span class="star"></span>
                                    <label>
                                        原链接</label></div>
                                <div class="float-l">
                                    <input type="text" name="txtMoreTheOriginalLink" id="txtMoreTheOriginalLink" class="w230">
                                </div>
                                <div class="float-l">
                                    <span class="prompt"></span>
                                </div>
                            </li>
                        </ul>
                        <div class="l130 t20 b20">
                            <button class="submit01" onclick="SaveImg()" id="btImgInsert">
                                保存</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--弹层-->
    <div class="mod-title">
        <div class="con style0h1">
            <h1 class="spanTitle">
                添加素材</h1>
        </div>
    </div>
    <div class="mod-form t20">
        <div class="con style0page">
            <ul class="list-ul">
                <li class="list-li">
                    <div class="float-l w130">
                        <span class="star">*</span><label>选择素材类型</label></div>
                    <div class="float-l">
                        <select id="selType">
                            <option value="1">文本</option>
                            <option value="2">单图文</option>
                            <option value="3">多图文</option>
                        </select></div>
                </li>
                <li class="list-li">
                    <div id="divText">
                        <div class="float-l w130">
                            <span class="star">*</span>
                            <label>
                                文本</label></div>
                        <div class="float-l">
                            <!--text start-->
                            <textarea id="ReplyText" class="h100 w600"></textarea>
                            <!--text end-->
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </div>
                </li>
                <div id="divOneImageText">
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star">*</span>
                            <label>
                                标题</label></div>
                        <div class="float-l">
                            <input type="text" name="txtName" id="txtName" class="w230">
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star"></span>
                            <label>
                                作者</label></div>
                        <div class="float-l">
                            <input type="text" name="txtAuthor" id="txtAuthor" class="w230">
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star">*</span>
                            <label>
                                上传图片</label></div>
                        <div class="float-l">
                            <div class="file01" id="divfile">
                                <input type="hidden" id="HidImg" name="HidImg" />
                                <span class="pic-place w240 h150">
                                    <img id="file_upload_img" style="line-height: 150px; display: none">
                                    <p class="nopic" style="line-height: 150px;" id="OneImage_none">
                                        暂无图片</p>
                                </span>
                                <div class="btn" id="Divfile_upload">
<input type="file" id="file_upload" name="file_upload" onchange="FileUpload()" class="w240 inputfile" />
                                    <button class="w240 btn-pic a-btn">
                                        上传图片</button>
                                </div>
                            </div>
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star">*</span>
                            <label>
                                摘要</label></div>
                        <div class="float-l">
                            <input type="hidden" id="hidAbstract" name="hidAbstract" />
                            <textarea name="txtAbstract" id="txtAbstract" style="width: 600px; height: 100px"></textarea>
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star">*</span>
                            <label>
                                正文</label></div>
                        <div class="float-l">
                            <input type="hidden" id="HidDescribe" name="HidDescribe" />
                            <textarea name="txtDescribe" id="txtDescribe" style="width: 610px"> </textarea>
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                    <li class="list-li">
                        <div class="float-l w130">
                            <span class="star"></span>
                            <label>
                                添加原文链接</label></div>
                        <div class="float-l">
                            <input type="text" name="txtTheOriginalLink" id="txtTheOriginalLink" class="w230">
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span>
                        </div>
                    </li>
                </div>
                <div id="divMoreImageText">
                    <li class="list-li">
                        <div class="float-l">
                            <div class="mod-table">
                                <div class="mod-table-head">
                                    <div class="con style0list">
                                        <table cellspacing="0" cellpadding="0" border="0" class="w600">
                                            <colgroup>
                                                <col style="width: 350px;">
                                                <col style="width: 350px;">
                                                <col style="width: 350px;">
                                                <col style="width: auto;">
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th>
                                                        标题
                                                    </th>
                                                    <th>
                                                        封面
                                                    </th>
                                                    <th>
                                                        操作
                                                    </th>
                                                    <th>
                                                    </th>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="mod-table-main">
                                    <div class="con style01">
                                        <table cellspacing="0" cellpadding="0" border="0" id="myPressPaperTable" class="w600">
                                            <colgroup>
                                                <col style="width: 350px;">
                                                <col style="width: 350px;">
                                                <col style="width: 350px;">
                                                <col style="width: auto;">
                                            </colgroup>
                                            <tbody>
                                                <tr lang="0" id="appmsgItem0">
                                                    <td>
                                                        标题
                                                    </td>
                                                    <td>
                                                        <img width="50px" height="50px" src="../../Images/Default.png">
                                                    </td>
                                                    <td>
                                                        <a data-id="0" class="c07" onclick="Editing(event)" href="javascript:void(0)">编辑</a>
                                                    </td>
                                                    <td>
                                                        <input type="hidden" id="hidTitle0">
                                                        <input type="hidden" id="hidAuthor0">
                                                        <input type="hidden" id="hidCoverUrl0">
                                                        <input type="hidden" id="hidText0">
                                                        <input type="hidden" id="hidTheOriginalLink0">
                                                    </td>
                                                </tr>
                                                <tr lang="1" id="appmsgItem1">
                                                    <td>
                                                        标题
                                                    </td>
                                                    <td>
                                                        <img width="50px" height="50px" src="../../Images/Default.png">
                                                    </td>
                                                    <td>
                                                        <a data-id="1" onclick="Editing(event)" class="c07" href="javascript:void(0)">编辑</a>
                                                        <a class="r10 c07" onclick="dlRow(event)" href="javascript:void(0)">删除</a>
                                                    </td>
                                                    <td>
                                                        <input type="hidden" id="hidTitle1">
                                                        <input type="hidden" id="hidAuthor1">
                                                        <input type="hidden" id="hidCoverUrl1">
                                                        <input type="hidden" id="hidText1">
                                                        <input type="hidden" id="hidTheOriginalLink1">
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="float-l">
                            <div id="divInsertManege">
                                <input type="button" onclick="InsertRow()" class="w100  t15" value="新增">
                                <span class="spMessage"></span>
                            </div>
                        </div>
                        <div class="float-l">
                            <span class="prompt"></span></div>
                    </li>
                </div>
            </ul>
            <div class="l130 t20 b20">
                <button class="submit01" onclick="javascript:btnSave();" id="btnSave">
                    &nbsp;&nbsp;保存全部&nbsp;&nbsp;</button>
            </div>
        </div>
    </div>
    <script type="text/javascript">

        var materialManageModel = '<%= ViewData["materialManage"] %>';
       
    
    </script>
</asp:Content>
