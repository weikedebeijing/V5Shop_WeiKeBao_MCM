<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content3" ContentPlaceHolderID="LinkContent" runat="server">
    <script type="text/javascript" src="../../Scripts/CssLoad.js?Item=wechat"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="MCM-N-L">
        <div class="MCM-C-M ">
            <div class="mod-title">
                <div class="con style0h1-02">
                    <h1 class="spanTitle">店铺基本信息</h1>
                </div>
            </div>
            <div class="mod-form">
                <div class="con style0page">
                    <input type="hidden" id="appCode" name="appCode" value="" />
                    <ul class="list-ul">
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span><label>微店名称</label>
                            </div>
                            <div class="float-l">
                                <input type="text" id="ShopName" name="ShopName" class="w230"  />
                                <span
                                    class="prompt"></span>
                            </div>
                        </li>
                        <li class="list-li">
                            <div class="float-l w130">
                                <span class="star">*</span><label>微店图标</label>
                            </div>
                            <div class="float-l">
                                <div class="file01 w230">
                                    <span class="pic-place wb100 h150" style="line-height: 180px;">
                                        <img style="background: #333;" id="file_upload_img" src=""
                                            name="file_upload_img" alt="" />
                                        <p id="OneImage_none" style="display: none" class="nopic">
                                            暂无图片
                                        </p>
                                    </span>
                                    <div class="btn">
                                        <input type="hidden" value="" id="LogoUrl" name="LogoUrl" />
                                        <input type="button" value="上传图片" class="btn-pic" />
                                        <input type="file" id="file_upload" name="file_upload" class="inputfile" onchange="UploadImage()" />
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <div class="l130 t20 b20">
                        <button class="submit01 t10" type="submit">
                            保存</button>
                    </div>
                </div>
            </div>
            <span id="UpdateTargetHiddenID" style="display: none"></span>
        </div>
    </div>
    <script src="../../Scripts/jquery-1.8.1.min.js" type="text/javascript"></script>
    <script src="../../Scripts/Js/ajaxFileUpload.js" type="text/javascript"></script>
    <script src="../../Scripts/jquery-validate/jquery.validate.js" type="text/javascript"></script>
    <script type="text/javascript">


        function UploadImage() {

        }

    </script>
</asp:Content>
